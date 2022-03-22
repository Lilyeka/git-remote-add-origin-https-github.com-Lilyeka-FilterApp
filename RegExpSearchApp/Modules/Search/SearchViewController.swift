//
//  SearchViewController.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import UIKit


protocol SearchViewOutputProtocol {
    func viewDidLoad()
    func searchButtonTapped(model: SearchModel)
}

final class SearchViewController: UIViewController {
    // MARK: Views
    let urlLabel: UILabel = {
        let label = UILabel()
        label.text = "URL файла"
        return label
    }()
    
    let urlTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.green.cgColor
        return textField
    }()
    
    let filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Фильтр(с символами ? и *)"
        return label
    }()
    
    let filterTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.green.cgColor
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Найти", for:.normal)
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.spacing = 15.0
        stackView.axis = .vertical
        return stackView
    }()
    // MARK: Variables
    var searchModel: SearchModel! {
        didSet {
            self.urlTextField.text = searchModel.url.absoluteString
            self.filterTextField.text = searchModel.filterString
        }
    }
    var presenter: SearchViewOutputProtocol!
    
    // MARK: Life cycle
    
    //MARK: -Init
    init() {
        super.init(nibName: nil, bundle: nil)
        let readingService = ReaderService()
        let pareserService = ParserService()
        let interactor = SearchInteractor(readerService: readingService, parserService: pareserService)
        let presenter = SearchPresenter(view: self, interactor: interactor)
        presenter.interactor = interactor
        interactor.presenter = presenter
        let router = SearchRouter(viewController: self)
        presenter.router = router
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.presenter.viewDidLoad()
    }
    
    // MARK: Actions
    @objc func searchAction() {
        self.presenter.searchButtonTapped(model: searchModel)
    }
    
    // MARK: Private methods
    func setupUI() {
        self.view.backgroundColor = .white
        self.stackView.addArrangedSubview(urlLabel)
        self.stackView.addArrangedSubview(urlTextField)
        self.stackView.addArrangedSubview(filterLabel)
        self.stackView.addArrangedSubview(filterTextField)
        self.stackView.addArrangedSubview(searchButton)
        self.view.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50.0),
            self.stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15.0),
            self.stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15.0)
        ])
        
        self.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
}

extension SearchViewController: SearchViewInputProtocol {
    func updateView(data: SearchModel) {
        self.searchModel = data
    }
    
    func updateView(data: [String]) {
        // здесь можно остановить крутилку просто
    }
}
