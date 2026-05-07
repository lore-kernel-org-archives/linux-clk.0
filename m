Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8940F8DE;
	Thu,  7 May 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163182; cv=none; b=Z2v1DWu/l3j8AcIOWxuYIql5M4QcPEsZ7mf+3FV/3LeVeKZTpaup1+RH+u09CP533A+voWSh/NiRrVVlvRDijRULcSyiiAuSMXsCTz2OGQgIeqUBh82TIR/DBgtZVVKc36VKr1BIvmsxK604SPbQgEifrpZiDylVOiaKR6OG3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163182; c=relaxed/simple;
	bh=qO+TPGjPyIU90fyNONfH8qQZWNpD/rEJEKB057F0kQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSFXyEPFOsyy0wRx/C0HW6dM7O8RoCrB6dIQ9Uekf13wuEM2F54EJ3DS0CG0F46y51PgDWphQxp8YRHcRTwssc687224sZDyI1Rb8mTabG5hkXdcfpiAFhzrKvnuR3kx+zL9J81GeDHHtQXilqD4UtH//tBdtYR8Imhs4a/UY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2085CC2BCB2;
	Thu,  7 May 2026 14:12:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	robh@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCh v3 1/8] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
Date: Thu,  7 May 2026 16:12:57 +0200
Message-ID: <20260507141257.436456-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-2-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi John,

On Thu,  2 Apr 2026 18:31:19, John Madieu wrote:
> RZ/V2H, RZ/V2N, and RZ/G3E support external audio clock inputs
> (AUDIO_CLKA, AUDIO_CLKB, AUDIO_CLKC) that can be used by the Audio Clock
> Generator (ADG) to derive internal audio clocks. These clocks are optional
> and their frequencies are set by the board.
> 
> Update the bindings to allow these optional clocks for all RZ/V2H family
> SoCs.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -26,16 +26,24 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: AUDIO_EXTAL clock input
>        - description: RTXIN clock input
>        - description: QEXTAL clock input
> +      - description: AUDIO_CLKA clock input

There AUDIO_CLKA clock is provided through the existing AUDIO_EXTAL
input.

> +      - description: AUDIO_CLKB clock input
> +      - description: AUDIO_CLKC clock input
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: audio_extal
>        - const: rtxin
>        - const: qextal
> +      - const: audio_clka
> +      - const: audio_clkb
> +      - const: audio_clkc
>  
>    '#clock-cells':
>      description: |

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
