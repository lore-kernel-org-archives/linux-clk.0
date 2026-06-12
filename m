Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846237CD45
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781267763; cv=none; b=B3WGXPgsQHeUoJvB/FTf2U0Kpe3tvZljtnRFeensIrR7wAvGwpBTo55Yzh+V+w7WhAmk9JL4HaO7UAf+RKfNmKHrLkIr7B/+Qu5gAlrOnPIFMIuRIKOZSeXfD6fM/Xogcu7POoHgqj0Y92uctUNMgw6/PrtL4JSUicvygUKagAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781267763; c=relaxed/simple;
	bh=vD5qLfyk0vIHFZ/ccv/arbsN9b2IE5ZmgWlrJOudNf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsakzdW0Uv8I524RO1Y25t4qnXm7W+adGRQOOuTYbxg5Cc6jN/S4XDQmFTJrKSGKIfLY0OwCCFviNqoQKUaGhMzy08LV+9JQ615mDcboToAl1rBaJXY1PKYE08MRzikrZb6jLwhKBzkcbmSniPZbsgHERY+a1v+ky2721cjwhEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UruNWSys; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UruNWSys"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-396770b47eeso546591fa.0
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781267761; x=1781872561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK4UXsAg+++fA1AFGdqbhoeWfRkIvD32qkyOSrFCeU8=;
        b=UruNWSyso72GgRwUer/d0IA52/3FDaRa+oq9piPJsQ68nVSYkcwMrvn46DSAytoRIM
         gurvHitgdp24aLpDDlPHzN6oo9Cm2pSmfOMq95ByO8gH3VGAd33EPEPqamFiUR7wxgXs
         qTlSdxLIaqA4KaIdaGA8RMwdC4FrNFM1v+whZPs5ag2Ake0KgQVzSDVLY8KoA6ojkZHT
         WnjHhOn1c03yEJLgdmjeT7rLkYFpPTnQc+dcHyNJPfyOxvI3bCpW/zYLLp9ZpQEer7Yk
         Uwuqz5L1k8ITCxENu9qbBNEICa4B/vwKfnPgplOm17M+DoyM8nEHecqmjuzsm1anhJ0o
         n0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267761; x=1781872561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rK4UXsAg+++fA1AFGdqbhoeWfRkIvD32qkyOSrFCeU8=;
        b=VVltl1TKl9Xp91vXWTMpk2BuPydZsXkfPOuFzAVgEAAXdX2OftibKfK8ofK3+b/zHt
         98Oq/G4OBSUREoe2OVJoCvw0Fw2eaL1Y6hf05drNS0u+p6w3Cyx8bdOB7Dfmqvlq8+vL
         jD+t4cnvmtu+1uWIW/gld3nqumx0PWPLz+No27Ws4/SKqJxLDLJA4DoaZp0+vsHuK/bv
         sVP0DSE5ulR/WZwZ3hD5ehbGJkeYMw+ZZPIsnMkAYDorwhFxghwjJlshqp7KaziTmCXo
         u6k9g3CT95sUwR2MJo9s7yRCP9h/MDEs9CyK5gF4aJ9mrYY+vv0WeECBH8+o/GFsktDK
         eQhw==
X-Forwarded-Encrypted: i=1; AFNElJ+3KnBQ4VE/0HDsWdP9iLyhBG84rCEMj/rlBfSiD3Iq07BrizuZvlsxJ7fXHT/J5MvAmqPdOfg2u4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGCGKTXKiWGq2JXuwvHUHTp2sVdfmUU5rVDkD1drcKl/HsOPJ
	VUDKUCLKlgUgXCResg4GJU5l1Yirvns0yjukP9dL4KMUwxrAHaVXoywI60U54RGHJc0WAuXtK91
	TdjIPqPI=
X-Gm-Gg: Acq92OGQ3WMG8KSfglQmDS3jh5oQvE6W8ANdlR+UDKRc8IynmG2o4yU7YmsFwBkSrk+
	nnqlfd6caoMOcQM9MtvEMhrLICxByGAGf83xxRm3lvTa9ilJLm0GbybstMI5qYoezRSQj86wNfw
	RUzbg3FGv0cgwa6DE3uXQQi4aCrk1+wa4stQfFw2bNUSxHJqT4o89qz20Df8fshcvZ/bqOVPtMi
	Tg4dWR4OEGsjXCsKmWTh1W2z1iiXBGX1rtQpUNU2GG60pNDnaBiSQdflx3rTrWRnudlq++DkoXq
	O5cjTeulHgnumH62zdXMXzGI63mTnrxiYiodDEKqiuERyrNHMU7vdzhZZYq6mdJNOvRbyqzbJgB
	tzIK3QHFGFPHB6p7AbbDe2vVGJCZjnkXdCcprI4xhfiGhSMubGADA1OUWlbVesRXju/A3NSL4BM
	dC7mdrkDUglwxM/lSvMb+18RzVnldlz8kN7IKjfaKVGS+TdKmXLD+uS0B6NWSFOq5YR32RYWw9y
	T3a+1oX9+z/LnE2
X-Received: by 2002:a05:6512:3f18:b0:5aa:6a2b:d457 with SMTP id 2adb3069b0e04-5ad2db5ddbcmr403229e87.4.1781267760523;
        Fri, 12 Jun 2026 05:36:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7328sm509490e87.45.2026.06.12.05.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:35:59 -0700 (PDT)
Message-ID: <802246ec-a020-4d98-a50c-edbf89f2c24e@linaro.org>
Date: Fri, 12 Jun 2026 15:35:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-1-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-1-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm Glymur SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
