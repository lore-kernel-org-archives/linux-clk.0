Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086EA37FF60
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726913; cv=none; b=YvOBfnWo1qkud2ZCUFv+Q2JxstE8oGCmhlLU0LToPKBRebpy5wPTq3qg9k/pVZG0fVI6OQbDOAc+a4MgFt+mBbCfMbAgueirAPja/Eavv4BABtJklu8W9XMVI9HulvLk7oecZ1iGct9dJGOJ/lKmpeXrEOmO44oxVSl95v0BySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726913; c=relaxed/simple;
	bh=GMP79ITCgxv/qqTOcIGDhMjkPwlpAtEKWoKxT1QzKrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7SXAT2+wsWNTZI2ji0xOzAI6DF2yejYAmXhzuNlrPoD2RY85arXDfcla/0Cb+wbEnc5Kn+bMS/Yl+IpKjULFyLD2RvVHAP7AGMd/sMv2DSSVSeK/+uaPPPWkI4VprEHzVXFw0i1mhU7Y17wwPF0gsMpnVQuqqQIbI+p2e2nBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWwbLYod; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWwbLYod"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso47659855e9.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773726910; x=1774331710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=gWwbLYod2MJtEqf29QupScfb9gpItkNGwvBMBG1+UiQNzmrCwp3qD4mNusAWvRpXTV
         vYjNt1lXqeIpRZXFQKWyz3VmpDNYTq2QheBIE3V19iFt9PCSFdlz74ABhoESa+WrIGiR
         1rCWK5f952IJ5CcX/Wn0U8u8eApmFLBDRXvkbJFv9QvShtcVx40Id67a1w2blQcn1IfH
         ez/7RduyRZEzIAuS3BS5u71L2+j96GJ8WoN/+OzkdHHyJ9ZTDNipE0g9rPHUBvAOR4v9
         9Sr9OG+Bz/fnJgcTfzG8zRtUsq6becPQzDM3zQKmx+YfdQOw12WHgLM3unIzhsC99AnC
         cM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726910; x=1774331710;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=B0qanuCU9lJwHFc4IegCvw1Mh4GW85B7KReC0/QtdUF+ss+c7QJITWyiDpGUvYP47v
         3Eeo4gPUdg4yogUFQ+qGT2iusFBgUjmnYg9ElqyHZcAV7vGCltOIH76Q+jcgxquYRI0v
         eMP7o0hj0j6IWLEYSEm18RwUjLAqAt6KIVQw+Fims4aECneFxOGt/JH3iRvP3POgoLvi
         JwXuTeHxdwZptv+02oyRoS04+iJoBG9S1ZTdnUtqwjr1fffliX7Jo2O6PnU0pNV/iYmP
         EqAMFa+B/MEqH4V8SYpsHahFmLnIbADrSQ98+qISckMHm3wy5DCpj6miWhHWVMERXq5a
         ME9A==
X-Forwarded-Encrypted: i=1; AJvYcCWByih4NjhYQCUDkcje5OzkjR9i7bAUjZUKmBtzEhbOwQ/dcbY7VglgrjSTGHkB8Rgr3MChZDbNTH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcKo7lBru2ovkN/zyXppI4ejmY0Om+IcwZgxKNakpoCZpc5Xv
	VNCssQ4W4/ib5uHveM4Q9AMimEup1jAohus6O5g3vRnhEFLum2ZcYEfzINQ/qK1DCQk=
X-Gm-Gg: ATEYQzwRX2nkOc2IGa/+lg1ZutU3SVV4+0LdeP2OipbX3n/ZxDECqSpMv7sBEfwWxAH
	UUKBQuhEXdWlZBGO96X5Q75RFcsgPfPulH1SXfC0gpiR/jxntuVzPEMzCvSSbuTsvEGJoikArvL
	2HYNo+5bGoNJs6u46na3t7sGjKHJM622bL1isQGHyQ9bbVe6nCICoaEdx0WxLYKni6PN2eLWOul
	Naf0fOQA9DPSlzA64MiPGzO8QhDcxgSycd64fqUjcHUhTlTRshrWFq38vwuSQ04oRtLD/T+IZGl
	3MOGn3INL0Ttjj9A4o71UXncUKi50rA0+4zjBGUF56zciY80DIcSXTMlBOHUoniJ3/yNyJG757J
	qE949yXuW/jJLiGyrg/BuXe7Ajg9id68YmNUU3g5TkOgi6CIb3ZtPn0INSTk0dKMcQ4J22fJdMw
	RrZsrPXMfB+l+GHBURr+l+mU+2ix5TwAtWEe0=
X-Received: by 2002:a05:600c:c8d:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4855671052dmr255918505e9.33.1773726910252;
        Mon, 16 Mar 2026 22:55:10 -0700 (PDT)
Received: from [192.168.0.101] ([51.37.189.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm42508625e9.6.2026.03.16.22.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:55:09 -0700 (PDT)
Message-ID: <d104e54d-8276-4d1e-bb7d-9c01c45a7184@linaro.org>
Date: Tue, 17 Mar 2026 05:55:07 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <20260316-papaya-mink-of-examination-6db401@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260316-papaya-mink-of-examination-6db401@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2026 07:31, Krzysztof Kozlowski wrote:
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
>> +    unevaluatedProperties: false
>> +
>> +  "^opp-table(-.*)?$":
> Why do you expect multiple opp-tables?
> 
> And where are operating-points phandle? Please look how other bindings
> do it.
> 
>> +    type: object
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -175,8 +201,6 @@ required:
>>     - iommus
>>     - power-domains
>>     - power-domain-names
>> -  - vdd-csiphy-0p8-supply
>> -  - vdd-csiphy-1p2-supply
>>     - ports
>>   
>>   additionalProperties: false
>> @@ -188,6 +212,7 @@ examples:
>>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>       #include <dt-bindings/interconnect/qcom,icc.h>
>>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>> +    #include <dt-bindings/phy/phy.h>
>>       #include <dt-bindings/power/qcom-rpmpd.h>
>>   
>>       soc {
>> @@ -233,6 +258,10 @@ examples:
>>                           "vfe_lite0",
>>                           "vfe_lite1";
>>   
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
> Again, incomplete example. Where the the phy?

Both of these q's can be answered by adding a phys to the example, which 
I will do.

---
bod
