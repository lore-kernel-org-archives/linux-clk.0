Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcRQS4J4"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4BED50
	for <linux-clk@vger.kernel.org>; Thu, 16 Nov 2023 07:05:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507a5f2193bso980046e87.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Nov 2023 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700147118; x=1700751918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8ztruwTEzNqGhDwNxN4hXW3N9Yo9g8CNvr+Y4z6O+k=;
        b=wcRQS4J4mXukG+NgrAqu3gF/dCLAXWRVykRjT3a0vq1Sue6ye9VEl0prJmlZJJpdTy
         mHuHhgNXGJ2mtGRgLehALAP/oD4o+IkjSXlGz0GRPK+EiZdfkcRlLEcRU+4d1Exg6zU9
         y+1zvxEaJi6GaLeLCgXmOIV71yldeG37P/6Sc+mWxBycBwYKUrKGB/SiSxDNQ/ukVLVI
         1/yj0I3/FTFLzV4MuWFmSCIZJM0u9lS8QW89LKGhn5mrC416nsqNEUfxdPipgjTnMpB+
         qqESvOV/Y5jdfUyrFCxBYwg7MlfZ5H9NO7lAZ42avXUoGjj+AwWGDwfprM2pphOA9fYP
         jvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147118; x=1700751918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8ztruwTEzNqGhDwNxN4hXW3N9Yo9g8CNvr+Y4z6O+k=;
        b=BuSpFwrFuzc/Tgiek05BssJl3xvS45P8SFcEqEi9PzOhi2EPaXMGqFoIv4DWzWS0PK
         s3x6y4IyBbWDpvRUD1oxdP3sNNL0YaoGzCi27XnxDPk6a5SzPQCqCuvNM43IIfT2vsMn
         rZPZO298yaBlqzULCDputAOXRqfflZYnez7yAjlXq7cmLiXHVBDu9MHg13Lc59Ohw6E4
         NpZir2pi1d+cJkIkIz0Q0dE8fkS9M814YFUzmT0jXt+RETj4Q58VBTc1V9iw2WjdjKBn
         A28kewQ7Dem0NVYHcGUbAg2KYCNi/CqNFh2iD5WZWZVEr0nAGL2VEd/6j09AdonK8K3L
         /0zQ==
X-Gm-Message-State: AOJu0YzrC33qVEbVX8TCCNjh7CgpKxxfpULiAU1f2XJ/Z/OARUIzaj7j
	8hY82+9d/FrVP5l0Cv3CHq2NWg==
X-Google-Smtp-Source: AGHT+IGgtkvKHvRCkcC8IvrfG4Jr4Gtm0TsvyhM0PmD5yiJB/6F8c0YaysiX6wR5ayIUsM/MoVqACg==
X-Received: by 2002:ac2:4117:0:b0:501:b929:48af with SMTP id b23-20020ac24117000000b00501b92948afmr780178lfi.34.1700147118541;
        Thu, 16 Nov 2023 07:05:18 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b13-20020ac247ed000000b0050a3e7e718dsm19556lfp.189.2023.11.16.07.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:05:18 -0800 (PST)
Message-ID: <0f618da5-e742-4c0c-908c-1d37ff90a3ba@linaro.org>
Date: Thu, 16 Nov 2023 16:05:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] clk: qcom: Add ECPRICC driver support for QDU1000
 and QRU1000
Content-Language: en-US
To: Imran Shaik <quic_imrashai@quicinc.com>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231106103027.3988871-1-quic_imrashai@quicinc.com>
 <20231106103027.3988871-4-quic_imrashai@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231106103027.3988871-4-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/6/23 11:30, Imran Shaik wrote:
> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
[...]

> +/* 700 MHz configuration */
> +static struct alpha_pll_config ecpri_cc_pll0_config = {
const

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
