Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MEGRrHTG"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B2E199A
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 05:15:13 -0800 (PST)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B1A03F0F8
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702041311;
	bh=c5wUCZP5uxT+D5h6Lc7Bx9+IP9vdWehgZtwy5FF1vNU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MEGRrHTGyX8+TQuTwCa64aZiyk6dhrmm8BAlI5I06kCptYqAQEnC04mPvSyQOXGbc
	 zgXi33L6Tg31RDLqIjq5vmzG+0T2nKBGtFNtwdTlKHZ7E48UCV6NiorCR4N0Eg0TJe
	 zuhpgwiLeRiv/fEYqDqRZCOOyu/WuDqcsGpUXSIMyskNy7J2cIbkVUuz+Kp8oIdtRJ
	 jTY5p6S0ekLMbpyDyxY5sXbk1+tRi+hhCxpTeEWIfD5d5e+bdTURNpHgYLq51uAFmi
	 bXanFS15Om6NqcKoYkyPG3nPqqzjfcDFvStO0C3NSyu5dNka6dUp5fSr+9OMPQxQ/+
	 vQDbHPI3dQhtA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-423afeb1cbcso24764591cf.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2023 05:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041310; x=1702646110;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5wUCZP5uxT+D5h6Lc7Bx9+IP9vdWehgZtwy5FF1vNU=;
        b=kvztv4cWX1YxzmBGfXczySgyjL0+4N9wkbvVIRpM+Z8tUubzfGwFs+y9oELlRuVYAM
         vJ1Ny+LLXbWObhUKa8V9k7QVFPNyoTEEZSdGOOGSOLwMI/kJipO2maGC7Nfk/33y4sTN
         9UUIXbI3Ev0gS6JXi9OGFkHDyahiKn6/N+KkfgnMO43Zbdiqvx6OaRbssYZfj+eoU2AR
         h242g3E8pdmEIAvJMsEzEn0c0V/FPuUx9Q7hMJ8WFluSE6WEWec5SllMZckxjeIiw6HE
         J1sV41m+mWhXnQAa9/adMti1EiV6HDqTlIf6ucDTBBJaMaJohblWXPno0ZsceQby73K8
         t5bg==
X-Gm-Message-State: AOJu0Yzn8wmajknTo7sBN8UB/B+RbT1PKpWYADjw7lNYpuxlTaGxlu4I
	1W29awp/bnJUCu4HNiaYyxwztcjZesf/zS6t34ah4cCo78g/j4wuKjLf7ZFXMX68m4VtfMPGOcz
	pE4xng6ZHdw563j/QSp/LqRk6k6qjT3VbMWNP2Pii+jJaU+HcDPhffw==
X-Received: by 2002:ac8:59cd:0:b0:425:a282:71ae with SMTP id f13-20020ac859cd000000b00425a28271aemr83649qtf.65.1702041310494;
        Fri, 08 Dec 2023 05:15:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGznAXIIRyxMLb5pO2qeJrPUYYl2PAXtj36+PqtwjGvaAeZjPNal02cbh/Khten3+rQ2+aY7jlmCUrdPAAgJ9c=
X-Received: by 2002:ac8:59cd:0:b0:425:a282:71ae with SMTP id
 f13-20020ac859cd000000b00425a28271aemr83624qtf.65.1702041310209; Fri, 08 Dec
 2023 05:15:10 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:15:09 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-3-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-3-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:15:09 -0500
Message-ID: <CAJM55Z9yLeMDifcGprgav_cJgwLUwKPcsPJSyjSxr2-nVw-YrQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] reset: starfive: Convert the word "jh71x0" to "starfive"
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
Content-Type: text/plain; charset="UTF-8"

Sia Jee Heng wrote:
> Function names that consist of the 'jh71x0' naming convention are
> renamed to use the 'starfive' wording.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../clk/starfive/clk-starfive-jh7110-sys.c    |  4 +-
>  .../reset/starfive/reset-starfive-common.c    | 64 +++++++++----------
>  .../reset/starfive/reset-starfive-common.h    |  8 +--
>  .../reset/starfive/reset-starfive-jh7100.c    |  2 +-
>  .../reset/starfive/reset-starfive-jh7110.c    |  4 +-
>  include/soc/starfive/reset-starfive-common.h  |  6 +-
>  6 files changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 6e45c580c9ba..e63353c70209 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -345,7 +345,7 @@ static void jh7110_reset_unregister_adev(void *_adev)
>  static void jh7110_reset_adev_release(struct device *dev)
>  {
>  	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
> +	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
>
>  	kfree(rdev);
>  }
> @@ -354,7 +354,7 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  				     const char *adev_name,
>  				     u32 adev_id)
>  {
> -	struct jh71x0_reset_adev *rdev;
> +	struct starfive_reset_adev *rdev;
>  	struct auxiliary_device *adev;
>  	int ret;
>
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
> index dab454e46bbf..8d8dec9e5d7a 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -14,7 +14,7 @@
>
>  #include "reset-starfive-common.h"
>
> -struct jh71x0_reset {
> +struct starfive_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
>  	spinlock_t lock;
> @@ -23,16 +23,16 @@ struct jh71x0_reset {
>  	const u32 *asserted;
>  };
>
> -static inline struct jh71x0_reset *
> -jh71x0_reset_from(struct reset_controller_dev *rcdev)
> +static inline struct starfive_reset *
> +starfive_reset_from(struct reset_controller_dev *rcdev)
>  {
> -	return container_of(rcdev, struct jh71x0_reset, rcdev);
> +	return container_of(rcdev, struct starfive_reset, rcdev);
>  }
>
> -static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
> -			       unsigned long id, bool assert)
> +static int starfive_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
>  {
> -	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> +	struct starfive_reset *data = starfive_reset_from(rcdev);
>  	unsigned long offset = id / 32;
>  	u32 mask = BIT(id % 32);
>  	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> @@ -61,34 +61,34 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  	return ret;
>  }
>
> -static int jh71x0_reset_assert(struct reset_controller_dev *rcdev,
> -			       unsigned long id)
> +static int starfive_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
>  {
> -	return jh71x0_reset_update(rcdev, id, true);
> +	return starfive_reset_update(rcdev, id, true);
>  }
>
> -static int jh71x0_reset_deassert(struct reset_controller_dev *rcdev,
> -				 unsigned long id)
> +static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
>  {
> -	return jh71x0_reset_update(rcdev, id, false);
> +	return starfive_reset_update(rcdev, id, false);
>  }
>
> -static int jh71x0_reset_reset(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> +static int starfive_reset_reset(struct reset_controller_dev *rcdev,
> +				unsigned long id)
>  {
>  	int ret;
>
> -	ret = jh71x0_reset_assert(rcdev, id);
> +	ret = starfive_reset_assert(rcdev, id);
>  	if (ret)
>  		return ret;
>
> -	return jh71x0_reset_deassert(rcdev, id);
> +	return starfive_reset_deassert(rcdev, id);
>  }
>
> -static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
> -			       unsigned long id)
> +static int starfive_reset_status(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
>  {
> -	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> +	struct starfive_reset *data = starfive_reset_from(rcdev);
>  	unsigned long offset = id / 32;
>  	u32 mask = BIT(id % 32);
>  	void __iomem *reg_status = data->status + offset * sizeof(u32);
> @@ -97,25 +97,25 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  	return !((value ^ data->asserted[offset]) & mask);
>  }
>
> -static const struct reset_control_ops jh71x0_reset_ops = {
> -	.assert		= jh71x0_reset_assert,
> -	.deassert	= jh71x0_reset_deassert,
> -	.reset		= jh71x0_reset_reset,
> -	.status		= jh71x0_reset_status,
> +static const struct reset_control_ops starfive_reset_ops = {
> +	.assert		= starfive_reset_assert,
> +	.deassert	= starfive_reset_deassert,
> +	.reset		= starfive_reset_reset,
> +	.status		= starfive_reset_status,
>  };
>
> -int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
> -				   void __iomem *assert, void __iomem *status,
> -				   const u32 *asserted, unsigned int nr_resets,
> -				   struct module *owner)
> +int reset_starfive_register(struct device *dev, struct device_node *of_node,
> +			    void __iomem *assert, void __iomem *status,
> +			    const u32 *asserted, unsigned int nr_resets,
> +			    struct module *owner)
>  {
> -	struct jh71x0_reset *data;
> +	struct starfive_reset *data;
>
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>
> -	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.ops = &starfive_reset_ops;
>  	data->rcdev.owner = owner;
>  	data->rcdev.nr_resets = nr_resets;
>  	data->rcdev.dev = dev;
> @@ -128,4 +128,4 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
>
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
> -EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +EXPORT_SYMBOL_GPL(reset_starfive_register);
> diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
> index 266acc4b2caf..83461b22ee55 100644
> --- a/drivers/reset/starfive/reset-starfive-common.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -6,9 +6,9 @@
>  #ifndef __RESET_STARFIVE_COMMON_H
>  #define __RESET_STARFIVE_COMMON_H
>
> -int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
> -				   void __iomem *assert, void __iomem *status,
> -				   const u32 *asserted, unsigned int nr_resets,
> -				   struct module *owner);
> +int reset_starfive_register(struct device *dev, struct device_node *of_node,
> +			    void __iomem *assert, void __iomem *status,
> +			    const u32 *asserted, unsigned int nr_resets,
> +			    struct module *owner);
>
>  #endif /* __RESET_STARFIVE_COMMON_H */
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
> index 546dea2e5811..122ac6c3893b 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -51,7 +51,7 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>
> -	return reset_starfive_jh71x0_register(&pdev->dev, pdev->dev.of_node,
> +	return reset_starfive_register(&pdev->dev, pdev->dev.of_node,
>  					      base + JH7100_RESET_ASSERT0,
>  					      base + JH7100_RESET_STATUS0,
>  					      jh7100_reset_asserted,
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 87dba01491ae..c4dd21761e53 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -53,13 +53,13 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
>  			      const struct auxiliary_device_id *id)
>  {
>  	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
> -	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
> +	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
>  	void __iomem *base = rdev->base;
>
>  	if (!info || !base)
>  		return -ENODEV;
>
> -	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
> +	return reset_starfive_register(&adev->dev, adev->dev.parent->of_node,
>  					      base + info->assert_offset,
>  					      base + info->status_offset,
>  					      NULL,
> diff --git a/include/soc/starfive/reset-starfive-common.h b/include/soc/starfive/reset-starfive-common.h
> index 56d8f413cf18..16df46a074bc 100644
> --- a/include/soc/starfive/reset-starfive-common.h
> +++ b/include/soc/starfive/reset-starfive-common.h
> @@ -6,12 +6,12 @@
>  #include <linux/compiler_types.h>
>  #include <linux/container_of.h>
>
> -struct jh71x0_reset_adev {
> +struct starfive_reset_adev {
>  	void __iomem *base;
>  	struct auxiliary_device adev;
>  };
>
> -#define to_jh71x0_reset_adev(_adev) \
> -	container_of((_adev), struct jh71x0_reset_adev, adev)
> +#define to_starfive_reset_adev(_adev) \
> +	container_of((_adev), struct starfive_reset_adev, adev)
>
>  #endif
> --
> 2.34.1
>
