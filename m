Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F17404E
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777465348; cv=none; b=JcpZcexm008h/bUNkiSN+vUqiAtwRUq5ib64e+60l0nt51+4bAeNs4NfA+PiSo29nygrTkdCLXbMowmHO1oJAvE3aaCP0KkpJr1nFNmzPC6V0mpDMpLA9vKz+FMiS/mBeB/b5Is2t3VC+wOYHpos08NbWA7q0qo8u1VLRYpLCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777465348; c=relaxed/simple;
	bh=KOGV9jLH5RXBywSOyxQCqGJvaYR1+Y2TL0szPQtLy74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fol8zcw2opcr8/jrTQMxYayIEXfqG8c6xEKsvQUfM/5urdtxbcae1U3nY+uv+u+ozaN10qsw3itnRG/M4atIeUxbV+CZP8wRH8+Mu9iKoir69YbQn3lWyeJvJOzQdscDs9xPqkjI+R6fUAK534NNQMGDnIzL5TP6XUYqNE08Tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso3785081e87.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465345; x=1778070145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYIYCIsBtJDK4jXwWO2JUdTXoGJvuUmgU1KwSHdoXoc=;
        b=nBMHsCxrU8vQDfSD2vDt3Vh9W/yH3+hiCFNdb59mqaAEoNXsiwPwUlnHEYAy6pETd7
         7JpvuJAK3tvKNthaiZ7ryUAt7TQXxT+0SX/ehFQCFVKFEybjf9+YNKe5XjQDLOZcipGX
         eFq9Z+0POv6PrrvGhlwJSWb9cSGnPeWqNpphnp+uBGp2KBdMZhBWnSok3wAkSeaXBV3A
         U28l10xHaUkvL/yeHTq3/SftMfG22kCOhpxp3kCh/JmaiBUSrMxbtqKSShC3Hkrw5lMh
         NJlj55ZHUu0s0QjlfzHvkF10I2Te3XpPE/nRY1w+o/pZsCGG397/zvjjZolZg6/o+/MF
         K3qw==
X-Forwarded-Encrypted: i=1; AFNElJ/hp5ixceVBmwvw2mtHk7oq1UYabgqW7Kgn7WhHDxITTNBxXLiFFoDbVrtmTAfVVLeuuNaVHXFvIKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+S5PbdmfmzYB0BmnMOjomq401y1b43jAu5ASJj0wifhzvS0T
	kTP1QT2mzPs8oosolFC4jjcf+7q4QEDWgrc3YofQB6pRhtBIiyHFoh3mOgBMvA==
X-Gm-Gg: AeBDiet/DNTVia3weGH4FYzxQqb0z7JlxXdJsECHinOgqU19liWOBXl+aZcmzgPs09b
	5BuJ+p8L5gzdSDLS8pq7zmurZEMQurS0sfO/oRMzRmDttkmkbyFJJngmh6dKmGaCV12dlYFBSBL
	S2ZWjH3bLPZlndFzLJp8QxFgp/ziEz3/j3wpGcbdBPeSukC3Q7L5XFK94LIOVhTroDTjOjqQzoX
	zaKWJIs6IPiAh9a+FyR/eJGQuJuI3icQLTyvOQQG6JgafyuLA6zwEVgOkhVZUUgH8b9kAcKW7ax
	he4sxRFNrVH4CE2bWBlbqiBqZwEKIFxv43nH8xdZMf9sAxW3PZ7E9V/ctWURtLTcok+Hwl31Cxh
	nrMnG7U7vCnqFa1UYqwVNf/PQaA9xljFZursBlzOZLeub+md9XxDKssN/EdRBRmGdZ66SsuIeYR
	7cN069Hv4RSIKO7NLotWmkM9onwm1uGQZ6R/RZwI8fW4ixgLr09tiC5qh1+Dd1cpb6OokheVAer
	oU=
X-Received: by 2002:a05:6512:159c:b0:5a3:d032:6554 with SMTP id 2adb3069b0e04-5a74660a516mr2864033e87.12.1777465340400;
        Wed, 29 Apr 2026 05:22:20 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6e348esm507693e87.6.2026.04.29.05.22.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 05:22:20 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870778358aso101536951fa.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 05:22:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Xm4jmmez7YtPhJ603ICaY2k3Z++skpwX3f+hO86NM1nnNwe59nQeA3E7+4HOpOosk8NLWm9sdENw=@vger.kernel.org
X-Received: by 2002:a05:6402:2b8d:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-679bb0969d8mr3789280a12.22.1777465006980; Wed, 29 Apr 2026
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 14:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
X-Gm-Features: AVHnY4J_eIQauePt3-ENfJ0vvJTMmNJqoEy-L_5paGzJVO5LgQ5rAyTsYv0XxdM
Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC wsa

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a77965.dtsi"
> +
> +/ {
> +       compatible = "renesas,r8a779md", "renesas,r8a77965";
> +};
> +
> +/delete-node/ &csi20;
> +/delete-node/ &drif00;
> +/delete-node/ &drif01;
> +/delete-node/ &drif10;
> +/delete-node/ &drif11;
> +/delete-node/ &drif20;
> +/delete-node/ &drif21;
> +/delete-node/ &drif30;
> +/delete-node/ &drif31;
> +/delete-node/ &hdmi0;
> +/delete-node/ &mlp;
> +/delete-node/ &pciec1;
> +/delete-node/ &sata;
> +/delete-node/ &sdhi3;

I am not sure disabling sdhi3 is correct.
The R-Car M3Le documentation says:

   "M3Le does not support MMC1.
    M3Le supports one MMC channel (MMC0) only.
    SD3 is used only for SDHI and is not used for MMC.
    M3Le does not support MMC HS400 class transfer rate."

The main R-Car Gen3 documentation says:

   "This LSI has four SD card interfaces (SDHI0 to SDHI3), two of
    which can also be used as MMC interfaces (SDHI2 and SDHI3)."

So while MMC1 is indeed sdhi3, sdhi3 can still be used in SD mode?
Do we need a new compatible value, as R-Car M3Le does not support HS400?

> +/delete-node/ &usb3_peri0;
> +/delete-node/ &usb3_phy0;
> +/delete-node/ &vin0csi20;
> +/delete-node/ &vin1csi20;
> +/delete-node/ &vin2csi20;
> +/delete-node/ &vin3csi20;
> +/delete-node/ &vin4csi20;
> +/delete-node/ &vin5csi20;
> +/delete-node/ &vin6csi20;
> +/delete-node/ &vin7csi20;
> +/delete-node/ &xhci0;

Shouldn't the following be disabled, too?
  - ohci1, ehci1, and usb2_phy1,
  - cmm1 and vspd1 (cfr. DU below).

> +
> +&du {
> +       compatible = "renesas,du-r8a779md";

Assuming the DU needs a new compatible value...

> +       renesas,cmms = <&cmm0>, <&cmm3>;
> +       renesas,vsps = <&vspd0 0>, <&vspd1 0>;

Shouldn't this be

    renesas,vsps = <&vspd0 0>, <&vspd0 1>;

? DU1 is unused, but DU3 is used.

> +
> +       ports {
> +               /delete-node/ port@1;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
