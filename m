Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2F27815B
	for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322085; cv=none; b=uiCaEE6oMbynSU5AH3RNhH0HhtbLtM99gF5Ev5DZWd65v0zoUFgOnK1zQscYP5MhjCt3f9W9MlLQf73WQuJysKWyoEIMH0aZZqcgBa5PCj2aiE69x4cZPP9ZfWY7I4pPo7zbIF6GfzwM/5SRj/4fuXuO2O81qQVKBkdQVZer8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322085; c=relaxed/simple;
	bh=cTFqz9KiP/BNOVxP6oYjAxkQuoAR35vO5bCD+dPhj8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9tFIYhQNoCkfkxU2tT65/C7IRx0TSYW0RJjXrq43EmbPmwMMAQcE3bH4RwPrLrs2e++zSq60RdUpHSAlRXkv0OL8bbPMUZ6CU0sZofGxogQqojArAWN+JzUjmHX4iV7S6C6RI0HZAx1JjSFU8QNLaC0m7+26MfRTXfg87cbWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esSu80Sd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esSu80Sd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3940885f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745322081; x=1745926881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2geUynLfZP5GcwsLx6XiSPW2gS1uqnjT5fqaXqswJM=;
        b=esSu80Sdbuz2C/olhVD6P386RBdGHzypoFtG9l7MnhMqFfhmzjX7AnjtFrWhADPiBQ
         q6TrcSIXaUyxrcPoe+KOdykY1YAuJpESg5XJSDRNW23A7MH27FpA6uLbHxcZ+QUwDisX
         0Cfy6SSECTNxYPJme0J6c3kQVGu29ljYKRhXmvyZvfABA79H80uUMBSM/TNh0cb/TPcQ
         688bW2W6Q2uNU21pJSCEWJ701WIr5YEuI76FrMe0oBdhiux7g6hJgyaCZpfqVqr2sqMr
         Ecrl69aHSQcKDexmIgdatS2WXYp3aMyCrJmOIrtGJ/x//F2/VUhylJqDeMEvOyhirNsv
         HMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322081; x=1745926881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2geUynLfZP5GcwsLx6XiSPW2gS1uqnjT5fqaXqswJM=;
        b=bKTjERB/tg1ThaDpAw3RiRR00d1OrVsE8Ktcb0wDKcnj1KA0Q0cR7ATA2jTCMM8A30
         +UUcZBnZC8tH+d8jBPYg6C6r+Unpr44rglSUZ34acHooP0gdECM8JT0sWhfKG4h3Ud4w
         KUuxXwg673+vR2vOxitA/2A1/SHOSZlIBgauZqArf8tw13XDQ0MZP1drKOLKCnvAGk+3
         GiCHBbNJQh7vUJJzLHS0pVIPpHlHByXZSwLdNZzelBFaWOPG9ISAgxRCMzPfG88+FCPu
         lYLQxHf9YU+V6OdWB35YB6DmdBScLtdvBgsMHf9a8NFBFdPVqJ2vdbW59sb4hSb3Jqxe
         vi4w==
X-Forwarded-Encrypted: i=1; AJvYcCVihS59znpRtnT2Em9NJNSQkuB8nrn/wEdJR6AGHYLAR9AS99xQJLDTjW3RjcPJ0peDN69XsyARdno=@vger.kernel.org
X-Gm-Message-State: AOJu0YylN82szR0RwhoR0i899Ak6P+bsbGmSfLwsqsdYlEEmeLpHQuNu
	miQsf9Vg8IigJCrMLPgvwwKKSEjxayiGwwXsnKDqV6mdkGWAV5y2zvSUs0yHXZc=
X-Gm-Gg: ASbGncsQH+vUqqLQuoNu538eXI3iL0jOhOP/e5CLv1KlcH9sgzc7eJWlBnHYhf/d+AM
	ZggaLZU3IUlLsWqZWtvbK+k7xgg9FRDH+ocX72WoSSjywhxF/g7BosDlGeB4/50z+joM7cMuN30
	i2lEvHu9ocxdAuaJrwsoGAzY/5TDSs9ZD0zz+Hmrnvtd3pBNu7vWMGEZamdW0epSjV//ypa9oo6
	i6173ifWaOqnoXxiVJ1+Fhgyd9lC7aO7zPe8dxMkTLQHAyPqkrBqJJKvhFmbswWYcBLT3zALix5
	DOZjZPATkU/zcu544xB6RNVVeG4XVq8U+cUPC51ZSpkplSZN8z/B3VSHk5o7VfXr0ZnfOQQ/Zyi
	qkg2/dA==
X-Google-Smtp-Source: AGHT+IEVUBG8VdUTIHsn/SScEWB30O9QywXiGr1ltp9dQVSpRWXHvYoHZ4ukfKXtZWxCtX2w6sQUOA==
X-Received: by 2002:a05:6000:2907:b0:39f:d03:f567 with SMTP id ffacd0b85a97d-39f0d03f56amr4499873f8f.16.1745322081558;
        Tue, 22 Apr 2025 04:41:21 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207basm14766595f8f.5.2025.04.22.04.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:41:20 -0700 (PDT)
Message-ID: <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
Date: Tue, 22 Apr 2025 12:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>   2 files changed, 246 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
> +
> +maintainers:
> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> +
> +description: |

You can drop the "|"

> +  Qualcomm camera clock control module provides the clocks, resets and
> +  power domains on SC8180X.
> +
> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8180x-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source

Missing clock-names

A suspicious lack of clock depends here. No AHB clock ?> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +
> +  required-opps:
> +    maxItems: 1
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#

A suspicious lack of clock depends here. No AHB clock ? No dependency on 
gcc ?

You call out the gcc above.

Could you please recheck your list of clock dependencies.

---
bod
