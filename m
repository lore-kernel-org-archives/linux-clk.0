Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BB233684
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733924216; cv=none; b=DRDalKBE4jfUEcwp6Q8hnfOndagSptPOcuKmp78wl2GtveWQGCZutlpPrJ5QDU+3RA2x4Q/y7DFBLyZ9r+NEwrdqYX9o4yXoNwZgbQIJg1PAAjVQ/EAYMub/jwBG9rzQ4oRUQnUXlCIF35PYOBNVXJWKVjHQeW6p2YAwQbdi4lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733924216; c=relaxed/simple;
	bh=fuXYp1uvXlvOHM0BGIwSdW+Neg42eTmNvggMnkhRUIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+rAmLt0gHcNfJgl0Rv7mTSrDZAby6lTnbhGKQW+YJMrkZaxKKWnTf/dNpzHcvwygFQ+kmMPQFYWG53Un7tlgHnwtfrkzP2qal/kfk+/FmR3ylRx6q1PQ0Ow3PXRCodJvJqa2MRof9zuSWf/MAFl/WwCNn+8qjA9R6EFipQJWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nmvbd8Jq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nmvbd8Jq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54019dfd6f1so588677e87.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733924212; x=1734529012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEbwGtbe9naMX/pU7T/wl0s3YzTrymq39FJreAC4edI=;
        b=Nmvbd8JqPxpXRl9zL1BiSZxEyln59DzinMMkZxLyZwzkZc4GKyzLyMOpTSh+TsZU1u
         1J6kdV4zOpbvPaUlhO34PjLkcEI2FkuLwS8kr6pudf7Y6iOnmqHq3Xvp2hJGO0MzLbbk
         Kq7Rho+Tck/lwg2utCGAWd565sb0Mq8VajDAqS0SFBZ57aWrUjTBTpMa/oXAPGN+LP+3
         iShYI60SBdYnQKjW6wisIIwiJSZdWBY7XB5t+HGCyXqb9G+sXX172XgAmTqRhwT+C3y3
         XXTpZH+HiYS0TSc1U6Kq/hEPP4Ke6PFcpapdGQqOLPfZD4C1ykd7XpcJf3Z1WfCdg5tY
         /pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924212; x=1734529012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEbwGtbe9naMX/pU7T/wl0s3YzTrymq39FJreAC4edI=;
        b=owhp5FUAB3VAAf8au8fVRKlnQ2akHz5RyrfHoPvegFftnAsv0GPgo1Pe/ozSnLiptO
         hfiZJLJox7qFtnqPofBYFjiQYbi5biXsTeHvcNFPArn9pObKntfny3hwCRw4adblSjZ6
         H+Ahvm/cAX8pxlLnW3OhJukhf4aolNC5eH/yx49tlqFlqoM3rYaa9Di1dyZjVEWe6Ji0
         98PyX3EfTu/0hSxEJ2EZNUqo5SG0NKpi5Lsj4mtG4ReG2UdJUE1OThxPFv92jgzsKqWS
         9bwo5CVpK51Zbg/KCPx34NWzkXblgHS41l0qswVZBSh6gXaNXFDITd0IlI6fZYP46a/J
         g2/A==
X-Forwarded-Encrypted: i=1; AJvYcCWEsFJJqMR6/fbvwcnEkB/J1V3OG15VV8z3iPlLWlNpHig/2UI3GveoFZrXJkrf/+FJPkRFWKMKmmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vngZUg38uoT5ZwuG9ahITLfEBmgc0kYtygY3i5ofESMzdaz7
	DOsvry84rArZQIUB4iPIc/zLC33EwtjD0HW0Hxj0lsJN5rXmfKiincRZyPvZs68=
X-Gm-Gg: ASbGncvBUW5U1OqKZmEohopIjqN/kwgPs0DvwHf+hiL1JtWs8H5VhiKWqAfzdjN0BlA
	nPwtzmNXZFy8lmue5oayEhYMdggr9t3SGtHNBtSKr+hoFqdFKUpUu6AYzky1oFWZyQOqKgHU83F
	3M6TbylB+umHdGSFiiE5uHx0Tzi9/L58d6PhxQLnBK783vp/dMd+/J+4Y3513vFKRfN40qxvf9X
	QpKDdSctJBWeiq2W+viuIg3SAlOzOEY7KZZV7vHy5/vmks3dhLLupOVuLC+4NEFaYMbAzBqGCXF
	8zp8WEAJvoqs6e3C8QoofTA17V2G24fB
X-Google-Smtp-Source: AGHT+IHHGHISPWwoOfSLQHxkKBfu9jAmiwtrWrntxuCBZKz+ikghNTm/6FcJSOAcYPNYw/C/JlHI5w==
X-Received: by 2002:a05:6512:3c9c:b0:53e:df2b:df1a with SMTP id 2adb3069b0e04-5402a5e83c3mr291795e87.7.1733924212381;
        Wed, 11 Dec 2024 05:36:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401a3a4c24sm1264587e87.199.2024.12.11.05.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:36:50 -0800 (PST)
Message-ID: <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Date: Wed, 11 Dec 2024 15:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 12/11/24 02:27, Bryan O'Donoghue wrote:
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
>   drivers/clk/qcom/common.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..e6a024e95ab5f4b0776ffc6c7b3bebfbebb007fd 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -22,6 +22,7 @@ struct qcom_cc {
>   	struct qcom_reset_controller reset;
>   	struct clk_regmap **rclks;
>   	size_t num_rclks;
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
>   const
> @@ -294,11 +295,19 @@ int qcom_cc_really_probe(struct device *dev,
>   	struct clk_regmap **rclks = desc->clks;
>   	size_t num_clk_hws = desc->num_clk_hws;
>   	struct clk_hw **clk_hws = desc->clk_hws;
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_names = 0,
> +		.num_pd_names = 0,
> +	};

Please remove the added local variable.

>   	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);

Please simplify it to

	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

> +	if (ret < 0 && ret != -EEXIST)
> +		return ret;
> +
>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

--
Best wishes,
Vladimir
