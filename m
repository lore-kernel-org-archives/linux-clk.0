Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD853E35
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714560094; cv=none; b=Gb75BazyxVTRxYxmX+MgMR9hkmMs4Ff9dkTQulV98y/Xf5uV2t4KpR3wRLhh1nTPXcsMe4LGJumvK0GWBdvhsDoDYf4K8Q1COUHjeUik/RRv4+b05FecYf8P2s3v/rfcS2CCHhW68LqAgvyLrzXGaXybJD42IDqlE0B9Q7vn4ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714560094; c=relaxed/simple;
	bh=/ZQIG/3uaLNNMu+Jaq1pWiCGUFBqLdO9PicLaF6MvLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ysmfr/YM5CzBIvbIiWxR/C+NA+LuUVbWU2lmqaV0YDJQLo8W9vku5HdZ8IoMPwfXPY3FLqGVnd5bWfG4lZduJvHjfxd0SWpVDioOX2ECNqFQmYI3Q2SJTdXcca/FxPd+51yzHQzKSre46RlkQ33mNq57jvxvUIDrusWTeDCHa9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYXcL8zx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYXcL8zx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so37935645e9.3
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560091; x=1715164891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnAXwpnJCfyBMxb2ERCfc2sWQTd2dlZbEzR3Sps3cGc=;
        b=wYXcL8zx8FZQPqbO9RvL1JXAfm4RWFrs5VIluI3eq4BM1lHNiYM20BOy8QoQvkz21B
         ZZ67Vz0Ll0sk3yMP5psrVEKU0bcf4Yg+KvZJ9ZxfW4sPgpnrzd/yxXEWSs0t001VTfkP
         Ctdbp90ogzAv96hGo62lEX/XYr8sBIGR2lUZnwWw0TvX3pn+Q/u4srDbng6iyWQ1NNX0
         mBUy3B+l2ASUa/oH3+Bfk2HOq+LFlNJKW41o/2P9bwvkXx/Oj7yfmvP3AKbmyDVWcNpp
         KQo1IKSBNUKsTP7EtjFkzjW3qXM1QtoWzBZT+SSZTex3FSO3+6PsbxgAenXISlPtFStY
         bSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560091; x=1715164891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnAXwpnJCfyBMxb2ERCfc2sWQTd2dlZbEzR3Sps3cGc=;
        b=jp3ggs5w+ExhJST0hLAJ1vYp/+oNS7Kn6DeW2WVjIozS2mukYyEmWDdSqwJ/LgrmMU
         2v9c6N3bfFRGN4FecmmUtAWJgW4fxBXkEbTymx++usQzkslaEH3nLNhH8vPAf7zrhHJc
         +m1FYmw0uV7zZ753vo2eO3e0gNLgPTJsfTmFlrosgmPVZnrUZBrqCcnTMpv1BHjHzV3w
         YQIeKvSKPFoNoEtVeWAj6D9dCfJ7dQKAxPqEnOJDHiWQxUq8+s+pPKKYBzwci4BM7RP2
         z2vFZuQQUiFLmyVXvvbeKN7ae2Hx1maNU6NhXPiQ6G+tXBL0OgY9o7JxFOON0imh04fk
         jsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7gp0MpT0vTSbVWjrpixNZ+VgxOjdADH2r27XTCYiicR7FDKwR9sDUHQSikem/+Q9c+6PRshJj9vrGQkjbU8hnn+aAeCf+zL1q
X-Gm-Message-State: AOJu0Yz83XJrpLy4jw4DWfHqdbiDbGXATGpf43kRi0a4I5EudCQTzAXq
	/eh8yfLjb9dQ/2iyLEzrxY2Lpx+y8qf77jCem2oUo4tvh0IyHJDCYQUjCKjPmbo=
X-Google-Smtp-Source: AGHT+IHji7usLVWIknIEKSCSQW1rplXvuNFa5Fj/xKexpEet4LiizDosHcaq8CZihdGZp2qmPdKChw==
X-Received: by 2002:a05:600c:1384:b0:416:6af1:27af with SMTP id u4-20020a05600c138400b004166af127afmr1596783wmf.35.1714560090610;
        Wed, 01 May 2024 03:41:30 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c224500b0041aa79f27a0sm1775807wmm.38.2024.05.01.03.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:41:30 -0700 (PDT)
Message-ID: <c55b7cdf-5ff2-42fb-8611-d9492f37d4b1@linaro.org>
Date: Wed, 1 May 2024 11:41:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/8] dt-bindings: clock: qcom: Add SM8650 video clock
 controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-3-quic_jkona@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430142757.16872-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:27, Jagadeesh Kona wrote:
> SM8650 video clock controller has most clocks same as SM8450,
> but it also has few additional clocks and resets. Add device tree
> bindings for the video clock controller on Qualcomm SM8650 platform
> by defining these additional clocks and resets on top of SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml   |  6 ++++-
>   .../dt-bindings/clock/qcom,sm8650-videocc.h   | 23 +++++++++++++++++++
>   2 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/clock/qcom,sm8650-videocc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 78a1bb5be878..922e95c61778 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -8,18 +8,22 @@ title: Qualcomm Video Clock & Reset Controller on SM8450
>   
>   maintainers:
>     - Taniya Das <quic_tdas@quicinc.com>
> +  - Jagadeesh Kona <quic_jkona@quicinc.com>
>   
>   description: |
>     Qualcomm video clock control module provides the clocks, resets and power
>     domains on SM8450.
>   
> -  See also:: include/dt-bindings/clock/qcom,sm8450-videocc.h
> +  See also::
> +    include/dt-bindings/clock/qcom,sm8450-videocc.h
> +    include/dt-bindings/clock/qcom,sm8650-videocc.h
>   
>   properties:
>     compatible:
>       enum:
>         - qcom,sm8450-videocc
>         - qcom,sm8550-videocc
> +      - qcom,sm8650-videocc
>   
>     reg:
>       maxItems: 1
> diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
> new file mode 100644
> index 000000000000..4e3c2d87280f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8650_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8650_H
> +
> +#include "qcom,sm8450-videocc.h"
> +
> +/* SM8650 introduces below new clocks and resets compared to SM8450 */
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_MVS0_SHIFT_CLK					12
> +#define VIDEO_CC_MVS0C_SHIFT_CLK				13
> +#define VIDEO_CC_MVS1_SHIFT_CLK					14
> +#define VIDEO_CC_MVS1C_SHIFT_CLK				15
> +#define VIDEO_CC_XO_CLK_SRC					16
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_XO_CLK_ARES					7
> +
> +#endif

Extensibility +1

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
