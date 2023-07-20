using com.logajog.salesorders as logajog from '../db/schema';

define service CatalogService {

    entity Order as
        select from logajog.Orders {
            Email       @mandatory,
            FirstName,
            LastName,
            Country,
            CreatedOn,
            OrderStatus @readonly,
            DeliveryDate,
            ImageUrl,
            to_Items
        };

    entity Item  as
        select from logajog.OrderItems {
            ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Price,
            Height,
            Width,
            Depth,
            Quantity @(
                mandatory,
                assert.range : [
                    0.00,
                    20.00
                ]
            ),
            UnitOfMeasure as ToUnitOfMeasure @mandatory,
            to_Orders
        };
}
