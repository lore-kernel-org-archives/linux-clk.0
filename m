Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10452E7635
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469141; cv=none; b=qxq4O334S1uFA2oRhwipmI6aKDlSAd5tcqfE4NgzHcSDft4yPjXeTr7TVE6rCUB65IlKaqJ73jjrrgjo7gIA/8pzOsT6Gi2Ag8jjpPxuBp06WJBwwWOsjoFd+3orTG1eqZiuuK35efeh4snk4tNyj3ymuq6uw8I/y+E2hglC+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469141; c=relaxed/simple;
	bh=WTJ3pzdwIneOX06IoFSpJpP/ij3N5ThgvRmHQQVgZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlnrjycAh/hf5Gw69Kopl9yBBd3QsD24mUF6NgZKD0yMLIR2gqvM5Qocd+mtyg+mlB0VpUGPDewh2PMIbiMfabVfbX77yHCHPDa/HS+8puH0pa1uaxEUIDBddff3ofbtN65S3JjgXrWN35+d4qPPixvg2VS8uI4mC/U02HZffEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=C+s9xaCV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="C+s9xaCV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439a7b48df2so1744264f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772469138; x=1773073938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vgVgq/PKL42P9mqoX80JnTj9f0Sx394ufpp39qX55w=;
        b=C+s9xaCVLFQDE5pK8Sk8Y/tOCYGcF+EmfdMaf9f31qd7lRzfaNiQ/7pOgXAMWuXdeW
         l07YTl6mk83iSTWbwzi2T8ddWxNQz+mzVZcvHoiAz5eMN0nxSqU4DZJ1L5eKJjG6VGI8
         MZzPHS6K4BYznLWO/FWGGJyJ7EI+4yoFy4Wc7URl8U1msGnFnC55aiB/vw/LOPa7Kf4R
         f8qShO+/eKfv33mXCazLIzA7Qnc7fqnHiYnT+vYm3XPZH8s6oa6QqXEwJHJqmH24KWi4
         f/8ok7qkh6MwZ/y3hWMW8p5SGdIo4pFa5f89zZJBbjSxFTxjTV+tIHB3KFR2rxZzT981
         YwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469138; x=1773073938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vgVgq/PKL42P9mqoX80JnTj9f0Sx394ufpp39qX55w=;
        b=C5T26OfLI6i/pTQ9MxBrXNBJ3CIW46LJY3aR4lIZm8cMlt+l/PGNf22p6EUvD0Mui0
         S3kMxpmvNJn7PZvoNkFRyuOl6x19hQnNgazD4Wjv2HwH+00sFQIsXL+XtpaI+0VEbyME
         nODgGoCgYF46mLkd4xeFywkMtxhzOFgLYNa/wBdBiJGyOaYk6NHGmPbwwlYhxDHkL/Ci
         lkneoguVX5n3HyoA119ckzAuylFq54XddkEOJO3v0vuy1p5x7BPdW5jseeweO/Wr80Jd
         M615PvfXeF3U/fG6J903kgYOa0LlqbCVLkXGZ9p8H04duKsoaY5+6PeaYSmywMxTS/Rj
         sipg==
X-Forwarded-Encrypted: i=1; AJvYcCVNCoGxKdj91R11hZigiZOaXraRWQwgfKpvhXm0o95NbGDFdMHTjduB3BqomtD9pLwJrZnHPMqvLhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpovvdrUb4g2VuRCWwtZbki3NNkRrnujnFWDrqeT5/y+nOhMKD
	W8vcNJ87AjjuVEi4ADQ9WBUcJj6H70/cb/BehGBOOU7NgeGxjydMzqGfajdNuI9Vk+w=
X-Gm-Gg: ATEYQzyqJPyX0+4yCzJ6Es/alLoXo5G2ewXJ7nF+IDr/Q1bluu5m6jmj/VMsmnXanex
	qee0ExXk/zCQrpQB45oBG0n067fn8WupG9b76vsybNUUGwWQ8UNE09VTS1NJY4WfOZvD9yy7u1z
	SEFNeYOkR+KYittEybxEVdF6dYoRFP/cob87qCmavnCvOnnE/eMCrAUsIb7KYEYknjy+eBjP2b+
	mCEpUIPikmpA0eBBpZYHPDyFe/coM4nrqflqY5RNJ/D2yDM9mOlgxRv0cB7kjxJY4l8zVpaCf+1
	ZVSwAWp6Ap3fyfkKNbqhHOYYVePBbLIN6W8w3bsTulX9VctwI+abv9ooe6CG+VgP26awWz6PeBS
	dNynQr6aYRX63shsXxOhfZXpYhHGInu4gU4AY/dfqKZxNRxn0FClFRVpVmGf/pRvPjCNjwp0GKh
	e8TVeY5rp9zPMleDYS4bgsJDt/jr2N5ml5R9My
X-Received: by 2002:a05:6000:402c:b0:439:b55d:b0e3 with SMTP id ffacd0b85a97d-439b55db2e6mr9320134f8f.42.1772469137917;
        Mon, 02 Mar 2026 08:32:17 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503424fsm11923248f8f.22.2026.03.02.08.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:32:16 -0800 (PST)
Message-ID: <712feb0d-2855-444b-852b-49920ebfa4e9@tuxon.dev>
Date: Mon, 2 Mar 2026 18:32:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-7-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-7-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/26 17:32, John Madieu wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) PCIe

Still a checkpatch warning:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8:
controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) PCIe

> controller. The RZ/G3E PCIe controller is similar to RZ/G3S but has some key
> differences:
> 
>   - Uses a different device ID
>   - Supports PCIe Gen3 (8.0 GT/s) link speeds
>   - Uses a different clock naming (clkpmu vs clkl1pm)
>   - Has a different set of interrupts, interrupt ordering, and reset signals
> 
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v7: No changes
> v6: Collected Rb tag from Claudiu
> v5: Collected Rb tag from Rob
> v4: Fixed clock name constraint using enum
> 
> v3:
>   - Moved interrupt/clock description in distinct PATCH
>   - Fixed clock name constraints
>   - Updated clock descriptions
> 
> v2: Reuse G3S names
> 
>   .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 73 +++++++++++++++++--
>   1 file changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index d1eb92995e2c..a67108c48feb 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,17 +10,21 @@ maintainers:
>     - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>   
>   description:
> -  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
> -  4.0 and supports up to 5 GT/s (Gen2).
> +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe
> +  Base Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
> +  up to 8 GT/s (Gen3) for RZ/G3E.
>   
>   properties:
>     compatible:
> -    const: renesas,r9a08g045-pcie # RZ/G3S
> +    enum:
> +      - renesas,r9a08g045-pcie # RZ/G3S
> +      - renesas,r9a09g047-pcie # RZ/G3E
>   
>     reg:
>       maxItems: 1
>   
>     interrupts:
> +    minItems: 16
>       items:
>         - description: System error interrupt
>         - description: System error on correctable error interrupt
> @@ -38,8 +42,16 @@ properties:
>         - description: PCIe event interrupt
>         - description: Message interrupt
>         - description: All interrupts
> +      - description: Link equalization request interrupt
> +      - description: Turn off event interrupt
> +      - description: PMU power off interrupt
> +      - description: D3 event function 0 interrupt
> +      - description: D3 event function 1 interrupt
> +      - description: Configuration PMCSR write clear function 0 interrupt
> +      - description: Configuration PMCSR write clear function 1 interrupt
>   
>     interrupt-names:
> +    minItems: 16
>       items:
>         - const: serr
>         - const: serr_cor
> @@ -57,20 +69,28 @@ properties:
>         - const: pcie_evt
>         - const: msg
>         - const: all
> +      - const: link_equalization_request
> +      - const: turn_off_event
> +      - const: pmu_poweroff
> +      - const: d3_event_f0
> +      - const: d3_event_f1
> +      - const: cfg_pmcsr_writeclear_f0
> +      - const: cfg_pmcsr_writeclear_f1
>   
>     interrupt-controller: true
>   
>     clocks:
>       items:
>         - description: System clock
> -      - description: PM control clock
> +      - description: PM control clock or clock for L1 substate handling
>   
>     clock-names:
>       items:
>         - const: aclk
> -      - const: pm
> +      - enum: [pm, pmu]
>   
>     resets:
> +    minItems: 1
>       items:
>         - description: AXI2PCIe Bridge reset
>         - description: Data link layer/transaction layer reset
> @@ -81,6 +101,7 @@ properties:
>         - description: Configuration register reset
>   
>     reset-names:
> +    minItems: 1
>       items:
>         - const: aresetn
>         - const: rst_b
> @@ -128,7 +149,9 @@ patternProperties:
>           const: 0x1912
>   
>         device-id:
> -        const: 0x0033
> +        enum:
> +          - 0x0033
> +          - 0x0039
>   
>         clocks:
>           items:
> @@ -167,6 +190,44 @@ required:
>   
>   allOf:
>     - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pm
> +        resets:
> +          minItems: 7
> +        reset-names:
> +          minItems: 7
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 23
> +        interrupt-names:
> +          minItems: 23
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pmu
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
>   
>   unevaluatedProperties: false
>   

