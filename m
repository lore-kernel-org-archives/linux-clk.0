Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99E204F99
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359693; cv=none; b=Rd98BPC73LYJPobJo3ELQDq8SsRjAf99eiBqRz81H1bvmXIJch8b7ABkJ7bHlw7qYfholWO1EZPWZ/pJ9PqTRPUk44AIYge8Co4OusyhAq+RmwqtrcwPvbSUS41kTQ3aHvagPmq1CA6zQHFni8Gq1Vv1fxHWlvsq4D1qdrW+few=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359693; c=relaxed/simple;
	bh=998bCQ5vVclaoJfJBg10iHBupkkwTUVT6piNf84yOAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C79GVb03geKrRgxUuZ7xLpygWKNuD48df7aD1r12/p+wdSWuYW5bIGb9dnQW3VyJWFBPKhGGtXeQDWTtpTeDlz0bFfyNq2lLzReHVVjP2Not2KgEd+WLEPzjY1WzKJeBVj8nt/xftnSVN5LYRfMbKhAWdVrr93ilU7jr14iETAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPQaJiM5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPQaJiM5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso698226066b.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359690; x=1760964490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=NPQaJiM5Lo6OGWnN0sekJQ4QZ8icT7kHy5wCjuym0dkVKzfis28kx64b75v9mGLDo/
         zoo5eogYxgEXgOtQGaT2oMDpoePoE/JpN58X+ZZsU+6HwCJ/U+slBXyKhb7KT7vhsAfN
         p/o5qSNQd+KP1ZpLRora/fHNjTsw6h+Fmo3vpYiQc3cD5eiNTyU0opPaOJaCpNtnFmlA
         D3sw0v+duY4b0YHJ4UvYUue6o32Ddhd3WhKUtQE01hJnX0K1c1Zcl3Zeo3KqUVymCtUR
         QBSDUGMz7u1/rw6G75VNbWBWGFPGPQiBH6gT0RG4KE6nT3gD93JYWLtXVHeS8UaesP6u
         eUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359690; x=1760964490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=iHg6Ds7J3lNiuIRsg4MFdjWkWJY3+Q8yRTOHJWy1JtDcrrbT5/GBU7y0bwOW+ZXJa7
         lJHkadDTNL5fPcCjd/dEMIepWkGk+o3ZpfXpW2ycZkvj5YsgqqTL/2f8cyzktMV4JKuE
         Tn1xQ06TsTCSEingvHpemiWGjfPIeay5rLA7fOX16hv7ozVMpw/3nhjCrMJmT8ET5uOY
         UuDnAjhR3YapixqCR2gtjX46gjvHk9jbGp/f5fWEx+8sWAxI1KJrzW1Txj3tT7bQGO3b
         RL+qZaPPZtfwrRr/5ixc9RsD+cY3iwpPhpB+2MevBgOU9OGK/fszq4iOx1NWQqUua5NJ
         Lk7A==
X-Forwarded-Encrypted: i=1; AJvYcCXFc7qc3dSw7/fl4maQlL+jp+yYaI9thVELJO+zYwPoJl28f0VqCGXlEwLvahWHbOIcosyszZ6RyNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtHIQRSKrOMLo/nvV7w1DJUhSHNwdMv72Uae/4YFwxZlSfuJY
	BiEDqt7iW+EVPj44kqaDJkBjMq623JDSWcUmixfOWdGK7s8KXtHHMNHe
X-Gm-Gg: ASbGncuMOUE1MUUNrAO6wKy9smADWqPjj+DBpB5k7oOR2+v+DfXjoEVNsLpyGMBibRA
	qWjpDo385VW6Q9nRFEA/u3KIHe7Wvm4iPkMRbnkHPylMe9CS45vPyOfRQ0vcfdi5E4Yf6qdTJPY
	7V5TGz6XEa/p5x5xNVDPr3h5KUfyRVSjwAy4pRbs0M7jD6fwCUv0tTzKrutmU0/nlLLLYAdEOiB
	q0z2ffMcPGlTtEBZAcKPGlXN8bm8joS8sEW8tsqoiSXVIo/83knIorifHOeWe21wUnLiy0XUjXE
	0TMzYNGypjhe9q83XqFY125M0ogHdr2mYTJJllX4eCoQaLPXHpHfrGeV73sfLaWwdZ+BPG/GBG3
	3lvtuTrp5rg9iXaoTpyAddBDTzlquqhWn4ZMPe12pdMF6wPl+TT0KCQ7FmePiGtLXZky9pqtjKp
	LvbGmr
X-Google-Smtp-Source: AGHT+IGhsH9Jko1f8FqT4pidOms6fn00pFogStN/Ol9Z3CUMb20PsGcKDB/1u9de4k8QmAJ4VfkJ0A==
X-Received: by 2002:a17:906:4a85:b0:b55:c35e:e533 with SMTP id a640c23a62f3a-b55c35ee5d6mr1063241366b.12.1760359689360;
        Mon, 13 Oct 2025 05:48:09 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm916644566b.5.2025.10.13.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:48:08 -0700 (PDT)
Message-ID: <1ad36baf-83af-4ab7-9f47-dd7f74d4749f@gmail.com>
Date: Mon, 13 Oct 2025 15:48:07 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
 <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/5/2025 10:03 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:03AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> new file mode 100644
>> index 000000000000..ef44f50921f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
>> +
>> +maintainers:
>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> +
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,imx8ulp-sim-lpav
>> +      - const: syscon
> Why is this syscon?


because of the MUX child's progamming model (i.e. "mmio-mux") which needs a syscon parent.

will get rid of this by using "reg-mux" instead. There shouldn't be a need for syscon anyways.


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lpav_bus
>> +      - const: hifi_core
>> +      - const: hifi_plat
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description: clock ID
> Drop description, redundant. Look how other bindings write this.


ACK. Very sorry for the easily avoidable mistakes.


>
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +    description: reset ID
> Ditto
>
>> +
>> +  mux-controller:
>> +    $ref: /schemas/mux/reg-mux.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
> reset cells and mux controller.


I'd say the mux-controller child can stay optional since the driver allows it?


As for "#reset-cells": unless CONFIG_RESET_CONTROLLER is enabled, the driver allows

this property to not be specified. The whole idea was to try and make the driver more

flexible in case, for whatever reason, people wouldn't want/need the reset controller bit.

In hindsight, I think this decision makes writing the binding a bit more awkward (since the

optionality of this property depends on the value of CONFIG_RESET_CONTROLLER) so maybe

we'd just be better off with having this property mandatory and modifying the driver to remove

the aforementioned flexibility?


>
>
>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8ulp-clock.h>
>> +
>> +    clock-controller@2da50000 {
>> +        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
>> +        reg = <0x2da50000 0x10000>;
>> +        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
>> +        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
> Incomplete node - missing properties/child. Post complete binding and
> complete example.
>
> Best regards,
> Krzysztof
>
