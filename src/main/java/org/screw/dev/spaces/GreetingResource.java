package org.screw.dev.spaces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Path("/")
public class GreetingResource {

    private static final Logger logger = LoggerFactory.getLogger(GreetingResource.class);

    @POST
    @Path("mutate")
    @Produces(MediaType.TEXT_PLAIN)
    public Response hello() {

        logger.info("fake webhook invoked");
        return Response.ok().build();
    }
}