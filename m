Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355569;
	b=YkCikkUfWFkzGzabsT1lAja3sFVs4ILsOACyM306b1CVLX/nZJfoavGuhlOZ7PV22gDe
	 RXSFq1k+/dN+cP9C3Iug4132JPS74pF12JGgtpncZZZmXclap21jj7mtJap8AdI0bzBsL
	 +FpDwzjYtrIlFLBXdtQcRYdMl1PkqCZ/t2JyqDTr8hSktT+yy5MQuMq99f3RKczuHaoQP
	 Bfb8OlL8v4tWAiP2U69AQw7GVG8HjBo+xnHaSI9jF4D3icBDM1OSH0AQBwpI66TYaDBWj
	 Bmq5mtWvv6TkybnxlgIa3qak+Ay3JjAAcbyRCRi9OfIJ8pwjIyNzZq1gHsjCjeoPWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355569;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
	b=obKVWT8MGn0+/p31XNmxhMQm2ueIilu+GC7qIMZ1cgZ0oJy5rgT6UEfPXySurg9+7HpO
	 6aCFJaH+lyHUmO071tEeyt2fF7omEH+LMqZQBVdKVfYAFPXYcmtxwKD5w0Hr42AnZaGLK
	 b+GMMAS70U1i5ng73yIRHENH7NkX7H+K175IJt44F9eDaIqhPahxZgL1USNYkhUvQfMdH
	 6oiU8vkzNvFk/YmO8Ww563xDI8rDjbpUDHtR+ZQXTc7B1ePj1kY98BNeGQ+UEOernKPGd
	 20pqZ9EOaAsvSV314vsfFHdBd9BXryAVfR/5QfvwjGWnQ6FIceGsxjGXvvpB0z2QKOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F022606A322
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 10:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F022606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso103947241.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 03:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355568; x=1793960368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
        b=KlUtxdb02UJNAZelEVXHaJRKT5OEbloyduR5ja6ER69bZCLndyxy3pgvI6KwwawXey
         B9fR/6cVm4GwTY6kadlFYkX8vK2s22H678H8jpwxb7/cZ540uAUT6Q6/PkG1fQrDfoSe
         kknX5oL1rsBZaG9Hluue/ZSKf+nEHz+rjFOdcalf5duVSGhTr6oHB04qOil8dk4qGq/B
         0aWWDgPcgM2FZF4C5J7xsHTtd5tJgSgWVBU1577QgradkE58GZMtxdjg2EjsPPq7Ho53
         SP1iTvImGoKjBY5DWpuPe1cflbJIiqSzINom3xkbfRn1YQKoKrfpIPR7oSGlGyc47j7H
         29wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxiiYhmtD/orhjZRVMCgDLmV+Du2v/qkhm45lLZyJkM638QCT/QBZK68sMIeqkb3IS/PaF4jgjMHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf603de4rfOsC/pjglCspuYJeZzTTxT2CQOUk9bTZ22j813iJU
	fOv7d9prjgYtG6tuSyHb4N84BXpYQlTHV5m7eZe4704pVR0fS4Ou8s8roFsiYYIS
X-Gm-Gg: AYBFou3S+8pAsaWwPHoY2oKCbaonHmEW/cnY0Mrvn+A6rfiAaJC8AxC/SMbqOvNwcaV
	ap0NSanXkRIq/g2DlxW8Qu0WTHk7SmUCqtZLGScbMTgtcOzHZVCMnOFDXGuXsrxTfp4lUGykeHH
	25+nQbbFhooXdpO9mw5Y8gW5lwjVEntLscVufag8t70tz5WZU5CW2BS0uNG/sMfUaqNHhCzbqHJ
	bzc9MrUSlvYJoq4Xk2ZOgONaocdh7I2y4NoSbAiFDPGhMwNNLVUC8uLV8+kQVPcuoh8b+NUIccq
	QV6y3RUu4SiAbU29TpcfA97xrewqfqwdK7gZGP+Pk4b/q4QhejhhfzQUBpLWhN2WK9dEEWzpD3H
	XXAguyFC1c6DX97TlsoGCu4ghip3SNFufY2FHTnvOY/3NA2JoWxfXfCRrQNt68dZYzcSm3O4n2h
	N5lXbHqwVBzcOLGn91xrEVsRg5zTejTJ2m2GpaM+CafqDq5Z0pMPwUn3EEUA+vrQPoWcjqONPXG
	OhU+T7PF1p/MIH3msJ3OWdUMmQyGDZzhFdADVuKNqpuU2McNOZf5m9Q2G4mDObAWkV4cXxqKWhj
	+4t43Z82ZBqX6KinnQDrGNluV6PbwTYUVOR4kjLeVnWtD1cIProQ72bTXuDQV7uIHYU=
X-Received: by 2002:a05:6102:5121:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7d072635de3mr683191137.11.1793355568438;
        Fri, 30 Oct 2026 03:19:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07768d366sm1635761137.10.2026.10.30.03.19.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc91ddf447so151516137.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBza429drxFIYiBbmYIz/+jfR4KzF2Ae6XZ5FJoB771ErrOYmZqFur3jM5fzDzT1JQqEX1h4DFqfx4g=@vger.kernel.org
X-Received: by 2002:a05:6102:9d4:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d0728d38cemr726412137.36.1793355567237; Fri, 30 Oct 2026
 03:19:27 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
In-Reply-To: <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
X-Gm-Features: AclHuK8TLIiJXfBZEbZO-sDHcOFpgPhdmma0xCzHFZfNFDpVgGdGYD9NeIfWwIY
Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
Subject: Re: [PATCH 4/9] can: rcar_canfd: Add support for R-Car Gen5
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Biju Das <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 14:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The CAN-FD block on R-Car Gen5 is similar to the variant on R-Car Gen4,
> but uses split global and per-channel interrupts, like on RZ/G2L.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -636,6 +636,23 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
>         .external_clk = 1,
>  };
>
> +static const struct rcar_canfd_hw_info rcar_gen5_hw_info = {
> +       .nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
> +       .data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
> +       .tdc_const = &rcar_canfd_gen4_tdc_const,
> +       .regs = &rcar_gen4_regs,
> +       .sh = &rcar_gen4_shift_data,
> +       .rnc_field_width = 16,
> +       .max_aflpn = 127,
> +       .max_cftml = 31,
> +       .max_channels = 8,
> +       .postdiv = 2,

R-Car X5H does not have the /2 postdivider, so this should be one.
Else the bitrate is twice as fast as intended when the external can_clk
is not available.

> +       .multi_channel_irqs = 1,
> +       .ch_interface_mode = 1,
> +       .shared_can_regs = 1,
> +       .external_clk = 1,
> +};
> +
>  static const struct rcar_canfd_hw_info rzg2l_hw_info = {
>         .nom_bittiming = &rcar_canfd_gen3_nom_bittiming_const,
>         .data_bittiming = &rcar_canfd_gen3_data_bittiming_const,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
