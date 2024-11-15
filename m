Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF3558BC
	for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731635234; cv=none; b=g3iYIbDxpyjRD5NDXypQrfCWClhmQOSb/X9bdwnTH4pNhOHgxpFQ8uhtNeqAw4gAhATFbJOm0HDHHUXrH6h4lYJdzCd8TpiPadGPV+XE9u9DXbFcemaS9uGbGt6ZNt133AByEyU5sclAaIFQXzxhGBDgQaN0jJ16G1m79sgf1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731635234; c=relaxed/simple;
	bh=Vt5BKSGnVSO1wERPKQPDulTkD92E+F5ePSF0pjjU0rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COaSsNLxFbaNdwPuAPC+Gd9J1QWYk1TqbSEJRwZtPog4QYjraFF+p4qyNBeGY3rNZuTs6IyraIFR4zpnJyu929WSbH6SG7zMT6f3Cqra/ynQRbJHqO0nSkUvTRLYDYmOOJHxbFZuU+yarpqC0677XI31TNe8drT0x2QQ4iTuWA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynZoiBwW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynZoiBwW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539ec09d690so144939e87.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731635231; x=1732240031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlZtJEFuE3UKpvbYIEqSVLfZBwjcDIGJk/mPflIrqmI=;
        b=ynZoiBwWQgRaGjpRMP2rwT4iu9RuPw2jNDFkDUPTXMXv15PNhvy6RfjcOVhdTHvW6G
         4+CKwo8Pf/uTqJ4h8HT37DC0FuHFZl4lcgKPApBgbWvE+QZ3LxXHbrbYTjgoJG1cVKGV
         NcG1WgY8S4+Gqx1QRFIgbYhCSbOFBhiNG837RLbUr9OEAjxavXo+NGPbK948/Qbcf52h
         Ry/QSHO1TfjhUeEqhlWb3Yv90qufORUHTY2YWE1S1Y12L+7JaZcOb6XxSURh+VbP2MAn
         Ph8Sk5Nu8cHzBjzV6B8I0jXitQ4ii+1/G4+O9V7vewm+tHN5SxhuiDwsjjGD4/qsx+3N
         5lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731635231; x=1732240031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlZtJEFuE3UKpvbYIEqSVLfZBwjcDIGJk/mPflIrqmI=;
        b=XWupGPGdUAX+rCFhJOBRblT3yZCS2oB4OlD/pvrxG/uFkrBvotHj6HmqdbPFi5UAR8
         BzBzEsGw77OtOT9j9czrvM9hHgfu48q1F++R2wrtiPkyEW/v8Ftk8+s65viivJPBZHpM
         d5qQcnqytWFEP3ZuqS4wkWLBHFGm2ImCgYP8hiEPji88JwEBaGoYXI3QAyW4JD9mupO+
         wNSE1oMV7YUFJ5T6xnnfdlUint0VOyLryUX5B+i5zfay/oOt1JS9lVhB60Z6mqNTnCIB
         LrxMW791oNppKY8Z+WbUxrf/e0QaYeiV7iwfwJYZj+GW7A053h2I6w6ifBq6ul6Jd1Sm
         cc9w==
X-Forwarded-Encrypted: i=1; AJvYcCVf6sRy7N7r+hXKqzXz05tkJAsfA/D1GDoVfvcx+Mk4QlggEvGkp/LjAHQDUoZFQNxipHKZM1IYrcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwahWCM1RtP6KMP+U95vwaB0+Oq5PjI2hcemlSS3p6Pr6Z1SD2L
	3Ly11hC5zqlPSBMcRKD/WHCt36+twg/rtOzd/1U0h1k5dTXPH67bTWHv7+rtGWm/hDsvAEYHSKF
	UkI0=
X-Gm-Gg: ASbGncv0pWuYhM1iBxKPcn+pNOkpDBEFOaH+BdaB5BgwSzU7puHAaSytJ3KAecRdv5t
	X4SPswyt6suyVtUCI2jfi3lLhnigKKtbc11miAt7BBGRZZ9E5QmR5KVxVtnomwRmWFJPDptCUou
	Ojr/ZlnCiZh2E32xwDaBMyTNbyKEeOFXqfUdDexm7hGqVOKnvwPRR1ejDaAC/mQShMNdSkVsv9J
	ALFBEUqYQZY4N4nI6Q0EMiYErFN6JEt6uSjmJUcrPjUbWwLtfl82TXosuoH44LecdF7kmdf5AG4
	bzQEUtGfhJ0nsYrZgbkMfdB7aKqR
X-Google-Smtp-Source: AGHT+IEQjqO83cHFzO/xhdQPIAupPGyCJ6+MgojLBINDYK0Ken0N/7ofXhoTPAECXylvuwdADYNyGg==
X-Received: by 2002:a05:6512:3c87:b0:53d:a5f3:a561 with SMTP id 2adb3069b0e04-53dab25bbc3mr106471e87.0.1731635230804;
        Thu, 14 Nov 2024 17:47:10 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530b41sm376971e87.136.2024.11.14.17.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 17:47:10 -0800 (PST)
Message-ID: <b3e38b04-0ca9-4022-af73-9feab6f151f1@linaro.org>
Date: Fri, 15 Nov 2024 03:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the
 parent GDSC of subordinate GDSCs
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241114-b4-linux-next-master-24-11-14-titan-gdsc-v1-1-ef2533d487dc@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241114-b4-linux-next-master-24-11-14-titan-gdsc-v1-1-ef2533d487dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/24 01:32, Bryan O'Donoghue wrote:
> The Titan TOP GDSC is the parent GDSC for all other GDSCs in the CAMCC
> block. None of the subordinate blocks will switch on without the parent
> GDSC switched on.
> 
> Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/camcc-x1e80100.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> index 85e76c7712ad84c88decb62ccaed68533d8848de..b73524ae64b1b2b1ee94ceca88b5f3b46143f20b 100644
> --- a/drivers/clk/qcom/camcc-x1e80100.c
> +++ b/drivers/clk/qcom/camcc-x1e80100.c
> @@ -2212,6 +2212,8 @@ static struct clk_branch cam_cc_sfe_0_fast_ahb_clk = {
>   	},
>   };
>   
> +static struct gdsc cam_cc_titan_top_gdsc;
> +
>   static struct gdsc cam_cc_bps_gdsc = {
>   	.gdscr = 0x10004,
>   	.en_rest_wait_val = 0x2,
> @@ -2221,6 +2223,7 @@ static struct gdsc cam_cc_bps_gdsc = {
>   		.name = "cam_cc_bps_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -2233,6 +2236,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>   		.name = "cam_cc_ife_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -2245,6 +2249,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>   		.name = "cam_cc_ife_1_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -2257,6 +2262,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
>   		.name = "cam_cc_ipe_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -2269,6 +2275,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
>   		.name = "cam_cc_sfe_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> 


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
