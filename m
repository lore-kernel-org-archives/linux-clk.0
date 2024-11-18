Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B11E572E
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968244; cv=none; b=vD6Du7b9/1QuqqX8GWfyHzSynI9C546oMrzXNyeY7cg9d/afPoLYZN0WSblWfJda2yRXzEFo3Xk+ILPukHlVizp393ob4qvw/Ey7hw9RFTaz8a1xPVVrWZV9oXyx8QdvBJu/rx9+1hfxD7cZrOrZ6c1xZvPdkiECV3QNs97hJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968244; c=relaxed/simple;
	bh=hZIvMyXtZWni8q5+iCDoHqgTW0z1eP+nNGIo28NDmRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFwz7I3MFSky9GjZ+Sv4A6pTAkzDw9eDpH3NdwReNCwfbUQ7tqZqxC4idE63BDM+TzgPFRs9OiwiyNGhKBDBT2NEWQq4X6l1QWU9Tn/RHeIFWlnO5mr0HSpAseaKmP7hGkoE+PIuLjDBt6+Hc2XHm+pbkPzlgdOr3IlT+53YnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcp8S/pc; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcp8S/pc"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb49c7d4deso3006891fa.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731968239; x=1732573039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J2lS2YmBPhVneBwHBuX6J9t5XJoyMza4FciI9dZ0VI=;
        b=hcp8S/pctrgE4OmEV+M6xkDxoMo4Y0PMgJ+U0IoD8UY5Bw9IVM19ORZn1vMLNuGCKN
         PsXR1yGDoYwlF8HcZb9m4HvEkjZT1lQfol24cUYzaqKhugkteskA2/CDusf6k4OF8ptR
         4KoAByn1iL6oIwfEnl5UJehtF+MDVdVRG/vOWCh4XwobZu27feA13rQtmuYA7W94+rD3
         ywwt8qtGyT2QmbmAuKdc3X4L821xUBmLPdbrCyP7FUsMDC+3WIk38u8QQv8siEVgfgNG
         fQAvlo1X2TPzdv8XxtjjP+ienhQjrmuDQ3+ydRi0d7/NB0rVYM05LJXIi9/PQcWXNZvJ
         IuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968239; x=1732573039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4J2lS2YmBPhVneBwHBuX6J9t5XJoyMza4FciI9dZ0VI=;
        b=w8Hw1DkINyy32o0ioeUgb9gDzNXnfCZvtiudenTlE+VP47700TuBq7aVFT8v2yS0bv
         P40/Wc3nJawGez3qAVm6JHLGLK1qRXPHn4VciAjJ6Z1ZWS5VfcmFXwzC1Z4mdE7rYK0T
         S4q03FCgsWB0RCYoFwoBJUGikH0qTyu+ykdBfUDovA+XjelXhzqhsYDLeZYJS15PE77m
         x2BkzFB4jD9pABXHprCppewtbyfrEzK4Jk1VK4orZ+foV/blPoaG3Hl7RSDyBWTMmsLP
         4k+r3feM0Z1JWSaDl12jyErn2kqNKeBlz6c/M0+Dyr49E+VxFwgUK7n1nm0A4hC7dpOP
         PcYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs02B/TIlkb6MM7TN9afWluSfqUAAoXfBoarFHDV3YOrQpFqYklqOTA73HovrPgBcZ+jMmAbBUW1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/A9La2d/i/MDplzQ7nco8jpjJF/KHdbPk0lJJIimnom//Mn5T
	I53EaFIMi/qs3NQxDrn302APFfEq5PUB15z6ffRGp8rgNIr8qlUD9I0fBuTz+Ms=
X-Gm-Gg: ASbGncu20Yy43o9GalFV3OftNy+/5m/bWM3YhGqmB+Zyj3NhN5cqTVjnOLEZ8vYwxJW
	F6HV5OBjzOKFIareefU04sxDHyyVvuzB49ZuVi73EefWbLFbWChcg0MYkze78n1KA6h45+EbG76
	WshmNWPqkJJJ3osrorWHlvi5ZhmMF/hEnVPuFXJpph6Wb6G7SRLfiQvkIBuXZRLBsJ3oNOeoB+6
	iW6VREsnq3zmzoitXKsFnCT8vxxTCe4g+MygYQ1loCHcBp9s0ZG7IIpG7mycSNa++x6JsJTH4od
	5uR4B3TKEwa6EBj92A+2YT0wS+mO
X-Google-Smtp-Source: AGHT+IH7yutk9OuFHF7vFU1p9lx+sgBcPdw4/+MxXchsSnYtkuyHmZwIoY0dub0Kym16dEsIApX+Dw==
X-Received: by 2002:a2e:b8c1:0:b0:2fb:55b0:8293 with SMTP id 38308e7fff4ca-2ff60668453mr11518611fa.5.1731968239323;
        Mon, 18 Nov 2024 14:17:19 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff6985118fsm10566341fa.2.2024.11.18.14.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:17:17 -0800 (PST)
Message-ID: <8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org>
Date: Tue, 19 Nov 2024 00:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/24 04:24, Bryan O'Donoghue wrote:
> Right now we have a plethora of singleton power-domains which power clock
> controllers. These singletons are switched on by core logic when we probe
> the clocks.
> 
> However when multiple power-domains are attached to a clock controller that
> list of power-domains needs to be managed outside of core logic.
> 
> Use dev_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock being registered in
> qcom_cc_really_probe().
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..b4377fa09f7c0ec8d3c63dfc97d04fbb8cd6e10b 100644
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
> @@ -283,6 +284,25 @@ static int qcom_cc_icc_register(struct device *dev,
>   						     desc->num_icc_hws, icd);
>   }
>   
> +static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_names = 0,
> +		.num_pd_names = 0,
> +	};
> +	int ret;
> +
> +	/* Only one power-domain platform framework will hook it up */
> +	if (dev->pm_domain)
> +		return 0;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   int qcom_cc_really_probe(struct device *dev,
>   			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>   {
> @@ -299,6 +319,10 @@ int qcom_cc_really_probe(struct device *dev,
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = qcom_cc_pds_attach(dev, cc);
> +	if (ret)
> +		return ret;
> +

	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
	if (ret < 0 && ret != -EEXIST)
		return ret;

That's it. No need to introduce a new function, not saying about 20 LoC off.

Next, you have to call dev_pm_domain_detach_list() in your version of the
change on the error paths etc., fortunately this can be easily avoided,
if the resource management flavour of the same function is in use.

>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

--
Best wishes,
Vladimir
