Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0B3D524F
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385834; cv=none; b=T6ik50eB068nfsIyvG3Z6hsSWsXxwDn81QWrOeuwzueBgUTncRjdSzJMiovLhr4CDJxCG2vsMmJxQzBkDpNwh/gt9q9iJ6WJomGAD1TR37yY0UiMbPHf9mo54Rv2Za7tKoYAbsF/FtjIU86+fRgb8S0LJHKc8Fak3r//I8bKDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385834; c=relaxed/simple;
	bh=fVFayjc2eOqsSz3WXVu1VPZKmGsi43dhiuYuNC+XHjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQy4FmrFowfNIqkgUavLXeOmeP+q0X1oouZ5EI8Ck3l3N2FIluKCpI1v32r3kXjG9ACpVt4/WnBeb2bXKET9oVpfSrbxTa/bE7xWdtoL+lZzpV1DK3vtEIJU+7BnKVvBLghQ/8/OHf1YVkDeKIVeMB0D7f74Iy41uyoZ46yW5S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHsPQhQa; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHsPQhQa"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso260993766b.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789385830; x=1789990630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrFobApx96GbKEm837whkFKjtf7GL+qiMSoZ+3ZGcro=;
        b=wHsPQhQaTJzUQzz1qYlTn4P++71n2Iy5bqhx0T7CRPf+7i3lKHY1rexkOlNGQMCwcZ
         u0Si7AN1hryouOPT0nQ0XaHFU17Iz0k837RLoBm0pTbq3bVh3u6e8NjjrxEZo1yzlreq
         1zeFFjjSVCVNE917fZ1a0rcs2BBY86bNkcm8ynrlvONS2osqrRYMOqKc4nbC9jcDbBaR
         8Mo1vHCg2uYDr/G9ok+a/q8fdH2mrPsd4SB5QMrq9jVl5Vb8QjRxzNjhzSrHzNM275s4
         w8KsXaUL4F+uO0EjoogrCOS/Qg7/3bCEvsns7xfnDYsM2h8qyihbpQOc/NHgDu7MPpdn
         3q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385830; x=1789990630;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrFobApx96GbKEm837whkFKjtf7GL+qiMSoZ+3ZGcro=;
        b=cRKjO5g1OHcUZBqFm5tgvBoB1mtymHsDluuahtrAQMk5WFNLtoOJHiI8tqXSl3LhHb
         YAeSVQU5RrflqAI4QuL/o3VwpzxGISaVVCDBA36g/3nauZSenC6zhe2k6jn+KSl1Atck
         DF32te0cM/n4vNnXSST0XoanUkIohq/u0PFjXOME4Xj+rRMD756nLFRNjPDlIg8djZGY
         6BMRKmFOG6UtKkL73uJBk3qq8I9yTY8gKkKfM3TqGoz9ebf6ScFO5Rgnq0xz4BFoUvKQ
         81/hyT2vzBRmY8BpVog6hHsmX0//8RaUxjLeWpes57ibgH+Qq1zPbFwWLPxONT2yXXoc
         JEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2LcCO6J/LQLDqvDyHjpk/wL3quatcufXtRfSE4LqoCi3wgSHvo/D0jrGtxIroTHIkbu7GUG7B9xk=@vger.kernel.org
X-Gm-Message-State: AFuF++lCEdWanLeww0V/djrA67GbDbouVts8yWj+FBmPt/CAGuE48h1b
	GaGXHbDDTmY22kqOvtUP0aSLNl0jlcBQzQFUNEm9pgKYGq65QHa3ckkB+wXDbr9KbHY=
X-Gm-Gg: AYBFou0hs4QQ/xXbywMk/Ptyw6D9PqvlC+5F/kGZ1gBqx2/fc9rVnZ0n0OLVk7ZMFVS
	2br1w7Jv3deVXJ9jxkyCODBZGQTwLr1s9rVK/di13ioUBrugRo05yRXWbUqjuH1QCoqOs3uiXn8
	fhQVcJda7OSx0yrSTUP1dpIRUF43Kupj0zfFqMvCeGNoIk4kPgxP8YxZDahF8kmvnjSI6pwlkrU
	9dCjVHNcXFGBXbyjzVflWykqdF3+ZYdvlPzUlVEWMxdYmaUQViSjAcBejtBmFybab7pR6wrk3FJ
	QpdsuJRbPHYZpkA86gGBlOg6w43VnCJD3UnnES/cmTR0+sn8YaKFcSkjLeIo2jckIJpEPi9XTr/
	lIpi9Bv7bT8R04FERk2oLiZDq22QPf661+u6zcjlovM6LnPRg+gAea/d6eWVDqyTc4eibCUi8s1
	rwQ6Pmamaiy86dhwzMsTYPSm5tjItbXQkXnSXlMP06rKCnZkhBcXGaFibI6v0IQxwwNGNI8+GXu
	GLthsr00g==
X-Received: by 2002:a17:907:806:b0:c29:53b5:c69d with SMTP id a640c23a62f3a-c29b86f99a5mr151242966b.28.1789385830007;
        Mon, 14 Sep 2026 04:37:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219ecsm412455366b.16.2026.09.14.04.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:37:09 -0700 (PDT)
Message-ID: <44634913-fd6c-454d-a3a2-6a8d541b2c1e@linaro.org>
Date: Mon, 14 Sep 2026 12:37:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] phy: core: Fix use-after-free in phy_get paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-1-f7bd68b5369f@linaro.org>
 <aqRq-xZRIDL1apdI@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRq-xZRIDL1apdI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 21:56, Frank Li wrote:
> suggested subject:
> 
> phy: core: use phy_provider_mutex protect between _of_phy_get and try_module_get()

A pattern I try to encourage and role-model is making fixes very 
explicit and obvious - frequently I'll ask people to prefix their 
patches fixing things with Fix.

I'll split the difference with you since now that I read this submitted 
patch title you're right, it could read better.

"Fix race-condition between _of_phy_get and try_module_get()"
>> Sashiko asked during a patch review if the existing usage pattern had a
>> race condition; specifically in of_phy_get() if it was possible between
>> returning from _of_phy_get() and running try_module_get() that a module
>> might be unbound leading to use-after-free.
>>
>> Looking at the code this appears to be so, there is no linkage between the
>> phy and module under a synchronisation primitive.
>>
>> Using the phy_provider_mutex in phy_get() will ensure there is a link between
>> the returned phy pointer and the module_get() bumping the module reference
>> count.
>>
>> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
>> same usage pattern.
>>
>> phy_provider_unregister() must take the phy_provider_mutex so amending
>> phy_get()/of_phy_get() to take that same mutex guarantees there is no
>> use-after-free.
>>
>> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
>> Cc:stable@vger.kernel.org
>> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> ...
>> @@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, const char *con_id)
>>   	if (con_id)
>>   		index = of_property_match_string(np, "phy-names", con_id);
>>
>> +	mutex_lock(&phy_provider_mutex);
>> +
>>   	phy = _of_phy_get(np, index);
>>   	if (IS_ERR(phy))
>> -		return phy;
>> +		goto out_unlock;
>>
>> -	if (!try_module_get(phy->ops->owner))
>> -		return ERR_PTR(-EPROBE_DEFER);
>> +	if (!try_module_get(phy->ops->owner)) {
>> +		phy = ERR_PTR(-EPROBE_DEFER);
>> +		goto out_unlock;
>> +	}
> why no use auto cleanup guard() for mutex lock?

Technically this fix would apply to kernels predating scoped_guard() - 
kernel 6.5 v Fixes: @ ~ 3.13.

Not really sure how far back the cherry-pick will work but I'd like to 
give the possibility.

We can always sweep this file to use scoped_guard() on tip-of-tree later.

---
bod
