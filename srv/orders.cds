using com.logajog.salesorders as logajog from '../db/schema';

service ManageOrders {

     entity Orders    as projection on logajog.Orders;

}