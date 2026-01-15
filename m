Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354E32B9B4
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485330; cv=none; b=n+3QFYXUjy+yihIVzXASv4wjtxlTihJZi4nfD0nX5ynwnFf4xwxZ11ELIiXXVGUcxMnlswrKGAJyJ77XzE9YlSwB/fPOGpYqeS7LPSHYzleGD6LmzNsAfe74mmpQ8mYkdGKiuA637kc/ANCW0TI4iLbzZGT900eN2trDcshtrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485330; c=relaxed/simple;
	bh=rTcmnpef70Bd17FfMNPWpzLu6hWiJcl5FrvjG1iQ7kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skGIlNBt5z5A+m4qi2op2r7gIPowVnbNTm+dS/g7zo5NBBNHOVEz8PgNDwhXfVPORORlvnBYKXn9jBrVpyeRtzgE/mH0X1jULr6YC25JpYcA33LA5pc8y+M303th3Huu7SSss49os/eXaQ7cG/sNTsphuRhCukw5gm+auBcg/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J+6zIyAL; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J+6zIyAL"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b870732cce2so150512666b.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768485326; x=1769090126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrZ5+jQy92uNw0r2S0THSakmu7K1eDt7PKdDPiL1BxI=;
        b=J+6zIyALzvkmmvHLhMbqdi5qXkwtAN+VC1tpHA0tEs+1bLX7ofpseQsFp3j1aZn/0Y
         Kr8/6pSdIqSFRtq6dOCNTKNUW34pzyO11qlJkW5klukx7C24o3UZPn/a0QB38lbilq/5
         6Zv1mAxaFszr5mQFlP6cXCc74pH9fDjTB1N9rF97cgEJMi2w/4RC+zelGesUPk0tQvQ0
         lGHYm2HAvVHohvEU5POGQAznYFBVXlF1nkpfCmovGHWnA8W0LTn4jT5pmYnLODu6mMBL
         dqkIuaFJsJST7e3se4wTS5NcuscSofSbaTZaNiAcDwMYpqzAAsVmf5sLf4UnKCd0VjfF
         tzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485326; x=1769090126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrZ5+jQy92uNw0r2S0THSakmu7K1eDt7PKdDPiL1BxI=;
        b=tH/0S+fKJTrR5YwfJNkAsVpWgde+XxBle5yl6SLV/ngnH/Gmnjwobv/ZWumCE6Mm+O
         bO6iFcNT4WeOk1LcmRnTxtRXlvyekSkLkSNyfLqBDYz1bmA4nkkFKFgU+jgYZNmHf4pr
         a+anhuscEMWEK42NUN7K3c0/bcbddR5Np22nc4+QP7iJkS12ZnI1VxhSOrjjiisnEU0C
         u7yX3nkuc6KWDWKINkMALGJ0r65ewYUx6YcO0v5kfPpkvxrcQnF+3gwk2oidw21vHJRl
         3pQalfz8Pmtd0V4C5Le4jpWtGiGyl9+ntVZzbuUnYpRPrM/eOSgkA1DSA26yLn4yzEOo
         ScOg==
X-Forwarded-Encrypted: i=1; AJvYcCV895UiucsJTN3DlZdRFKxnrPR8flfa3vHi0AO+MKkn0EZs59TgoRe3NfkaKFYK3Z9/4NJJF2AaKFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWrJWbqNDVDbUtnwal/lsmuDX+x2dL4xyOmdHGfH9JOoEfmMm
	dHvyjjakDGZrC1sjAo1WHT8KVIrGnpxZY1bnen9SsbIE7vjHYnPepJ4bHMuvjf9VwuI=
X-Gm-Gg: AY/fxX54VzP8VH75C3LnQghUm1Wj26Kr0rH+rx3L0i6TR9NGYTQoW9JK8JuCsRudz8g
	dAqi9CnAk/ZndNG+VLXkEGYT2LiPm9F8N8sn5AGfAGTa0PWvWBoZO0tT8hHKYlVpgFYz7KoLkzW
	0qCQ2v1RXJa1OYSivAVDWiFjHnSwb5PXTQqdySRfHeuyEUfwTzxlAyMyuwtqfyhccd/WoxSrqjr
	oynX6XNbv7Xmg2GG3HV9wF6zJ1ID/HTDVUHdmyaH1Tks7UIVhr0CsUPIPlh7R4jrM4hOACMNIhs
	81ZWjol//ERZym+KK+Iq9C6YFNCYsu5eb9JRdNp5J6JyU9fqjaZ0qb3wTpDkkMWBh84J+72xrwx
	FbitmxiOGWWdSx0oe4Xf22PnCNMsVXwJBUx5DrNJm2wu39SRvSyY7et06ISjFA59D95260JkQik
	gX62oWSrO/L2IDHsmmrSM=
X-Received: by 2002:a17:907:3d42:b0:b76:f090:7779 with SMTP id a640c23a62f3a-b876113a251mr548317366b.33.1768485325766;
        Thu, 15 Jan 2026 05:55:25 -0800 (PST)
Received: from [10.78.104.246] ([46.97.176.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87705a24f6sm365632466b.70.2026.01.15.05.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:55:24 -0800 (PST)
Message-ID: <6c87673a-32a7-490b-a365-096f3ae63c6f@tuxon.dev>
Date: Thu, 15 Jan 2026 15:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-6-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-6-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) PCIe
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
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 243 +++++++++++++-----
>   1 file changed, 172 insertions(+), 71 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index d668782546a2..c68bc76af35d 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,85 +10,34 @@ maintainers:
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
> -  interrupts:
> -    items:
> -      - description: System error interrupt
> -      - description: System error on correctable error interrupt
> -      - description: System error on non-fatal error interrupt
> -      - description: System error on fatal error interrupt
> -      - description: AXI error interrupt
> -      - description: INTA interrupt
> -      - description: INTB interrupt
> -      - description: INTC interrupt
> -      - description: INTD interrupt
> -      - description: MSI interrupt
> -      - description: Link bandwidth interrupt
> -      - description: PME interrupt
> -      - description: DMA interrupt
> -      - description: PCIe event interrupt
> -      - description: Message interrupt
> -      - description: All interrupts
> -
> -  interrupt-names:
> -    items:
> -      - description: serr
> -      - description: ser_cor
> -      - description: serr_nonfatal
> -      - description: serr_fatal
> -      - description: axi_err
> -      - description: inta
> -      - description: intb
> -      - description: intc
> -      - description: intd
> -      - description: msi
> -      - description: link_bandwidth
> -      - description: pm_pme
> -      - description: dma
> -      - description: pcie_evt
> -      - description: msg
> -      - description: all
> +  interrupts: true
> +
> +  interrupt-names: true
>   
>     interrupt-controller: true
>   
>     clocks:
> -    items:
> -      - description: System clock
> -      - description: PM control clock
> +    maxItems: 2
>   
>     clock-names:
> -    items:
> -      - description: aclk
> -      - description: pm
> -
> -  resets:
> -    items:
> -      - description: AXI2PCIe Bridge reset
> -      - description: Data link layer/transaction layer reset
> -      - description: Transaction layer (ACLK domain) reset
> -      - description: Transaction layer (PCLK domain) reset
> -      - description: Physical layer reset
> -      - description: Configuration register reset
> -      - description: Configuration register reset
> -
> -  reset-names:
> -    items:
> -      - description: aresetn
> -      - description: rst_b
> -      - description: rst_gp_b
> -      - description: rst_ps_b
> -      - description: rst_rsm_b
> -      - description: rst_cfg_b
> -      - description: rst_load_b
> +    maxItems: 2
> +
> +  resets: true
> +
> +  reset-names: true
>   
>     power-domains:
>       maxItems: 1
> @@ -128,11 +77,12 @@ patternProperties:
>           const: 0x1912
>   
>         device-id:
> -        const: 0x0033
> +        enum:
> +          - 0x0033
> +          - 0x0039
>   
>         clocks:
> -        items:
> -          - description: Reference clock
> +        maxItems: 1

Can't this stay as is?

>   
>         clock-names:
>           items:
> @@ -142,8 +92,6 @@ patternProperties:
>         - device_type
>         - vendor-id
>         - device-id
> -      - clocks
> -      - clock-names

Any reason this was dropped here? I see in patch 14/16 you are still using 
clocks, clock-names for the PCIe port.

Thank you,
Claudiu
