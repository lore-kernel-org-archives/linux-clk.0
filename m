Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D630E82E
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762778992; cv=none; b=hxcIRgVxcCnEAyhHU9xdfB/AxQYXfkJWF57h1d98H7cPAAgKJnmWhOd6UiY0NNhMNKGHN2yxIO7YwsNrVTwZZwzRiF6ZKTOuZm1LYMKnalls7LIRkKhatnrK2/NSGPQhXPsLVNegg3XF5p/orI3BqzShtMzuYRRqX+Pac8ela6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762778992; c=relaxed/simple;
	bh=cAw6KDVicFMiZpuDduunfg3+w/yg4gN+HRNZWYDOi/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcKEl9jwazG955YDJIgpV1tUFI8fhQ50/v4xHFvejl+SkHEx6PRCfWWZ6b4JEC5fjNcBilJnTsYhv+iKMGxtx34A0Pw8ZtxvD/1TQuyc4VIcs0pqb1/MtuDM2wEDr8u8gP+SzLaTVbpwtQU3nqIl9lpFLf85hb1dEUjLTJwUstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5db469a92f7so839006137.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 04:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778989; x=1763383789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh17CiieclZAsVeAhUA/WaKqsZ8PVmhh++ya3iPI2Ik=;
        b=sF7d+f6CtgsntpHnSwLJct8/XYYzFet7edOLTSjet/HRVwJSTkh2NI81jnhkyTQcey
         WbFee67PQJYQSFy88UDF90yG46aCkk/9IKcNjUQVTMRSMcrbZg2ilOxObLhVBpcIWOMi
         he6V/uOMY3G0q4rjgjyIBnT3Yo19XoAGs+52BvSgt6xGE+dT75ycrDuhhYTmTS0GoUYc
         NQM8zu5O6M/DyN3owTm+HDzCVXU5l80IDGync7smSvAFO7IEFV0NgPp1XArzZMkAZAGQ
         aC0+3ChJG7wFNMWXF70maD0l3n2Tkw5Wd56MKepGcD0wCd2Hgd0JOgt1OC5Ue0NUxNFQ
         SgTw==
X-Forwarded-Encrypted: i=1; AJvYcCWgRH5Cq/CwLva+M13Fc5q5p1Yv8UOy6ezy9sUl0gHKQ3pQlEkWv99/uHdbln3onUmWQT6jWj4+i2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnsPm02ju+3egZcF8rA5U1Vqno6Wzh9ngkrec3WqyBU8Q3VF9
	I852zX5wXchNuy8sqz83/+b0h4HuJut+X5FsXGtriV+4O76eJ0UFzB1wHHijPDAy
X-Gm-Gg: ASbGncvorkQGHBrdGabg31JVpNf5CyeGeSBuHQbE17TG5wmfb+cZRMLv36mAAtAzXgt
	oUR1CytWTnJ8qyDrrov4Sqyyk8t2ZDr4EimoagdSOeyL5uoQAJnSgF2ltWYaltzwZ4Iw2zNuS/d
	arxyoLgN4b3bE2+2b8N36YsZGHWLRFnilHCxex9oXFaLbej3eqigdYdeJQ0iNwT1ur68E9Xkh7q
	oX8zmECIdmNqStsL+0PqBmW3+MnnAYNC3qbNE7MR94vbbbFIm/ieaGBjdnr5So+XFj2q7Pju0YW
	jh+p3WqNq2R+fo5pFUItIDyXiQoz5AqBuSEIZVvXfKbymPHEFmrrPrvzGwCz895/lhC8PAhAOxk
	vCwANQ2cYD1HJ/CJhGSc9VJdDZFj8GHDFCEpSMxm01YZ/VkDQjCbtsaJxUjTDdb+iFsQrLKvxAX
	83LugOdzkpGpMXyq8KamCjIgJacpiin9JUzHVRkw==
X-Google-Smtp-Source: AGHT+IHvQVKeajMFPe2dCRgrGr47idluvIUoTD4n0uHW4Ot0oaoTVV1Q9rWHvi/076Qc4Ab55Vf33w==
X-Received: by 2002:a05:6102:dce:b0:5db:e338:ba18 with SMTP id ada2fe7eead31-5ddc4839d63mr2333772137.37.1762778988978;
        Mon, 10 Nov 2025 04:49:48 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708522abcsm5819842241.0.2025.11.10.04.49.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:49:47 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9371f7571cfso682863241.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 04:49:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgfZEWxvxaSUCq+aEhmNPMnPaNMf9L+2Stq/SlhIUmFvRGaiZFvAoEO5eqbXyeyogOx6Q3O0ZRLwU=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5db:f352:afbd with SMTP id
 ada2fe7eead31-5ddc467ebffmr2222725137.3.1762778986813; Mon, 10 Nov 2025
 04:49:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105104151.1489281-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251105104151.1489281-12-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251105104151.1489281-12-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 13:49:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTH_uuQURgqQrg1RGDMwzdDAWFk__mS9+Gc8mcESfUyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkfRzk8FN2qNNCBLlLG0XaTRUdRgwFG7IJoHivC4Q2Ld9wLwHCuz85ymR8
Message-ID: <CAMuHMdWTH_uuQURgqQrg1RGDMwzdDAWFk__mS9+Gc8mcESfUyA@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] dt-bindings: spi: renesas,rzv2h-rspi: document
 RZ/T2H and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 5 Nov 2025 at 11:44, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have four SPI
> peripherals.
>
> Compared to the previously supported RZ/V2H, these SoCs have a smaller
> FIFO, no resets, and only two clocks: PCLKSPIn and PCLK. PCLKSPIn,
> being the clock from which the SPI transfer clock is generated, is the
> equivalent of the TCLK from V2H.
>
> Document them, and use RZ/T2H as a fallback for RZ/N2H as the SPIs are
> entirely compatible.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> @@ -9,12 +9,15 @@ title: Renesas RZ/V2H(P) Renesas Serial Peripheral Interface (RSPI)
>  maintainers:
>    - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> -allOf:
> -  - $ref: spi-controller.yaml#
> -
>  properties:
>    compatible:
> -    const: renesas,r9a09g057-rspi # RZ/V2H(P)
> +    oneOf:
> +      - enum:
> +          - renesas,r9a09g057-rspi # RZ/V2H(P)
> +          - renesas,r9a09g077-rspi # RZ/T2H
> +      - items:
> +          - const: renesas,r9a09g087-rspi # RZ/N2H
> +          - const: renesas,r9a09g077-rspi # RZ/T2H
>
>    reg:
>      maxItems: 1
> @@ -36,13 +39,12 @@ properties:
>        - const: tx
>
>    clocks:
> +    minItems: 2
>      maxItems: 3
>
>    clock-names:
> -    items:
> -      - const: pclk
> -      - const: pclk_sfr
> -      - const: tclk
> +    minItems: 2
> +    maxItems: 3
>
>    resets:
>      maxItems: 2
> @@ -62,12 +64,55 @@ required:
>    - interrupt-names
>    - clocks
>    - clock-names
> -  - resets
> -  - reset-names
>    - power-domains
>    - '#address-cells'
>    - '#size-cells'
>
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-rspi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3

No need for maxItems here (already at 3 above).

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-rspi
> +              - renesas,r9a09g087-rspi

No need for renesas,r9a09g087-rspi, as it implies renesas,r9a09g077-rspi
is present, too.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2

No need for minItems.

> +          maxItems: 2

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
