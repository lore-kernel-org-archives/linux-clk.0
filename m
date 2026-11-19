Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052575;
	b=IsAODSoGcBQkHiwDTliF7gZtRZEmnnI++2GL/kPkDPp+nPW5WGN7Dz79OQDKoN4PHLK2
	 4JW2qTNgEm2F90aDzMjOxglpeIlQeVPNEbqQnLCredhoPDDv6lrHgX9369tTC88ETBsnu
	 ZwOhGl3dcySlyThUusQPtWVilt1K1FJouKBd0MAL4+GM8Z/2ndyN7dwdfm4+UOAeM0TsF
	 FqYsC8cgASqJVSzttboMOw6gmKwtYOkiyPoswKbOTW5oNkk2zFr+RUfIptbGoOKlGY6fX
	 kOvCEOU3yesbiC+PQIRiWab/a8FHzcOVYMO1caB3nvOA76gpqTrdfHFwAEhfoFJNNxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052575;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TNJqWRDLQtqezoNq5nZn5mof+TYc54a++ODP8eRnVHc=;
	b=H4HC2fi8hkpnU+kMry5ivvgCW6ZE1tCfz4IkG+Nri6F91LLCsm0J7CzhT829Qgbpzc1S
	 1J/eYvtbtyV5PUgy/fAUEuvgzy8pMEsL4PJ3rYex692N8TEwSkHzcqMtyuw7zxoVs+Bic
	 SQkbBaFNTDLkGHmL/8YFq8SkN6P6okwXYkwVza/mlBUhjo4Ld7bGpHP7mf5qBhNptzvRp
	 zY9qBh+18MZjlZhhXwOYKT/SEp0R1WioptlBy46WvAP5VNqNnI60ObwUCnR6FoCkKCtd7
	 2wwWJd21U9hCnqtaTI2LvkEOSYShNRye8QCMQXJIjM4v7NknXFyOJyAgp2PtilmspDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbqZ2o6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515E606A31C;
	Thu, 19 Nov 2026 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbqZ2o6L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C3D1F000C4;
	Thu, 19 Nov 2026 01:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052574;
	bh=TNJqWRDLQtqezoNq5nZn5mof+TYc54a++ODP8eRnVHc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YbqZ2o6LybiBta1rVCuHeCUhjeSQM4UAwL8chwlTCTSEP/ugY8MEYxDAT6M7UieQO
	 U4optAag57zlP6HGMestwOoBI1eaiT0pOUB9CR0Y5P1f4xWXEHQ/xXnvUiXaKZMEAK
	 8Lcc3M9Cu00ikxCZES/uCbMiA7qiFsdDNfDA/FO2VWnVDUUhUQXP4D53jVnQ/krk+m
	 AlfjgqJJRuNRjX3LzXj+//gi7dTWPThK6PIUfBgCAJxkAZ6ooxHQ2bsmNBTUUPZuMP
	 iI6bpL21zUuzj1oLwoxIGzjvFkJbiUnLLxUqQi0uxWoWjKwiy99MdycmpuJXt5swlu
	 s5DTv37MSkGCQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/5] clk: cix: Register the Sky1 AUDSS IRQ auxiliary
 device
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com, 
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 tglx@kernel.org, devicetree@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, radu@rendec.net, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117094408.1393837-4-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
 <20261117094408.1393837-4-Jelly.Jia@cixtech.com>
Date: Wed, 18 Nov 2026 20:42:47 -0500
Message-Id: <179505256752.187996.952601612639868708.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=aXJ9C26UieRByax4ACS+gov5jq9nofkOwnsEGr9engA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+hUiEcaTk/F45R5EtfaKBzzS9SQLKDzkW/XLqqIn1l
 j3i+P5DRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZJ8Hwv5C1M+SA6PnfQYyP
 vq+c2pon8E9T00sp87RwxCzxTdpCrQz/c2rrq1Vbb3ntWBFsN32me9/bIKNF5lnCm9a1KZ+XLH/
 CAAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Jelly,

> Register an auxiliary IRQ device for CRU nodes declaring an interrupt
> controller, following the existing reset device pattern. Share a raw-lock
> regmap with the IRQ driver and preserve gate/reset context while powering
> down the CRU. Restore the parent before child IRQ delivery resumes using
> noirq system-sleep ordering.
> 
> The existing reset-sky1-audss.c is unchanged. Auxiliary child teardown must
> run before parent regmap/runtime-PM cleanup.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  drivers/clk/cix/clk-sky1-audss.c | 37 +++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
> index e096b8121df3..fa51cdf4f4bd 100644
> --- a/drivers/clk/cix/clk-sky1-audss.c
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -2,6 +2,7 @@
>  // Copyright 2026 Cix Technology Group Co., Ltd.
>  
>  #include <linux/auxiliary_bus.h>
> +#include <linux/bits.h>

This doesn't appear to be needed.

>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> @@ -18,7 +19,9 @@
>  #define INFO_CLK_GATE				0x10
>  #define INFO_CLK_DIV				0x14
>  #define INFO_CLK_MUX				0x18
> +#define INFO_AP_IRQC				0x54
>  #define INFO_MCLK				0x70
> +#define INFO_SW_RESETN				0x78
>  
>  #define SKY1_AUDSS_CLK_PARENTS_CNT		4
>  #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
> @@ -28,7 +31,9 @@ static u32 sky1_reg_save[][2] = {
>  	{ INFO_CLK_GATE,  0 },
>  	{ INFO_CLK_DIV, 0 },
>  	{ INFO_CLK_MUX, 0 },
> +	{ INFO_AP_IRQC, 0 },
>  	{ INFO_MCLK, 0 },
> +	{ INFO_SW_RESETN, 0 },

This, along with the defines should go in a separate commit.

>  };
>  
>  static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
> @@ -519,6 +524,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> +	.use_raw_spinlock = true,
>  };
>  
>  struct sky1_audss_clks_priv {
> @@ -928,6 +934,21 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
>  	return err;
>  }
>  
> +static int sky1_audss_irq_controller_register(struct device *dev)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!IS_ENABLED(CONFIG_IRQ_SKY1_AUDSS) ||
> +	    !of_property_present(dev->of_node, "interrupt-controller"))
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "irq", NULL);
> +	if (!adev)
> +		return -ENODEV;
> +
> +	return 0;

The reset registration code currently has:

    #if IS_ENABLED(CONFIG_RESET_SKY1_AUDSS)

    static int sky1_audss_reset_controller_register(struct device *dev)
    {
    ...
    }
    #else
    static int sky1_audss_reset_controller_register(struct device *dev)
    {
    	return 0;
    }

I don't care which pattern you use but make it consistent within this
driver.

> +}
> +
>  static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
>  {
>  	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> @@ -1110,6 +1131,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
>  		goto fail_pm;
>  	}
>  
> +	/* Remove auxiliary children before the parent runtime-PM cleanup. */
> +	ret = sky1_audss_irq_controller_register(dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
> +		goto fail_pm;
> +	}
> +
>  	pm_runtime_put_sync(dev);
>  
>  	return 0;
> @@ -1125,6 +1153,7 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
>  	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
>  	unsigned long flags;
>  	int i;
> +	int ret;

The ret can be folded into the line above.

>  
>  	spin_lock_irqsave(&priv->lock, flags);
>  	for (i = 0; i < devtype_data->reg_save_size; i++)
> @@ -1132,7 +1161,9 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
>  			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
>  	spin_unlock_irqrestore(&priv->lock, flags);
>  
> -	reset_control_assert(priv->rst_noc);
> +	ret = reset_control_assert(priv->rst_noc);
> +	if (ret)
> +		return ret;

Should this be a separate patch?

>  
>  	sky1_audss_clks_disable(priv);
>  
> @@ -1170,8 +1201,8 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
>  static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
>  	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
>  			   sky1_audss_clk_runtime_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)

The IRQ driver uses the new pm_ptr(). Please use that.

Brian

-- 
Brian Masney <masneyb@kernel.org>
