Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749DA3A1E7F
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710641; cv=none; b=Da4YZwGy71AZ8i5Lu9rUvUaqjtNGnWbCWTtFr7/k9QtaKbLx6VwFhDPzy72YrY6jdy4uGCDN3+k7ARvk90QfgAv9bzlPgIUSHm9wdnLj52bQzjlE0nbT7PHTF6kdIvEmPKkxTtFpNchjFmdlGKVrvJwrO/5v2yv5ZJP4iRGHGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710641; c=relaxed/simple;
	bh=aXyztoGH1zk5aC86ZA1tmUX3uX8ntn+sdIgnb/TvD50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOuagRX4IddJEnMom7U0SHgJGksg9iMagCeIBJnISQrguEffedb29qzQ96o7gQ0gogLxnLtXAkafGfwLrrxGhHl92RrZvPjSpdcS73QU6x5vzIjhX7TmHomkFHEcThc3aBiSuOK6qWNch3IbmQKCpHt4aO228E1o9uY6QhpAmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KolVVlwl; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KolVVlwl"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2d56eaaceso104861385a.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 06:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710636; x=1768315436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rog/A303nBNnKd9hedF+AVkollAQIitKAnxFL0w4GYY=;
        b=KolVVlwlCg9DjwmtHZpbu7sqndBppzmEPJldoz7hzQcWDM42G9QLthp1WJtkg/V1RX
         XpqsDc7NoGVUFyyZTLj4PseJxb1uKpM4CBLjSbKO3TQ4u6XMjhZ/2XZN/Shft0E+RcqX
         WohEMA3w4Krm9oVnNBog7ZwnBzitqZkOxIC+SrDfaUvawiEwKHKfyO3U2ZvOdJqki4QL
         xFxEiHr7sUdpMrHqOAE3mKTrRMVp0fvUHh8gzqWKU462cTVe+fPiDNP8/uwa2JLVNzpJ
         P3yU3LodpJAH3REFiJygY9dYbACXpkCRm+BgJfhGM4kXT6D0fGwlLwByHvL77e4ehA67
         YEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710636; x=1768315436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rog/A303nBNnKd9hedF+AVkollAQIitKAnxFL0w4GYY=;
        b=dask8xPd6T09FriVIOBe2u6QAXFdwI5RQLQnLCcNPdUd5KyeDftzEVUMqqNRP50KHK
         F+1lY1Kok2oYwM9+jfE/+U2i5lz0CdClPq7BqqJm6R5HOkQk+D2I8saUxvH0o0YckPjh
         y6yRJRAsoRjDmhGq6ErlUPcKAvhVJ8QWsE+vRHaTChx8QnMoWZCyUYXRsG3UyAtb6vIM
         g3xA7cpBR9V2r+Vfb2nRVE479DuLI6vC0xEHz+G7/kEiWVKwur+DNDgCJw2eWGkTpL7U
         g33zPEcboZeTBNgEvPmORpNcgkJLN7mQOVRFgl31+yhQwmKR1P98Rf28gGeNJjs/C6c6
         TZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeC4Ar3iA9yXyDr3gbJ5Ua6f1Bt3xX7iX2/pBzWLqjtuj3DvxAKufA9p5iI9gzDMtCrXz55perdgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFn39rMMVEsQ6qc77/NRD59bTwhFneNyHrEzkbxq2g6tYgNa+A
	sAwnNtp9SpKu3h2OugcwPW2FKvC3DoT0k3ImJLQEObfW1/q6G2DJBWzN66aZF7zYKsk=
X-Gm-Gg: AY/fxX5Q93nXE2PFA5XQgYUoyoNR2YcUkG4fDznn2bClodTq4zIXyaEbznaOm0lkAXE
	GPrq/NsSbRrOWw4JUvBdgP7kfTe4I2mvs1Jqv4MdeJUQEk9Ow8DN1EnX/57NFXI4gplt8H5M6fX
	ah5dMisK2gsUbv/1baB9npkXe/H5LlrMYQgodUuGEfMGJIPuyMIpdfPF7LF/nSEAMhdgWSXCQDu
	PQ3RVCHCnuRTSVqnm+Xh0rX+22chd2uP/t5ScsLUbRgS2QW0tSHuJBm+gbAAL9MF2EVeD54YAcN
	SrfRP4rTIlyWvP8wCWq5bY4gb5e+sk/MVTzFI61dG/EDYqzQdUn4D6hYT5R8AbS1LGjPTHGO4em
	uPmSFiZgD9g16w5bt6KFWktBd82lSrrY0Sd+vJJvRLxpPgwN04tEHT3/yipdBExmLn4FeJAu9kF
	balu2FvzoBbZuLrRoPiOeNf+eHjD3uHfEJb9mEl7dxtGdT6ZdYChQ=
X-Google-Smtp-Source: AGHT+IFYqi2toZCdCuQZsUh/EKjp61Zc98MPld9QD98KQo6pAb1fbhQWOQ4ktANOtoLEtXCIeuBplA==
X-Received: by 2002:a05:620a:25ce:b0:8bb:a675:b540 with SMTP id af79cd13be357-8c37ebca405mr392613485a.69.1767710636222;
        Tue, 06 Jan 2026 06:43:56 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:55 -0800 (PST)
Message-ID: <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:54 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yao Zi <me@ziyao.cc>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> Refactor the probe function of SpacemiT's clock, and extract a common ccu
> file, so new clock driver added in the future can share the same code,
> which would lower the burden of maintenance. Since this commit changes the
> module name where the auxiliary device registered, the auxiliary device id
> need to be adjusted. Idea of the patch comes from the review of K3 clock
> driver, please refer to this disucssion[1] for more detail.

Are all of the hunks of moved code moved without change (I
think so)?  If so I think it's worth mentioning that.  If
not, you should explain whatever differs, and why.  (I would
expect the only thing that would have to change is making
spacemit_ccu_probe() public.)

I made one minor comment below.  I didn't verify, but I
assume this is all just moving the code around, and based
on that:

Reviewed-by: Alex Elder <elder@riscstar.com>

> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/clk/spacemit/ccu-k1.c     | 179 ++------------------------------------
>   drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |  10 +++
>   3 files changed, 186 insertions(+), 174 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 01d9485b615d..02c792a73759 100644
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
> @@ -1001,167 +988,6 @@ static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
>   	.reset_name	= "apbc2-reset",
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
> @@ -1195,6 +1021,11 @@ static const struct of_device_id of_k1_ccu_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>   
> +static int k1_ccu_probe(struct platform_device *pdev)
> +{
> +	return spacemit_ccu_probe(pdev, "spacemit,k1-pll");
> +}
> +
>   static struct platform_driver k1_ccu_driver = {
>   	.driver = {
>   		.name		= "spacemit,k1-ccu",
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index 4412c4104dab..5f05b17f8452 100644
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

I'd insert a space here to make the definition above stand out a
bit more.

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
> +int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
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
> +	if (compat && of_device_is_compatible(dev->of_node, compat)) {
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
> index da72f3836e0b..7ae244b5eace 100644
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
> +int spacemit_ccu_probe(struct platform_device *pdev, const char *compat);
> +
>   #endif /* _CCU_COMMON_H_ */
> 

