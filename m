Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcIvQlFH"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFCD1BC6
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 08:31:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507adc3381cso9103835e87.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 08:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700670703; x=1701275503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcqAwLBMHhKbnOXIvbwhk3murLO6VoRY+tmVMJbtNr4=;
        b=BcIvQlFHZdiaBp41gYdVyAoB6H1w64isIswb9Yb3ht1EZg6t3HW/aUea0Fkr6njjhw
         DwGvLRVUd1dsH47R6Ov07uHVLUFUeWCcrlmGOfXxibbQYO0Cmjcdx8NF74Ogmud6Ifff
         n2Z3VM1Qomriq1a9+nfKXxnk+A4nhV+lMaW8PZQXqfcPvgSNllGUGY3SiyVa2I2Y7Qo2
         sMTXA+2SGXaon9hswalDFSgUFXDQH+HEepLF5qdxYNEbbrR/frznr8XTAk9CvDR+Bkn0
         1U/cof6qx4HAWO7rN7Wmz7gciQDfpyLcGWxd9kNwFJg2SE4UMZ8MLz/Ij3myTFRgZkaM
         J8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670703; x=1701275503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcqAwLBMHhKbnOXIvbwhk3murLO6VoRY+tmVMJbtNr4=;
        b=NMQdyibpeYwiiYyVT1tcOSZQdx0TXRN8gQ8DaRVtmtmGYmOtVMObp1HaJ6mgEqPIFJ
         2kI4emDg4j+umZPv8AFD+pLmQBat5JYkmqtGprMFCe0zPPWQEUakDN947McQvW3nDQ32
         fno71x/yC1PpQCzzqPnHJk7peWbuk2+O4L/axq/BK7WOxeT1flJnxMr+TDKlldQ4qwzx
         gna05z7qMXa9DAiA7iJBeRYHyRkScAnGeD8oreb8cbZr5m5wiMrnMK9tXXShblamFxLG
         /Kkwnv9QFO7Pmab5aUS7U57oUh9FvZEvj/30qjy2N+LVn7GBFomkRw16cCzswKwrxdF3
         uAYQ==
X-Gm-Message-State: AOJu0YxlYV0OsutInnpgOUjEmY3N/QbMezZDgAhFUEVA4LRQFtIumQUa
	GJhNUIRu2D3kvwpQE2ofOyiJSg==
X-Google-Smtp-Source: AGHT+IGuzRySC9GW+hhmPSqezL7u+4165dM0VrY/tM74yR1+spUW69ro9qbJ5M3BqQGA+HXaHLzNpA==
X-Received: by 2002:a05:6512:6cf:b0:507:a6a5:a87b with SMTP id u15-20020a05651206cf00b00507a6a5a87bmr2466750lff.51.1700670702937;
        Wed, 22 Nov 2023 08:31:42 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k7-20020a05651210c700b0050a6fd7ec34sm1886640lfg.191.2023.11.22.08.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:31:42 -0800 (PST)
Message-ID: <d0620c39-9c27-4f25-a160-0e21330448bf@linaro.org>
Date: Wed, 22 Nov 2023 17:31:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] clk: qcom: ipq5332: add const qualifier to the
 clk_init_data structure
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-1-a7ff61beab72@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-ipq5332-nsscc-v2-1-a7ff61beab72@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 15:30, Kathiravan Thirumoorthy wrote:
> There are few places where clk_init_data structure doesn't carry the const
> qualifier. Let's add the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
