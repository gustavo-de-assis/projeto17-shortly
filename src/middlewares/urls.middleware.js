import joi from "joi";

const urlSchema = joi.object({
    url: joi.string().required()
})

export function urlValidation (req, res, next){
    const url = req.body;

    const validationError = urlSchema.validate(url, {
        abortEarly: false,
    }).error;

    if(validationError){
        const error = validationError.details.map((e) => e.message);
        return res.status(422).send(error);
    }

    next();
}