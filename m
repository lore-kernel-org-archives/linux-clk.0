Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C24313E21
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710643; cv=none; b=p1KEeApIjdPM+1o2DNGo/riU3BeF0kvGR6ze8ewNsG1OeSkN+LscM3COfMMN2ShDV6A8H8gNGmnachpR1Rc+Sz/R4oBAYztj3BZkB/cSvOqKTKBFQ+U788zEBDWjOvb0/ny+goO+Fjm/GYI0CNwDp6Zz/ha9VCWFLsD4XgfpADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710643; c=relaxed/simple;
	bh=xWDoSIsxgM+RQVtckDWggwk39PYhLqYdEi36Mi+d7Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDw+m8bmdH7iQy+BULF1hcyuR72NK5LG69SsRoS2qoJe/7jTJP8AiQAxRQhDEXXXetcGBW+XUANewCcWB0c76vAabBkJvXHa8V4xpn0f1PPwlvu6F7YiIWpbM6c2hZZjOgpYVgPmARE4k5Am0/XFq4TFG4V/B04fuwUATyQS9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=B5KKg2Ix; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="B5KKg2Ix"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2d56eaaceso104867285a.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710640; x=1768315440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=B5KKg2IxdhGb1KnQLGZknhyiWfS0lCRl6o71N9TFTerVgz32SwflKcNGSZhqr4/rkX
         Lr7hfzMJ/OqTUh/hF//KusW4jtYRCtbqXuD3SXbPXprv8GTF/ySiOTkw9gq5Gjb2NEd0
         UZFsdO3cqs4lpRVrZU9nnJjML20RYIn1IYCDuhgMjOJnVCaHf6fHpnVNUn4jjgLxXDTJ
         wRcJBXLO4dz4u5uDHIbCny8rZXxTqNYk9fvHWI3beqSQYUr7/j8LSZWvBdgHQHcTEHpU
         LoF569GM1y/5Nx7dVHI92OLBy40l/h+40qloV4FOalzj/PiBhxuXeGzdG6xZyZp/ch56
         +Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710640; x=1768315440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=rVDJam/oDIo/sn2X65ykGUoniiSYSd1SF+w1RXoVKlpXkvsW13JoSQKEDz6VWZZBRA
         uBaDDBetMHPSeNX8IBEa9P30aJN+tA7VylpjRSYiguRtI8C5G63aNAU1xFnbvf253cQ1
         PToOahG0CtG1FyXe/7qnHZpo9cgyjdR8h2ycUC3p02ikw5sG/xKO+5Tq+rr3Bub+uaGN
         bs6EcI1UgNnscxQZzHBzQhqhsnLxnUruTfef8Zsm7iy7HHYhVeUq53Ufkz6RjVkb0Gfq
         pg9PRnah0+45yTHJyQy9T0vtKN+nVoDkJ3F+SCMr7dMU6w61xPYEHHtdjp5BVdO9cERq
         uCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTwT4YXLJvBWpyTZsC4CD7Hw59jlKDUY+jf/l9IybS9yIaAqBNC+T7uYOFUfaFUHtjA8iWaqxjVqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbU09QboDmflSQdKOeWAv++IvqBFm5MO1nu2igiAWOXcK1rVfM
	rOnf7ymsitonG2hAtcPyVQMUvh7QQUsYJ2BNeK+lkhazPPf60ZHpcXRQ864YApiRT+4=
X-Gm-Gg: AY/fxX5KCBRiNmlxiWZNHvNl2WgEdQVBHnVJRH7NPtsZPMVC1UfIlUn2I5xdRZoVS0h
	aCc6CSQVzQ8Q/rXrv73CuSnlgUqYBm/0oVil/ewncVbRMCdbSULq7yS9Y+RCwPTujlvM7OhcBCH
	YrwGvOyrBMf+hovtuztWvD1u8DtRZtAxxj+uloJqaxWZaV3ac4aH68mvK+rWGUrTHsqBvlkTL1+
	x2Mb+DUqHqFPWPolScGICEiiLxia5B0NSCnHha18mlVRyfp9ffD2verUVCzU22nS7+LAI3IhRcz
	Yfl51tATqRW0DegBaWTeZcDkTBazrN4gt96gE4FSTZyE+7IYavRB+b3b3CkLaBTSjzZ4QfjKFds
	iit89P2g1Wl2LT+yjh2Yhs0ZZ2WezgpAwsev/c+hI9wFpPSw5vlCJFO8HRynH8si12v2/UHtlgc
	Ew7dH8IQiQV0yGQbq18hwRSeiGN/7dRR+HJLXwOOVk3xvTSzdOwqMZSMK9k1jmSA==
X-Google-Smtp-Source: AGHT+IGrfIQofU9ZXGHQqOM8HyQbxngWETjyA4UE68tcePwXWmd7b3PCLuyw9SW25mP3XlxN8HPLDw==
X-Received: by 2002:a05:620a:1725:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c37eb6cbcamr425625385a.22.1767710640277;
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Message-ID: <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:59 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module where
> the module name changed to spacemit_ccu, then the reset auxiliary device
> register id also need to be adjusted in order to prepare for adding new
> K3 reset driver, otherwise two reset drivers will claim to support same
> "compatible" auxiliary device.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This would ideally be merged with the previous patch.  Maybe
Philipp can negotiate with Stephen to have that happen.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..cc7fd1f8750d 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}
>   
> 

