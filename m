Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AB486E6D
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670189; cv=none; b=tz3lnejVySJ0mlAJMcTYIPqMTsx9ZjtvIMsKmmGEGwUyLybwQ87MYQw2luqt+lMVJ5hAT6bSBOzaiIgXLcwvxH4tWPQrE07Rcgkt9VltcY324+NZIaRu5iJyO+DduagmZSZX907U2oS7iYguCzWRg8zGmtVyKlZ3jSxBaO62JoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670189; c=relaxed/simple;
	bh=Loh7CxMJyj/c0rgZ7iXlS8miTtj/q5VnJdY302NtqGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftW3IwlWb60eQAxH0bbHxfKN7DHDWO2MI4rvjYsMhzFgXrJL4Jiz6cOCwE/QCNYO+ZWB3dNoj3C8oH/HJbQ75tUfo9vM/1FQytDZHlftdxsy2WFy6fRN9nksOC3l4X3MATophc0TLseSXulEYXYJbf/oniMgjHj8cZAjCwYZZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15d47266baso569157766b.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670185; x=1788274985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8UDG6348hQ5hCNqa39+P1Xgwy7V8Kyi97ymwy69cGkw=;
        b=Iw+SXQJelI6Ul1jomYEOnUzAlrGS6vvfRt2ltj4tSguSZARnZt3q0pMkZaR2UIBFTo
         TCqyKPHbYWEfX8lDnJEhWIWF1+OkquXAr1EYWfmbqJpiW4qYx2VWY9czQH8V+UXp1hwJ
         3EyROW+xlNW/W68VtV6aMD8pviBI3LE33s9msRXjlTi/vqb1LNnUCQQDLcJ+pWTCVlec
         whdFTSQfaRiwMTxOXgpJ7n/jlpzgqOPnbmYRTrFUl20nMuLxWKV92mh1ShNRbuQ57udb
         nDbqBK61Lho+loG82f6qhLg7LGTiMU7ASAU9fykYv3/4lraWqECFRwu3kO5PPlvLjCjL
         jHuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhy1o1LWW20EA4MwYVrFRAJ9jkJ/75YBULjC5jd9Iimi+AgmNOyd6vnrduf4Q2iOaeXYL6wHutA6s=@vger.kernel.org
X-Gm-Message-State: AFuF++lTvoOiJ9H9UMXjjnZ5So9LU2RXEb+CSQk35sId54FYhbQjKR4N
	Z7jq16Rq0fLzaP3hLBA44LWjhvoz3KZiTLKHPJeLVXJf2+Z5QA6Nc3sxSfRkWZXf52c=
X-Gm-Gg: AR+sD11LAPFaPfM0O8IEinRk6OYQCVu/I1eolb5La4ZHlm5qsxlUbQ6/tkL9Jim1Bew
	XpFNKqm11D3a6hcBf/fTgHYKb7QVj8r6byXrKaXN7OjMzFTK3rpnuPAHyAtHVY7FJ6HHj+DdPRn
	T4ZKc0WOKvsOk6FxV3u4w0+N4xdtOlS6gbHdVL1Iow3GyB+2enCBrYgaQ0yryE8Jw+p3v+PL1nr
	uxQ5DiGU7kr3G/LEeBlrU5/3oFzFJrJPYVooApPz+ah4MAn7ip3YSOFP6mcUjkjhTB9YZoVImrr
	WAX7tgfnhMoKjDkZkB3LtP1nGVtGcgSiID2OOUw1COkD+MCNj62Uu74D//f29lfH7vatS7NLulR
	PXPojxxBkmQNjpedTkA2+funD+U7mThjdG6XV3M1m7nS2/jYd+gAAxZqleW8TzuJb5ACJ8SgwcO
	UWDX+jCLbOfZq58nnVzedpqaPk8kchGyi0ntWM9KIQizGjJO+70xvbQkB8/IJuCBZmLq9JdHPV5
	P1nRMxUhjbd+N/APwd/3d7Jag==
X-Received: by 2002:a17:907:1c19:b0:c20:2eee:97be with SMTP id a640c23a62f3a-c24e5899c85mr837089166b.7.1787670184958;
        Tue, 25 Aug 2026 08:03:04 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1878384766b.49.2026.08.25.08.03.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:03:01 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso8256153a12.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RryqXuv/4XRKGI4zhh8EIYrcxERIB/Rt97yPI8k+k/vPBjgrFMEgzVRd9SXER2L3wRvQjXQ8aBKFCk=@vger.kernel.org
X-Received: by 2002:a05:6402:2490:b0:6a1:f93c:f0a6 with SMTP id
 4fb4d7f45d1cf-6a5c4157aa7mr9125375a12.12.1787670181340; Tue, 25 Aug 2026
 08:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 17:02:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
X-Gm-Features: AcwNN1XuzkfLnm_UPDcmDBLz-Zu37ChvVAcOyLsURutDp-p8VMVRi7QPa69l3QY
Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -68,6 +68,24 @@ codec_dai: simple-audio-card,codec {
>                 };
>         };
>
> +       can_transceiver0: can-phy0 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD1 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 0) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };
> +
> +       can_transceiver1: can-phy1 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD2 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 1) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };

Actually this is a single dual-channel TI TCAN1046V, which is modelled
here as two TCAN1042 instances.

Recently, we got real support for TCAN1046V, so this should probably be\
rewritten, cfr. "[PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc:
Update CAN transceivers"[1] (which I wrote a while ago, but never
submitted before)

> +
>         vcc_sdhi1: regulator-vcc-sdhi1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "SDHI1 Vcc";

[1] https://lore.kernel.org/2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
