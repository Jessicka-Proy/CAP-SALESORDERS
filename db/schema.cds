using {
    cuid
} from '@sap/cds/common';

namespace com.logajog;

context salesorders {

    entity Orders {
        key Email        : String(36);
            FirstName    : String(30);
            LastName     : String(30);
            Country      : String(30);
            CreatedOn    : Date;
            DeliveryDate : DateTime;
            OrderStatus  : Integer;
            ImageUrl     : String;
            to_Items     : Composition of many OrderItems
                               on to_Items.to_Orders = $self;
    };

    entity OrderItems : cuid {
        Name             : localized String not null;
        Description      : localized String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(12, 2);
        Height           : Decimal(15, 3);
        Width            : Decimal(13, 3);
        Depth            : Decimal(16, 2);
        Quantity         : type of Price;
        UnitOfMeasure    : Association to UnitOfMeasures;
        to_Orders        : Association to Orders;
    };

    entity UnitOfMeasures {
        key ID          : String(2);
            Description : localized String;
    };
}

