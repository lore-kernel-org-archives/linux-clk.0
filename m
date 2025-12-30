Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489A288C27
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055819; cv=none; b=Q+YG4KmBY/tQjjQgLtzpVNFnkOxVIhNlbG565z26kwld8jpn9mYJLidBHmLwG9FMV5FCNEB+rGc/oBkktLAo3umoI5DulVVqkb1ZDtMhHOzkVn1Qhle79x61BwJdOLsxogIiBIJwLR/aqZwZ9cfil2cWgoImGJ27i7hQcuW/7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055819; c=relaxed/simple;
	bh=QF0nWAk1WZ3nHvQmAScdls1GbfonTw3BqpbMEHWUbvo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d8mU8PojYOiDoQCKKXpX6RZFLniFDVyOxYnERidkUmEGVO6wC2rm7RcEbWRfCpGUT/RPCAsXJ/B/qNiYir5RoyNFZP624xvXUD9arN4xM2oWSfOvHI7EhNgAznl1aMJMjYecktCQv8ID0RQYT4dMJsRxC4VIqfLDvhFpXeXyoCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RDM0Kgd3; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RDM0Kgd3"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88a3b9ddd40so53307596d6.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 16:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055815; x=1767660615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mcQfeRSOzGUpy1su1reSd6KnOIVV8UyhdobMHCI9C80=;
        b=RDM0Kgd3u9YBPjPWrkmul4G79hEz28qxlFtpjkndHp/vbRl4gS1/vZ4HDraMOrOCEk
         p7vu5p5eQEiPW8dp1gkpscTnLNIsa0jmTiT1hcEhkkvy6IWuqGgUNfumda7iOCy0z1xf
         8Vc0oWqa47nBnL3hqLTyj1Mzic8uJh3p12fxUhKe1B96b6jANVqV/FaS7yDJlc6TeimE
         7eQe8K3S2zOwljbpPQJPygCzSRqEI2DNV3mtB+eIVTfjMUstIzdnJuLHSkWwb+SCfFEe
         Xj59qHqEkzTRpYR3GW+MZ1DJMwoZUhgPhAhT+/QwzhUNqNzdIp44yFgxSxN6WQ29o+bt
         skQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055815; x=1767660615;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcQfeRSOzGUpy1su1reSd6KnOIVV8UyhdobMHCI9C80=;
        b=NQLw4XF9i14v1FIX5RkIKf6jiRop2roNWX4Kkdvg4G71972xZ4fkClORIARwBNSIf+
         cj36PuUSzCTZ2EuN3qyNu4zj3Su0AgfobWuvqITxAWLjuvIgmg+D6xsnfvIkBSO45e5v
         QdyNoyOZYVfeOVnf2m3Tkt/8zKyBlM3+U0+c6rNH4QmS6j6cahV8eiXYK7ExY+fN3Bn/
         ptGGxTAEXmFVvByvDXBzWz0Y8kDcmFhyePTb2LmSiqUUITkRvnvg+rIMydFrzf3Uxm/e
         gm8w6pm5nfiIO+J2+mEF8CW9TKQdkSbPyHFobo3BSkhdFzalBJdNDmVvzejOBpHB+JTM
         5SoA==
X-Forwarded-Encrypted: i=1; AJvYcCXHql7GFx44dnEWX5k4vCE1nYa/aBvXFc86b6ynrc7VQ5CPBhHhjXUqeYklOoBQVlmZGg+k2RXo90U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QTPdKtF2bFU5C8UCxXQl7hoZs29Rn1dG/cjsTOO0z1gChq56
	bWMuEpmQpIDEvfVygmfhYmXoQe1LZWGJ8bdxtS/OKfebe8HHdCprl+eoiKw/4+8+QAM=
X-Gm-Gg: AY/fxX6TFPz+5nYrkJtQiDeZWz1eXjMrqrVjLfdMgmkdNo8TwEZ+rEGcnIcWu6zawP/
	fXpqfg9VeRVu+kHe6CGwwmknOu9CgwS53kP+yk849G3kmUkrOLycen50uJ5eAsn3uHTYZA0AeAZ
	POdPXn/hyw9NyiI3cBkGdJ0AYesr0wSriUGsQivUBC1sVOOaYEyLUIaCqZklCVdarMYFfP8I0G5
	/yfHN5/zLF41lULsyxYUgKNrQR/hceQnS7BlmeZg/WYAqfvcwvRgDq9XoxPlIvM7CQc3k0ua3Hv
	UU2jECUpcRZnNgPZQRUEtSlfhyvKLcWOi0vj3Kyl7cjNrM8tjejS0tOYxlHQbbeyJuG5+xzpm7j
	fHItsvokxCzsi15iOr22ynLHbxn0/tNSsLi+84PKBUnw6b6CgBy00nOmkjmUXhrltmLU4q0LDE8
	mCnRXvhCX4Yq4SjDQKa7T581fF6AMO0rZjy4HJHDKGBgQdvbxRD90=
X-Google-Smtp-Source: AGHT+IF2ABeBWgRWRwwsbjzT/6REvtqaV8aFrPPVBUy5ytQBFWhVoVrPlEMOJ2p37Czl1zIpI40giA==
X-Received: by 2002:a05:6214:4285:b0:882:44cc:f58e with SMTP id 6a1803df08f44-88d8166590dmr599666146d6.2.1767055815490;
        Mon, 29 Dec 2025 16:50:15 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:15 -0800 (PST)
Message-ID: <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:14 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yao Zi <me@ziyao.cc>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 12:55 AM, Yixun Lan wrote:
> Refactor the probe function of SpacemiT's clock, and extract a common ccu
> file, so new clock driver added in the future can share the same code,
> which would lower the burden of maintenance. Since this commit changes the
> module name where the auxiliary device registered, the auxiliary device id
> need to be adjusted. Idea of the patch is come from review of K3 clock
> driver, please refer this disucssion [1].

I understand the point here, and it's just like the first patch:
you're extracting generic code out of the K1-specific file so a
new K3-specific source file can use it too.  This is really good.

However the end result should incorporate *only* generic code
in the generic file, and have the SoC-specific source files
contain everything else.

But as you have it now, the (new) generic probe function
contains special handling for "spacemit,k1-pll", and that's
not generic.

So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
separately, allowing each of them to do platform-specific things
before (and/or after) calling the generic probe function.

I had this comment at the end but I'll put it here instead:
You could move the spacemit_ccu_data structure into the common
header file in a separate patch (possibly the one where you
introduced that file in the first place).


OK now I'll talk a bit about why I think you don't need to change
the names of the resets auxiliary devices.  (And even if you do,
I don't think you need the macro.)

Each CCU is defined by its "data" in of_k1_ccu_match[].  The
compatible strings that match those CCUs will be specified in
the DTS files.  For a given platform (K1 or K3), only those
CCUs that make sense for that platform will be defined (i.e.
"spacemit,k1-syscon-mpmu" defines k1_ccu_mpmu_data, which is
appropriate for a K1 platform, not K3).

So even if two resets have the same name, it shouldn't
matter if they're defined for use by separate platforms.
(I think the name is mainly used in defining the auxiliary
device name.)

I might be mistaken, and I don't think adding an SoC identifier
to the reset name hurts anything.  If you do it, it should be
done inside the platform-specific file.

And... I don't know why you don't just add "k1-" or "k3-" to
the name assigned rather than using the macro.  You're only
using it within a platform-specific structure.

static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
	.reset_name	= "k1-mpmu-reset",

rather than
	.reset_name	= _K_RST(mpmu),

					-Alex

> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/clk/spacemit/ccu-k1.c     | 188 ++------------------------------------
>   drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |  10 ++
>   3 files changed, 188 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 01d9485b615d..f97d6f0f0c39 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -5,15 +5,10 @@
>    */
>   
>   #include <linux/array_size.h>
> -#include <linux/auxiliary_bus.h>
>   #include <linux/clk-provider.h>
> -#include <linux/delay.h>
> -#include <linux/idr.h>
> -#include <linux/mfd/syscon.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/slab.h>
>   #include <soc/spacemit/k1-syscon.h>
>   
>   #include "ccu_common.h"
> @@ -23,14 +18,6 @@
>   
>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
>   
> -struct spacemit_ccu_data {
> -	const char *reset_name;
> -	struct clk_hw **hws;
> -	size_t num;
> -};
> -
> -static DEFINE_IDA(auxiliary_ids);
> -
>   /* APBS clocks start, APBS region contains and only contains all PLL clocks */
>   
>   /*
> @@ -802,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= _K_RST(mpmu),
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> @@ -913,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.reset_name	= "apbc-reset",
> +	.reset_name	= _K_RST(apbc),
>   	.hws		= k1_ccu_apbc_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>   };
> @@ -984,184 +971,23 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.reset_name	= "apmu-reset",
> +	.reset_name	= _K_RST(apmu),
>   	.hws		= k1_ccu_apmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> -	.reset_name	= "rcpu-reset",
> +	.reset_name	= _K_RST(rcpu),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> -	.reset_name	= "rcpu2-reset",
> +	.reset_name	= _K_RST(rcpu2),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> -	.reset_name	= "apbc2-reset",
> +	.reset_name	= _K_RST(apbc2),
>   };
>   
> -static int spacemit_ccu_register(struct device *dev,
> -				 struct regmap *regmap,
> -				 struct regmap *lock_regmap,
> -				 const struct spacemit_ccu_data *data)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	int i, ret;
> -
> -	/* Nothing to do if the CCU does not implement any clocks */
> -	if (!data->hws)
> -		return 0;
> -
> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> -				GFP_KERNEL);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	clk_data->num = data->num;
> -
> -	for (i = 0; i < data->num; i++) {
> -		struct clk_hw *hw = data->hws[i];
> -		struct ccu_common *common;
> -		const char *name;
> -
> -		if (!hw) {
> -			clk_data->hws[i] = ERR_PTR(-ENOENT);
> -			continue;
> -		}
> -
> -		name = hw->init->name;
> -
> -		common = hw_to_ccu_common(hw);
> -		common->regmap		= regmap;
> -		common->lock_regmap	= lock_regmap;
> -
> -		ret = devm_clk_hw_register(dev, hw);
> -		if (ret) {
> -			dev_err(dev, "Cannot register clock %d - %s\n",
> -				i, name);
> -			return ret;
> -		}
> -
> -		clk_data->hws[i] = hw;
> -	}
> -
> -	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> -	if (ret)
> -		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> -
> -	return ret;
> -}
> -
> -static void spacemit_cadev_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	ida_free(&auxiliary_ids, adev->id);
> -	kfree(to_spacemit_ccu_adev(adev));
> -}
> -
> -static void spacemit_adev_unregister(void *data)
> -{
> -	struct auxiliary_device *adev = data;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static int spacemit_ccu_reset_register(struct device *dev,
> -				       struct regmap *regmap,
> -				       const char *reset_name)
> -{
> -	struct spacemit_ccu_adev *cadev;
> -	struct auxiliary_device *adev;
> -	int ret;
> -
> -	/* Nothing to do if the CCU does not implement a reset controller */
> -	if (!reset_name)
> -		return 0;
> -
> -	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> -	if (!cadev)
> -		return -ENOMEM;
> -
> -	cadev->regmap = regmap;
> -
> -	adev = &cadev->adev;
> -	adev->name = reset_name;
> -	adev->dev.parent = dev;
> -	adev->dev.release = spacemit_cadev_release;
> -	adev->dev.of_node = dev->of_node;
> -	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
> -	if (ret < 0)
> -		goto err_free_cadev;
> -	adev->id = ret;
> -
> -	ret = auxiliary_device_init(adev);
> -	if (ret)
> -		goto err_free_aux_id;
> -
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> -
> -err_free_aux_id:
> -	ida_free(&auxiliary_ids, adev->id);
> -err_free_cadev:
> -	kfree(cadev);
> -
> -	return ret;
> -}
> -
> -static int k1_ccu_probe(struct platform_device *pdev)
> -{
> -	struct regmap *base_regmap, *lock_regmap = NULL;
> -	const struct spacemit_ccu_data *data;
> -	struct device *dev = &pdev->dev;
> -	int ret;
> -
> -	base_regmap = device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(base_regmap))
> -		return dev_err_probe(dev, PTR_ERR(base_regmap),
> -				     "failed to get regmap\n");
> -
> -	/*
> -	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> -	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> -	 * status.
> -	 */
> -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> -		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> -							    "spacemit,mpmu", 0);
> -		if (!mpmu)
> -			return dev_err_probe(dev, -ENODEV,
> -					     "Cannot parse MPMU region\n");
> -
> -		lock_regmap = device_node_to_regmap(mpmu);
> -		of_node_put(mpmu);
> -
> -		if (IS_ERR(lock_regmap))
> -			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> -					     "failed to get lock regmap\n");
> -	}
> -
> -	data = of_device_get_match_data(dev);
> -
> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to register clocks\n");
> -
> -	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to register resets\n");
> -
> -	return 0;
> -}
> -
>   static const struct of_device_id of_k1_ccu_match[] = {
>   	{
>   		.compatible	= "spacemit,k1-pll",
> @@ -1200,7 +1026,7 @@ static struct platform_driver k1_ccu_driver = {
>   		.name		= "spacemit,k1-ccu",
>   		.of_match_table = of_k1_ccu_match,
>   	},
> -	.probe	= k1_ccu_probe,
> +	.probe	= spacemit_ccu_probe,
>   };
>   module_platform_driver(k1_ccu_driver);
>   
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index 4412c4104dab..f1a837aafb46 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -1,6 +1,177 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> +#include <linux/clk-provider.h>
> +#include <linux/device/devres.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <soc/spacemit/ccu.h>
> +
> +#include "ccu_common.h"
> +
> +static DEFINE_IDA(auxiliary_ids);
> +static int spacemit_ccu_register(struct device *dev,
> +				 struct regmap *regmap,
> +				 struct regmap *lock_regmap,
> +				 const struct spacemit_ccu_data *data)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +
> +	/* Nothing to do if the CCU does not implement any clocks */
> +	if (!data->hws)
> +		return 0;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = data->num;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		struct ccu_common *common;
> +		const char *name;
> +
> +		if (!hw) {
> +			clk_data->hws[i] = ERR_PTR(-ENOENT);
> +			continue;
> +		}
> +
> +		name = hw->init->name;
> +
> +		common = hw_to_ccu_common(hw);
> +		common->regmap		= regmap;
> +		common->lock_regmap	= lock_regmap;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret) {
> +			dev_err(dev, "Cannot register clock %d - %s\n",
> +				i, name);
> +			return ret;
> +		}
> +
> +		clk_data->hws[i] = hw;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static void spacemit_cadev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&auxiliary_ids, adev->id);
> +	kfree(to_spacemit_ccu_adev(adev));
> +}
> +
> +static void spacemit_adev_unregister(void *data)
> +{
> +	struct auxiliary_device *adev = data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int spacemit_ccu_reset_register(struct device *dev,
> +				       struct regmap *regmap,
> +				       const char *reset_name)
> +{
> +	struct spacemit_ccu_adev *cadev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	/* Nothing to do if the CCU does not implement a reset controller */
> +	if (!reset_name)
> +		return 0;
> +
> +	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> +	if (!cadev)
> +		return -ENOMEM;
> +
> +	cadev->regmap = regmap;
> +
> +	adev = &cadev->adev;
> +	adev->name = reset_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = spacemit_cadev_release;
> +	adev->dev.of_node = dev->of_node;
> +	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
> +	if (ret < 0)
> +		goto err_free_cadev;
> +	adev->id = ret;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		goto err_free_aux_id;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> +
> +err_free_aux_id:
> +	ida_free(&auxiliary_ids, adev->id);
> +err_free_cadev:
> +	kfree(cadev);
> +
> +	return ret;
> +}
> +
> +int spacemit_ccu_probe(struct platform_device *pdev)
> +{
> +	struct regmap *base_regmap, *lock_regmap = NULL;
> +	const struct spacemit_ccu_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	base_regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(base_regmap))
> +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> +				     "failed to get regmap\n");
> +
> +	/*
> +	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> +	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> +	 * status.
> +	 */
> +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> +							    "spacemit,mpmu", 0);
> +		if (!mpmu)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "Cannot parse MPMU region\n");
> +
> +		lock_regmap = device_node_to_regmap(mpmu);
> +		of_node_put(mpmu);
> +
> +		if (IS_ERR(lock_regmap))
> +			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> +					     "failed to get lock regmap\n");
> +	}
> +
> +	data = of_device_get_match_data(dev);
> +
> +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> +
> +	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register resets\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
>   
>   MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
> index da72f3836e0b..9b4ef24875e5 100644
> --- a/drivers/clk/spacemit/ccu_common.h
> +++ b/drivers/clk/spacemit/ccu_common.h
> @@ -7,6 +7,8 @@
>   #ifndef _CCU_COMMON_H_
>   #define _CCU_COMMON_H_
>   
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   
>   struct ccu_common {
> @@ -36,6 +38,12 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>   	return container_of(hw, struct ccu_common, hw);
>   }
>   
> +struct spacemit_ccu_data {
> +	const char *reset_name;
> +	struct clk_hw **hws;
> +	size_t num;
> +};
> +
>   #define ccu_read(c, reg)						\
>   	({								\
>   		u32 tmp;						\
> @@ -45,4 +53,6 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>   #define ccu_update(c, reg, mask, val) \
>   	regmap_update_bits((c)->regmap, (c)->reg_##reg, mask, val)
>   
> +int spacemit_ccu_probe(struct platform_device *pdev);
> +
>   #endif /* _CCU_COMMON_H_ */
> 

