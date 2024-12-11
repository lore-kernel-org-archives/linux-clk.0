Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5911494CC
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733928852; cv=none; b=TMQ/kMOG0K46OENl1vjfTC6dgNChXrgeyr8zYAxzB9zrAbon3IAsGNVYf+Pv2SwehagJ5tPFKzvvxZRD7Pp6GDdrSxGJFodTpMr0W3aWDvH2uvqPk73EQVg9hVwqjPBOfL5czFA0w8opkjKESNsQK6Bk9T7rmYTdtFf10FhJUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733928852; c=relaxed/simple;
	bh=TA26KGjfUYtHcpviYZWDnnwFJwB1nA6T2oAA/scN6hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNsrRS5AkXHbcf3wzmVDUPRK3N9HImPyL+DMoELpf/yPYunja9HD1RyJYLz/Z9HSI7GMjpdhI5+lzI5+a2xh5fhm6n/BJZvHmgGGt1nfUvZ8kLIq3bTYUw+L5UQLLmsB1mYKTUe1iqflCvcU7eRlLqfhEn2nrr7hnnolgxfljsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTcLD1z/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTcLD1z/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa69077b93fso481095166b.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733928849; x=1734533649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ktlO6czYcyYSCmYggj2K8QrV0XdcUJX5mHC3XGXDtU=;
        b=nTcLD1z/hx6Mz0dpJu78nxwyu9yUzZLsjYihxO0rpUMK8albX8aKyeh+/yHyxHGeAH
         EknDZiMcTt/XD0iR/35YWwntvbRDxMM0veWkpw2yj6g2G0Omr83w14ktMuN6Kx/rimRP
         0dqNXx32rCFLwuX2pH9dxIzpl8ovmFikn/WncVpVReWp6J2SdBaFQh/CZJoCZhaBvMYL
         WnwBHPF/TvtLEHJBomfGcDMXmH0EEGcYiMmrfNnMDsCFqLkYlBtXnCMGHlQIu+7LbKwY
         HkxM7W2yOQtCP6OMQhFN2SzXpkUuuzIhQniLB9Wp44Ecl5Ef1avkf1MUb/+H0+7U/uj1
         GnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928849; x=1734533649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ktlO6czYcyYSCmYggj2K8QrV0XdcUJX5mHC3XGXDtU=;
        b=rAm7rEgCjiEoOYnOEHO64EY1VHXuuDzcVeFsjsKBOnGkGShqKGaIp7aUoRsLy7r1t9
         fDqeSwTM9vR16fQVQYlgXo0wRbxvPE0rFYJc4ZUU4XnxVMC9CvicoX6/wpwFayd3+SkX
         0LD0efNO4ysl0AGhj7JCQZ07MLaMMF1lXggWjj2wJMkWcNm94s9fw2DjTdn4iVlC3aT9
         zQlviRtuBQ74raVUHdfcGN0DdELjxVhLJd45eZJ4rrjoTukasVCRILRjEc3ha+BMsgqo
         FWOUPiAlEGg5SGXLln6YKOjTxfBpcqGvvi0h/5AstJwNcEPG3Yzmy4rSOuc4cM+ZeNS4
         ch5g==
X-Forwarded-Encrypted: i=1; AJvYcCXlotSacgRmmhUqKrVnB8vpclgX7M2Nr60J2PIK7Myxl2PpGF3GgIAO2RryyypXjDyEXne5fsFqwWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2WiQJFQIkVCuNz5OuGZPOEk0voXcwp/pVlttao62zSXUaOot
	O+0gL1jVpE6ISBAcZHAf5CWzVEuMf9G8ZYnYJevEvUQ1D7Gx4B7Iaabdtms0JIA=
X-Gm-Gg: ASbGncsEUSWG42rvjbacFTFV8JAqZmkGd332proATjTYs7uanYvcPljX5yRqCzrFMfq
	aGQxHv5zseloxYI/rcGadCHUHbgn5kNgBW475wiF/w/T5FdYMbsC0nLxaKm2qx5qQuqW0Q2AGeW
	IZRZ1FViNUovqXpFtMZ7qAQdIrQNLUQF1Ky1LrYhUTyoVoMfUfkAspbBBw871lYXh0/eYoDK9+K
	ccVpiBZQlLQR5gG3nGG9Fnzd7AdkONiFY3EBezmr8IUQ3hOTQJXKP/KEPONg0tDgrs=
X-Google-Smtp-Source: AGHT+IExrTQgcrzFJ0AioGe6gUTXc8SXmmdedfxuT1544kYxd1QbVPq7wj4wcyNV0DI4WQLs6/DGMw==
X-Received: by 2002:a17:907:82a7:b0:aa6:9ee2:f4c9 with SMTP id a640c23a62f3a-aa6c1ae752bmr8454466b.23.1733928849467;
        Wed, 11 Dec 2024 06:54:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68770c4a4sm473262766b.163.2024.12.11.06.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 06:54:09 -0800 (PST)
Message-ID: <beaf4e8a-51a5-431e-8538-269d2db94f15@linaro.org>
Date: Wed, 11 Dec 2024 14:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
 <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/2024 13:36, Vladimir Zapolskiy wrote:
>> +    struct dev_pm_domain_attach_data pd_data = {
>> +        .pd_names = 0,
>> +        .num_pd_names = 0,
>> +    };
> 
> Please remove the added local variable.
> 
>>       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>>       if (!cc)
>>           return -ENOMEM;
>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> 
> Please simplify it to
> 
>      ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

My apologies, I cherry-picked the wrong version of this patch from my 
working tree to my b4/send tree.

---
bod
