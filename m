Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172D1F4FD2
	for <linux-clk@vger.kernel.org>; Thu,  7 Nov 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982320; cv=none; b=K8t7X0oz7Le1ezM+80ZUqPqBCfV18JZ7qJQJmK3LgoMUOcrbaI/PQ7RCJ0jRZmJ7VNc6sKTnfaOPT4dQUwIz+pReNS/6A/+nCNesqDwym06kTBarv5oe1O59Q32iksqLLQ55nzQ8qJHzgEO9/VcUY7M87aRdef15gZ4OTj6tajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982320; c=relaxed/simple;
	bh=uOHtoOGSDgDkow1wLA2awmZ3A8Qe3ptAdpnofZDjgqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuLBItW0mFQr/X+//XWgYwuSeFUYOyRhfq5axhAD0bvbvnCCgj2nZDpUZ3PHpW4ojD09KNivy7RmddlWdfYSE3o1mM885/Xz5wGe4z4pOBnPyu0O5F7mSSFbKNWrvjimf4yLIJGEJ3GRQObQ724B5LjPgg0i8Qxjvb1hnYGKdEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsW5RuK/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsW5RuK/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso124802f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Nov 2024 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730982317; x=1731587117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzbdXmjU7p6o20uBK8Vs/ZUnlHfeyC3jV0YTi+RLdZs=;
        b=gsW5RuK/QVDvjg+NYAX3GtP5VTunCSDJIGe0M5t3ED9PufbRLLGCEYp7BKtAoIoKwg
         k1ziHzQxjJWkq1QgynrKATcUyjVCu1Go/r2KFM6XGhaLgvojxIIQf0p4SjpMfUQe6OaZ
         wcQ9AaE6to2Q20J8bZ1KwaH0UF2SvBRTS98XRch6vxmxABwXhwQ6FfB5kBPVnBiRgN5t
         mrrh3HOoDTBkDfOXi9aMAsXe/LlfUZsYsm8KWLbNHlTlwkLlQhtT03MtZcw3VqGRHl4N
         1GqjAi7hrdDOsFWtq0So6qjnNZWVHBO8fGAcInoOtr6wvsptaQ1VQZpFBOQg8ZJn9NRt
         TDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982317; x=1731587117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzbdXmjU7p6o20uBK8Vs/ZUnlHfeyC3jV0YTi+RLdZs=;
        b=ZXAlrC80CCBj2aqIYLlAgEv77+E77OLkC7N83Xhe3DzttK5hdtv1F4Ot9zKEqLX+eV
         BvQ6hTTkpO9CuZpxbTSAy6FGhglQXk+0BDcjOPSQG59L/xxzuJ/odJ5zCIgZsXaNJwa6
         mzHI90arZyE0qqxsGCHsjbK5pvfMiv6B1GdX7uo0OhiFHUPp8rbPWhZBSdCYyMQMZQSo
         1yQ7hdsy3cQW460DN3aykpU0MEP3Eb7yL32jskcwnQkM6tyTwhq1RO+6rIeqq9ESf1+C
         hnR2j11rVLbLdLfqKQyccz/EbSYzAnP9VoJoe/DCw7Snye/gbFJD+i0Cs4EXn3CrqHdl
         Rwrg==
X-Forwarded-Encrypted: i=1; AJvYcCV3D45t6qyMR8Z4i74PZ8ZAEkoJ40IoSIeqjVzX80zfJnRG2wFV/P3dlmtIXq6nS8+wsA6SP3Q/1gU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0XfG5EGDzs4AqrsARpqR1YoNWuylzpwGB8jcvCvDrACRfpOh
	M1LMIEPucItBCb5wUScLviiIxeD6zf3KfzNEVdvHLF6LFZyJ6hIhBTC/DKgSKVI=
X-Google-Smtp-Source: AGHT+IFOgPssWZsDH1j5T86iLoVp1PjuAQf1YJ308gU5MuuoGMyMeA0iydRzzX36J0FJAIprsNb+6w==
X-Received: by 2002:a05:6000:400b:b0:37e:d940:a9fe with SMTP id ffacd0b85a97d-381ef746475mr362301f8f.13.1730982316616;
        Thu, 07 Nov 2024 04:25:16 -0800 (PST)
Received: from [172.20.144.41] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea5c1sm1625361f8f.81.2024.11.07.04.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:25:16 -0800 (PST)
Message-ID: <0ce2df56-85be-44da-af23-cc5bee98e14d@linaro.org>
Date: Thu, 7 Nov 2024 12:25:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
To: Imran Shaik <quic_imrashai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/24 11:51, Imran Shaik wrote:
> The QCS8300 camera clock controller is mostly identical to SA8775P, but
> QCS8300 has one additional clock and minor differences. Hence, reuse the
> SA8775P camera bindings and add additional clock required for QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>   .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml    |  6 +++++-
>   include/dt-bindings/clock/qcom,qcs8300-camcc.h           | 16 ++++++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 36a60d8f5ae3..81623f59d11d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -8,16 +8,20 @@ title: Qualcomm Camera Clock & Reset Controller on SA8775P
>   
>   maintainers:
>     - Taniya Das <quic_tdas@quicinc.com>
> +  - Imran Shaik <quic_imrashai@quicinc.com>
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
>     domains on SA8775p.
>   
> -  See also: include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +  See also:
> +    include/dt-bindings/clock/qcom,qcs8300-camcc.h
> +    include/dt-bindings/clock/qcom,sa8775p-camcc.h
>   
>   properties:
>     compatible:
>       enum:
> +      - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
>   
>     clocks:
> diff --git a/include/dt-bindings/clock/qcom,qcs8300-camcc.h b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
> new file mode 100644
> index 000000000000..fc535c847859
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
> +#define _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
> +
> +#include "qcom,sa8775p-camcc.h"
> +
> +/* QCS8300 introduces below new clocks compared to SA8775P */
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86
> +
> +#endif
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
