Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C33153BEF
	for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625465; cv=none; b=QybaFJ+sDevaRmqKTNc3zI4poCS0CuDAOgCa81Mistlm8PrcldRRUSIPDreNukV0p6TJiGoDfPNrKvKLegrSCGnZ9cHK6Ojd35dFGGim5Iq+lzKcIEBrojhfnCD2pxxQPcBdPrIdtAlG9mWSvsW0/InZoQR9ep6mubT/dBXpO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625465; c=relaxed/simple;
	bh=nJUrBTzLCmoeEBw/e2vxOTOBcTPnOYt9FpDz/70UR30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPT/UqkW+DKPJt9iDqwapzKXoF8Wrc23VHnImD715lnuzcgo14+BKXHWQ7l04JXs12lAWc460UUN0vlrsbRy80uwFkS3V2cW/pL6IPV6PTf+fFL6o88KegsoY7rnV/8AkJ/6gKeDSL9L9ry6+FDe69tkB2kTKdu59dn1fopq388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3qwYgNA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3qwYgNA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so524066b.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708625461; x=1709230261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILFwcJG+u/u4mc5uI+JhxO5Ph6/q8Er+p0tnlNwT0QM=;
        b=Z3qwYgNAprmAEyBVecdT8R/fIKdxl9lKu1NvGdehFFfs/JyynlTRwYoBAbHThLdM2E
         EBObGbrRACqMOWoICaJNfSyx+qNRFSMnsJuuC9hHCx6doMhiubJqdf+ip4OmQEkgAasM
         9wXX+7i5r9l4pAbIaipDiTAO6BccjC8cVh0LSWrmYcCa6h4u0233XmdQcQ6nF6EH0fd7
         xftKX/lbwNp/HPyEKjkXbKnd2nlxu/ijWZuaMYOHMgmFqVxFQzNbkqVGz6jHpF8Y55+G
         9QfX4VtcjEDdHH48r43LjZy3hxuyjtLkRUPLiilGsbJQLD0uQZDT/V4iWnnV53ZZNps7
         4cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625461; x=1709230261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILFwcJG+u/u4mc5uI+JhxO5Ph6/q8Er+p0tnlNwT0QM=;
        b=j+/f2JRMmaRspA0ChGr0AVjuD3YxSfLA8rX8LtsoskPpD7EYCcg2FidiqKVS49eRPi
         7SdhPN7YWpauQoheAV8TY/F1DVRhcyQKxuB/l7DY40qOy3Re0hnFpeJyUPa01T3PY5jZ
         YxmDCFR4cYuvXW56gfbSnDyaa8Jf3TU8ulL/o/oXtmAk69oOEqYAvUnYrjudPSMVKN6P
         Vx2vAWf0dxuS67f7QhJnT7eLDIWOmPLZx0WiqXiUfWIKhpPouKpggNPzKA2oQEtwvR4H
         RMpCDXuyAfgzDDwL1O+US7LmM+D1Z9qyQKCysKaaE3JiJiXrpyOb8xRWSAD5Z6IBiue8
         Hpxw==
X-Forwarded-Encrypted: i=1; AJvYcCW4SA6AW1yPaeG2OBJc+90bo3eOcjmtdERX2ifSK9UxiNR2dzOikOBjN50n3DWNxhmuqjKJ0ppIJpENBOHkMYu+gsGwY/I4dIgu
X-Gm-Message-State: AOJu0YyueuHhoHlcfuRTAajZe6TW+O2WbWmBvD9ItivaWELoodDUFm87
	n9AWGJ2bnCtjKjcqehip/IqOGXaADMsPm0vA7Ep9VJ8y0ykzz8sW2a2qXxlZ4zQ=
X-Google-Smtp-Source: AGHT+IH2aIv6DWkMkEA3X9JJb8bneFqsqS6HyS/520aJTU0j/6Ztu9TnpUDTvsf/VJJluJG+IpTySw==
X-Received: by 2002:a17:907:76d4:b0:a3e:791d:afe6 with SMTP id kf20-20020a17090776d400b00a3e791dafe6mr8199301ejc.44.1708625461358;
        Thu, 22 Feb 2024 10:11:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id q12-20020a170906770c00b00a3df13a4fe0sm6274074ejm.15.2024.02.22.10.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:11:00 -0800 (PST)
Message-ID: <6e0e7670-f003-471b-b42d-8b45a42b02a8@linaro.org>
Date: Thu, 22 Feb 2024 19:10:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: clock: hisilicon: add clock
 definitions for Hi3798MV200
Content-Language: en-US
To: forbidden405@outlook.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240222-clk-mv200-v3-0-f30795b50318@outlook.com>
 <20240222-clk-mv200-v3-7-f30795b50318@outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240222-clk-mv200-v3-7-f30795b50318@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2024 17:41, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
> 
> Add clock definitions for core CRG and mcu CRG for Hi3798MV200 SoC.
> 
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  .../dt-bindings/clock/hisilicon,hi3798mv200-crg.h  | 150 +++++++++++++++++++++
>  .../clock/hisilicon,hi3798mv200-sysctrl.h          |  21 +++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/hisilicon,hi3798mv200-crg.h b/include/dt-bindings/clock/hisilicon,hi3798mv200-crg.h
> new file mode 100644
> index 000000000000..bf6b6b855724
> --- /dev/null
> +++ b/include/dt-bindings/clock/hisilicon,hi3798mv200-crg.h
> @@ -0,0 +1,150 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 Yang Xiwen <forbidden405@outlook.com>
> + */
> +
> +#ifndef __DTS_HI3798MV200_CRG_H

__DT_BINDINGS_CLOCK_HI3798MV200_CRG_H

That's not a DTS.

> +#define __DTS_HI3798MV200_CRG_H
> +
> +/* clocks provided by core CRG */
> +#define HI3798MV200_OSC_CLK			0
> +#define HI3798MV200_APB_CLK			1
> +#define HI3798MV200_AHB_CLK			2
> +#define HI3798MV200_APLL_CLK			3
> +#define HI3798MV200_BPLL_CLK			4
> +#define HI3798MV200_DPLL_CLK			5
> +#define HI3798MV200_VPLL_CLK			6
> +#define HI3798MV200_HPLL_CLK			7
> +#define HI3798MV200_EPLL_CLK			8
> +#define HI3798MV200_QPLL_CLK			9
> +#define HI3798MV200_PERI_DIV_CLK		10
> +#define HI3798MV200_CORE_BUS_CLK                11
> +#define HI3798MV200_MDE0_BUS_CLK                12
> +#define HI3798MV200_MDE1_BUS_CLK                13
> +#define HI3798MV200_MDE2_BUS_CLK                14
> +#define HI3798MV200_MDE3_BUS_CLK                15
> +/* UART1 does not exist */
> +#define HI3798MV200_UART2_CLK			16
> +#define HI3798MV200_UART3_CLK			17
> +#define HI3798MV200_I2C0_CLK			18
> +#define HI3798MV200_I2C1_CLK			19
> +#define HI3798MV200_I2C2_CLK			20
> +#define HI3798MV200_SPI0_CLK			21
> +#define HI3798MV200_SCI0_CLK			22
> +#define HI3798MV200_SCI1_CLK			23
> +#define HI3798MV200_VDH_CLK                     24
> +#define HI3798MV200_VDH_DSP_CLK                 25

You have mixed/mess indentation.

> +#define HI3798MV200_JPGD_CLK                    26
> +#define HI3798MV200_PGD_CLK                     27

Best regards,
Krzysztof

