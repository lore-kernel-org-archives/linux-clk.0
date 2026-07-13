Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBDD30567B
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958106; cv=none; b=li5oKgfXCJ89hIS2FZYw0tEByKteN3strynfDYtCRTwaKEeVvf76z9fSeSQABBOp8Ti4Xsu1YuHX3goKGXOarzFfEsnNAvf5MU6bhC9XNGE42oFmc7iQz8Booa+7UOOksXOcIgyKIkAWxCMPjkZGscwM+sK7HBqcs1Ko14um9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958106; c=relaxed/simple;
	bh=O5pyFLw83Ql+8EIFjSrZ0kqwUIJfbEiI35BjR/8WVDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF3gfZXT6CjEbmHZobzQZwRc3C5GeglwQYMPWPyNdtVQW6rE96wu0oF3WbIFCqulK5srITSTbY+nSrer03vFUF08tATbOerMoUqILtaOMt/Pr4kC0pbE4VmwGFzgn6XJ7EpQAIpfbzwznK0AK6wONbCvvraYk3PmmjYqJwumSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bdd0779366so1013194e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958103; x=1784562903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dGAf88p06+MskhwY7uBe/JNJCrwrqcblSzHwwgSV5+w=;
        b=mBOrql9YXtsbw54Z0WiQKYtjlIQFRUEp/VWRUC0dzFN215O825jvDcvi4LlkB1Jbo6
         VjgxTw6hYze+ja+VgMgbkCnCJD7glTgAVJBcM5UMiLM6KslstpvTXgUZvhqEt/ANc3TH
         4Ubuu/9/bBZ7yC7/Bgzun20AS76Wo/p6w42m+9xVRA9YAywxTCNdBYeN5Y+WNbv/jiTu
         lzf+sRIPrfvTpkvlrQk5iTcNO6P4bs9tYNUxwKLwdCurDeAvtbKWfXxt4J4QXuCGgomQ
         lHKNW2UZaDA4Nepr4/+hIgOwaig0+t4VoZ34qXMafhbEjLTrX0xfIzFQRPCiOgW5OdYO
         Y5fg==
X-Forwarded-Encrypted: i=1; AHgh+RoAcRyDBWqqx05+6riow/QB+DblRSd08v4Nr6DM2hY/1SoKSftc3KOJjiHMMt8kMpi7mYDxndoQV/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzwnmabNmgqkjMPLRNEek6oUR4EBbqlcv+eDQYNejqgBspFu9
	Z9J4TJq8A9DfV7LcoCicvKDQtCf3CS/pvB88HPILZLdqBOr1HTPpTOhL0f8MQ5TIQVQ=
X-Gm-Gg: AfdE7cno9KN4OqyHGDMHBPN1vKXcdP4xTjXJ+QUPUmR1Vmh18LKxTZOLciXbwDwKhGL
	7qV4GuVlSSmZk1SVqWt9NO/ZTuCHsvywrNbFsPy0i7I6KX6sQDyvm6T/K020C1WpLswCA0Rcs9W
	cSzGwKGUuM2bNMk9TqFnHZWNFqjaLea3lrqUQJ2KP7LfQS+y9/5Qmh9DFJ6JyNEQUthKV4lzbf5
	NlxBEJgWNfoz0howO93+BA6WHniOxjsDOyxqd7qhTcaKYuk+TT4aKXLB8k79s/g0PnXeULuqKnG
	2qxIvqo9sNwCI2MLHNnfsnGonzXdjtnQOYbdQmQVmSdbnL3IejR0JsQkxweNUzZnKuOUl+KeL0W
	I3BJtZaVfHnuPDcBGZfArXX29/egdv3bLMRq/0wM3uvkkaNmypJUurKxJbru8ukShgapcs0n2H1
	B2nKtSAtWu0FRzsEoXaRJ0DynxyZyfWFBoLnIkY6cREqDyTgtZ67pPxxtlzbkY
X-Received: by 2002:a05:6122:e461:b0:5bd:79be:8f3d with SMTP id 71dfb90a1353d-5bfbf0d83dfmr6358293e0c.4.1783958103374;
        Mon, 13 Jul 2026 08:55:03 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e0f38sm9601758e0c.2.2026.07.13.08.55.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:55:03 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9690c99c917so1042849241.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFA9OP+oMd3UsjYyLxRlrJrsDO/GEJdaVS32EyU+l/+dTT33yRfEdLRiXLKQ34psEZNU6qvAvbT5Q=@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:739:8c52:f2b with SMTP id
 ada2fe7eead31-7457e8e369cmr48584137.18.1783958102735; Mon, 13 Jul 2026
 08:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
X-Gm-Features: AUfX_mxzgD_hAyuoiso0jWBOVR76LgHMAUSKVimBZKTOAwoA2LG95DcPvI9LrPM
Message-ID: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Add SYS syscon support
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
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the System Controller (SYS) block rather than the WDT
> address space itself.
>
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the SYS
> block consists of two distinct regions (0x80290000 and 0x81290000) that
> contain registers for multiple peripheral blocks.
>
> Now that the SYS driver provides a unified syscon regmap, introduce the
> "renesas,sys" phandle-array property to allow the WDT driver to
> access its control register via the system controller.
>
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - No change.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> @@ -48,6 +48,17 @@ properties:
>    resets:
>      maxItems: 1
>
> +  renesas,sys:

In Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml,
the similar property is called "renesas,sysc".

> +    description:
> +      System controller registers control the start/stop of the WDT, and halt debug.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to system controller
> +          - description: watchdog IP instance index
> +            minimum: 0
> +            maximum: 5
> +
>    timeout-sec: true
>
>  required:
> @@ -73,15 +84,29 @@ allOf:
>            minItems: 2
>          clock-names:
>            minItems: 2
> +        renesas,sys: false
>      else:
>        properties:
>          clocks:
>            maxItems: 1
>          clock-names:
>            maxItems: 1
> -        reg:
> -          minItems: 2
>          resets: false
> +      allOf:
> +        - if:
> +            required:
> +              - renesas,sys
> +          then:
> +            properties:
> +              reg:
> +                maxItems: 1
> +          else:
> +            properties:
> +              reg:
> +                description: Deprecated. Use renesas,sys to pass the offset
> +                             of WDTDCR register instead.

the index of the watchdog IP instance?

> +                minItems: 2
> +                deprecated: true
>
>  additionalProperties: false

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
