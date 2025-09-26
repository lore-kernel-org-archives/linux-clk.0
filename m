Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110013BC0C
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758848157; cv=none; b=tFpICpqpzgWmdy5hpWZolUY2nOHPkhvBa6TnQAVEEYHFMzlg4MiXVmxNA9IhyIaq5AMjenyCStAESkgfvCXl8bEFqGlbd5ar24LZ5qmIvGCaWGuBU97KlIJ699qz1wrO1tJOUFq7O13aUza2zTM/nNkThXHGi+mxjTeoNK60EJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758848157; c=relaxed/simple;
	bh=Zz+6gqobKOIfFclgInpsZ9r34darF71LJ0ImvMuUGBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkCyyKgJFKCqNXE26JZJuu3QhBKQjU0DAWFaC4GNqY7Czs6ut8P7gQEHNGaUVMKnRcH04SfQ0qMS/U8tw1RgO2ft2upFs4z2g6wfXQCeqI+OLZorRmmT+0thRl/jb04nYzRaI2SixkwUV9ICyn6F642iIHkBAaSvZlxqZWh/JZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4fet/v3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4fet/v3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e30ef74b0so11114585e9.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758848154; x=1759452954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=i4fet/v3QYRRu+09AQnMSyRmE4cW+3ubMZqH2NXirzR5H8XxpSR78mutGfosjqrEF+
         oayskS+nHISj28uFMCooQR9FVr8affXte1Fn1hpwn5DkWHFxiJE22GA84zqzS4/obGGG
         JdIzSB6jtPq2rufEUumwlKwrlehs2uwxCCq6SJXu7lebNzNiD4X1jRRTCi4uMI14D8Qz
         unxehQ4Rb9V7wuAVbn3ZMPXjxgHejbf2Ts1LCsVF9xeNT3EX8hS81QVi5SZM+JijZWV4
         6gMHCXifnfrVYaDNxhsGTDuAQ3TTzAPiTAgxD052P3T416mpv8tshjDww4K/+LHotbr3
         AcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848154; x=1759452954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=JgY78SBWGCQY4/uTGOLxz0Go3O4P012S9H5hbQdGsH4b5Cxcko27ce2sG6Le0Cc/2H
         YPJnJ1nmECwle/0uPdny9kkypTVsbiXeHnKwDdtZKsyaRHbijB2Y02/rHzw9ihJwsm77
         YFW0jVxjM5/TjJzZ8sY2YwUC769/1GgB04KcW4G7BMLf4nw79I9Ej4bxbovG6AqoilIG
         VepznZY+fyJU9Yc1bJa6qhKBSbaPRFKNwoLIJ8dtupgITkk76T6j8PP5tj07UAh7apNS
         E5S13pUUyakDhJZ+//Adqjvk8I+gglvAuLppij+rEHH70fJlzDnznkwRn2orEzsR1Jd1
         XjYw==
X-Forwarded-Encrypted: i=1; AJvYcCWhVWwK+0vbtnyAn3mtkO8G/1GrxYbJjUc4xDnwbuClO1V9HrGrmDWnceTu9Yn4Lm5iRDYL5mW8T+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gjeE7eZiY+tiMlXVas30LTfHrHqEBW27TufKrGuX4NPdAME3
	3/52JJvtPftQ7AuvVuI+OBiYBs2ddcEUz9ajWFe4HIWAmVraljXV0UemuCGPxB1WeFo=
X-Gm-Gg: ASbGncuUxFzlEO9acgfJ/tF0a6FgeGnA/ig1FsNfSXklmV+zfu8pSfBDisO9GZLfjpr
	0msVWW6S8Qq3ZP611WesTnzJeZTx66kR4NNWPtLpccmsuCR2FnEo/VNCgFLiP0xpuBLA3Os/zWR
	Uq6xLjnUoAqXzWa9u5FEFOORLuEP2ewxPXeI5248c8rxn2jwiu7QNOtNasMpWWLUNoKFmUzlOkH
	BU3cfI5qjAy68ujq+iRpI2YrCtS1qtLw9Koz4L8e6HCWZxm3LevwfjxFWlHNKHXNqVoFvJabcOj
	4fCj9UiyJhuYALSf5A1JSrR+uRI9j7jpWMo5pYbf5oCVQq4JUT0f4SaCW+tnD76WerxCQT4GRmk
	Zu458C+OjtT+Ujgi1220TN5jSLkfFX0ch96/a7+G1UTUkTQq+hCcHNoGHHIJqmCT6nM4Dglt5KV
	1h33A0WCIolaoQ4Wp2iN58
X-Google-Smtp-Source: AGHT+IEi7fDGWCixHLoidioieRVuXJUMu0nnRncjPtslMOdDH/jitf97iTqziYXoLsGnOKsP4maIXg==
X-Received: by 2002:a05:600c:3551:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-46e32a10ef4mr59198215e9.30.1758848154080;
        Thu, 25 Sep 2025 17:55:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab62233sm97057095e9.21.2025.09.25.17.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 17:55:53 -0700 (PDT)
Message-ID: <f705e9b3-864d-46bf-a6b3-f3be4756293b@linaro.org>
Date: Fri, 26 Sep 2025 01:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> +	/*
> +	 *	Maximize ctl data download delay and enable memory redundancy:
> +	 *	MVS0A CFG3
> +	 *	MVS0 CFG3
> +	 *	MVS0 VPP1 CFG3
> +	 *	MVS0 VPP0 CFG3
> +	 *	MVS0C CFG3
> +	 */
> +	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
> +}

How ?

You're doing the right thing commenting on what is being done but, 
you're not providing any context on what that thing is done.

Write a set of unnamed bits ?

+#define ACCU_CFG_MASK GENMASK(25, 21)

It's only five of them, please name in your comment at least a give a 
clue as to what they do.

---
bod
