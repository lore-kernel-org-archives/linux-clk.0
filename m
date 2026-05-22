Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E219460
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464845; cv=none; b=Tm+97k/ukpdF4rWakhFmsjS+ar/M856wm7/BWw3Y4bZW7/MS0OJBPHSf9IXoS/14d46/oOdreLVnR75Y6ID1BRtrLnGvhCq2XL+LnxQEZUmYdqB31sop9UFmIgXLeiSrluTbTnnL75+rnnLcVHIrjAnghjdrveErnmXQLBFLvfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464845; c=relaxed/simple;
	bh=J9pqhe3rEd28EB+7QM4Mt7JtYR/l/3S7v8/M/aaqFQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPPP9EeTZggw4UCBzLBkfx5QHi7k8y7FNWERHmH+6204ZbC3hLvNws9aLw4nRCRDvmPK0yX8H/ooEd651SWm8Ha/Kdu7nWzZCNZtM1TvpP0dDcHmCpBwvQ50ZrZso/CeeKF3HApV0upm1HOxouJ/aZB1wkoNXV3RMa26saQrBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5751e12c524so2697693e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464842; x=1780069642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mat1V267K7OB4qn2fEb5sEkdQiWDnrER2vm5Q5jlK3U=;
        b=cAcoOFHE5zBeJFLwmJB+No9ntDuTwtU8iqZiUwUSC1boiOFV55tkDxBTbIJk7gRa3t
         DOWLYXUbBAOkOi9hzZCfdwe262xLaKTWluANFa7Jhgs38Thf5ZxlXZL5kJnzEUajVxOa
         Dl9BRhYphYjFoeP9Kppfbn0mVTqlY5MwNCxBt23mcSyihF6NOFJoyS4LVrJir8MIXChZ
         /+WrcfvmTk3wTrVwIZ54TyexKbKghKiBjDtly86htfhUv9Pkrne4SsNpqBkABeMqQL/x
         ZIh0cZBuAL37iQVBRAmb3XRsxd+hOtC8vSiWpetrgzqkTFN4wmPXcYrLa09XiVt/JNlM
         xvBg==
X-Forwarded-Encrypted: i=1; AFNElJ8VQ3n+58+37wDMGvoEirVx1Z5sCg51PN51GMjr0+avzInLT3bGwF1TkK4YDc9767XEml3qGHIiyhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/mMPcRgXvoTbKU1fd19Uc8Y1iik1aDdyrOQ1bWYEBaadHmAed
	JfC7uCy+o4Cgm3dexQV+enFj6uGJ3U1JNi3kVjpFx5lOJaAjOrdwVqWCBcq4/Mur9lg=
X-Gm-Gg: Acq92OHVWmzLgC61NFzFxcQnNeaE/ycZqRkDADuhrRHxjzT47SGWTUqnbeize72giHO
	fGIJCovNycvMl7yhOdztDVd0rjJskdDuirWmIaqmBy4RVfvgJHjPWnn8k/26IpCmXdK8DTA3HfH
	G9XU5oydDe9Z7KC8vHE07e6v89P2yxfEKLjTJz6Dabl74vrEUzfWRW7fbJ1ly7252eXeIKvtRCa
	8osXOnNjnCKK1mPeRCu0SubHByjdc33f5zgtphjhh/jYPZ8p2fZIMufZQA1YCHd5REfv7iWWzKH
	CGIiB0zi/sGBEZb42b+kOi8DOgz15icNK1HUoFxXJwXu3Oe+3gveizYNPQk7tkUTL8xEb1j0vRt
	r7dCfdRTV++MXKzAhmSAYZ2Bgwmi8Ldm5AjJB05eprRWw2HHB0Ofv+87aZ3U9gymqlkOkuwP/7w
	KP+QkbwC2jlI2DEKycXAyORMCkMtngA9FATvZWiayOCKdQ3qhBrEFHxnyUErAxWxBC
X-Received: by 2002:a05:6122:905:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-586626bb34dmr2349982e0c.14.1779464842439;
        Fri, 22 May 2026 08:47:22 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm1998940241.2.2026.05.22.08.47.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:47:20 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-577500ac0e4so2487503e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nu+mkFT0JWZC31rgmheJ+Ga/sPZJdppdSRrhmM3ug7UceOiOYrfDlHCHxglVtx5Hxc3Jj8URLZXw=@vger.kernel.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr2614239e0c.4.1779464839874; Fri, 22 May 2026
 08:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:47:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
X-Gm-Features: AVHnY4IbX-4yvb6-_QqYAmKEvB5Pw7JiMigOp3rN1DUejXGr6NhPRl6ad5aF2d4
Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a779md: Add support for
 R-Car M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop CS2500 variant suffix
>     - Drop cells from rcar_sound ports {}
>     - Drop ehci1, ohci1, usb2_phy1
>     - Drop Salvator-X reference from commit message
>     - Split panel DTO into separate patch
>     - Drop FCNL node
>     - Add another memory node for the second 2 GiB of DRAM,
>       although the DRAM layout is patched in by U-Boot
>     - Drop FIXME from audio-clkout {}
>     - Sort nodes without unit address
>     - Rename regulators, use npmv suffix for n.m V regulators
>     - Rename x12 node to x12-clock node
>     - Add PHY compatible string
>     - Use interrupts-extended in PHY node
>     - Rename clk_multiplier/clock-generator to clock-controller
>     - Use interrupts-extended
>     - Reinstate port@0 to rsound
>     - Drop iommus from SDHI2
>     - Drop DU until it can be tested

Thanks for the update!

--- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts

> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       tx-internal-delay-ps = <2000>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id0022.1622";
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;
> +               interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +               reset-assert-us = <100>;

10000?

> +               reset-deassert-us = <100>;

300?

> +       };
> +};

> +&pfc {

> +       pwm2_pins: pwm2 {
> +               groups = "pwm2_a";
> +               function = "pwm2";
> +       };

Shall I drop this while applying?

> +&pwm2 {
> +       pinctrl-0 = <&pwm2_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

Shall I drop this while applying?

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
