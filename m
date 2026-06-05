Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11040B392;
	Fri,  5 Jun 2026 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651111; cv=none; b=R0sndjK5LhVcpTLFTrlugvt4ywlt3eh0BanE1q2lbL6P/Damf5aPioJLfuTz7kma8eGlM62yV0kja7XKw9gT9A+muNrCbaNrjxcEoCtv2nkQUF5r+YwhjQQx41QWba+lY8/tFrhT3XMbIQhrlazKmsg9CDohzrzE5sbpd3dLdK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651111; c=relaxed/simple;
	bh=ItkIAnz77Ht0V8s0D4hwlXvYE6YSU3G0RhJD7/KyKms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnMWtTPQ0hg5r5+QiFpt3ejmsmdAHRf1NIDWPQ9GXl8peG4VzhQMfzqkyGo0p4kO3ZQuqQE7x2C+2wgETdnbsr4Ig0lwVvvsziTTZ3jROE08cT7bMs2jmrDsgWWXBQDdMS6z5tQ/sx/gWt0i0MXAnrWuBOcTkrusqS1tIcv04EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqKe8T4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqKe8T4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C61F00893;
	Fri,  5 Jun 2026 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780651110;
	bh=eqX3jUpHIogQmCNm4Nvjf21Tcfqt7WTpDhp1du4BbYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PqKe8T4q/jag/P+1p/RNY7o1OccadN9fagxWNtbiXxaBf1v1j9LKVxBBMSpfonx8P
	 Ob/39kHxu0W1q0axx1PoE1FKRT3QmSaP60L5KirHzblMvNwJwEiowzJWpAk/oHgQPN
	 dRDEhByIBUc92HLnQeYEIpyQLt4t/dwW5rcIh+fh91uz/MHbKjhEQxCsL9X53ReG+P
	 3JAt4YqP+2UwxyC2p3DIq16fXrOUvJhhUBTvl1JzMyG1uC4c8sN6H3W7v2bP4Wuj33
	 uHgZt5HH4ePWrPCLb4bFM1J5HEiawBc4CJhtigOx3EtmN6QOP8L6Np3Aq61H6tRcrt
	 dmFMIeSwTchBw==
Message-ID: <17528d9a-738c-48fe-ac24-b8d90875a74f@kernel.org>
Date: Fri, 5 Jun 2026 11:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-2-joakim.zhang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260605032225.523669-2-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
>    compatible:
> -    items:
> -      - enum:
> -          - cix,sky1-system-control
> -          - cix,sky1-s5-system-control
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - cix,sky1-system-control
> +              - cix,sky1-s5-system-control
> +          - const: syscon
> +      - items:
> +          - const: cix,sky1-audss-system-control
> +          - const: simple-mfd
> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -27,6 +32,11 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  clock-controller:
> +    $ref: /schemas/clock/cix,sky1-audss-clock.yaml#
> +    description:
> +      AUDSS internal clock provider (cix,sky1-audss-system-control only).

Are you sure this patch builds? Your cover letter should explain merging
dependencies/strategy/constraints in the first chapter. You start with
THE MOST important information.

You need to disallow node for other variants.


> +
>  required:
>    - compatible
>    - reg
> @@ -40,3 +50,22 @@ examples:
>        reg = <0x4160000 0x100>;
>        #reset-cells = <1>;
>      };
> +  - |
> +    #include <dt-bindings/reset/cix,sky1-audss-system-control.h>
> +
> +    audss_syscon: system-controller@7110000 {
> +        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
> +        reg = <0x7110000 0x10000>;
> +        #reset-cells = <1>;
> +
> +        clock-controller {
> +            compatible = "cix,sky1-audss-clock";
> +            power-domains = <&smc_devpd 0>;
> +            #clock-cells = <1>;
> +            clocks = <&scmi_clk 0>, <&scmi_clk 1>, <&scmi_clk 2>,
> +                     <&scmi_clk 3>, <&scmi_clk 4>, <&scmi_clk 5>;
> +            clock-names = "audio_clk0", "audio_clk1", "audio_clk2",
> +                          "audio_clk3", "audio_clk4", "audio_clk5";
> +            resets = <&src 0>;
> +        };
> +    };
> diff --git a/include/dt-bindings/reset/cix,sky1-audss-system-control.h b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
> new file mode 100644
> index 000000000000..2ebc5c4f10cd
> --- /dev/null
> +++ b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright 2026 Cix Technology Group Co., Ltd.
> + */
> +#ifndef DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
> +#define DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
> +
> +#define AUDSS_I2S0_SW_RST_N	0

Most likely _N is redundant here. Consumers will ignore it completely
and this is binding used by consumers, not by reset controller.

> +#define AUDSS_I2S1_SW_RST_N	1
> +#define AUDSS_I2S2_SW_RST_N	2
> +#define AUDSS_I2S3_SW_RST_N	3
> +#define AUDSS_I2S4_SW_RST_N	4
> +#define AUDSS_I2S5_SW_RST_N	5
> +#define AUDSS_I2S6_SW_RST_N	6
> +#define AUDSS_I2S7_SW_RST_N	7
> +#define AUDSS_I2S8_SW_RST_N	8
> +#define AUDSS_I2S9_SW_RST_N	9
> +#define AUDSS_WDT_SW_RST_N	10
> +#define AUDSS_TIMER_SW_RST_N	11
> +#define AUDSS_MB0_SW_RST_N	12
> +#define AUDSS_MB1_SW_RST_N	13
> +#define AUDSS_HDA_SW_RST_N	14
> +#define AUDSS_DMAC_SW_RST_N	15
> +
> +#define SKY1_AUDSS_SW_RESET_NUM	16

Drop, not a binding.

> +
> +#endif


Best regards,
Krzysztof
