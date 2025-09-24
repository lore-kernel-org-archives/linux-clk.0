Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F81280308
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758700294; cv=none; b=hYiZjOpcAJXiJu1k1o90eE/KYglJXMrb2F5y7buAiNcc8GRe0vFTNE3wRxRGin6FgikatPX98gIm/FN82JYQ6sydUfDcp5jwG/IP1pwICkALPl3/BsUVR8RKHh5sgScm7cvxw/YpHAcFIc1eYNbHx96e1KX1coq0mocTy0atND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758700294; c=relaxed/simple;
	bh=aWLfvJIhJGUp5ivux4F05IzZUz29wUscuHa27oPNgME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/kDFFvnAJWNGYSJdjvIviR2SYZ2TewJ/hhn/EGVaHDYQ+Q9xmcREkIcnOiGduyO6jkzv7dnyT9GrQPVcpq5vk1BnUWQdYcA3gfTOLp56Nn3cb6ZPCbp3ZwSRqQMzh6+MsYjK3HiyIzBCungwEVw4OnbPmMjIxmv56O1NmESwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-55784771e9dso2700124137.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 00:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700291; x=1759305091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh+Khf6unZqbzxNHEU+Ts8bq4BIxlEWA7Rzthe6aDww=;
        b=vuzHYCy/JY6qJcgUXNs/C6FDyGMEa3o/zzcelsVFZNzvclFsJdp+40QXCa89WgdT19
         xKCTzu4zYQkeREY2NbNhQXQecftae5tbazDaNwLxMM55HD+8nM/mtOubsrUXl0P6zAJ6
         WCkru6MBDMegAsG/2hWfbWbGdPdTypuBsRyu8+Pe0vPL/Z92l8oxOdX1G0iRx6nStj1d
         ZqrIZ3qbOr1napeVpD8s+fcGDH/B0xGFnK9zL0YuOknSegXjv6jr7twEAmKCfMwKO2O5
         d7toc33dzyx/lKrSdQV12VkrYrk2b7uEJSDxkVuGSuAASPdcDxmHy96EWVfbaMgLfGgD
         e8lg==
X-Forwarded-Encrypted: i=1; AJvYcCWmN7N9aFGGwkA6JpgL++NFJtMj1NMMjwJdP/aeurueSnszW82RU090WT32Jw9McAuA3yIA3ItNeFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYczh3RXd4S2+Oy1IyCVF0LBeUMYhxjhRwn28m6pJ7gXEbQ0WJ
	HKxcOjMOsF4UjtWgrJnn5nKWsZs2Oj6gastsv4MYYNcoMQQMRPuSkrp1Uk4xBhba
X-Gm-Gg: ASbGncvRxzHKl5Z0HgQMok4GyhbdxLpJyqLg9zWequctCDO2m/o3uj2LHfZqPHgnEHV
	v/EcHPO51RG7ermi6U+9Udf1k1x9E/K3RXsh8+JMwkuwtcfYmUol6ZuTtAuOwYvLH96vZjaMu49
	TTkf0E3DWpA5J0jXqeRwaTwD/9Senp9AGMK/chgcJdWLD8Pco0ZfANhSts+Pbheb1nJQu/Roifa
	wWNFV098MCBY42L88/U1rX5x/7lvYt9Idxjz3cc4dAXO3zvKQzrxA2ha3MVI3UmynvFaiwpR5Ru
	8zDk76KKXubSZfBmAqemt0mMiJSYDNZjByMMjfHcyYJ3+BizL/etnkvBMUwByoOfatTf/dC88G+
	Bs/N+T6sH1pIpiM51ngDa28217s0MrEIgAQhyEcHpHxSkYjxS3lcSZN2MuCpD1e0VLmrZI/E=
X-Google-Smtp-Source: AGHT+IFL/SRqBtpOyHu9vy+alUItWQB2paErCJc+WBkxB6U4dtAMgcUeLVrk3BBplFB6m+yLAyW+UQ==
X-Received: by 2002:a05:6102:50a9:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-5a5769666edmr1849982137.13.1758700290962;
        Wed, 24 Sep 2025 00:51:30 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8f25b3cf97dsm1928431241.18.2025.09.24.00.51.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 00:51:30 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90dd3b43f8eso621466241.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 00:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ8WoQxlQ3kUaN3Yc+Jg3f/ICVfe3pOsEc25QAum3i8peyAnEDj4lDJwc074vW+dJsjG2goUtI9Xs=@vger.kernel.org
X-Received: by 2002:a05:6102:6884:b0:569:93c9:b572 with SMTP id
 ada2fe7eead31-5a57695d27dmr1659602137.9.1758700290135; Wed, 24 Sep 2025
 00:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923160524.1096720-1-cosmin-gabriel.tanislav.xa@renesas.com> <20250923160524.1096720-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923160524.1096720-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 09:51:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEDJZ6wdGZs_CDs=jLPV1u382o6=cZ1HfKQOffGf7jGw@mail.gmail.com>
X-Gm-Features: AS18NWCUnOtI9sni6QIPbp0MqkmfhYYAKBnwNUuJbeyYXQXVL2FCMeoJiSjFxRk
Message-ID: <CAMuHMdVEDJZ6wdGZs_CDs=jLPV1u382o6=cZ1HfKQOffGf7jGw@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 23 Sept 2025 at 18:06, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Document the A/D 12-Bit successive approximation converters found in the
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H / RZ/N2H ADC12
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> +
> +description: |
> +  A/D Converter block is a successive approximation analog-to-digital converter
> +  with a 12-bit accuracy. Up to 15 analog input channels can be selected.

The documentation for several registers talks about bitmasks for ch0-ch15,
so the actual hardware block supports up to 16 channels.

> +  Conversions can be performed in single or continuous mode. Result of the ADC
> +  is stored in a 16-bit data register corresponding to each channel.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a09g077-adc # RZ/T2H
> +      - renesas,r9a09g087-adc # RZ/N2H
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: A/D scan end interrupt
> +      - description: A/D scan end interrupt for Group B
> +      - description: A/D scan end interrupt for Group C
> +      - description: Window A compare match
> +      - description: Window B compare match
> +      - description: Compare match
> +      - description: Compare mismatch
> +
> +  interrupt-names:
> +    items:
> +      - const: adi
> +      - const: gbadi
> +      - const: gcadi
> +      - const: cmpai
> +      - const: cmpbi
> +      - const: wcmpm
> +      - const: wcmpum
> +
> +  clocks:
> +    items:
> +      - description: converter clock

Converter

> +      - description: peripheral clock

Peripheral

> +
> +  clock-names:
> +    items:
> +      - const: adclk
> +      - const: pclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,max-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Maximum number of channels supported by the ADC.
> +      RZ/T2H has two ADCs with 4 channels and one with 6 channels.
> +      RZ/N2H has two ADCs with 4 channels and one with 15 channels.

According to the documentation, both SoCs have three instances?

I agree with Connor that this should be dropped: the same information
is available from the channel@N subnodes, and future SoCs could have
gaps in the numbering.

FTR, from a quick glance, it looks like this module is very similar
to the ADC on RZ/A2M, so I hope we can reuse the driver for that SoC.

> +patternProperties:
> +  "^channel@[0-9a-e]$":

0-9a-f

> +    $ref: adc.yaml
> +    type: object
> +    description: The external channels which are connected to the ADC.
> +
> +    properties:
> +      reg:
> +        description: The channel number.
> +        maximum: 14

15
But I don't think it is needed, as the dtc check for non-matching unit
addresses and reg properties should already enforce this.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-adc
> +    then:
> +      properties:
> +        renesas,max-channels:
> +          enum: [4, 6]
> +
> +      patternProperties:
> +        "^channel@[6-9a-e]$": false

6-9a-f

> +        "^channel@[0-5]$":
> +          properties:
> +            reg:
> +              maximum: 5

Not needed as per above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
