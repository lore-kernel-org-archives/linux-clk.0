Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pb1C1hJS"
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926FD10E4
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 13:45:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1a2615e909so149166466b.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 13:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701467129; x=1702071929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yln3CV2ycfuQHetU75G2NmPx+NUrR3PyzdS1+LL06DU=;
        b=pb1C1hJSyPA4oMvkoFACQt9ZWDK+lcmGh/xLfmekUQdd+VYOd69RLgNQ0kP0+qJCOS
         zgxrxKPe87a4PJ02JFMSrL0/tz/MR77knLm3xgjZd+T2d+mlvFuJGSXfPOI0PB6E2a4B
         wmHsQQVVYyzgSNly4YSygPYYdEnxnaZ15uHLsRcXksMPeS9yQ1PTfh3tYStkIZzJryE9
         SnY3gjKxbOoB5vrIa4ZjlQn4XaXSeJ19ehcQqyM8l3TnlTu6d1ZtE95uuggydWle9x2X
         46s95JVymTPuvtfv48CRiCigDSKEAFwEi+MOsogxiv6xbf5KIPBx7GY32oKgJv9qc1RP
         jz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701467129; x=1702071929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yln3CV2ycfuQHetU75G2NmPx+NUrR3PyzdS1+LL06DU=;
        b=HwQIqYClqG4fCLPdcCo0h/gjphkhSQsDmyfYsIxXUUbvaFl0+hETABsxRFmWhVxMY/
         cqsJwNJwA+QwfKP7HHejleMiXn3c6+WdD1t3Kc6nMtNr9WBDWfb978MN4oSJ73yFI2dR
         0JSqW7cGFSovO3V6x1yKrHk9sHLUOlfQ3fZefrWYhUDXLMd+hDhOLAZpzPNh9r7gQpFL
         06+M+9eicu3kINg1i5q0NcQRZoTWooF5SRERycLpAXA24gjQHp1lV3LngrmXsJXqBmcM
         nhGCLz2y+B0vpxMJbWXMWdXabmWGYeoaXduYwOUJG8zEBnxXDOTGRVbbzBQ80Y7Mwmdz
         yxpw==
X-Gm-Message-State: AOJu0YwjKmoEAl/CRerNrYFYnkDGSEG5zaeW1/xYoLQYsNnz/RRcB9LU
	4DXABELy/E3wLwYlXHu/gRbC+g==
X-Google-Smtp-Source: AGHT+IEDm1KetQPt0xWlENFZrj2+NfKtXAZRKZRssgkHJbwQXWiEJmDrHQfttG64Nhmy4ekTO5I50Q==
X-Received: by 2002:a17:906:cb87:b0:a19:a19b:4229 with SMTP id mf7-20020a170906cb8700b00a19a19b4229mr836882ejb.148.1701467128690;
        Fri, 01 Dec 2023 13:45:28 -0800 (PST)
Received: from [192.168.209.83] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709062b0700b009fc8f309183sm2339415ejg.51.2023.12.01.13.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 13:45:28 -0800 (PST)
Message-ID: <ea16bc85-f16a-4b0b-8574-9d356fd60bda@linaro.org>
Date: Fri, 1 Dec 2023 22:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: videocc-sm8150: Add missing PLL config
 property
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
 <20231201-videocc-8150-v3-3-56bec3a5e443@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231201-videocc-8150-v3-3-56bec3a5e443@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.12.2023 10:50, Satya Priya Kakitapalli wrote:
> When the driver was ported upstream, PLL test_ctl_hi1 register value
> was omitted. Add it to ensure the PLLs are fully configured.
> 
> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
