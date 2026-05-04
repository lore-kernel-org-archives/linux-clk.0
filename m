Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757F37BE6F
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887128; cv=none; b=WShcBj35wn0ENjAfD0PRvV3UWx5eJ0Ou+BR0hOi4wkvh/xcGYIjNYDobjwfsQFU+rw5DOQfF4zRN1aaN3hAs/Sqov+6W0Twgh+bQf6UUEdRBNpzWUu33c3Xll7tolrxOh323bEi2NCyjMOTYpD0YA/5Qj+vZA2zWzkJGDAgZlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887128; c=relaxed/simple;
	bh=lhMXoZX5EKaIKEyMd6/+4ptCK/lC4Z3mYLu5uWl9Ca8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scosxR7t/nHHd6/cmw5nDt3gBHtLmzFsBwlvL5J6j2nguv66Btb7fv0s1VHqmidctFBAyKrPdUpIdlTWU8OI5MfD7WR6H+/g2FwYQEjHviNKl6fbh/bPJgo4+RWuH9pb6z0ElS2g/MF0EMiF4ECwxVAJbwK41C+iATQU/TSboOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de46b8e432so3755279a34.1
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 02:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887126; x=1778491926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiyjHCJDl/rogPwAqEoOmuI7BlhASDQQxZixIp7ihY8=;
        b=m3zd64L2ckBVi9jY+ftkleXtwrmIfZpGBnrC9QqI60ddqXfsKy9+jAifBGwI/Za9tL
         jYvTPcK+a/AxLCh0gKLj6bY52+3gTbNo4m0EltV90n59WQBV/yvggaaYLuhhDRIyEt0i
         8BrE4c5AiKNQBQqS9jkpDECmlOnqvkQSy2r4hM4a0ZdFSUU7QuwR7rq/OkSZkVGPq9zu
         6QQOcJOvjRn8xPCzTK9I9Zxt+7JEgwvGo+zDIiNRIthGAJCA81LOlTNMwsfg4MG4Hmhp
         6OytCR7pKwJDCn6DuH9//Ce24Q8mUyjXfqcoN+GMlkWZST0bRqsrUSyc0DpX8hdgFE57
         ZkWA==
X-Forwarded-Encrypted: i=1; AFNElJ9J4gSdZMIiJyKasyOgdpS00d3wJy8VJS+vmGP/praU1GLYvmTeLMPR0Nuw2LvLUIq+V7UtmwIa1U8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqGlOfRaBRRRzKqWjgw5fbV1Y6hDU0bPkWy4kPXjjbKK0srVM
	K3wwoGioG8WzOekJ8xCZdMS9I99pfkONgLIOL2w7I2WYLaZ8NSScXJEYu8O56x9g
X-Gm-Gg: AeBDies2cloecGslNt7080wSCnj3b78ttqKdySPGZkA/w2fnyfKwkFfn+k9eYpWnm6w
	OKhQx3tC473deE6P9uQh/h0O11/tLpfw/P6VPvsk8wvVZcASpMrxPYkyWsg4Bf9LoBCz1Y3VFRs
	4+gX2EULeOO9xbvvGqnRwqOiqZ5H5GGH2vvoeYT5qWAmFBx3rqGUW9njBlxWYHveNZHI/D1bB5l
	rA7TApDWiFqoORgR0WPnrrrvlWRtXQavtmYBPsdtYtm//rzeDiKG2/YZ+3VVQ+A1V8/j2L14fA2
	+CS7F/zTx+IxIBMmgRGFfO6jwu9swbHfZC5rT9zpctZuBLizF1kZtjziP8OnvzBa8nMrT46SteR
	GvvWSt46vZxNq3hH+94yqDUt8EB7z2XG9yTnK1XTxnw/QVRNAFL71MOCtHk+cNNrH0KHUvHivez
	RF/xOLn7F6funFW5QsD2zjJQQmdU3m5Sev3P0s4ykePvx/Qw1KwB65zJupiG1CZxlUBrS1unI=
X-Received: by 2002:a05:6830:6d2d:b0:7dc:d2ad:fb17 with SMTP id 46e09a7af769-7dee13e34b4mr5214929a34.20.1777887126078;
        Mon, 04 May 2026 02:32:06 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca7a5e6asm8044679a34.3.2026.05.04.02.32.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:32:05 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7de7dc85b74so3618605a34.2
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 02:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BdKOu7r5dsaUSRHxXQEJlJLYF29fQzkhMjlODWXl2w9TKSnhu6x8X4sVSRZaW7IwSIsspF9WmAbE=@vger.kernel.org
X-Received: by 2002:a05:6122:2884:b0:56d:b639:5c0d with SMTP id
 71dfb90a1353d-5750ca1f022mr3391522e0c.13.1777886706296; Mon, 04 May 2026
 02:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org> <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
In-Reply-To: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:24:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
X-Gm-Features: AVHnY4LakVD8SFWNnLvI5N41V0dwMs_sPKYjvoWQU3neqkGpISJJCy9fOpu_jcA
Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sun, 3 May 2026 at 04:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:
> >> +&avb {
> >> +       pinctrl-0 =3D <&avb_pins>;
> >> +       pinctrl-names =3D "default";
> >> +       phy-handle =3D <&phy0>;
> >> +       tx-internal-delay-ps =3D <2000>;
> >> +       status =3D "okay";
> >> +
> >> +       phy0: ethernet-phy@0 {
> >
> > compatible =3D "ethernet-phy-id0022.1622";
> >
> >> +               rxc-skew-ps =3D <1500>;
> >> +               reg =3D <0>;
> >> +               interrupt-parent =3D <&gpio2>;
> >> +               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >
> > interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> >
> >> +               reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
> >> +               reset-assert-us =3D <100>;
> >> +               reset-deassert-us =3D <100>;
> >
> > Do we need these two? We don't have them in e.g.
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi
>
> I believe we should add them, the KSZ9031 PHY does require 100us delay
> after reset is deasserted and before MDIO access is possible:
>
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>
> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>
> "
> Note 2: After the de-assertion of reset, wait a minimum of 100 =C2=B5s be=
fore
> starting programming on the MIIM (MDC/MDIO)
> interface
> "

OK. So please add it to the other boards, too.

> [...]
>
> >> +       pwm2_pins: pwm2 {
> >> +               groups =3D "pwm2_a";
> >> +               function =3D "pwm2";
> >> +       };
> >
> > What is pwm2 used for?
>
> The signal is accessible on the EXIO connector D (LBSC) .
> It is up to user to use the pin for their purposes.

Usually we do not enable support for random user wirings on EXIO connectors=
.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
