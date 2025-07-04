Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB82219E96A
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643420; cv=none; b=CKLp9x8LBNVTBtyKwjJnyH18fnlx2J1l4M4EClBHnyhe1bRZ58bXYEeZtkPc6rhmUUvuzP7/EjlTYi5ud+rzI5QxdwlBWfwcMg1Uv3s9DFyhuXm1QT5Go68DqZ71nzA/xKq80nE3lyz117258dFtRWZl5DugyR5d8XYDnXfXuPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643420; c=relaxed/simple;
	bh=Nd2ieUJ4/LjUfPGJsbtgPp6Vi4m3tStbkjvl5grTX08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9AT9fN8V86IQXsPyHbEuExl5e3ggl3BMXq7YyIrOnRF6PO2gxHje0VB6wwu9+eYCmlUe7oLz6YbHDsXFHwBVnI8+WFXGylzUwqdP/ew6KHzb4LZzZvu5sA2uGYZzaWNuTxM+h+MScE8bB0efc+WcrHIXmQ+dq4pGWdYt1gY9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hK2ZiIY6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK2ZiIY6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so736281f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643417; x=1752248217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=hK2ZiIY6Knsx9D8619FL2SHIy5Pf2DFkFggtLGWAtW6VJTwIAIyV8BtEsVuz3dDPUw
         +0DlCNkFgLi4cASKFkabVl0UULEKwFNAdA3mVge39BOee73aQw3PIHORFZx1mtN27FEW
         BJRBQ01bIIt34fYN5zvRxAFGnPaJRXpeRHviBgO+ofQsO2Y4o7iL9BsROWHsydmmVGi1
         ugXDqIamghDA5vbkDlyt++C5l+n+djR9lDZFs5DzsNXr1TYBD4w+ghXuaMnKHugHmENA
         QYqHxsiNcQWmXBOsl1lQm6Oof+WOdDQyIQG5u/gbE5w07yT9sPIFteOkOOf16RJzEvA7
         5seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643417; x=1752248217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=kgTwQYxY2a/5AED9lvqQeWe7ZODD5MnD49Si7a6UQ9hhLjSpQzKGIdDVHLzXH2iqT6
         ud++SOqulAp4vqszQWPpmTmPg79l2zcIdcl4j/62mlFOBQ5soh+xVAhEMC8qjHqLn58w
         NnDbOl7EH6yQVQkNkJwqdw44GMtXXD5zqNMpkvRtsEeehcs2tJcHFv9fwlBU++AToygE
         XmpK6Z3KlNjgH6a5a7cklNV6FiwrpnyX7F7n1uFPq42+4ktt4BB8y8vZ4DR6I1fbX1Ml
         27f+FgUTcUo8v37wWDBSOqlfLxdchvxINgpx7z2kWqCsav5EcQXbsQrP4cuiW0rSD437
         OnQw==
X-Forwarded-Encrypted: i=1; AJvYcCUiY/gZFHNZ1bv8xUHFGjTl1wSre5/Lt9pEJxgmq03/wBf3Njgs+WRBP+51Qjp4s/lwGfmfh/dZeR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0L7kkamlwiFMis2hE9Xwd9HawpNT4nQ5Btlr25/iTuKYVuZy
	6cJzOI28jsloUHQl1KyK5rw0ONjfhwXgSs2yUwCwXaOjXK937pPKSR+EC0hOaiUqhPk=
X-Gm-Gg: ASbGncuLrUkhZlPoLyAV65vm/DzVQ2kLxG8RyvGp+o4fRjHC410NSitxWuqAzbRSovN
	aF+oGfJeWyxrDCwTO7Sh6SY5k+32ibYZ/wNl4M+ZY627Yn12Qg/soJHWwQjv+sQaxjGNS5IvSuT
	dK7zxuSttzlP3+wvjnRWyPDtx7Pms4z4ekpHbICMbYM7SkeN9v2jDugh2ogPa3rhjMnGxGOKpq9
	39EWrpyhX1Us/coFTqorIdowgkhJWRaNQvNcpfYd0TU8a5cM2aU2YIopN2mV0+A0KJobwpJZpmC
	JA+X0dntxhNTjLBbwCTiCKaK8qlAZ5waNQsRKTbuEf2t7OqdnO0CC5t2bb+97ZFinp8cFxnMuCv
	jOXqYWdD/rxmkJ3sidU0uNp/rxIWz
X-Google-Smtp-Source: AGHT+IHqM7Iy80KErSccPJqKfwLxmIXwKCu2g56lGYo/d8Opt8xmrzRkqZI8qhJs2jylA3Gj/Xk/CQ==
X-Received: by 2002:a05:6000:2512:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3b4970195e6mr2519830f8f.21.1751643417073;
        Fri, 04 Jul 2025 08:36:57 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b501sm2788217f8f.14.2025.07.04.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:56 -0700 (PDT)
Message-ID: <ad0d5ff2-f112-471e-89aa-65cd229c52ff@linaro.org>
Date: Fri, 4 Jul 2025 16:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
> --- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> +++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> @@ -482,4 +482,6 @@
>   #define GCC_USB_1_PHY_BCR					85
>   #define GCC_USB_2_PHY_BCR					86
>   #define GCC_VIDEO_BCR						87
> +#define GCC_VIDEO_AXI0_CLK_ARES					88
> +#define GCC_VIDEO_AXI1_CLK_ARES					89
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
