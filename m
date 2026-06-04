Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF060410D3C
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574382; cv=none; b=bwbJ8pM1VGD+N4Z8eYbqq4TPzHu6jGmQsazImTfy8KKSF3L1A77syN2jgLVI9EmegHWuutU0FUv4rd8eSkDe3Rv/re0Dr6/rK7th2Pmpp0F1Jb6ekNnLTgxdmN8XLWRAzifYtvFP1Jyk7/Bqbqg9YGVJAI+jezaNI9+w7wdZUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574382; c=relaxed/simple;
	bh=ywQR6+si3be3C5PHwLaMuL1HKazcqbrmNysyvyYb15o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOL+KEzvRKl2KKN7/0ufQ+TKimT6oZ7tFIOlBN1b6lTdTi5FajU22P1aSc8gKvylHVcSuRQq5r01iXwBbjFzJZQLWoCNfH60DkB++LFG9Sg6MK8KYTJqvqL1CjpTtTPESwrRY/JHyNUOUvn2yOr9YxxKBysxg990YH6Eq7d3TVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59d07df448bso480541e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574380; x=1781179180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISCTVs8so3qeH2PLNzTEp9wspkUuH6UUbf7a9c+3AGw=;
        b=tS/kC5DjPHpXW41xjwHRmOf4x4KvofC+HxkDvDgXPkv0vp+Q/yRzjyYRY1oFxN16SY
         GNG034DZnXNzbfy/HYArRQkoVk4gz69bIo1BuqccCTON2+3bcR/diCONGGbQRx9Upuql
         YiZE7Ry/c0oaS/XTIzzbHJSwO4YI+ocnEjmR4LeTx2zoOzjcVJbVCOlMu6TAoFUkQC3R
         COkSaq8Y3/IyXjV/FNe7XwFadisDzr01VtutvUuOXDfgZNGmmAmeImyxySGsR+rh1lgq
         dBTX9do8f3xQkgH33LtB6PIzHLlvbNDKHvljGYbUzCTxkUcZSfQbt6lIjFTeyYHF/zKr
         aulg==
X-Forwarded-Encrypted: i=1; AFNElJ8eUGLpfmG8thXXZVf3JXclz+49juA9OMGkx7DZiBX9ggi2OpCdJ5NIULx1mIKcNUMlo/UN8Z6YPQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw77QtTVDW+bYKJiuMv9KvbgFAFyaSE/IBnZMGy/JaRyEYi+zP
	v1Am4QVEQ9TS4HobRRVd8smI26tg4eQFaiiGn5W5lRyWJ1eJzQx12QCPu4neWlFrwUc=
X-Gm-Gg: Acq92OHIM2wZtvnAtLpPnTJD2Cn+fWNMv20DSYaZ8JiKLLVz0cPHrYAA5cryyIzsuT9
	L9J/FSci3esPa0+fNJ1EcoZfZMZXOAZ0RMm2jhcPs7SXtVwVe68+b2splaCZ2TvE3SJL+P6ECrU
	r5hEPJdR/ShSRs/p4T7S9jweEgBOjbfKdN/YIwwIwOlzippbNlZ2CBmxUG/WTMrT0L35hMFQZML
	6zMJsTR2YBf0PKfHgcmTEzQlhVNSJyROrNkk4136zBgBreUBxH/mACDSIT0Kq6KvMNXGLGQoJzW
	iqSiZpXHIfWFgxPnYJ9kuLa3nNl0zQL1UAZnGlmfo4x1NSQgfAnf0kDD5eyLDwYBCUjgJ4Q4tv+
	eCzWC3byDEWT0+c9xmQwwX3QGu/g8rwAISnAsrz7FTM4096E3HLTj31I8pzue3KRl+H79LpkC4t
	ihv6d8JUKKXbaOFgU3N1C2YuXEv2EBoYqkKpnWm2LN9VLq7o/uRc33FoF4/IX5VIuxsP0CuTM/p
	EUrbBmTng==
X-Received: by 2002:a05:6122:1d87:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-5a6e61be6fcmr4389918e0c.7.1780574379921;
        Thu, 04 Jun 2026 04:59:39 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dc44d233sm4804924e0c.10.2026.06.04.04.59.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:59:39 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-96358d0a024so468723241.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 04:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+khhListLBwE4Pk1P5qddsgROAWoeEcE+Itfra1rVfLVtzefrvIJ+cVPeLp8ewS1nA+FoxDpxVUHQ=@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:631:4c79:b1d2 with SMTP id
 ada2fe7eead31-6ec4b271de0mr4360203137.25.1780574378638; Thu, 04 Jun 2026
 04:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:59:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
X-Gm-Features: AVVi8CcbcHPVoG2RyTFJmvI5Pqu_feKTjza5L3FARlzu4TpWPjIkF65Jen6BRfI
Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
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
> Model the optional external audio clock inputs as CPG input clocks for
> RZ/V2H family SoCs (RZ/V2H, RZ/V2N, RZ/G3E), allowing the Audio Clock
> Generator (ADG) to derive internal audio clocks from these external
> sources.
>
> The clock frequencies are board-specific and must be overridden in the
> board DTS files.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop the audio_clka fixed-clock node from the RZ/V2H family DTSIs,
>    and drop its reference from the pinctrl clocks and clock-names
>    lists, consistent with dropping the AUDIO_CLKA input from the
>    binding and the CPG driver (patches 1 and 2).
>  - Reword the commit message accordingly.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -14,6 +14,20 @@ / {
>         #size-cells = <2>;
>         interrupt-parent = <&gic>;
>
> +       audio_clkb: audio-clkb {

audio-b-clk, to follow node name recommendations.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clkc: audio-clkc {

audio-c-clk

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
>         audio_extal_clk: audio-clk {

I will move the two nodes down while applying, as "audio" sorts before
"audio-b" and "audio-c".

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
