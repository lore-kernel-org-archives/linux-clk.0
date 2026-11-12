Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496570;
	b=vVG7H6ckNdjXHMpwxVKU2L+duni49niS7LAq6mIqi/5Fl6hJ3eBFgSxfpHz+0mGN5pAm
	 6iLEhSHlU0+rxhKCbs7W7TiZMmAr1aiouMEIEEDxduQZ4iDS8EbyutDPVpWDq6HKKI6Ck
	 byB/fiY2pqbtuuy9eCExzf902i45uvfg7OAub/cnjbUw2ZF70zJiupMjMDzEN1cArEdF+
	 za+C8EnUxxFpPvVF6HAyR1Io3bLf9dBqMIDWP5Br/0VNu9tWA3SsdaRU66sjyegQ/OFjM
	 QMfDsBvpFMPxWTlUpV59I/HOkAVT3gO4x5M9susbYYfEr8x4m4bxUR0tak9AduSIr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
	b=DOTSY5gFWLtVVRbZ+lSjLLfwNKyr1+T/ix9fhFcfRzJBbnSl5YMN2rWgbBEElLw9KAfW
	 1MD1tsMjlu4fAx9Y2PV2PWx7UnOTD1Ncf9/ryg+96nDdsynCN5omzgYqg8PYBafAQRreT
	 3dMM3x/rJPwnA3WD0wSM8fyF3zTr8/Dt2wjxvFC/fWbTH9xmB5g6P1LYivpMCa93l5Df8
	 H/JbrB01SyinBeo/MGFTUPI6NSHfRUgtnLoa+XiVIKhvKM8dKNoNLy9olLgBZUvS50e06
	 //kbvsLhOTO0eLOpisLqvXXEJMGu/0csPIEp6QZlxqpO4QaQKP0spHR9gay5EBAIzjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A442606A883
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A442606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c8958d5so501943485a.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496568; x=1795101368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
        b=JecOMiCEfqpspedK2HU5Xc7aCEgf00pha2+LrwCwSKjIkzTAu71OYrd5KJOrrQgkwq
         Rx3UAltcpJFjxraims60FhoU9K4BbB4qC6UeX35bVkIeeCc8l/qh+UamZ+Lig0nUPRf1
         QCfrUFYmlL8Z0MBHBwhpKtwHmf0q7SXR4kRTd2aOFqbRSe7T7xzZ2mq9LgpXWsuHIwFO
         3TSBK1uEUJ6x7kfvuhWzSOhSsiMakt75rwCofS8pKg5RW8Y+FyBmWR3GhTzFeZvoTIU9
         wvZ2PTxL8RJbyi1RXZl5ufYJhfz7KUPjQQ0GxVfzSfDMomLMdqse8e+Ps2HAt/K6BrqB
         Zs/g==
X-Forwarded-Encrypted: i=1; AL+hErGJfslcZkiXsP9QF6f2iw4eI2pUlcUojkpfhHhdY5O2M4Hgo3gXE+iPBlgkKzfe/D/hUBSudkyRkl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eoiEzRwxOZZQOhhmkDbXySldPWHXPbgw2/kMleNAzvnImnlNo
	s32niMqi6TZTMDSqnNLBLpBDY6tu9CVqh6vRniGC7MYKRfg2c1JQVdQmlm6uA/SZiKE=
X-Gm-Gg: AYBFou3H6q/9i/EEM7Skcnwn+04JYjqpuaLgxg/VEw6UOeKnQPLIKNi7/Jd8Da+YwFU
	tJUs7xDu4hB6l2R2P6c4/4WLYYwpHT89jI8y52fb7m+BqkKufrrNVBXy4mX8tDciVYlRC1VlCR6
	aZjM4Ne+iVj/mxS4+THyGf8V7SeGSNlmWvCo+nbdz3kawVTrNQIdJGIYeKXE3J6S2LcfxkM5H9a
	eLFay2ykCs3HGXbvmUxMXVk3pW5Z7WeiXZxah41zaOdkJ/lde0gSUysPg2QPThGXKC4bO+7N30e
	fVtfI90zZgRPQA61D8F0udiXxeT3RidaERMmpG5thCRxvnw+tF1fJceeFCt1vfCA6JGBTBvcVBb
	tzRumN66TSe0fEx4EQ1cmx4uiHK7Ty/l+9ytxn1s7xFVAp53NbynPSeJSym9KTeETakkjEd1a0r
	X+zqQXeZehoR+TYGcMCvHyggjH25DeWorrHCGG/LeWztRIyrdlFf+A7k/vaa4B6bru+t7dQK4Ej
	y4MTXVYPwJcwSOjE9V5y07T2svc/ca/c4cPQlVaEiKhy/xPLZimsAVcM8oooEjthsu0mIJtn8Eg
	ezaGPSzrbJFwPvOgBnzPtTZyKzCoHtMrBLYV02vbQIoBcN3LEMyiHmHygxtDaGhpqDQUqRQ=
X-Received: by 2002:a05:620a:458a:b0:93e:d7f0:497a with SMTP id af79cd13be357-947aff97221mr964474585a.16.1794496565565;
        Thu, 12 Nov 2026 07:16:05 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ffa11sm745133085a.43.2026.11.12.07.16.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:16:05 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365f9a04c5so55342951cf.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:16:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFSsBfjcRilIecz7g8fQTt0OzTT+TKpuKuFf//5E6OZeAxklHhiZMpEhe3DdRJHPmVlImR47nHSs38=@vger.kernel.org
X-Received: by 2002:a05:6122:54b:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee1c298abdmr2507584e0c.2.1794496158519; Thu, 12 Nov 2026
 07:09:18 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 16:09:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
X-Gm-Features: AclHuK9Zmur2PVIdNvv46swJ-VbufJjxD1dvyJf5R-d3EopJYyWzLSJYUjPuDQE
Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] dt-bindings: Increase Renesas X5H MDLC PD
 specifier bit width
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> In the Renesas R-Car X5H, the module controller's power domain specifier
> cell's bit width has been increased. Update the bindings documentation
> to reflect this.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> I'm guessing that the maximum number is now 512 but I can't find
> definite proof of this.

As the Module System Reset Registers are at offset 0x900 + l * 4,
and the Module System Reset Status Registers at offset 0x960 + l * 4,
there is room for 24 registers holding bitfields for 16 modules each,
thus maximum 384 modules.

> --- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description:
>    Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
>    Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
> -  to 256 modules in the Power Domain of each Module hierarchy.
> +  to 256 modules in the Power Domain of each Module hierarchy. Recent hardware
> +  versions have increased the number of supported modules.

Just change 256 to 384?

>
>  properties:
>    compatible:
> @@ -32,14 +33,14 @@ properties:
>          are always on, and for which there are no MPDG bits to control them.
>
>        - The second power domain specifier cell is the module standby part, and
> -        must be the module number (0x00-0xff), composed of the Module System
> +        must be the module number (0x00-0x1ff), composed of the Module System

0x17f

>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.
>      const: 2
>
>    '#reset-cells':
>      description:
> -      The single reset specifier cell must be the module number (0x00-0xff),
> +      The single reset specifier cell must be the module number (0x00-0x1ff),

0x17f

>        and thus identical to the second power domain specifier cell.
>      const: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
