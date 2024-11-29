Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641515B551
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732879861; cv=none; b=KnuPjjzWEaTQdP2a1HHxXZbty1RYZDrnQhg+Egg0+oIUcoN2ysBbjYbSUQ09PC5WzliJiyveB4a/J8usWkICE4Dr/zgDEIk31QRqcWKYTHFdcL4HLEhjOA8H9MC5YyTaJiTbXh7hnxvElHTzQJ2aUX69AoNg6Pm6MdFhgUYv190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732879861; c=relaxed/simple;
	bh=KvkDUcbjxSgA55eI4i8ys84ybkmkjThM4KqxgS2qbFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNK+qtv3HaqzJqNdQCoS+RGeaKdQdyRzdCLbKVWyXeh9fsfZx5OdISd9V4W7jqv9WG/yfwkzMKDqmKAnXAguezobO3RiHX3/X28VYD7HZVEIR5JdDzzXOeezwLCg0+Mcx+9tjeS03fXOiOmWttQiWXPNYgVHeNh+CYVj9JgQ7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpl45+3f; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpl45+3f"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ddb4c05d1so277218e87.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732879857; x=1733484657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dru7XehxiadKT/ViJQ84q3HT+JPTxb4ywcU3T49Qslc=;
        b=gpl45+3f10IWM8JA4HpDSHThFolrojAmixn1ppzOhCdegQHlM7BxNIsqh+9DPfT276
         9/RuxJlcs12d3sCdvv+VqdnaNWiJnrlsPPOCSL+oG3ol6CpsVaF7+B4X/mnOYoO3aljM
         vuoAgIq3i4gnuxGcBlR7jCiJmJObijgzKHQBZVZKEsq9MibS6QkGhMWeIl0ZwjX8Qizd
         esE3kC1f38I2e0NHCPEYjekmrjQVBosz7RMrCEt88hfITapRdEPQn77t2aHgPxLlrjam
         tENlWIFJ1CKR+CnJh5s1BUxSZ6tcd0CWNKJW2hxka/O3lCBzVo/ivmAH0yb0hYlTh7Xv
         39hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879857; x=1733484657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dru7XehxiadKT/ViJQ84q3HT+JPTxb4ywcU3T49Qslc=;
        b=KWf9/NQkd4lj6pB5AnPYZLv8cOUe1qMoAxjAhTE6XJP/gonJS4dA8aXqaP3O2tqSs9
         R5Nv/kLrvfI+njUN5Rsa+4XdTV50Wt7eei4xcm3Boy0PndUcQH2LzMoASuffig/KzWTO
         dqKDXy82CwwBJiAHTQFdVobpllBoeGFC7VTStK8n8zDyLufwkjz9M6UTUk9CncgTy54a
         AlIRqaiMsX9qvPq/LiMWPcgdRRIPbq7eQjPqUv3HwO5dT12mmwKcg4RpQQpqAaibmhbk
         M1K7AS0T7YrcYBasnWlce3zFypOOSpXX03PYTA2EVXAJYuhH8SOzY2RSiqcz9TnfN4Lc
         9Kjg==
X-Forwarded-Encrypted: i=1; AJvYcCXAqTtt12wnwqV49+W3/3I1EIZeb3z3ALNS076qTvBQ1WdLVcBYjwDtMVrH1zl/Pv7cJNiBCUk0bfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrY/UFRcnV4GXorWEZdUQJ+EcV8baGuSvHfNDxPZBNAW/eFpiL
	PZ7sTfhzm0JOYFg5a0pVvbHaMfwArHFSWYyc5wrDmTaYtTfPt2XQfQoA06cRHx4=
X-Gm-Gg: ASbGncvAq4Ped7TL+Gqd5OODrKyXLMzaseWJV4fRfngqEG+TpmnNrMFd090ku7uDwfj
	zd9SEt3uSDSfu4AoC4oqSawZ48oan2UdTQuUXOa0BfY1HhS7pgjyHEi8BQF0p+KTnbt3d4RZgVo
	w+JPVZSKuydn9ODQrqj2TLOTkAXfZbUVkigxAWTraZ/x3/e9hLIo8q5Y7XbJbpyI69de9DNAde1
	HMJTe9e/BjBrqx4VcTZ6FLDdL6p3ay1/BVuUx35QMS8uxKwdX3mK9gp0jo7XGteiRNuPAc+xDcO
	FrOcPOwqEn4mmpajsxpOP4qCk83y
X-Google-Smtp-Source: AGHT+IGn69c9WrUJa5Fx5fZQEEMOvwP4jv1LmT5p/N4LSQWowO2axrDMJ+H0kV5B7ia/qeP27am3cw==
X-Received: by 2002:a05:6512:2316:b0:53d:a9ab:2ec6 with SMTP id 2adb3069b0e04-53df0108fd0mr1406559e87.10.1732879856709;
        Fri, 29 Nov 2024 03:30:56 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6430e69sm465538e87.44.2024.11.29.03.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:30:55 -0800 (PST)
Message-ID: <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
Date: Fri, 29 Nov 2024 13:30:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
 <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 11/28/24 18:38, Bryan O'Donoghue wrote:
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
>   
>   	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);

Please make a call to the function like this:

	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

Here pd_data is unused.

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
