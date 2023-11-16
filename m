Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TT3WIvoX"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D67D4D
	for <linux-clk@vger.kernel.org>; Thu, 16 Nov 2023 07:01:58 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507973f3b65so1283901e87.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Nov 2023 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146916; x=1700751716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxqVH86X4cuXfvt9WZn0ecdmtgufJGOQ8mS6FlCKTTg=;
        b=TT3WIvoXl8t285/yu51geQxnaBFYUWy4rblGHXf271XRY+dn5okGopwRi1PeOF5V1G
         aqyuoS2szYDu/LvI20MKoLvrUtUK2sZzBIseA1U/C29nL1Tpn1pElR2gPrDAfuoKJtdc
         w/4RhrT/lV7b9nGcxP6Xzkc7Vhw7dTrnkVMZkMvcdPPJjm7Ah6r09L0yHaGrBxtWBmAr
         vftGr75080x3uW2Izb/oeNYz66B6No4NiE9vaLLI7oSSYNfA+EQSsB005iGlzbOBQUaW
         AAzewtRBjdi1A7jxQY9BRwZxpCvzvNdWkX7vGqZHjZZ9j9flItF/EGCkqCnq8QraspFl
         rbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146916; x=1700751716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxqVH86X4cuXfvt9WZn0ecdmtgufJGOQ8mS6FlCKTTg=;
        b=oET9Ubz5iDMk+0AQ7nx9uIaObKKxZWy9V1gPaDVpsIXJFmZaxBPw+vPwG7jqmx3MHn
         hJGYtuxIUwEZjTCmJ5/nDIN6hbofIkpWrpYN8Pv2/R2or2WODdaaYmeHEHrR4LFIWHG+
         a7JyDctIMbTHAYOvy7x65kKsKyE9KISEHPt2OmoKRPh8MjWvYYLMqafAi5aySGeYo6kk
         45/zHXIxfKoVY4ZWdlRMZtgAbsw3UN1mqjnm+2E/IBNkDuEhzyTYrhd+6wXt1qslVegy
         I4W1YtQNaBhd+kG84cxbkgD7ul2+45T2/UtHkhMRw38nFZ9XdhRkZhwwmdoRR2jkmk3A
         5mqA==
X-Gm-Message-State: AOJu0YzvHAnwEkQahQP2pBXkrvdO+/sXvYi9w/g4obAh9MjOIrFJlEDv
	/D+5WI5DliVolMf4A8MT11Gkgg==
X-Google-Smtp-Source: AGHT+IE7vexAqvYBpf5qKBNAy2mXPg26r4KlHbQTKyhkH8y2DOhxq89FAIPla6UrhtxGpzhE1S6ZbQ==
X-Received: by 2002:ac2:4426:0:b0:509:fc7:8853 with SMTP id w6-20020ac24426000000b005090fc78853mr10278293lfl.12.1700146916542;
        Thu, 16 Nov 2023 07:01:56 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i7-20020a0565123e0700b00509471d41besm18062lfv.211.2023.11.16.07.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:01:55 -0800 (PST)
Message-ID: <e8dc01a1-f3fd-4c23-9607-62a199b6a2bb@linaro.org>
Date: Thu, 16 Nov 2023 16:01:53 +0100
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
To: Imran Shaik <quic_imrashai@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231106103027.3988871-1-quic_imrashai@quicinc.com>
 <20231106103027.3988871-4-quic_imrashai@quicinc.com>
 <CAA8EJpoGLCfrWQ5r8cOcqyWmF2ZTTqPxFy_HVzPC-A-dCiV48A@mail.gmail.com>
 <8a1ce949-204a-1c22-c554-67b31379eb7c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8a1ce949-204a-1c22-c554-67b31379eb7c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/10/23 09:34, Imran Shaik wrote:
> 
> 
> On 11/6/2023 6:34 PM, Dmitry Baryshkov wrote:
>> On Mon, 6 Nov 2023 at 12:32, Imran Shaik <quic_imrashai@quicinc.com> wrote:
>>>
>>> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 SoCs.
>>
>> After reading this series I have one main question. What is ECPRI?
>> You've never expanded this acronym.
>>
> 
> This is a clock controller for eCPRI Specification V2.0 Common Public Radio Interface.
This should be under description: in bindings

Konrad
