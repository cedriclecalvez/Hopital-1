import React, { useEffect, useState } from "react";
import api from "../utils/api";

export const Services = (props) => {
  const { servicesName } = props;

  const [services, setServices] = useState([]);

  useEffect(async () => {
    console.log("test in Services : call api");
    const axiosResponse = await api.get("/services");
    console.log("axiosResponse to get all services:", axiosResponse);
    console.log("axiosResponse to get all services:", axiosResponse.data);
    setServices(axiosResponse.data);
  }, []);
  console.log("all services:", services);

  return (
    <div className="services-wrapper">
      <h1>{servicesName}</h1>
      <ul>
        {services.map((service) => {
          return <li key={service.id}>{service.name}</li>;
        })}
      </ul>
    </div>
  );
};
