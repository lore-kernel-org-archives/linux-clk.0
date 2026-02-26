Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E86330FC01
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099397; cv=none; b=mlP8aQm9Brr1xawkt6E7rTjwQJ7cbcgINa0O5AQbomGZhlYs9zFqr/ssZ2TLgfaOtfab2cXHNAPaqHZpSYQwg4VBPeiVkFaiuEeqT+ktHzQhWnL4DyamylqSMKKQ9hc2HjsBj2pgCyi6PzSMImw5Vzy0SLKcoMm+YTyDPhKJcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099397; c=relaxed/simple;
	bh=0VLKb0yi2wmg8HmVprc6SZDCPaIePTHOT5RF/nosdlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVsPApajnRVfg9n1yRpXIwbNHctvy91smIbqRqug6Xjd7vCVvSfo1zQsYTXfDLIxKfIpsUhPVzeitwLzwFws+AYUVxqlGeeVe/UOkv1LuFYo7cXFJ/Fv4RqLXtrJRiOWA7aI6aFxCFDXbbJsKA2da2ZQCJRxsMioOQi0DChrQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BEJsCcJp; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BEJsCcJp"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4399851b14bso329870f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772099395; x=1772704195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ACrGoewzoYGRbbsm9o100sXJ5ajI581hmZz0uIYUic=;
        b=BEJsCcJpbn0rZefI+x0qXtlzFynEIuTfR5bpCRgJCN+JigKjtCM9Os5wi02gKWQtWC
         L3gebfx8rZssFS1V/IqZ7oKW5/d9VtwWfQIBQqWtCZdtmoWsGrqgJOYnw/wSl4nvKu9f
         PxN6pCtC6gZSI55fl+jEgX29RlzKbTl2p/KhXVM/yBJm8AaFxQ9G2r6mbz++sac2zLIU
         azsWJuAyyivWszqkek45/YHndN8plNEEwc9+XBY+5OGsDNNF/Ovs1PCVntMpNzO8RdHj
         ve8O5yVlV/oViio9Ml06FdsvCOxncmeNdEMFessAWSDQvdWjLCgrHH/CKTC5xRP+B40c
         Zv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099395; x=1772704195;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ACrGoewzoYGRbbsm9o100sXJ5ajI581hmZz0uIYUic=;
        b=MVq8FmP3Yhn1Sam2OaoiFMW/EEdUWrNo27D70Ag1l+ZjFV3anT+mkQKaGPMcjcFkOq
         OxbTLKdl/zXHIGVjDwltXaHwAug7xc4ldxIe61DKC2vFcFpVcA8qqP42smpWs4oU7LBB
         d1zhvhVnNCOgrj8//KlS2HHK2Px5NgngpFDe0Pg49lAJd+MXCyz78cVU1Q1sfhWnQ+nS
         jqJSDVZEjSpfIk4QPadcg9tobCua69gjnfFsa1CfMh2KpgvSZo0SWqhJi3sWEHGL65z7
         h+Pl/DG3z+qVxzLamq09huCfPKaTWlxvvw2eacPCaGp4SU4mYvLRStk9qclMWW/W8r8K
         bCgg==
X-Forwarded-Encrypted: i=1; AJvYcCWU7ZIJj/smoBqi3+wQaJ4dA3UKXg//ionormKETlCr7I1FF68tYzIpV8Tmiq74QHlPh2Oi8w0SAGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCWJ6ip/0J3KkuIVxR1ZLdDkEPezX52VFg/NMwHf0xkNCo4R3
	AjShIgM8u+lw3GTIg5/jEd3XFbayRiv7K3aUkonBiKmKPZtUcquXy1rSz8A6vMnxZIw=
X-Gm-Gg: ATEYQzzCTh2I6240HZKPmmXw+jg5ymW1buMXWg1CrxnFvK2CnRAcOvpFLGcPBWomO6R
	4emGb+0OQsMQ6L6FniPb9tQKBLT602KarT7+9Wpo2TAdKdTfVjUKZRbylL55ASqN8d0O3HbGK2A
	vbkIrfcrn2iGtErTeazWyGVlPedqL0Ggn+om5KoJ7SqguxW+pze7quNkFIhXTXQDEJF8cVMlfTz
	5lMlPDWyR2mZq2napNBrRNHSUNwn4fZDJy4g7aBCOxYIcOgsZNdtxFtO6j6EK7g3Dtkn7VCK7bE
	KwqmiOyOCoNbXvkJGDp6G8OkavClVtOtCf3NsDdAH8hRR4tVCpFvtpd7D48g8Wqnm40cFakySG2
	d3ySbYkYjAgdluNg/s54pgjw2lOWB8r3rj5Ipfqv/FYPPQrKSHNBeXZVaimfWu6gBpBFoC6SWkO
	wea8yg+qKTMLfRfJ9+dhdqgp7YQ7Ddu1IGVgW1rZZvvcYYaiczf8eiV4pfDMoW6DWJ
X-Received: by 2002:a05:6000:24c1:b0:439:5bfe:18ce with SMTP id ffacd0b85a97d-4396f15ccdemr36782242f8f.8.1772099394691;
        Thu, 26 Feb 2026 01:49:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439927c3e01sm8948031f8f.11.2026.02.26.01.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:49:54 -0800 (PST)
Message-ID: <5e595b6f-ec3b-43d9-9963-f4b594f93b86@linaro.org>
Date: Thu, 26 Feb 2026 09:49:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
 <6JLP5a_yJmhmmwSmtFoMmzlT3Gh5yhHVpVSRTqDb93I2_KFB6-p_6mKmGKaqtStt2bbVPqQ16j0Sfp2Z-LvhlQ==@protonmail.internalid>
 <20260226-resourceful-pelican-of-defense-437c7e@quoll>
 <13853dc8-1a54-4cfd-b801-f23d88be4a88@kernel.org>
 <5QUAno5rJaSIXrCTC1Y9QJOrrx2Pt1GGVJspvhutMHgSh6mcu5S6gsZHu3lOEVXjG7pqSyJjH6RB1wXRszZ-Mg==@protonmail.internalid>
 <860cb545-8283-4f2b-9f21-19d207ed7da3@kernel.org>
 <f9242e8f-95bc-4b2b-9b7d-2ad80bea1e46@kernel.org>
 <df38ac48-a472-4f0d-84c0-1f108aa13229@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df38ac48-a472-4f0d-84c0-1f108aa13229@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2026 09:38, Krzysztof Kozlowski wrote:
> I just told you - there is actual mainline user in v6.16 - so whatever
> you claim here is incorrect in first assumption.

I thought we had discussed @ Amsterdam or perhaps Tokyo that if you 
could show there was no external user - i.e. prove no dependency then 
you could change the YAML ?

Specifically check u-boot, FreeBSD etc.

---
bod
