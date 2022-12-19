import joi from "joi";

const userSchema = joi.object({
    name: joi.string().min(3).required(),
    email: joi.string().required(),
    password: joi.string().min(6).required()
})

export function userValidation (req, res, next){
    const user = req.body;

    const validationError = userSchema.validate(user, {
        abortEarly: false,
    }).error;

    if(validationError){
        const error = validationError.details.map((e) => e.message);
        return res.status(422).send(error);
    }

    next();
}