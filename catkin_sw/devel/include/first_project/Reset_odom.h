// Generated by gencpp from file first_project/Reset_odom.msg
// DO NOT EDIT!


#ifndef FIRST_PROJECT_MESSAGE_RESET_ODOM_H
#define FIRST_PROJECT_MESSAGE_RESET_ODOM_H

#include <ros/service_traits.h>


#include <first_project/Reset_odomRequest.h>
#include <first_project/Reset_odomResponse.h>


namespace first_project
{

struct Reset_odom
{

typedef Reset_odomRequest Request;
typedef Reset_odomResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Reset_odom
} // namespace first_project


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::first_project::Reset_odom > {
  static const char* value()
  {
    return "018a2998f38d6a4605b80747930e74ce";
  }

  static const char* value(const ::first_project::Reset_odom&) { return value(); }
};

template<>
struct DataType< ::first_project::Reset_odom > {
  static const char* value()
  {
    return "first_project/Reset_odom";
  }

  static const char* value(const ::first_project::Reset_odom&) { return value(); }
};


// service_traits::MD5Sum< ::first_project::Reset_odomRequest> should match
// service_traits::MD5Sum< ::first_project::Reset_odom >
template<>
struct MD5Sum< ::first_project::Reset_odomRequest>
{
  static const char* value()
  {
    return MD5Sum< ::first_project::Reset_odom >::value();
  }
  static const char* value(const ::first_project::Reset_odomRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::first_project::Reset_odomRequest> should match
// service_traits::DataType< ::first_project::Reset_odom >
template<>
struct DataType< ::first_project::Reset_odomRequest>
{
  static const char* value()
  {
    return DataType< ::first_project::Reset_odom >::value();
  }
  static const char* value(const ::first_project::Reset_odomRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::first_project::Reset_odomResponse> should match
// service_traits::MD5Sum< ::first_project::Reset_odom >
template<>
struct MD5Sum< ::first_project::Reset_odomResponse>
{
  static const char* value()
  {
    return MD5Sum< ::first_project::Reset_odom >::value();
  }
  static const char* value(const ::first_project::Reset_odomResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::first_project::Reset_odomResponse> should match
// service_traits::DataType< ::first_project::Reset_odom >
template<>
struct DataType< ::first_project::Reset_odomResponse>
{
  static const char* value()
  {
    return DataType< ::first_project::Reset_odom >::value();
  }
  static const char* value(const ::first_project::Reset_odomResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // FIRST_PROJECT_MESSAGE_RESET_ODOM_H