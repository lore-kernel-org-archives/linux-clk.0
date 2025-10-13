Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C1286D56
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359974; cv=none; b=jurhEUNG/W8Y2UqhJgZaf2KsKTaXoecXuZQLro3Qzb+hhqgFko0qcn1OGt2YXWHTRHpX7e8b6JhUAk7KyAHUnowF5FAZyX4pUWp/BkVzVrGXks4Fmw7KZ8PDYa2n5A3Mmhk1sRO/0OmL1hCdANJdOd2KXi+lCieuktunEsTx83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359974; c=relaxed/simple;
	bh=veB2ekC+v+jOvBRwKgJpVvI2Ki/SBVYFi1JBEeYd+Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxJJwM/eBv8nBwzndQeLDRq2j18o6IP939pul+lM/lu/EootCiy+rRMcAFysIZKpV2f5gyXRfn9jIcaBiTL59oUhimVa35/TOrDmE4q+rYF/Yy7UzOVVCp3+PxFXKZJJNEVsPpC9WDUM4fxpORx9/99zGMAG2ytXwK4I3ayQOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7iQBH7z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7iQBH7z"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso699050366b.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359971; x=1760964771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=V7iQBH7zsKGQy995T4R2WkgNgku82vaDfEA8pEuYev7FQAQcHDnt4gWtdd9gLsAtC1
         G1NVaF9FIh6ypFgliNGkd2uCiwzf32kdOTeKupZbxXGhwpWbjQeqT8e/FCstePPLKBSl
         ZB8r/RvnheKPhmFMIHczAx0H8GJV2iGv1vyvamdBPrY6o1h1LlzL9xiJjJPTkKy4+nsk
         efpElqcHyXhdtmsk8DtUmTMnp7m9LBVCE8LFU8z9V0Eq2TFyzF8SHRbu+LsBiC4XMXlz
         GkaIkG5MymXEPU/tb+TlZcuFQEuvRben+cF6WPjQ8+ujbbVLZS+42XuAO1xZrJbZdLSi
         E67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359971; x=1760964771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=Lfxapvv2CxNcVEbP7KAv6A6EO1j2BNC2UVTFZaY3z8ATJI55F0AWPW3J4FPK+J8kJt
         sRGbQleroLPTLBTtfbingGVylgbWcYtGXvG4awOcrbLLYbMr0JiqHmW9sPyUGMlJyZ95
         DvL9mWd+E6PCQ0WvLJaxua5yDiWfEuxNswZNCLbt8nBjq57nkrEnsOyfih75in/S2JKl
         IaWqKfKf5m5K/TSWJjjoResU4o87lSGq6hD6rPmfU9EfaM1sKxePLCwcVllcAt2kaK3A
         DbaKojHh5W0uW1pXd98kLzQu+OYgWIJ+0NGOoYNW0DfdhpP+/lKURl5gfPsmF8VhMW/Y
         H0LA==
X-Forwarded-Encrypted: i=1; AJvYcCVYcP6B6fpAVOZrxFGdaZrBEEACDFAiYGEJ2v0XAn8ong8dHuoDfUx40ys2xkX3aQc0Ta6HJ+fbHbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTQf469wkKMFkquvg2ZleGa6N5IxQVzJDw+uxI9REVcxBhd19
	lNno03XcTDA3Fyf4NoyWyF7W94SbuuCfaQc51E/3+kbXWT9ZOw11FgCi
X-Gm-Gg: ASbGnctsfJaGoKl1xgud2MbLK8qcl3XsSkRCEV3yNOpLYQYpqube1V/o4IKqydNaXRt
	vX7hxMkxiYjUv4QWNDlEI3+XFpvnJCTdr9cJ/OwfJJa5rLx8FxUg5EAkPJTe5z07c1y6pBTXebj
	SWn2qK3oIXpfjSbIpZbjZ53dgQDBvut0eW9OU1cYoN1byZtyLMn4+TsqC9Z/LbWIE4MZ/Zx3jUH
	RZkpk7wetoj7/CQOSoiAZrDIkAsd2VlmjdlGCWWlpITj9eN1P+t3vl8k80Vt5LM6JVmKTTlBi4H
	O3b/dnnGKcJvYw0QPH5n9oSaXEo5iKurMyZrOCfzKCxnsh8MhjD5An3w5koW7vNdIqXYFsDyiXq
	YpFoIrPmY5qy+HcluSGPjOz/OPjv5Q5fDdnbYE0Zev+xjOcVG4JZJAHSVEsSRowugIEgjwCfBb4
	o74Sl5
X-Google-Smtp-Source: AGHT+IFmmG7MUY5yB4mZ2FFQqWGfn+1ow8HKXXWlks0nW+FmPuADWQrKCGGjfAyKnyrLWQQf+T1dkg==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr2364136766b.57.1760359970930;
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d95257c8sm920389866b.77.2025.10.13.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Message-ID: <27b2e692-ecff-483f-bb88-392f6ce87574@gmail.com>
Date: Mon, 13 Oct 2025 15:52:49 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate
 ID definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
 <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/5/2025 10:02 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:02AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add ID definitions for the clock gates managed by the SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
> This is part of bindings patch.


ACK. Again, sorry for the easily avoidable mistakes.....


>
>
>> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
>> index 827404fadf5c..ebebb4831761 100644
>> --- a/include/dt-bindings/clock/imx8ulp-clock.h
>> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
>> @@ -255,4 +255,11 @@
>>  
>>  #define IMX8ULP_CLK_PCC5_END		56
>>  
>> +/* LPAV SIM */
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
>> +
>> +#define IMX8ULP_CLK_SIM_LPAV_END		3
> Drop. Not a binding (see other discussions for many SoCs why).


these definitions are being used by the clock driver we're introducing here


>
> Best regards,
> Krzysztof
>
