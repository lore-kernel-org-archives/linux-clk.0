Return-Path: <dmitry.torokhov@gmail.com>
Return-Path: <dmitry.torokhov@gmail.com>
Date: Mon, 6 Feb 2017 19:51:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: add more managed APIs
Message-ID: <20170207035151.GA18296@dtor-ws>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170131005713.GA35974@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170131005713.GA35974@dtor-ws>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 30, 2017 at 04:57:13PM -0800, Dmitry Torokhov wrote:
> When converting a driver to managed resources it is desirable to be able to
> manage all resources in the same fashion. This change allows managing clock
> prepared and enabled state in the same way we manage many other resources.
> 
> This adds the following managed APIs:
> 
> - devm_clk_prepare()/devm_clk_unprepare();
> - devm_clk_prepare_enable()/devm_clk_disable_unprepare().
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

It would be awesome if we could get it into 4.11...

> ---
> 
> v3: adjusted commit message, added Guenter's reviewed-by
> v2: dropped devm_clk_enable() and devm_clk_disable()
> 
>  drivers/clk/clk-devres.c |   98 +++++++++++++++++++++++++++++++---------------
>  include/linux/clk.h      |   68 ++++++++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 3a218c3a06ae..2ff94ffe11d3 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -9,30 +9,20 @@
>  #include <linux/export.h>
>  #include <linux/gfp.h>
>  
> -static void devm_clk_release(struct device *dev, void *res)
> +static int devm_clk_create_devres(struct device *dev, struct clk *clk,
> +				  void (*release)(struct device *, void *))
>  {
> -	clk_put(*(struct clk **)res);
> -}
> +	struct clk **ptr;
>  
> -struct clk *devm_clk_get(struct device *dev, const char *id)
> -{
> -	struct clk **ptr, *clk;
> -
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> +	ptr = devres_alloc(release, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>  
> -	clk = clk_get(dev, id);
> -	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> +	*ptr = clk;
> +	devres_add(dev, ptr);
>  
> -	return clk;
> +	return 0;
>  }
> -EXPORT_SYMBOL(devm_clk_get);
>  
>  static int devm_clk_match(struct device *dev, void *res, void *data)
>  {
> @@ -44,31 +34,75 @@ static int devm_clk_match(struct device *dev, void *res, void *data)
>  	return *c == data;
>  }
>  
> -void devm_clk_put(struct device *dev, struct clk *clk)
> +#define DEFINE_DEVM_CLK_DESTROY_OP(destroy_op)				\
> +static void devm_##destroy_op##_release(struct device *dev, void *res)	\
> +{									\
> +	destroy_op(*(struct clk **)res);				\
> +}									\
> +									\
> +void devm_##destroy_op(struct device *dev, struct clk *clk)		\
> +{									\
> +	WARN_ON(devres_release(dev, devm_##destroy_op##_release,	\
> +				devm_clk_match, clk));			\
> +}									\
> +EXPORT_SYMBOL(devm_##destroy_op)
> +
> +#define DEFINE_DEVM_CLK_OP(create_op, destroy_op)			\
> +DEFINE_DEVM_CLK_DESTROY_OP(destroy_op);					\
> +int devm_##create_op(struct device *dev, struct clk *clk)		\
> +{									\
> +	int error;							\
> +									\
> +	error = create_op(clk);						\
> +	if (error)							\
> +		return error;						\
> +									\
> +	error = devm_clk_create_devres(dev, clk,			\
> +					devm_##destroy_op##_release);	\
> +	if (error) {							\
> +		destroy_op(clk);					\
> +		return error;						\
> +	}								\
> +									\
> +	return 0;							\
> +}									\
> +EXPORT_SYMBOL(devm_##create_op)
> +
> +DEFINE_DEVM_CLK_DESTROY_OP(clk_put);
> +DEFINE_DEVM_CLK_OP(clk_prepare, clk_unprepare);
> +DEFINE_DEVM_CLK_OP(clk_prepare_enable, clk_disable_unprepare);
> +
> +struct clk *devm_clk_get(struct device *dev, const char *id)
>  {
> -	int ret;
> +	struct clk *clk;
> +	int error;
>  
> -	ret = devres_release(dev, devm_clk_release, devm_clk_match, clk);
> +	clk = clk_get(dev, id);
> +	if (!IS_ERR(clk)) {
> +		error = devm_clk_create_devres(dev, clk, devm_clk_put_release);
> +		if (error) {
> +			clk_put(clk);
> +			return ERR_PTR(error);
> +		}
> +	}
>  
> -	WARN_ON(ret);
> +	return clk;
>  }
> -EXPORT_SYMBOL(devm_clk_put);
> +EXPORT_SYMBOL(devm_clk_get);
>  
>  struct clk *devm_get_clk_from_child(struct device *dev,
>  				    struct device_node *np, const char *con_id)
>  {
> -	struct clk **ptr, *clk;
> -
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +	struct clk *clk;
> +	int error;
>  
>  	clk = of_clk_get_by_name(np, con_id);
>  	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> +		error = devm_clk_create_devres(dev, clk, devm_clk_put_release);
> +		if (error) {
> +			clk_put(clk);
> +			return ERR_PTR(error);
> +		}
>  	}
>  
>  	return clk;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index e9d36b3e49de..413dc8f636bd 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -267,6 +267,29 @@ struct clk *devm_get_clk_from_child(struct device *dev,
>  				    struct device_node *np, const char *con_id);
>  
>  /**
> + * devm_clk_prepare - prepare clock source as a managed resource
> + * @dev: device owning the resource
> + * @clk: clock source
> + *
> + * This prepares the clock source for use.
> + *
> + * Must not be called from within atomic context.
> + */
> +int devm_clk_prepare(struct device *dev, struct clk *clk);
> +
> +/**
> + * devm_clk_unprepare - undo preparation of a managed clock source
> + * @dev: device used to prepare the clock
> + * @clk: clock source
> + *
> + * This undoes preparation of a clock, previously prepared with a call
> + * to devm_clk_pepare().
> + *
> + * Must not be called from within atomic context.
> + */
> +void devm_clk_unprepare(struct device *dev, struct clk *clk);
> +
> +/**
>   * clk_enable - inform the system when the clock source should be running.
>   * @clk: clock source
>   *
> @@ -295,6 +318,28 @@ int clk_enable(struct clk *clk);
>  void clk_disable(struct clk *clk);
>  
>  /**
> + * devm_clk_prepare_enable - prepare and enable a managed clock source
> + * @dev: device owning the clock source
> + * @clk: clock source
> + *
> + * This prepares the clock source for use and enables it.
> + *
> + * Must not be called from within atomic context.
> + */
> +int devm_clk_prepare_enable(struct device *dev, struct clk *clk);
> +
> +/**
> + * devm_clk_disable_unprepare - disable and undo preparation of a managed clock
> + * @dev: device used to prepare and enable the clock
> + * @clk: clock source
> + *
> + * This disables and undoes a previously prepared clock.
> + *
> + * Must not be called from within atomic context.
> + */
> +void devm_clk_disable_unprepare(struct device *dev, struct clk *clk);
> +
> +/**
>   * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
>   *		  This is only valid once the clock source has been enabled.
>   * @clk: clock source
> @@ -460,6 +505,17 @@ static inline void clk_put(struct clk *clk) {}
>  
>  static inline void devm_clk_put(struct device *dev, struct clk *clk) {}
>  
> +static inline int devm_clk_prepare(struct device *dev, struct clk *clk)
> +{
> +	might_sleep();
> +	return 0;
> +}
> +
> +static inline void devm_clk_unprepare(struct device *dev, struct clk *clk)
> +{
> +	might_sleep();
> +}
> +
>  static inline int clk_enable(struct clk *clk)
>  {
>  	return 0;
> @@ -467,6 +523,18 @@ static inline int clk_enable(struct clk *clk)
>  
>  static inline void clk_disable(struct clk *clk) {}
>  
> +static inline int devm_clk_prepare_enable(struct device *dev, struct clk *clk)
> +{
> +	might_sleep();
> +	return 0;
> +}
> +
> +static inline void devm_clk_disable_unprepare(struct device *dev,
> +					      struct clk *clk)
> +{
> +	might_sleep();
> +}
> +
>  static inline unsigned long clk_get_rate(struct clk *clk)
>  {
>  	return 0;

-- 
Dmitry
