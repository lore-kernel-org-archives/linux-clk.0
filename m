Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE82DB66
	for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKRRPT+e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c2308faedso7141045e9.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702643885; x=1703248685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsXmPIAmJl60XYRsMDSLfbrKydUJT24PwhIFCDJUrBM=;
        b=sKRRPT+ebjBOmZ8vzfuyi8AjPStVXjOHsM3CkR8AFc4Tet5py47NCGi6qZYyZIog3C
         cmdQKtTLKiPJpx6/Er6IItlVAIWDn6zS9oTb5sNV9zfTCTFn6fuJ06l/KPGXw2FIPfOD
         8BVsJgOHr13cknpKnXAXuG9rYnNBwudKjtptYaitsxgoyd+FQhOfDp5pX5k6WjuY+bmD
         IuNnHE1B4g8ng4ed+HpvForAKQ/lrbG32l8hyFjVPfGs20V9w5Nz2GxAIAlEsh/IWGAa
         1mq8NWnbSlYw3z86MT3fP1dHmhiXsnahsq8y4moW7hByFyBmhruTbu8JvynXOvFFfTHW
         lTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702643885; x=1703248685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsXmPIAmJl60XYRsMDSLfbrKydUJT24PwhIFCDJUrBM=;
        b=p1zqj1w6l+kLhu8LRrgxt7zlmfiC76+1GSlvzmPE2UTzX+XgOn59ANcYnMK0lGvrsf
         Zv6+8LRSRks5bWF++iht5QJAH4V4vDNyh9/FFrV1pvqTAiDdwf0ejjW9UT5cveR2DXj6
         JEyLrWIJbggWQRO7txvR7Cxtt3z3BwlFhIRTkQ3kuAY4vsyIOfckc7KRSVvAR8ScKKoe
         QSBmTay+TEUB3r49rz3WYxCREv+CZbIqFzBdMW402TJXwc8+wq2vhMoOqCghA26RNMsw
         4zioLZ/VdhNINo1zuJ5oDXuyS0d+plA7ZURftCds8o+Vly9XkpDGqE46fRXP7jHvRNV4
         iSmw==
X-Gm-Message-State: AOJu0Yx/ZGPAtcMc6cZlL+Wd5XZTFM4rQLJosTaofz11qmW6mZwj04oP
	KDWbAmGrxbK/VjTiKz0p7eiw9A==
X-Google-Smtp-Source: AGHT+IHBxBMgBiBWpwXzUIkpbdwQ+qcVVdthMh7pL80QCiPqI0Z2+8i9M1xYjMIM103e8Rksoud9LA==
X-Received: by 2002:a05:600c:2804:b0:40c:3eab:d987 with SMTP id m4-20020a05600c280400b0040c3eabd987mr5514403wmb.125.1702643884813;
        Fri, 15 Dec 2023 04:38:04 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040c11fbe581sm28680591wmq.27.2023.12.15.04.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 04:38:04 -0800 (PST)
Message-ID: <bf4abdf4-a61c-422c-8042-69a53e62dff4@linaro.org>
Date: Fri, 15 Dec 2023 12:38:03 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
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
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/2023 16:49, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add the camcc clock driver for x1e80100
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


> ---
		.name = "cam_cc-x1e80100",

This is some very akward naming here.

"camcc-x1e80100"

Same comment with the defines not "CAM_CC_THING" just "CAMCC_THING"

With those two nits fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


> +		.of_match_table = cam_cc_x1e80100_match_table,
> +	},
> +};
> +
> +module_platform_driver(cam_cc_x1e80100_driver);
> +
> +MODULE_DESCRIPTION("QTI CAM_CC x1e80100 Driver");

Again with the "CAM_CC" this should be -> "QTI Camera Clock Controller"

---
bod
