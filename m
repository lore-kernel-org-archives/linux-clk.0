Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292318D63A
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795625; cv=none; b=egyWnTsVC3HQMhDPcRl3sh+z80h8IiKM1e7bM0HpOq42iIxSLDDol2pUsLhHw7b9KaDWL2mAnVgCbdN9Bq61vTdPyPlQL+eF7MHICgIJf2F/TiQMaipytPUJE2dysLqrPZO+W4K0/vbZbUd+mJgT/oeCcHCU+UhxV7eL9yLTMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795625; c=relaxed/simple;
	bh=fQqYngYQaBH4nRkWFH+2RCIgNp656eo5Cdwm61nRK/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g74d3PE4W27fQMStnaFJqj/8vOOYI2mZLvaulWMHKgllsVJLplig3PDODDwdlGxLkPf2m3kNxaNCmPSXqnuCoN8Gvfn2RIAE2FCRjymXXSSuHGY2381MOWKdOgalsSYrqqq1eGg6d6aRJJmkF0aT8+kPRkGeN4ui3K4WYaaMBkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0eL6tqo; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0eL6tqo"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-53ddb4c05c0so113821e87.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795622; x=1733400422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SF5OHl6Q6ZggZKWiO6IZg02nSrf/YPTh7wLw9TpiFw=;
        b=L0eL6tqoED56UuVeo8BUpvq1uVWouDW7OAGiMvAB7S3Qg/xg2bAEVQmwkXiVO6RUI7
         lhqRpp3YSyldoEWXue9piEioO6lLycrzfJeIhXDku9wVclYckX9KfmfkCSfa/HWsgOqv
         YbmDb/UJa8CAXKmrWBcDdOpmainzuDJXdQ2Hw1kKoaBpRUUWQpWcQGP1yBQsDcVm12Vw
         UbVYcTE68LRE6fBp8XO2Im/iQQ9hx6bGjO1+uBHxgOMv2j/2bkfKfdlOl7QQfYYjxDbb
         K+uwLg3QWfNRCIjIqoIt9xOhJAXLWCwCloZ1GUm7V77ZoUVC/Sub2Vsis9/P9XJ6AILR
         mXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795622; x=1733400422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SF5OHl6Q6ZggZKWiO6IZg02nSrf/YPTh7wLw9TpiFw=;
        b=OYiWBCozAK7LCTQDYnUWGLIa5sCFA7CBtCUnXMSZRAb6C/VssCKfSgyE4gZb5QVp4O
         8WSg5WMOJAYQoMgsC5fTRdV6MHPii1jlntp1YElzrYn4btUDWiHI3qL0Dx4XmXjOB0MS
         kz4IEF+A2Ny3XsCBjU+er40TWHAmD4tIXj82gTj5LZzZRjjNlDPLQ9/hJAr4ClO0g5E5
         /ID6MU/JZQS4aoUHnyV69xesMEZ+DW108dknERNZS3neTqVdATKXugjTnXUElvrbk26d
         CDcdWN7c1S5UEr25+I9C4pEMUb/g4vKYPuic+5Y+zqNqHdeiLpmDk6a8t3K0VZKrN6N2
         O1ng==
X-Forwarded-Encrypted: i=1; AJvYcCUKVMJKqViwhGXJbYHcA9L7WoBBC79jTfVCThjEzaS9J+czw10DicDOnkI08nB/OsrFZ9s6V0fHo0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YztXLEH0cefH1iAwNzpRnYjmHjZajTK7b8ifslt61lRwOVIWNqZ
	0Dp7TbMffnrHcEiAlaV/mj1OAOHyWBYdDQQ9Wmd0R0xviR5ajLFQziQ/uc0R6jo=
X-Gm-Gg: ASbGncs7YangY2dcR9GFUM5wFfTIn7p3/GrwFoMBLqBbEajOYS5CrJ9u6QmhHklV6gA
	1gJHPcPXPElpA5/gEUgMlCTUcd+pnpLIl6Z0oB7Q1oQxRZ4xo+jXkKyU3CpAwnymvrbqrzOFMmO
	K7Wv75uy56RfPBfh75v2H/CwD26KyeRGhvE79DyFpj4UAMBEcOPJSn/z/m/+Y+hYfawzYyO+Xjz
	Q/Q4CmVLnY8RRKyxi3rEIm/+OmO9/1Ku0g7+rZAMcXXVtm9RWo9JVRKY7k5Y0a/pay3psvHyE8I
	/pcQEEGR3hQfr5aZW/F4I+P82Awq
X-Google-Smtp-Source: AGHT+IHsfbfQFGYieKwKAf8ZPiuL2mZxi4Zqttbg2UBokuZg6RjtXSHIhC857ys4GHZZnwz2KVhYng==
X-Received: by 2002:a05:651c:b21:b0:2f7:5c23:98fb with SMTP id 38308e7fff4ca-2ffd60dbc52mr8337221fa.10.1732795621780;
        Thu, 28 Nov 2024 04:07:01 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc097c3sm1756931fa.54.2024.11.28.04.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:07:01 -0800 (PST)
Message-ID: <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Date: Thu, 28 Nov 2024 14:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan.

On 11/27/24 01:44, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 

Is there any particular reason why my review comment was ignored?

https://lore.kernel.org/all/8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org/

There is no signs of the change improvement, unfortunately.

--
Best wishes,
Vladimir
