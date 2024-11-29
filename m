Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE119CC3E
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732884302; cv=none; b=g1SHyL4PziLHuIzcHN9YakkxSgRParkqPYUinw9C131z96lxf7naKJge+eQzL4l5b1g9z61fTLj25XqInTQ0oyJ7zeUBqqKXrcTi2GzjIaou9AjVwWXJiHjqs8jPUe9GqEuqSjBYvTknlwALJQq9NPGn65YV6lWkoOhiubU4n+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732884302; c=relaxed/simple;
	bh=hXRUVhUT7iuGMisSY5rTdmBe8+DVRRxrX/qutu0JmK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsKSeANMtPmQT61pnIg89lE5Ypc6JspKTl2PVHnme+uEkDkqglVPcrZED872LdQitS+HXc1WqAlMRCoppyb37tt+alJONHv79YmW/+91if24ZSiClg6kM89++67IWJ7y2v7EyRdQ8oYSIZV1UiwiYI5SxU3btwTpDwwQxKKBxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnB2YvSH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnB2YvSH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434ab114753so16250855e9.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732884299; x=1733489099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQHk4xgLP7Q9dv0sn0Vlg4Z+LAw3QiV2tT0lht9dhq0=;
        b=gnB2YvSHqs5NuhNCJFfrIE33ZtjCu0v0wGGgHDSG5830G8YO4/wQ4pnRs0sUBgsdiP
         xHREIc3bEjMV7e4iTWJWgmZrAH54xtsgq4vS9g5lX4gjXxqwvDy0O/OaACkW2RMIE5Bj
         b4D04at/TVctTPDyyV6ci4EZAp+bTAHh/X+se3s0oluZdxMUw0uXXBav57unG52gjHYf
         YxCb9w4u6ZvJKAJCU9qkbB9fRQoIySFBl5Ce7a44ahAmeGCWNyTP1+ToIRSGKeTVxVcU
         u06bRv20nnA5p12wv88FelhbuVhmRyOymBv78VatviURCzJPl14CXh/GvI4GW2YlJhwQ
         206A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732884299; x=1733489099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQHk4xgLP7Q9dv0sn0Vlg4Z+LAw3QiV2tT0lht9dhq0=;
        b=RdtsqfwBr21JitFCeDqdI37sRVnqnE+nAIQKL6mWCkFIqT8wUqFBmlQO48e7GWyX72
         6iH3ozVhm/Prx5MXqm/ALjgSUMx5/uYrATlIEJXYfZUsiuF9XGkV3YRps1LpKuUNPuIj
         REmuB6ULkPfDVLnMqoRh51zDDEupxIbfRgqIzNjl94kECiDxyBAu63UirYZsPWO8yycU
         4TPkK4hw1LyRLfniJQHVJ8/PqA0va2ukw/L1D55G6NgSIzpvCQlW+57yIt5wawnSNR8/
         uv763HcuK2uNWILiPNnsE+zB93NFSgJFOFLdVdz+59vdBYp4p71D5F1QsXxoiNLTGyok
         Ynuw==
X-Forwarded-Encrypted: i=1; AJvYcCXKDymBqX26+jBCGS+PsnboxFIvYHFio+zjg4i5/RkbIoRfQfKf/WKQlj8w//6gN/ccUMLqiEbGOZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB2q3pVnWuHRTmQFVI6aP9mBUsKfPoEsCrRdnsbvJvUsDfxBV3
	GGQFThdaN88u4g0bpCtNbIaIHQn6kkD82Il+4wqA6G/X0cIz1ohLNgRJ4/wOSNc=
X-Gm-Gg: ASbGncvz6h8jKGscWl51RpZXP9m1AOzMoWWI5Alhvrq4CAG1oL1bhekl2NO+47ebq8Q
	EIy88h/NsVcLHI5lH9wjEA3ODfUCT1MMRQTqB6kUXLJOEOxg7GGvre3aR7soOuHWVP1FulioXDU
	Jk50ffZx+MTjzggVBPSyCXTe/6D7dcnyqfdk352LtHDh+eNWDdpnWDecvAZZ9vX4g/GbCGHbOar
	oj3rhPa5kHawdLmBnvpjeNONANNgE/doE3g+XpSlrJ7rr4ehuDuNXfBLGNUG3E=
X-Google-Smtp-Source: AGHT+IF0w0Sal9lG2xneo79Z25errSE6iSLsCaFoKNGbaicJd22m1cUtOXxgp/Ku8MPgnlofoaablA==
X-Received: by 2002:a7b:ca55:0:b0:434:a1e7:27da with SMTP id 5b1f17b1804b1-434a9de8d23mr93783805e9.25.1732884299110;
        Fri, 29 Nov 2024 04:44:59 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm4332449f8f.67.2024.11.29.04.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 04:44:58 -0800 (PST)
Message-ID: <52e3d25f-d142-4efd-b41e-e9b93acec529@linaro.org>
Date: Fri, 29 Nov 2024 12:44:57 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
 <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
 <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
 <7cf4ce25-742c-48ff-99e0-bbbaea370e89@linaro.org>
 <4310164e-4000-4cff-a093-7986f71fc02a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4310164e-4000-4cff-a093-7986f71fc02a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 11:44, Vladimir Zapolskiy wrote:
> On 11/29/24 13:39, Bryan O'Donoghue wrote:
>> On 29/11/2024 11:30, Vladimir Zapolskiy wrote:
>>>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
>>>
>>> Please make a call to the function like this:
>>>
>>>       ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>>
>> Passing &pd_data will cause devm_pd_domain_attach_list() to cycle
>> through the power-domains listed and do dev_pm_domain_attach_by_id();
> 
> Doesn't it cycle for pd_data.num_pd_names times? Which is zero.
> 
>> instead of dv_pm_domain_attach_by_name();
>>
>> That's what &pd_data is passed here. You want to have that simple
>> attachment of the power-domain list.
> 
> I look at dev_pm_domain_attach_list() function with my best efforts
> to concentrate and see no functional difference between your version
> and the one proposed by me since v1.
> 
> -- 
> Best wishes,
> Vladimir

You're right.

I tested again, NULL works. I'll v6.

---
bod
