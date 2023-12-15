Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E502D033
	for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="EjeWhxIP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so3197785e9.0
        for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 04:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1702644047; x=1703248847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNtmiBWPHlC/LwlBwvLKuqfbmVBFPg3plNoHQEQoN/I=;
        b=EjeWhxIPKHywT//YuEL5Lg7iOE0UH6DdEDiEgpZRz3hJUclhYXTPrtTr8GMHKCkpIu
         wusvN+g4wOU+/lErCDHJaicm71rHwMruY2YwfWyzgF+JJ9TitSa2M/R4YjYrRaA8hBIm
         crJA3bDB9/p/aJNJt2aoaNBHT7U+pJNSwywckKckRdJ2G+FfgXloaVmkogd+rF6L8Oxo
         0FvgK2obeVvWqT6OgDKynNdLWi1jCU9idSxb2PyGeVFCyFbnUPc+sjpu1D9neDSMPk/H
         YPnWHsKRzKUC4Jtf/DhhEbiz2DhAFp0O64WwNzFoPAEXMKSc9HhIaV4RJ6NdCLXDwKwK
         EE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644047; x=1703248847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNtmiBWPHlC/LwlBwvLKuqfbmVBFPg3plNoHQEQoN/I=;
        b=FPYS6m6ollsW5QDcllkDkqLz91ChNvUD/YULsBFsYaovj3ukG8+d8frtLxh/LlA2v0
         TUrn/QMGrBuFw9jxON53sTuGSbvTxrDz6lCwtnF2Imvr5EJwMpG15upf8iqNch0/SX8I
         vFui8fA9T6KGPA0ZTI15lp34mPcOFxF50VVnat5+ZxOj9tJaebF5QrUTNMHyoaIeRSIH
         0od4n9MiSL/w/v0WjZsc+0T7Eu1JQZhOiSE29hcyeY2Ok8fVxwCQcBfvvd5GTH9llQvR
         63cpZgT+JGuhZG6FngfEqq6CJ+l1ZzxWIHKkZDnD0PFGMZVdVomdTi3uj6xasnUHARG+
         2mQw==
X-Gm-Message-State: AOJu0YwYh53R6Qd/UKLvhCPPPPoEzTLAFibZJjHYsE5YQJAP4gCy8kQS
	khHBEf8krFMlN5fq9mfLvIBjjw==
X-Google-Smtp-Source: AGHT+IGiN3j4Qb8EtMxTkG4LySvEND8uLeelHp6zvDnIHcQUdtmycW6VA3EM7ZimDrcWJ4hDHRkLlQ==
X-Received: by 2002:a05:600c:4511:b0:40c:2d0c:a3ca with SMTP id t17-20020a05600c451100b0040c2d0ca3camr6080783wmo.89.1702644047102;
        Fri, 15 Dec 2023 04:40:47 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm31774158wmb.9.2023.12.15.04.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 04:40:46 -0800 (PST)
Message-ID: <fc6f8e78-f704-4104-b3c5-bd10627c33b4@nexus-software.ie>
Date: Fri, 15 Dec 2023 12:40:45 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] clk: qcom: Add GPU clock driver for x1e80100
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-8-2b0739bebd27@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-8-2b0739bebd27@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/2023 16:49, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add Graphics Clock Controller (GPUCC) support for X1E80100 platform.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> +static struct platform_driver gpu_cc_x1e80100_driver = {
> +	.probe = gpu_cc_x1e80100_probe,
> +	.driver = {
> +		.name = "gpu_cc-x1e80100",

I think these underscores are very unnecessary and subtractive of meaning.

.name = "gpucc-x1e80100"

> +		.of_match_table = gpu_cc_x1e80100_match_table,
> +	},
> +};
> +module_platform_driver(gpu_cc_x1e80100_driver);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC x1e80100 Driver");

"QTI GPU Clock Controller Driver"

---
bod
