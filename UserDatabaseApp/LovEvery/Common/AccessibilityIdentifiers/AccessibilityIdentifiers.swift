//
//  AccessibilityIdentifiers.swift
//  LovEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

public enum AccessibilityIdentifiers {
    public enum View {
        public static let titleLabel = "\\view-title-Label"
        public static let textField = "\\view-textfield"
        public static let textView = "\\view-textView"
        public static let infoTextLabel = "\\view-infotext-label"
    }

    public enum AddUserScreen {
        public static let addUserButon = "\\adduserscreen-add-user-button"
    }

    public enum FindUserScreen {
        public static let findUserButon = "\\finduserscreen-find-user-button"
    }
    public enum AvailableUsersScreen {
        public static let addButon = "\\availableusersscreen-add-button"
        public static let tableView = "\\availableusersscreen-tableview"
        public static let searchBar = "\\availableusersscreen-searchbar"
    }

    
    
    
    public enum AvailableUsersCell {
        public static let subjectLabel = "\\availableuserscell-subject-label"
        public static let messageLabel = "\\availableuserscell-message-label"
    }

    

    public enum AccountScreen {
        public static let helpButton = "\\accountscreen-account-tab-help-button"
    }

    public enum WelcomeScreen {
        public static let startButton = "\\welcomescreen-get-started-button"
    }

    public enum WelcomePathSelectorScreen {
        public static let kioskButton = "\\welcomepathselectorscreen-print-in-store-button"
        public static let n2rButton = "\\welcomepathselectorscreen-order-ahead-for-pickup-button"
        public static let s2hButton = "\\welcomepathselectorscreen-deliver-to-home-button"
        public static let skipButton = "\\welcomepathselectorscreen-not-sure-button"
    }

    public enum BaseCarouselItemCell {
        public static func getBaseCarouselItemCellIdentifier(from modelId: String) -> String {
            return "\\basecarouselitemcell-\(modelId.lowercased())-carousel-item-cell"
        }

        public static func getTitleLabelIdentifier(from modelId: String) -> String {
            return "\\basecarouselitemcell-\(modelId.lowercased())-carousel-item"
        }
    }

    public enum Tab {
        public static let shop = "\\tab-shop-tab-bar-item"
        public static let account = "\\tab-account-tab-bar-item"
    }

    public enum CountrySelectorScreen {
        public static let selectButton = "\\countryselectorscreen-select-button"

        public static func getCountryCellIdentifier(from countryCode: String) -> String {
            return "\\countryselectorscreen-\(countryCode.lowercased())-cell"
        }
    }

    public enum OrderConfirmationScreen {
        public static let doneButton = "\\orderconfirmationscreen-done-button"
    }

    public enum OrderSummaryScreen {
        public static let ordinaryPayButton = "\\ordersummaryscreen-pay-button"
    }

    public enum ImagePickerCollectionViewCell {
        public static func getImageIdentifier(for index: Int) -> String {
            return "\\imagepickercollectionviewcell-image#\(String(index))"
        }
    }

    public enum AlbumCell {
        public static func getAlbumCellIdentifier(for index: Int) -> String {
            return "\\albumcell-image#\(String(index))"
        }
    }

    public enum DefaultPrintsReviewScreen {
        public static let addToCartButton = "\\defaultprintsreviewscreen-add-to-cart-button"
        public static let addMorePhotosButton = "\\defaultprintsreviewscreen-add-more-photos-button"
        public static let printsSizeSelectorView = "\\defaultprintsreviewscreen-prints-size-selector-view"
    }

    public enum KMartPrintsReviewScreen {
        public static let addToCartButton = "\\kmartprintsreviewscreen-add-to-cart-button"
    }

    public enum CatalogGroupItemView {
        public static func getCatalogGroupItemViewIdentifier(from productId: String?) -> String {
            guard let productId = productId else {
                return ""
            }

            return "\\cataloggroupitemview-\(productId.lowercased())"
        }

        public static func getTitleLabelIdentifier(from titleLabel: String?) -> String {
            guard let titleLabel = titleLabel else {
                return ""
            }

            return "\\cataloggroupitemview-\(titleLabel.lowercased())"
        }

        public static func getPriceLabelIdentifier(from priceLabel: String?) -> String {
            guard let priceLabel = priceLabel else {
                return ""
            }

            return "\\cataloggroupitemview-\(priceLabel.lowercased())"
        }
    }

    public enum PrintsWorkflowSelectorTile {
        public static let kioskIdentifier = "\\printsworkflowselectortile-kiosk"
        public static let shipToHomeIdentifier = "\\printsworkflowselectortile-shiptohome"
        public static let netToRetailIdentifier = "\\printsworkflowselectortile-nettoretail"

        public static func getTitleLabelIdentifier(from titleLabel: String?) -> String {
            guard let titleLabel = titleLabel else {
                return ""
            }

            return "\\printsworkflowselectortile-\(titleLabel.lowercased())"
        }

        public static func getSubtitleLabelIdentifier(from subTitleLabel: String?) -> String {
            guard let subTitleLabel = subTitleLabel else {
                return ""
            }

            return "\\printsworkflowselectortile-\(subTitleLabel.lowercased())"
        }
    }

    public enum ImageTrayScreen {
        public static let headerButton = "\\imagetrayscreen-next-button"
        public static let headerView = "\\imagetrayscreen-header-view"
    }

    public enum ShopFinderWidget {
        public static let pickUpCardInfoIconImageView = "\\shopfinderwidget-info-icon"
        public static let pickUpCardFindStoreButton = "\\shopfinderwidget-findstore-button"
        public static let pickUpCardChangeStoreButton = "\\shopfinderwidget-changestore-button"
    }

    public enum ShopAlertContentView {
        public static func getButtonIdentifier(for index: Int) -> String {
            return "\\shopalertcontentview-button#\(String(index))"
        }
    }

    public enum ShopSelectorScreen {
        public static let closeButton = "\\shopselectorscreen-close-button"
        public static let layoutButton = "\\shopselectorscreen-layout-button"
        public static let searchBar = "\\shopselectorscreen-search-bar"
    }

    public enum ShopSelectorListScreen {
        public static let saveButton = "\\shopselectorlistscreen-save-button"

        public static func getStoreIdentifier(for index: Int) -> String {
            return "\\shopselectorlistscreen-shopcell-store#\(String(index))"
        }
    }

    public enum ShopSelectorMapScreen {
        public static let locateButton = "\\shopselectormapscreen-locate-button"
    }

    public enum ShopBottomView {
        public static let cancelButton = "\\shopbottomview-cancel-button"
        public static let saveButton = "\\shopbottomview-save-button"
        public static let infoButton = "\\shopbottomview-info-button"
    }

    public enum ShopProductsWidget {
        public static func getShopProductWidgetIdentifier(from id: String) -> String {
            return "\\shopproductwidget-\(id.lowercased())"
        }
    }

    public enum StoreHeaderWidget {
        public static let changeStoreButton = "\\storeheaderwidget-changestore-button"
    }

    public enum SelectAllBannerView {
        public static let leftButton = "\\selectallbannerview-left-button"
        public static let rightButton = "\\selectallbannerview-right-button"
    }

    public enum PrintsCardCollectionViewCell {
        public static let deleteButton = "\\printscardcollectionviewcell-delete-button"
        public static let editButton = "\\printscardcollectionviewcell-edit-button"
        public static let quantityStepper = "\\printscardcollectionviewcell-quantity-stepper"
    }

    public enum QuantityStepper {
        public static let decreaseButton = "\\quantitystepper-decrease-button"
        public static let increaseButton = "\\quantitystepper-increase-button"
    }

    public enum PrintsSizeSelectorView {
        public static let showSizeButton = "\\printssizeselectorview-addorcancel-size-button"

        public static func getButtonIdentifier(from id: String) -> String {
            return "\\printssizeselectorview-\(id.lowercased())"
        }
    }

    public enum ImagePickerEmptyView {
        public static let actionButton = "\\imagepickeremptyview-action-button"
    }
}
