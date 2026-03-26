Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB732367CF
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539184; cv=none; b=uFiAPcJi7O7/VrcMA1dEBfJj7lP42h2JB3fBsJpeSk6FfrOZI1FLUk4yfgtDOKWb9gqAQGvMkETq+CfpE2DdnDMpJM+wQqkOt464R2XkYilTkWsKEfDAB5f+pKTjr8PMhAJWX3etzkNSW6uqfn9oyclra+bKYL76RUX6cCaT2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539184; c=relaxed/simple;
	bh=peWwslY60X5deNxQgqJv7OYyoSx6v0JNvTUpeeVZ1q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YiBMy82oUx4sjiaSLUfRZ97rVcvfMz2X6/FHBUVSMLUYdxCnae/4DLvpm1cegwiR23y2meEc3gRfxQPE7BkqgSJHwnlHzVkUbSkUop73a2o/58hL8G71oPTYirD9OWuGePwy4ccOVrM9JOaLMlBQJRY/lRmysyzsJtXY7Pe0ssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d36e7d8e6so523281e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 08:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539182; x=1775143982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICY5En3i4NzNQi5qrag5c9s0SZbURVLCotK2DvpExx4=;
        b=MIh3OS56jZsQFEnicrMSavueqYlXAXjwLerCLuDOLS8Fh2IZwLO2gg4UxflT/GEv89
         2YgdcMLIXQ8EVFuZQM5VDJ5LJL7+CFV9pCZIQ4U07Ux5YTVXApR9bMZ8XvWecELSmwWQ
         hKqDLn6jNFRLWrlEJQNiZEGxvEMn7WBmOn4UU5sueMN8lTG888TuPH0ravAXMnRB75Cd
         8aGiV7zwO1QvxVe63eJEl0J2bAMUj0YvwDwuUOtei/9vDM5xVyWThXC8/RO74FLWJAuh
         XbjcGWcDM9zPgApOYMZFMRxeIWyNYJERmneaqE0GseeqViiv3Z5cyRpEjfXn/n59dlre
         MceA==
X-Forwarded-Encrypted: i=1; AJvYcCXBV8CGSS8tE38Fn6kdn5l/JilF8QWesqbQTXDDDq0MnqPhPbc3g1AUjzBfUQ1JLTAbAu2uLwpNMiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO/x8mIaHgu+iwjqzllz28sRRG0GnHEwgpQBWq6ectpNjsUgz
	1zqZu/SuRtajqHCOWyJswbX/W0pb6PVgPUo7itYRD/f2i1Vec4rGwvd+I4bOmDdUfu8=
X-Gm-Gg: ATEYQzy6v2M+eAZN9pL+bdIt84M9gglnnfIvEh+aye5vSnQ6cL6OFMt4cRQivKyY7lD
	/yYAKoCp5Uc2dL8Z3K/btFO7O13STMwgQF3DMWHlRA7MtqrQSFkAmElCJuYVSJrvfNaWJ26mR6t
	Tf5X8IRE74B9Z+ufl3nUFdbYzz5LDwT8Ec8SK1cjryelEWgrASNWi/V5bML1xBQ2G3sqr6DNaSD
	K5JdTs0wf/UUujdJlhiijy+ntNC+2pA907b3AGtUlweviHlm/xvjtmIRZJ9pOjm7FTDDBzUHf3y
	a4f0CGb/Cdn28naIKoXOlY07i1DQ55BBHUlYKNAku1IcDSwWBWLrO7I07R5uiqQsRYooWqrZMVd
	EFlk0U2M5i4oP3P1rLH503iE6WlVsYnZYYhArH64j45DoO67P5AkvXD5J3jw9yfkSQ53dGxd2/6
	XcPtHKBEtLnGcAbaDJbwfTBVQycwCFF1NsC/Xlqn/tCco2CDWJH+6PQ8n1OpGW
X-Received: by 2002:a05:6122:4b0f:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-56d31e13781mr2388092e0c.3.1774539182129;
        Thu, 26 Mar 2026 08:33:02 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c29de8sm4644901e0c.6.2026.03.26.08.33.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:33:01 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-602b7085a52so762719137.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 08:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+kwFwaQmEFJs9ZmKJgVx4L5Mj7kMB54pKnSoL1s+Gs1ko2/JqPxrYWgZ629+bfHVTWpmxh3LoRrM=@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:5f5:2539:9b11 with SMTP id
 ada2fe7eead31-603870ce0f5mr4152226137.14.1774538871002; Thu, 26 Mar 2026
 08:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com> <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 16:27:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
X-Gm-Features: AQROBzCXM6uPDs6UcVr58TTtg0-_14CRbEgbIPerOfaOzDyxBM9HF9kuEp2hlRY
Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> ACK signal routing through the ICU. Document the optional second cell
> in the DMA specifier for specifying the ACK signal number.
>
> The first cell remains unchanged and specifies the encoded MID/RID and
> channel configuration. The optional second cell specifies the DMA ACK
> signal number for peripherals requiring level-based handshaking.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

Just a quick head-up, as I haven't read the actual secion in the
documentation yet.

> --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> @@ -63,17 +63,27 @@ properties:
>        - const: register
>
>    '#dma-cells':
> -    const: 1
> -    description:
> +    description: |
>        The cell specifies the encoded MID/RID or the REQ No values of
>        the DMAC port connected to the DMA client and the slave channel
>        configuration parameters.
> +      Use 1 cell for basic DMA configuration.
> +      Use 2 cells when DMA ACK signal routing through ICU is required
> +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF, SRC, DVC).
> +
> +      First cell:
>        bits[0:9] - Specifies the MID/RID or the REQ No value
>        bit[10] - Specifies DMA request high enable (HIEN)
>        bit[11] - Specifies DMA request detection type (LVL)
>        bits[12:14] - Specifies DMAACK output mode (AM)
>        bit[15] - Specifies Transfer Mode (TM)
>
> +      Second cell (optional, when #dma-cells = <2>):
> +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> +                  where 0 is a valid signal number.
> +                  Required for peripherals using level-based DMA
> +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).

How do you expect this to work? #dma-cells applies to all DMA consumers
of this provider, and these SoCs already have DMA users relying on
#dma-cells being one.
In addition, you cannot have optional cells: if #dma-cells is two,
then all consumers must supply two cells (of course we could switch
all of them to two cells at once).  However, as zero is a valid signal
number, we cannot use that as a dummy when no DMA acknowledge signal
number is needed (we could use e.g. 0xffffffff instead).

Is there any other way to provide this information?
E.g. could we have a table in the driver that contains this info for
the (presumably few) MID/RID values that need it?

> +
>    dma-channels:
>      const: 16
>
> @@ -212,6 +222,20 @@ allOf:
>          - renesas,icu
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-dmac
> +    then:
> +      properties:
> +        '#dma-cells':
> +          enum: [1, 2]
> +    else:
> +      properties:
> +        '#dma-cells':
> +          const: 1
> +
>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
