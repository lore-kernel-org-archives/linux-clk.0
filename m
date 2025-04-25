Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AE15C0
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570110; cv=none; b=siaB9VHLNwVMu3IGiIj8aS/cJm00lnkrx2qat9/40aBFC4xWjuN+PkF2CbB3HGAXr/2vK6KJF/JGGUCb/bwqy94JRBeo/8+g3+LXIRhmuS1LcJAFjv32G8VvU9cM10u2rfAGgbMBUvHca7+YYYHc7RlnR7N1DRe8r1Oe7cm0s+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570110; c=relaxed/simple;
	bh=kTafQVInfgZE1CFO5s37dA0o4B8Xyn3K4GQ63U9KYqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqcEU4DRiIYzhqk1x4/MRAxLXSgib2YN+5hPR5ly1Zf9mlY3lfksqgIA4mKsdsXV/7K36/Ci1+eKhFgCeODPGILaavx4Eq1/B49MdmyVlpHRRXXMO5go7vIdxObm88DOWIV/9Ttcz8sNhEitU+dFi2GUfurgywAkYY1vqe207cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeRCwsOf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeRCwsOf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so16959145e9.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745570107; x=1746174907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+u8einId9BLaGDvz8um8Sc4lADMO7vEkfqq6FWkbjfA=;
        b=OeRCwsOfDSlQTRL1GpyBFom8xW1oRHEF9dsYVOaXhCKZS6I0P+T2fhnlS0vjmhBBcl
         /rEHOMJG1gvKFK9sP9BrVSXylOBI1HGlVDqmciGn4GCAP7BCLGV+4j//dc+djxePJc4H
         ZB9f80C7wrb8onPlprPDZ2xZQl1e9pwmkvEJk30R0eicfCsWwIS1CpaondI5ELgY9Kln
         GLC29osV4H66NyvXMRUD7avwXMf/bWk3dlinYwPtGBir2NK5SKPypgq03R52LigQS1N+
         t3Ttgg1MicoODUGSaRRECt4XuMuC8eX3TXidox6aqOAiCrYf7KtDSo5AXvrtck+1g8h6
         p1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570107; x=1746174907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u8einId9BLaGDvz8um8Sc4lADMO7vEkfqq6FWkbjfA=;
        b=CzWj8A0lL45zBDv9ESALUd4NG95nWuH4WqZMWlUDKvBLlfzxW7QeAJlJLKMI+fHREa
         acTg67FgF3IKnfjA3yBxCddhbSWN/VWLc0GB/4GZcL2V7IEub0eKF/XkOjmLBlsZdlrp
         x2nt1pKMhSTNJw/qIpSAkNa+qHZuIYLHfO3IdDo34hUbYANASJcbh0y1b0yLeqZ/EtLP
         B3aF1P1Zwi5y0/B8Tu0tGnw/GSrw8725hqblDdKKkweomm3agWkwJAjGWys958F8s2EV
         /DfJVX0LY+fmbGyav1wEj+besrORzdmvzi1m+ugLnRVSwM6+EM4vyV6rYSPjQqwUbu9k
         9AEw==
X-Forwarded-Encrypted: i=1; AJvYcCWacFVTp3O9LC/Mi27bvDXmZmwj0/Tugr2jyzsS0efayStyB/R8nZjXMBFyQ+mv0YOqut42/FprB48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL5RHVQB8KtP0LHJmERwy3Fs5ngOz9Qd+fbC96Xdvsluyv5EAf
	IFfCFZPJWrCbWDHsMbhQssWkCH81m48f7nb8nNtpb+PEq0eyndz42uXxxAAIudA=
X-Gm-Gg: ASbGnctkRDQtWA2fOO8EmvDlwVeppHwuPBnWALYg3EgMjCihoG/TtZcq1Nvq2KgrpH9
	IU05PlJ5XARSUfkbGHRkJyGDPUI9IW1GHkzNPDjAnTb5G0OzBQR6I8bPB79MBBUnYqKL8bjdAb4
	jRFEl2QxgZVfr4k5kp6hP2PwcBYqQQChXE8oH6/Hd/ggWPgTPK6uwvDGaczJ+8m3Zjxx54taa5n
	pezKmQ6EdTc+3mZrAywIC96Qs6n2z1JoluIlp3b6H8BmOTPaolQyfXJpcZOoo/GNtnhiMpm5arW
	ORELJddKd2W/SvM7TH6H+XPqQ2ak15//+6ALNcDjegRvukT4Jt1igzU58tjQdp5UMerM3oNBqn5
	f94gX3A==
X-Google-Smtp-Source: AGHT+IHbMaG/UpKmNGf2vUTKm7E0YA1Q3uH84FrSyUdv5AM2rW1f4hc1ymcUcyPYeZk5iuLyxezoog==
X-Received: by 2002:a05:600c:510e:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-440a66b034amr9285185e9.27.1745570106663;
        Fri, 25 Apr 2025 01:35:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e0241sm49396355e9.37.2025.04.25.01.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:35:06 -0700 (PDT)
Message-ID: <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
Date: Fri, 25 Apr 2025 09:35:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
 <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 09:26, Dmitry Baryshkov wrote:
> What should driver do if:
> 
> vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> 
> vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin
> 
> I don't want to allow DT authors to make this kind of mistake.

I require anybody submitting patches to show how they tested this.

So you'd have to lie about testing it for a mistake like that to get 
through.

---
bod
