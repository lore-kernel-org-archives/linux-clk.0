Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81EC3DB338
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577025; cv=none; b=Skx6Ys7yNEh/IgkVCHLxbERnp/TfPsEoDJm5zKI+pLvVhumQhXnlQq6Z7MrZi15REgREesoCEILfuXp6UQ0k5s3X223yJE+fbwAZQfhFrZkED8dSaD2wyTh2OT4nwef1rtuMoP52zZJipyuWCTt8AAqxhwTWxlSzY1evKPAzqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577025; c=relaxed/simple;
	bh=9+GSC26KP9x8VFStwlQNXOXJrB+sq+AeP2Y3FBXhgHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWKikFuyG9ro+LWWXbp+25ZpiFHbgXS4kRkt9RnuIvOBFZcEQhwyc8P/tGA3qANxk9c8FB653W5DyZ3OHZe5w9hsaLt3JKKZKEBpI6pQvJ5lZLnAUj9K00N223N0gH1EP58JK1svOs9PHz//dKppYuspzelvf7PL9ttp1SYdCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c534af2470so462438137.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577023; x=1781181823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwkE2UGx4d0O/VfWYwU5eSId48QfcIZRSOkCnuIrTXw=;
        b=rGCP4BlQo+lt7NsSwQoihNpp4fncu+6nPANQlWTr6kKlK/heS1vbqQ7JMk9Q5+5i9q
         9I/NMUPLE9lNFIZ2HwRVySbGkZIZY0JJFD2X+LovkfsoPlFqel+u2mQxuVN5rztGuKat
         LPwI/EBQZtyJbzAaectxNAVJwU1HCRY7YYb+YbOJ9XWchUD5sEhF1kiHPwzfhfIsb/Oz
         wvlnkIVp0GezkAIZfBQqxzUhEb2xevbWt5zmTOCZd+4YL8OLeFWGu4qIYWoyP15qhlSd
         4ctV2LnZwzFI6tF0c/7efYhRbt/d+J6TBHW2z/gFe1O5PzVHlYYF0L5w7PpGLaIX8dbQ
         mmzg==
X-Forwarded-Encrypted: i=1; AFNElJ/ALDnr14KNfNlazEHFHFlUETiPk/8xkmD1PO8TpAgKuEnFq4xkBkzQOhhhmJYRv6hnS3lFXY2buak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx705PVQZk+KJpQISXfd8Udk9BHbnYu0l5YzsfRebN0Lq421eOI
	cwHFpWTsl4JBhDc4gQZ+2NHu0xbxgFtyC8RWOSSGolZc5XmFOZqqashxRGn0uDKXBD4=
X-Gm-Gg: Acq92OGiPB/k/h9XJzRbLPvHON1ysh4/QnbFEdqLoIUUtopvtuTpL96kGDpXPWWtfy/
	eMY4T1SQu91stMtdFw2yWiuQK2+fsTER8t8wphj6I9PKiRyWD6UiTxvKovoP6MtdEFbsZ7Vy2lf
	O9ckjvt+MbxI7dsFuwvXiIDyS3skOacuXyxpqsR4uxonlq7vntbZbUyx1hQw0iIWDQvIEiMSXzI
	pmmKdujuo2qBsVHbKwgActP2QZVPd1N46/+2SC1TNGdnwLIh4ZC+kXwUV3cUnwE7xWRegedwTPf
	oLpZXHvbAOrHyk31aXls0VJRHexEqxz/Q6FVs+wLBOefa70tEL+a8eICCeFapsR9MEk2rYYJdZl
	eNGkqFfLoIyE/yurp9Fof2Z4OC0g8/Ezk9Zkqffy6rJ47Jhdf4sbC8EKns+BGcynQku/xM8QHp0
	0f2lPwra7f1SfVyJaZyP2YiT4lX3lkroQ+LRw13DllewNTmHyi/2c+vO3EnPhI9pIxCVKI3kY=
X-Received: by 2002:a05:6102:6a95:b0:65b:47:2c8 with SMTP id ada2fe7eead31-6ec2e481ddfmr5118456137.10.1780577022744;
        Thu, 04 Jun 2026 05:43:42 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb36325d59sm5034462137.0.2026.06.04.05.43.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:43:42 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6c4db0bf752so449540137.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:43:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CHmJ502zNoWhHxLotALEMHYtMtobTEEeOVtFXHVhEYHg+O/hctV7N7dvmry2s7nyllkj+BNhRI6c=@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id
 ada2fe7eead31-6ec4710d8d3mr4931144137.18.1780577022139; Thu, 04 Jun 2026
 05:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:43:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDTXYG3hEz_DjYX95TrQtC+WAbcaigcJbB6+ahgLuLRQ@mail.gmail.com>
X-Gm-Features: AVVi8CcFSLH-fFepPuSUo9_HZp_pXmYIByM4nJDNELTvumtfJ3RhzJ9KYGckeGA
Message-ID: <CAMuHMdUDTXYG3hEz_DjYX95TrQtC+WAbcaigcJbB6+ahgLuLRQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] arm64: dts: renesas: rzg3e-smarc-som: add audio
 pinmux definitions
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:
>
> - sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
> - sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
>   SSI4_SDATA (capture)
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -353,6 +353,18 @@ sd2-pwen {
>                 };
>         };
>
> +       sound_clk_pins: sound_clk {

Please no underscores in node names.

> +               pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
> +                        <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
> +       };
> +
> +       sound_pins: sound {
> +               pinmux = <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
> +                        <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
> +                        <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
> +                        <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */

Please sort by GPIO number.

> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
