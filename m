Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0C3EEAF6
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101839; cv=none; b=N8/cnpl+W3MpbSanraPAcSKbgTyau1ekXvm8OJc1ukDyS39nRIu4uzqeR78JNeaMj83HMJGOSK/7ewAiiwpdW1a78JrmxQiR17t3aHxqvddApKnm3WWBl2GP0hh8yLT9eFvX5O6SEjxowtNd3L4LAY8fKD4aHmCVWZJ9FjDpP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101839; c=relaxed/simple;
	bh=cPW19SXjJnBDAagt7qB0/bXd0/z1hFemivJL8yGhT14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYDoFQo8lgBhj0uFQd5tPSqWBvvRUVb1AJZqG9eyQFgkvzc1WLs54ooZc1iHB6RWxGoLJwolhA5CHOV+HylB2yLzoxRy6c0hZY25kpvUnE8vJhFN3vPjAs0Moxfpoyvc3xJCXE9q6TAayO+J1QT9Eb64oSdsJ9wKMnMNFnx0fRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DnErxNAP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DnErxNAP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1175544f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779101834; x=1779706634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ARy9rq4cIvrxa/NBCnY0lb4B/GYtx7QC9maKRt4gYo=;
        b=DnErxNAPHFGcS977h8LT1mGNAcyW2uOlHVFGI4VY2cQPnsFMj0orpds7g2MtTA93pk
         pegq2MwYUQxMfCRth10udT37YtXfDXwQ/LomFJ37YVMlUe2agrlTMZb4xbaIUkhoLyLM
         dmNFDmC+PH+33YHhmkC1Wr//2ZC6seZDuje7i6PNiyQa37TYwAVOhthN/ez5pEAxYh2T
         Um0FWGNkBBZMvFrc6MJz1qGQA0zDiKPZH4qjw5A2BrEHbZA1cXfgwcq5K00B+wqjz/2p
         8XaXckHrqinZGWDGevqe5SptU1mrgnkLYHb3qZH1UlR9j0VSGWuIUvVC85kU8M0ise+B
         oaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101834; x=1779706634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ARy9rq4cIvrxa/NBCnY0lb4B/GYtx7QC9maKRt4gYo=;
        b=orEcpBbj5UEm27QelKYuEyxBTL4Sszzjdj/0fxaw5OrptNL55BrBiDXyjnxpGafBe4
         C8+BkOR7qedikObF1N/XJdDQCcZYf/WeKnbXvSeXgtEsa6I9xCfl8CYkyrbmsChwcuaH
         q0V5OmhOqxkBxcZri1c/a17jl8JJm7lSvdCjf677K3YzpIg0g7eVjtFI5P8CKorG2mKl
         RWohpGFIjpn4ZFjYbov2E9JR0e4CPidCoru+Jf1tD8BjQlyDZA529bdEspqqz1m6koNb
         fYlOdNzDTl1VNPWVbE8hD6MR3v5gbjvOgjdddWqBUy7YsM9l5OPDpoqlR9jKu6wk5F2e
         9VsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+x+4zguhQbmJDUXnANq2hwsvIoJstKiwSWSX5amHtDFucITwzpygRwDjOaSM9nOdbdDHbXl6oAqfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3KJdXyLLxVSLWORnylzmw+IrojnADoqVuAfpjLFxSH/W43Ee
	RbdzX2fZsU4iKlaIaE4AfgwF/NayWTNGS55WvyeSeUjsSmJKtMWWV7DMW1SEMz6Ndmc=
X-Gm-Gg: Acq92OH5CZQDWcwZEnowXgG8LIiWpJtMotS5jQ4RO4C3FI4Btx+VNczcHnBR29Kkn/7
	bqgGc05OQ9NmGMPVO95h+69vA0xJA3912BSSci8/Xwr/Gm6i1IgVBMoaI+qaOA1JNog7qVrjdgF
	FuP5ThP1tjZDJg8BAcIiW/KBdYa/nqKV6eAdPrcblB49BqmicAo8ots6uIi94aAXdfIkrgK04Lz
	OtpCKFT+pdlUjlFZCYSpm3KalXpYQ7Agp4EpxzRbAVXCFZpA0aFAUxEwYAjDBmQN/NlPJcM8iLD
	0Jaf72bzFAyBmMqakijfVNefhp5bNtrpXpXKKOb5H7gkweAxApJhQPL2NaJ+pEO8NeZqsp+2Vte
	ShWRpbnVDT8cjNfJ4b3SMmLuddaD0HrqUu446IqQmDwsCVtUD+b/Pk15Snltn43ncbs2E1oMgUr
	Aq9mPA23/zfYh3lB3E4bIpeLx7kRfP1OauIGea6TtrWA==
X-Received: by 2002:a05:600c:8707:b0:48f:fddb:dcd9 with SMTP id 5b1f17b1804b1-48ffddbf75emr131962865e9.27.1779101834543;
        Mon, 18 May 2026 03:57:14 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm117010795e9.4.2026.05.18.03.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:57:14 -0700 (PDT)
Message-ID: <1c41ecc9-d951-45df-b933-1934e1381663@linaro.org>
Date: Mon, 18 May 2026 13:57:11 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: samsung: acpm: introduce driver data for
 SoC-specific clocks
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
 <20260512-exynos850-acpm-clk-v1-1-837532ddbf38@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-1-837532ddbf38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/26 11:40 PM, Alexey Klimov wrote:
> Currently, the ACPM clock driver hardcodes the GS101 clock variant
> arrays and counts directly in probe() routine. To support additional
> other SoCs (for instance Exynos850 SoC) that use the same ACPM protocol
> but have different clock trees, the driver needs to be more flexible.
> 
> Introduce driver data attached to the platform_device_id table.
> Update the probe function to dynamically extract the clock lists,
> number of clocks, its names and mailbox channel id based on the matching
> device ID.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/clk/samsung/clk-acpm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index d8944160793a..604604b5b814 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -113,6 +113,8 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
>  
>  static int acpm_clk_probe(struct platform_device *pdev)
>  {
> +	const struct acpm_clk_driver_data *drv_data;
> +	const struct platform_device_id *id;
>  	struct acpm_handle *acpm_handle;
>  	struct clk_hw_onecell_data *clk_data;
>  	struct clk_hw **hws;
> @@ -126,8 +128,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>  				     "Failed to get acpm handle\n");
>  
> -	count = acpm_clk_gs101.nr_clks;
> -	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
> +	id = platform_get_device_id(pdev);
> +	if (!id || !id->driver_data)
> +		return -ENODEV;
> +
> +	drv_data  = (const struct acpm_clk_driver_data *)id->driver_data;
> +
> +	count = drv_data->nr_clks;
> +	mbox_chan_id = drv_data->mbox_chan_id;
>  
>  	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>  				GFP_KERNEL);
> @@ -154,8 +162,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  
>  		hws[i] = &aclk->hw;
>  
> -		err = acpm_clk_register(dev, aclk,
> -					acpm_clk_gs101.clks[i].name);
> +		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
>  		if (err)
>  			return dev_err_probe(dev, err,
>  					     "Failed to register clock\n");
> @@ -166,7 +173,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id acpm_clk_id[] = {
> -	{ "gs101-acpm-clk" },
> +	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },

you need to include linux/mod_devicetable.h for kernel_ulong_t.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  	{}
>  };
>  MODULE_DEVICE_TABLE(platform, acpm_clk_id);
> 

