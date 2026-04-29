Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01882175A81
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463427; cv=none; b=bH8i/vS/L+TD1broDwJModaKPsYam/19VA2ra7LIiBEvcqjUIb0YqpD5+tnawtaYl5PSxqlEsEsUC+BuUfz+UQ0z+p17B45cMsEu5mgwCzvjPglS9d1masAzUMAi3pOmhPKOsAPtiAEkV484fQaKIwa3T4CZxjjl1gIQgk436yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463427; c=relaxed/simple;
	bh=k3006wJqxnTat9Xj8MW2QjrO2YW2+jD6t20DobBX4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHiNetfesJYZsAEKVcofjT1QuY8cUmBAmDoaUgoJOFiv3OtaWm/dyvgdzspCsIZ198qt1wzhKsk9QeK84Y4nNp8pNIvT6FiQDwi4nmDjPBu42bZ4oWII9TAa3Y0QlAbxOVsoVQtJAjFuz0GewYvG9vD9ewKSBsN0LW+bqaUR/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so10458671a91.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463425; x=1778068225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07iUR/sIOeK9OY28Ao/jBJ40ezKJgRa8Xi1S5qNmXhs=;
        b=IMMOob1KBFXObysepYqdLqGtg/lv7uzjhlu6vj8dCZ5YIz4qNuwaUs16QNimKSMZK6
         oYlNdJTmNNUjRnm7mjpqFL6JNJYELQALlorCoKAxiJa/bwDcxnYuNFxDqgy2mEBrb+99
         Vjb2HRLaQNbOvdKiJiK/tEPXwa0UsOJqtUoMddTqQuIbcrthu76cKcH7UNZTEoJD9RBS
         ukgbE9OOhhQy0HOcMwB4juJUqrt0yhDnSqabv9cqxuijMLht3Q/mKoV39mO43QpBSrJB
         bu1/ZRInDqGzcamPLO2JWMOlFpLhSYYvQfTnjUZIAAOQUI2dmd2OhxmaCZWMr5wlcgdG
         hQ4g==
X-Forwarded-Encrypted: i=1; AFNElJ+YouLJQewdH4dHFyQeUsOrOxb2mBbg74Af0ijq2aEcGfc0h1nwW+pRss/1/2V8JO8uFgXHdzZlZGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkWYaWpZTrZFHy1w/KLEqCv6/Va6IPjzW83ylVkEUkERd2yHa
	p0RVfxXvzrpXBgv1IN7Qb1IAoG7FBihO2NNpzwCvUAmyHhpm020VJALUPeR2IgqAJtE=
X-Gm-Gg: AeBDieuOk0UoxFUojhQkfa2uwyZgmODJGlyMHFWQdFIUE8akTccVJDK9bxL1ZDCL89R
	RC7icU3yE37mDh9n4axsxLY0gRFYYU3ETNIPKHTX5UuF2dvBgJXxeWGFSRx3PePYmHHeOsFe0+h
	uzsXxDs1ijffHhechSSxfT5LOdr4f+HAkR8zwHJFz1phsBxdfapL/8GUVjtm9+REJibeXJoFdme
	RfpxcW0UHmUDY2ibaupKP/wl6oPKCkzvEZnphrQqMj6wHKcWASCPbqDS9wqZFUzOYYToTyXL+Ri
	x7Hxeh1QOHTPEOnzjDqe7dUbVTdcqcMIShbsf90kgTaqbeIO17UKHH71TJM9L3QPBdh36e4U3qS
	BC6AYI4pnLGYK2RVSNCByE3ItHFLt2aBzu4sS6eQnWdXJmbwcporT5iVNNzFtZvsasOT2KE3Yvf
	uvrSQd3rY/1TyngXJar1K/ZffFyuem1hWJNGwcO5r4v2kBREpvyWHikjKsT+TZbk77qBAKvdtcI
	Hg=
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr3506376a91.2.1777463425261;
        Wed, 29 Apr 2026 04:50:25 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27f32b1sm1193678a91.5.2026.04.29.04.50.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:50:25 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-827270d50d4so11361394b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uO9ve0w0KeF4RrZTihzTeUST2Abe8YNCBJjkv0emyE7gad6KCcTsNwMGl3C6Wd2sHehkRfR2SZYo=@vger.kernel.org
X-Received: by 2002:a05:6122:8b0c:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-573b368cf79mr1448638e0c.10.1777463106983; Wed, 29 Apr 2026
 04:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:44:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
X-Gm-Features: AVHnY4LhTK0YHEkXOgViPxtDX3drSx5eXMIsHWPwRkcxiJzGfAV6beExDjAOpFs
Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,12 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
>
> +      - description: R-Car M3Le (R8A779MD)
> +        items:
> +          - const: renesas,geist    # M3Le Geist

"Geist (RTP8A779MDASKB0F10S)"

> +          - const: renesas,r8a779md
> +          - const: renesas,r8a77965
> +
>        - description: R-Car X5H (R8A78000)
>          items:
>            - enum:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
