Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9B2798F8
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957806; cv=none; b=Ki0kH+9Axx394IpMPnLsgzLPpWgYyHatZRkzAFKgrvHGqFXqG9mrJ67ZX4Q+vIxNabKGrLF6MkUVyxKAPjYP6eF7rTgE36TvWu63xi1vhNU2AIrdqafUNOSWK2ETWzzXFftzAgBFxwh8BlqmRAdud1yqlM0Z1X31xay+XUXhs2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957806; c=relaxed/simple;
	bh=SJLknyw1I7ZFIFDDTxB/kCFRzM1gjizB92r2iOvY5U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIkx/W+XIZVUYz/MGe5CnFl4usGYugzdl0Kte0CA3n4J4nPAGPpXIXNk41rcNTlwDXxO4swD+Sm3czq/I6RxhL23pcaKlEqqBiKk0XIBw9H2ZP4ooVuMnQvu3bHC2gp8NIiHpxQ1gDh1HaJGzWpIYJFJ2iBUeClnj3eVCMlivhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59cd803792aso2005868e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783957803; x=1784562603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSAbD3g9v/Qpert4xOPXdfLiWxHZNX0hf2rnp4eCCEU=;
        b=RlS7AZqcVgFsjv4X2OqS3tlf3nTTLkoi8uxKtTFLEq9P71Xm5T89jkQ3l6J1V0pJ2N
         y/qL669mqCCBlwC/9wxz7Ob5xdYIr4ClDded1trDOyKcZYZXEOMFbuJ1pcyDds58IzYM
         jbwJnal6pTGU/YDlbL7AK14DeHufA7Z6Q5kowJGkLqo5IPhx7mA08622Io8jxM/B/U6l
         HdloFq6q1L1L5F11/d6bfQmpR7Zw3xxqEGXjSAn66i7TiCj+ISnRXm1aPnNRjiLgEaW1
         9qtKJ0DCDrRfFU+YggKIYGCco2TRs3C+6fDaY+pTqYNNnzL00YLUQWjYbsw9aU9H9s7r
         HvjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpjmx3xXQabHB1Av8d5Mm/aQA4jVAGdCvk/emk9isdPUCy6a+bnB7hq7z2w6zgUo5dxhA6X/7aLm1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGosWlvaBLJtyYu+NjfiW2coPxCBxxY0NqHQIuhMWA5PUUDf3
	0YSjAS6ZJ8mOsLL2L9/3zEnR4pNKk90bU6QPzD3cXLZBgbdjVLzu3VCMl39igEnfNaE=
X-Gm-Gg: AfdE7cllM/FG5snvkvM5Ss2OZeGbwtkB5Zhv+wfz4OuxR8Drhw0hud5F8+6KMwXGgNz
	ujRZZL3gZiYu4wbQ3cCBJkomFWkWEBoycdiJVTeNg7lNl7+PT/mmgPmtJaZ99qrvJPRmRqvKEPd
	ewWvRWS3kpwVyYabi8PStxikk0tDhPGV8DFkWVTFLTarYp7BjCCIdQBl+qtyMONNa4qhKogJwrq
	yqkJq6eDeNooJKUIrfeICbKaeMZrz667Thsz8M7SlhYBwjE0egXJUBfK/XcnHqCqBumyPSbLmPA
	lPvOYkO6Sh0mQx9JVjYvowv5RyOVQP6yoanhWOy3Rhp3Sv19phCDxp3zmz/Zec18n1PSRkPCtpD
	BnP9LNq6yJ+838Q/QD+TNxB34+JaH39gc/AkHTjfY1jRoc1otp/lExJGEGANBixRGmeFZML9/zY
	e32qci2x1V09XreHlyj3R0JIcBV9Ci35j7K8UB4eL7g0U3xe1LCANqcpQQ+C+n
X-Received: by 2002:a05:6122:4f93:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5bfbf0f4baamr6681907e0c.4.1783957803252;
        Mon, 13 Jul 2026 08:50:03 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm9256738e0c.7.2026.07.13.08.50.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:50:00 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73b7c3791dbso1688670137.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoRCIa0+b6KS/JXSQ1vcUQdGzFCKIZIfyQPFbc8QIo0ZlPHYiWFxRp/d7VXmOvWjtY7fgRy2Hq/Gtc=@vger.kernel.org
X-Received: by 2002:a05:6102:5605:b0:737:bfe6:3b03 with SMTP id
 ada2fe7eead31-74533bc9032mr5400397137.7.1783957799562; Mon, 13 Jul 2026
 08:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
X-Gm-Features: AUfX_mzILeHyjNiTkrmAQtVDJZX8rJj_P5qd9dfYE_6VlS_CSrZ4h4vly_PscUA
Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-power
> management and access control that reside within the CPG/MSSR address
> space. To properly represent these hardware modules, allow them to be
> defined as child nodes of the CPG/MSSR controller.
>
> Update the CPG/MSSR binding to support child nodes by adding
> system-controller child nodes using a patternProperty, requiring a reg
> property and a renesas,sys-block property to identify the controller
> instance.
>
> Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> existing bindings for other Renesas SoCs remain unaffected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit message.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -99,6 +99,41 @@ properties:
>        the datasheet.
>      const: 1
>
> +  '#address-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the address space for child
> +      system-controller nodes.
> +    const: 2
> +
> +  '#size-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the size of the register
> +      blocks for child system-controller nodes.
> +    const: 2
> +
> +  ranges:
> +    description:
> +      Required for the RZ/T2H SoC to provide 1:1 address translation
> +      from the child system-controller nodes to the CPU address space.
> +
> +patternProperties:
> +  "^system-controller@[0-9a-f]+$":
> +    type: object
> +    description:
> +      System controller child nodes representing sub-blocks for
> +      Low Power Management (LPM) and Access Control.

According to the documentation for the PRCi bit in Section 11.3.1
("PRCRN : Non_Safety Area Protect Register"), the low power consumption
bits are in the xx28_xxxx blocks?

> +    properties:
> +      reg:
> +        maxItems: 1
> +      renesas,sys-block:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Index of the system controller instance.
> +        enum: [0, 1]

I am not so fond of such "index" properties.
And of subnodes ;-)

> +    required:
> +      - reg
> +      - renesas,sys-block
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -126,6 +161,10 @@ allOf:
>        properties:
>          reg:
>            maxItems: 1
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        "^system-controller@[0-9a-f]+$": false
>    - if:
>        not:
>          properties:

As RZ/T2H and RZ/N2H are rather different than the other (mostly
R-Car) variants, perhaps it makes sense to spin them off to a separate
bindings document?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
