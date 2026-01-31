Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3615B0EC
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875412; cv=none; b=WdRTUptjXArQEVfVjwVqHfZqgs0LHVaiMhyyU/dLr+9IG38e8M4C7eFanvVz3dxUeEAJ2R8HIj0lgu4czqHVz0HmSrHfLGz5D1ZTvdJHeOfAaGHXhvYW7dPCBxaOIeMrK089Wz4sl073MCSKbIYqRCatpXwispVtoqVFwMV+aso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875412; c=relaxed/simple;
	bh=65aEQ+psn0HxtwrakcrSAT8w75jbaihld9FOtkSvwM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXrdqAX/PXgKFJ+iW795C0ExvrMaPXyj7/7IMUCNHoF9CyXkycmprLKWCvyirhJUbT1kGBXHsQnX+p26fEcKZ9p1Psu9niLkIwCDxBf1OEZMPoERtE4C0KCNv90Z4eQIJGH53+sAPWKYC/tWKL50cEsGkfmwYcBc2w5S54XhuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ji51cIoF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ji51cIoF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806bf39419so25159665e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 08:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875410; x=1770480210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MlGEqpxPuA5ARImYdl/1cKu2LSvKdYbg1W1S81a7ZI=;
        b=ji51cIoFIclxfIQyadiHY7ipsYd7t3iHckjvs1ORsSyXrotWuMwoZqJ2N85y2drltu
         0KFyEXdiqQAwKwF//+APYOf+hwJQ/vo/795tVW9L0uJWnhqOTzM0hvH5aHZKP0T1ZjkL
         BGbmDUtpR2X6lP94/0mTEoyBpl8WU/On+TypZpM445UeIWUxVV/vWK0QMtgooCmv532L
         Nq1L6ra5z6NUYhZTj7f2A+q4B+bwcWodmjzp0LL4SW/b1vP/ZGM8RNj03nhzWwFz967D
         Ba99m6/AI/ndtOzmUVpDPd/pbGp4JgqTXFSSpVTk7wBevsRN/NAWLNyHMgUc9WzQpufe
         +TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875410; x=1770480210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MlGEqpxPuA5ARImYdl/1cKu2LSvKdYbg1W1S81a7ZI=;
        b=hcBoD2qwNin//6VDRn1ay4rJNqBXXFn/P8RriIH60i/FeQ6/q8CqGggNA9Gc3UXP/a
         pTXVAxe6SOQVjfjJqG9UGk4NlrIJP7V3fWSLO+2SSrWEuF/XnRoTl0dInEs/QzkChEnX
         LuL+n7kDgEuW84UIUQZNFqaJGCsObAztIqmCZofvABW74xj3ZkcxFr64q8r0H337oauH
         8YUIAJ+Hy+dxMTJKIis/0myL+Y3caMxfzZ1fSQid+WjcX59eGGLuKVOjiMCT0bsGqgWR
         bzUMduGTAOxPyQu3pXOkHcN5nl/1EtABz53sTAQLjVqu1bnmFCH7I/D61v/K1ifCBlED
         m5FA==
X-Forwarded-Encrypted: i=1; AJvYcCWyUz5X3X3Nydgn1NlfkcmYYbXa5+rNaM4qThPNN3ePfZ8ciTmc2m6KevpT+cG5InBswvw+plnvO0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmsJ5HdYcSEy+Cq4gqCTEQobeR4F49FqbNM1qAc5tCy2vkdpEq
	pRe9+3xL14h+r5zPMyH8+jqZj9uSaYdhkV+QjVL5CPBzMhO+UWXHNxdyv9V53bDdeGI=
X-Gm-Gg: AZuq6aKjXb2W9D3u4Bz/yKr9/bY69jqfWgnqDspsmDnfvRINK8tuWKP3OGKNtcLiNdA
	P5ZaS7aLkhsyqncno3iV3PczDRCk5dWGOXpD50TJqH4n+MVImrx6y5h/JZkGuUI5xgnWt+WLVtm
	VSH8xuc031n+7+vMG5wXfp21YHJaGiJvRe0onLi/+AWMoXXfyUKxTN2ZbsRiEsrUSMbCzoMFTMd
	vsf0s12JkAJDie1W0WHUJpJ2Yqut6NCXHx7iljQ3L7QjB6oKpGTryFO7cb7HUiUnL1avu/66DZk
	wdIwaYdNjLR2/DfuCCbygnYpc6Adl7u8CQEUTTbHjtb2sdTSWcT/Lhz98Ubzs52qSbdHFlhcm1e
	Irvn93LCyVFLPf0DhVlwjPkk7EFjVFVnUr2jh/FcdUCySXqLdLlp8E7W/oRel5PS+Dd4wJpABGr
	at08ORE6EQ+SDRdJ2CLQ==
X-Received: by 2002:a05:600c:470b:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-482db2591f5mr86282515e9.3.1769875409921;
        Sat, 31 Jan 2026 08:03:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353f8bsm29406760f8f.39.2026.01.31.08.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 08:03:29 -0800 (PST)
Message-ID: <e0047afc-2109-4062-bc51-045ccd7f868a@tuxon.dev>
Date: Sat, 31 Jan 2026 18:03:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/19] nvmem: microchip-otpc: Enable necessary clocks
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 17:44, Alexander Dahl wrote:
> Without enabling the main rc clock, initializing the packet list leads
> to a read timeout on the first packet, at least on sam9x60.
> 
> According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
> Dependencies" the clock must be enabled for reading and writing.
> 
> Tested on sam9x60-curiosity board.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why this link here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> 
> Notes:
>      v3:
>      - Rewrap lines
>      
>      v2:
>      - Rewrite to enable _all_ clocks defined in dts
> 
>   drivers/nvmem/microchip-otpc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index d39f2d57e5f5e..34c0d7611f3e4 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <linux/bitfield.h>
> +#include <linux/clk.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/nvmem-provider.h>
> @@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
>   static int mchp_otpc_probe(struct platform_device *pdev)
>   {
>   	struct nvmem_device *nvmem;
> +	struct clk_bulk_data *clks;
>   	struct mchp_otpc *otpc;
>   	u32 size;
>   	int ret;
> @@ -253,6 +255,10 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>   	if (IS_ERR(otpc->base))
>   		return PTR_ERR(otpc->base);
>   
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Error getting clocks!\n");
> +
>   	otpc->dev = &pdev->dev;
>   	ret = mchp_otpc_init_packets_list(otpc, &size);
>   	if (ret)

