Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D929A2
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665242; cv=none; b=ZVNAEjzOLksn/c1I+o9+cyXUsVE4Uu4nhdGC/M0c77dMaSPTDO+rfAUfk8iJv6EEA0vC1oGMEbtUJnB3I0JazWbg/JThaBI7GHaQ7tc/6Xcum/d2qQ1yaQqNOBzuhUhFKd3x1kpUDFkTVnXlEF1g9C/RnBh+JtNh2DfcWvDO3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665242; c=relaxed/simple;
	bh=ZO1TUrgkyOFslg2HVzLKfz6Pju2ULXz1m9MVZo5iYSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cokHFQmi7AEXokpdmOpPWTa7TcKoZvacZXxYmXS0d+49I4+B72ugRFKKV9UTwS3QSkfgaUBI+OgcbCh3QuUmOmR9rv6bffuAW8hG3grzJ7ZFVbrrHy+a3Pi9LGqkvKEKLGbUyPLU8s5nnZFs313jKaDiX73K2rENhIfB74MIHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qm9ajs+i; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qm9ajs+i"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f4f24b4d7fso5774161fa.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724665239; x=1725270039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7YcwwNc2biS0wM+fkUYKliN67zxCEikT3YD5Msmvl0=;
        b=Qm9ajs+irLs6cVMAnFosnZ4Jaj/sCTJv/yPFVTLno4d9DsD8BpP/UPy+7TaKz6P2NV
         ZSuhAYRFlNnuJ/rG9GiJx07LRi3RS5C0BTEqgeEvBQp6taxdNoszy5brE7sC10FYLDUw
         cLEPL7xpyehpofBA5iix0bOwYqEFO8VkfX7mF9eJGmVyInvrCVUXSahbmcXu12NtvYzM
         LuwUuUEBp0niI8Bh/YzXm1iLXwWHXzVBQw3pcZbau7Ov/kUzNLmQWr772zfsdp4FZOck
         fwUkBJD7ZhTHyi0YujvLTi6hjgyxjbEPamP5T5UMBcW34kgtPJHBzwaKfimoEAUePakl
         dbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724665239; x=1725270039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7YcwwNc2biS0wM+fkUYKliN67zxCEikT3YD5Msmvl0=;
        b=pZakSxsNBQ+bT9ih6wkj6BlEZehARafLjs3hy9PPrEcyE5aUZQqiX0VQoNmtRFSOhL
         3OkLd/R5BR5c2tgzmPb8G6YanlYXnOxQSlfVLCGdWT5YTjbQ4MTKe77Hut5AabWncbSn
         Yhjdo5ylBrvl8smYO3F2RHsb2yBFYhzNO4+Q3v4ITb6EcPUHe4xzOECdqP41JxLbtQ+1
         84z95CstHG4NWf8qgBkg8k8u/B8wFh81TMTs0SmplHh6ScDEHDEiyOLHrvJr6dubigL9
         e8s4cp2k1pwlf9Y/zamV+9vsCGoI6KLhJVy1l27k4gv8M8/ICfpoevaiwStukYZ2qq45
         f7CA==
X-Gm-Message-State: AOJu0YwVtOCR6eoK5/A7sFltPLgUHqBedC3KsOFxUyR1Qcotq6fhKHgI
	KHr9h6+eR3FnTAH5i+c+5ujL8cyFzADT1cjPcVHrW2PtBZyKSTfY/VuJQTf/aWg=
X-Google-Smtp-Source: AGHT+IEPAjLnk9up1ePRo49KiSoB5SYL150VAoS3tSBJCY8gpG3ft3sGxoAFgEWyrn+giKwzX0HVUw==
X-Received: by 2002:a05:6512:3b0b:b0:52e:ccf5:7c40 with SMTP id 2adb3069b0e04-534387c4084mr4174931e87.9.1724665238611;
        Mon, 26 Aug 2024 02:40:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d6e4sm1403837e87.225.2024.08.26.02.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:40:38 -0700 (PDT)
Message-ID: <6cb9d478-ce85-4b07-82be-a5f517654a78@linaro.org>
Date: Mon, 26 Aug 2024 12:40:37 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Delete redundant logic.
Content-Language: en-US
To: jiping huang <huangjiping95@qq.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_713186AE6290AC7B8037FD247F5BF04C0308@qq.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <tencent_713186AE6290AC7B8037FD247F5BF04C0308@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 11:29, jiping huang wrote:
> In fact, the local variable "best_parent_rate" saved at the function
> entrance is not used later on.

It's non-obvious that the stored value is not used later on in the function,
and likely there are use-cases, when it is used.

However the very least the commit message is obviously wrong stating that the
local variable is not used later on, since the local variable is used later on.

You need a more solid justification for the change.

> Signed-off-by: jiping huang <huangjiping95@qq.com>
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8cca52be993f..d076939c42ab 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2295,11 +2295,6 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
>   	if (IS_ERR_OR_NULL(core))
>   		return NULL;
>   
> -	/* save parent rate, if it exists */
> -	parent = old_parent = core->parent;
> -	if (parent)
> -		best_parent_rate = parent->rate;
> -
>   	clk_core_get_boundaries(core, &min_rate, &max_rate);
>   
>   	/* find the closest rate and parent clk/rate */

--
Best wishes,
Vladimir
