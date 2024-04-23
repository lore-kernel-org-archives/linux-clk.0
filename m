Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F2134CC8
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878214; cv=none; b=dpjSQ7Qzk/6d+srwzUyjcNIEynbpTVGbCHZjSxCwclzQ2YTPDF3V1pj97k2Tl7JUpIAhfiDZP6MPqUZLc/A6q34c/C2vS2d3peBXMQqGYeLC32qs8s9Z9OvYtknf0zxVFBAE1ce0CYb4npkxfalbSXs6Rp6MloAgkkZBHBRekJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878214; c=relaxed/simple;
	bh=XAVttJrkxUXMxx1BF5xnYl48bRp078HmOGhTRY1qx4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h40Yq6eZYkMbU0Vtetip2Wcy/RpNvXMcuDCBittGAahIxtFARSlO+tvCojbINfzNeOCCI0QghRQjrWkCuCPQJxR8xJMwcfSztS7PPG/dwKMGgj46kKObw7bKUeuEXLSj/LnodTee0YRGubpOE0NzCI+/KAp6+zKMxUQcNi1QDsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQV6prug; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQV6prug"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518931f8d23so6042488e87.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878209; x=1714483009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMWtbHjpN+6vPPgUXI9KbcFajZT36z9cmb9PNAZ6H5w=;
        b=YQV6prugWwakNyX0P2kLyUni5HmS8JEMfGr/ZEgED84l9dHG6SE0iw9BaYoN5gvMPy
         AVLBD4yJPSZDiJCuASkv4e1lFUfobBNTssmo3xk9v4x1MXs5i9pM7xOfm745pBYpSRVo
         DS0HORS43FFUMnpEpTeOmdgiiWCCZseah/DLs8qrQxCscvHr5wl/xNfe4hX0GgopdsE7
         LFSSDEjY0oYl3NiVL5ANcUYmdnphoKVmSNGxr2hhZfq8CY5TQQZ1kiJwIoQ+D/hMAA/y
         LsDCdAqoTQ0S2UGTOA/umyacnOvE27w5k5pJH3bhQ4191/J8wmrlfMO7uN8KSq290WnI
         SE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878209; x=1714483009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMWtbHjpN+6vPPgUXI9KbcFajZT36z9cmb9PNAZ6H5w=;
        b=xKogsymlv0KlJfHj4SZftkMA+p/tmcp1rcYwa88fxtwqCS0UrchuduqpRDbV/UxzwN
         BFwhDHVmIiQ0nQBo91GugJxqK7+CDhwg1E5PP4gQ/4X3Qpbz0EyP/3sirl9LZSx4Vxqk
         xT/MwwtZ6XTiEr7Zk4TJh//jzmkApAhhAsW0b4JspAwn+rdJakIQkcVcLuRpor83LVc/
         xLj1J3BZ+CnuvvTIyGjCMZgd/qImvLyEij9N6oPYtrzYwUzAbv6QeKwqpX4loqHpAxJm
         ChikGbuzpQGBegZsJnZxHLFEAD1r8OPbrGds/+x0drxTh6L/esh6oLx4kkbvb/EEl0ln
         F0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCW2SxXTPZqIr+si1J5Gb0lfINX3u8C1EEGWkwYQcyvbBEvj8rAwwCBLdc4uxe9sFvWAT+uOC0DQMOgqgUiGiDEiFlRQAsNF8YmA
X-Gm-Message-State: AOJu0Yxyon5NqhPAHvQcDJ+k7+FEVOA3D6+KpF0Bu6RJwQcjFrBfeAXo
	hV1vCwjOcZNN0xTZWEnt1U6AGr9/jN8XpmvWg7AX9s7yBpvq7MK2x57XscTUIjA=
X-Google-Smtp-Source: AGHT+IEr5p9XYFifKIHg1KYFMVgeDTuQ3LuiP76t57uicBpeoVWKn13GAiIhoZI4BzZM82b/tsOF/w==
X-Received: by 2002:a05:6512:4809:b0:518:d4c3:4682 with SMTP id eo9-20020a056512480900b00518d4c34682mr7939643lfb.24.1713878209307;
        Tue, 23 Apr 2024 06:16:49 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b0051ba2fb069dsm177648lfu.37.2024.04.23.06.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:16:48 -0700 (PDT)
Message-ID: <f75bdc44-e57d-4404-b976-0bd9e6a0c5ab@linaro.org>
Date: Tue, 23 Apr 2024 15:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Update the
 LPASS audio node
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-9-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240318053555.20405-9-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/18/24 06:35, Taniya Das wrote:
> Update the lpassaudio node to support the new compatible.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 97824c769ba3..dc7edea7f7c8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: BSD-3-Clause
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
>   /dts-v1/;
> @@ -430,6 +430,11 @@
>   			   <GCC_WPSS_RSCP_CLK>;
>   };
> 
> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;

I've already commented on this the last time somebody tried to shoehorn
this "solution" in..

Konrad

https://lore.kernel.org/linux-arm-msm/20230616103534.4031331-1-quic_mohs@quicinc.com/
