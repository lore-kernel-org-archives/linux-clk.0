Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77742253B0
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494185; cv=none; b=WeSaFPrI+JT0ej6+pjdYdXnzrroApaO+o3m24OSPkc3BcmVQ2PyeS9GfgROE4MYFEGYLkD9VaHAikhofrDuodv+HC+LRAtZoVw9LIBB4mn4vCCm6VQCIyLdYapUG3Kf4XVl1IxMgHcNnk7i4RHUKZV5DSKuMxX826aDOjbqdmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494185; c=relaxed/simple;
	bh=73VMJJMB6i8oFzFknLVb9MdE7m/1cEhj6Q3/0RdUoh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj1op4Lur2/KMb3+f91pqUiH9eVt9HKKC7U3HgrtFPhCgo4TYFhGFLZb1/kaaEIqUrS0L3LKRyYnnOCQrcyImVd1c0MTltHQVZm/oaONFfZoUrqeSRZumbMROPDgoba0j8cByaAUIOBB7LdvP6lrW81AXPWb1ieWyqPeLWL75DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hECWH0BD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hECWH0BD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso598884f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745494181; x=1746098981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrtsDrUlmX7+CYrZdAD+RGxT3LfUayvvHtZlEV2ANSk=;
        b=hECWH0BDWb4pdIyjOWaRXgN3nkc8Mp4FQbkC1YLz0caL4nZ5NSHEzAEiLyHW3sqCTL
         6f6QbltY/qjl4mXjgABi9ziDAdFivNy4IoWKHIDwtSn2HxK7MJ9LS/6CLJSq3QAQRSKK
         f1VomrxdR/ukSg9CK8DEc9t4oZlJAD1qSadjggH40pJeNS8i8Qd8FDqdmK8wfSaRoBYy
         m0cF2mEck3x6ZxTDCiNBRZOL5UtOYezQg6O3iBufZ/UgqNqqKP0gThP3YMzTaYwDl1Iy
         OyHMa2JgMhBYTpnLmyH9KWyckXGiqUc5YMBEon7XrNn8bJptzVMMDyGOul0wqKh6g5zF
         AW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494181; x=1746098981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrtsDrUlmX7+CYrZdAD+RGxT3LfUayvvHtZlEV2ANSk=;
        b=selWDrQNgbSwdne8AUcEocGaJtZpJXRFmSKZsH+PQyHQe/REKREsfcVSuB6HsjFHp9
         +fGfbDIpjQ3UOk4wbLzmEfaPGWwJ27+qwXSVUgFvwe3Nofcu547Qw21X4awWLk2l+PTY
         +ruiizfRl4jDU/s/PU8xMtQszchpL4GdnpSXzfEINuCwtGAK8rPoiAvDg/kaF0IDYsX+
         YsVp8rDfH9BxHIb3q1S+KZNCyEguUcKOpaf4dKLf4YqsJUzeblpSjRMOVbcbcgW05rZs
         YldlHWb1DSIGIbbbNlHMt/ZO9DgW8A8Qf7QAO0kE4aC8z5teJ8dUQPEjkNrLtMaql7r+
         AxjA==
X-Forwarded-Encrypted: i=1; AJvYcCVPgr80NXZLwr3EUEOAy1DweILtUEHL1ijqhUyCjHwMIc+/sGNgMRHs99ATU4TKmtuqvfHVeGNaUY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjiYYWhpbyHcIy7sp+MG44hyvnJemaWpmRQ8oZAFDkOIOS9PO9
	x3pSySQcbGZQF/sxkXXzld4lY+G12QpBGqVsM0TV5gZlqKLohwlsZGl2XeBz+TA=
X-Gm-Gg: ASbGncsoHPjS/cJXJd1wpRZGeZp41Xu2WbKcCrMQdihs6Hz2Z4XE+d0zP2fCJ2brf4t
	s9ixig0+/0krvlAQc6LvATcwpBBHFmKec2JqYaAMfBxBgzV4xyPLQd6oDtkE+w5930BaYiqatre
	XbbgWkmIRc5+wPFk/LQKVKSLM3rJLJriPlXEyLopNksJ628aLoPQaVap2VhF5TrkX4csw8TT0YN
	fvUWC9hELRu/y21T0AsoOo3/1+NkiJWhnSJxKk0uwS8SUdtBpoRHAwdpWyFReWwild5RMmeDXmm
	HFNnxY08BUHL4/QAK3KN0Q1C1J9nYgBHpQA34pV4nXXHvhviL9+OKAh0Lz8P6dmHINHRHfUBWUW
	AmW8dKw==
X-Google-Smtp-Source: AGHT+IG8y1FTZe1dgMPfnhNIz1U2o0nx+jVk2Oo5YgUgntxJOGG4Efw53H1Ek38xA6mQECpCwY9DVA==
X-Received: by 2002:a5d:47aa:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-3a06cf62a35mr1844165f8f.34.1745494181044;
        Thu, 24 Apr 2025 04:29:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8003sm1778095f8f.1.2025.04.24.04.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:29:40 -0700 (PDT)
Message-ID: <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
Date: Thu, 24 Apr 2025 12:29:39 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:45, Dmitry Baryshkov wrote:
>> Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
>> the power-domains used by these PHYs.
> This won't be consistent with other cases where we have a shared power
> pin. For example, for PMICs we provide supply names which match pin
> names rather than one-supply-per-LDO.

Yes but taking a random example from a PMIC vdd-l2-l13-l14-supply is 
specific to a given PMIC, so you need to name it specifically wrt its 
PMIC pin-name whereas csiphyX-1p2 is there for every CSIPHY we have.

For example on qcom2290 there's a shared power-pin for 
VDD_A_CAMSS_PLL_1P8 but then individual power-pins for VDD_A_CSI_0_1P2 
and VDD_A_CSI_1_1P2.

If we follow the general proposal of

vdd-csiphyX-1p2-supply
vdd-csiphyX-0p9-supply

in the yaml, then whether SoCs like qcm2290 share 1p8 or SoCs like 
sm8650, sm8450, x1e have individual 1p8 pins is up to the dtsi to decide.

---
bod
