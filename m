Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7C2FB965
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526484; cv=none; b=BbFqEYWWuZPPT0PifYNeZdKcFchv19BwKsqd/6Juqu9T3+mYL+RGNezvXnWxRwumBxrpvLDyC3PD+UoqcZf05T4NsKvAd8kdm9pVo/AiHkDzVdMwlNjLT/stcssvAkAh//FAsnkdSaFXCpPP3rdm4Kx6jtRG7H+/q7UhkmIeMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526484; c=relaxed/simple;
	bh=TPzN5DMU8T/18hixWg+6FbE+3zhkzJJf8xccVhqSMfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKrrzi5SmhTzB/NWZdGWIDC8cRdnVEItP+nOVSdp0M1SgARx1jt1QaTKo/Qrzei3MLah3vTJk87lO7iOfNr0YDuABcE8vRHmBvT0SL8DwpH1LZ0lpywxfEXxK4FYQTbwdtIjI8oec28rP1q4HQoIcdbdCnvdSNDd9xCk3o2OojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2sPNMUH; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2sPNMUH"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7b248750279so15155287b3.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776526480; x=1777131280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=e2sPNMUHwQKNFxBRt9bexCJ7KiZUbIjPEp2KZ0QTgLwoeUhdJAZDtlQ3wqLmm9ftq4
         9AYQRdBbeOKzg2VMOaxw4iNCTkrADpJAY16VodX/oxhSX1kyXVRpTXSxPAUd5BCPhuJg
         sAH8Ee24NG+6UJyXveWJywzJiyz22ktRBQsD98lLstJ1+yTdVXMZYuXRpHA++lp8mdK1
         TfcziVZqgAtU7Jd57bx46JWaW3FQxYl8LG6ywgiI+EN1jyzQAaaS2GQ4BHFxESFoLElc
         yaQiSwCXP/cqy3qlRAktz3Q+CuOx/uvso2i/HPRkQ8yh/a2auhOegn6U9ENP+FLKOvDQ
         GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776526480; x=1777131280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=AJq/pEIOH7pSXJ8pYWmlhsLVANpJRiLQt4NEeKY2zOHO6gm499PTsh4XYYpQ5BXVO8
         bJW7xa2k18qxKrPDFMjbtHid+972/BUOt9u13N6iTP9g3UjZN/8t/AvccEGXWEbtaqqT
         bo1mG6NoDpJhdvHeA0p3Q8irzhVnQh84yFjirVyS3qJXQMaIhnvgvTLEyfV5QMJSPwSr
         +wXx8v2PdBRRJuFgG+O70PLJ0JYR0lFcWHgQS/e6flWvG8OfZ2qC9WYEpfIjgodqEkSP
         KNaLBVsvd239FQ4CoToUQf5J135uOLHr3qca3aLR2Tkvdrd8milr5fX9oTc0D7y0xIn9
         VpZA==
X-Forwarded-Encrypted: i=1; AFNElJ/XE514OMuWLt7PquwOcycoyyNpsmhxOGtOOaLM/Np2xi05YKq4PVR2DQrNT+W+BYVajehqTz6C5Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TTE0f//RqpyDKhEu3YwO3EwGiDwNeZiObpFflz25sClR39H4
	UsB3cQSg1qROnG6T85Ezz8AojmvHkTf+d8l8gQx8cJsv4FftffZuC2tp
X-Gm-Gg: AeBDievCvHbt3dOGI18YfClajer/ZXVAhyfBPnkP7jn1P2eTspLvTKmVM2eNugLnK01
	AJF3M2ZQwpgBt9XfPnYYnCIOXdaBTZ++6zOsJsTrMxWrt9lV3DkYFZkn249hcH8nfHVCufJVl4s
	oBOYTveQr3iwMPss4wSnEZ0z1LDaT3UvD/UkMusGrevi0KKsEieFoW1l6CWnO0KaBPWdr5iiaqo
	9eZToGPDFhb9Fh35ApaivqGIraf7B0SRwIe+V3R81ISMu0nLB5XkYUsnIzV3MtfvJav33IgKrSk
	hT+aa2AaUcBMl91uB5U3J1Q4ven2bwyPkNcYIMiTrJkM/c2uDmrNSDDrtvRn9SLDQ3EcFiFfphk
	HhVXPp6B2Fvb/K+s9xfqMlPOlKnm10rDMOF4qaEqVcTogErhcasBaL9Yn6oEllqL5xH18Cshht+
	n/1VNByjBS7T2fZV7gAxrJufHSe8lGKJFaad/+
X-Received: by 2002:a05:690c:e3cb:b0:7b2:9347:7be1 with SMTP id 00721157ae682-7b9ecf86543mr73129417b3.29.1776526480099;
        Sat, 18 Apr 2026 08:34:40 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm20380427b3.6.2026.04.18.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 08:34:39 -0700 (PDT)
Message-ID: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Date: Sat, 18 Apr 2026 18:34:33 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
> 
> This doesn't make sense.
> 
> You have two cores => assign one to encoder and the other to decoder.
> 

This way during decode only one of the cores gets powered up instead of
both, resulting in power collapse fails.
Core clocks and power domains can be moved into Venus node instead of
sub-nodes, like this:
venus: video-codec@1d00000 {
	compatible = "qcom,msm8939-venus";
	reg = <0x01d00000 0xff000>;
	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_AHB_CLK>,
		 <&gcc GCC_VENUS0_AXI_CLK>,
		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
	clock-names = "core",
		      "iface",
		      "bus",
		      "core0",
		      "core1";
	power-domains = <&gcc VENUS_GDSC>,
			<&gcc VENUS_C0RE0_GDSC>,
			<&gcc VENUS_CORE1_GDSC>;
	power-domain-names = "venus", "core0", "core1";
};

And then they can be powered up regardless if the session is for
encoding or decoding.
My first question was actually about this - whether these cores should
be powered up only decoding or for encoding as well. Bus configs
downstream signify they are only for decoding:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
Unfortunately, I couldn't test encoding on my device. It appears to be
broken.
