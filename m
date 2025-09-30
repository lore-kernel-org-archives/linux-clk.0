Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0C52FB612
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235116; cv=none; b=KoyR089zR4kO/h2fNtN4Bx9/wi4GhDbq9Y8v/1KMqcok+XBmuG84aexgaua7njwJlKHLWVgOYFrjbQK0FL+ma16/irjL6K3PTz7OUWQzptP+V2uJEJoGOi00eNtCPW0WnOcmtlXHh4oLxbgqKpX0JKZXYH6giLzi/xtp6Rmo5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235116; c=relaxed/simple;
	bh=Rl+WInx8PaUwS8IuuiiJzhnJyCOnZbjGkwRrtsfYF/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCjHjmZQ0n81xNNYqzu2Fk1bruigohBLdjUBkLFz4ys/RaVshOK4dcTiLpYUM9sX35JKaEIF60Kra91Fa4XAqC3Zu/8oIIlSj1eeMgSU6IgMW5ZegRtqhMihY14LDUSRRqb+iaFixR4TCMVlDw3YWXh+iVtlKNQKKUiOjg7Fqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5a3511312d6so2629678137.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 05:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235111; x=1759839911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLhZG+hkus/w1b8eNphrVTh3mT7pWH0Bv6WyCP36MRw=;
        b=TVyYDxx2vskG0fi1vtTpRpKuEXsg2/4o6lmX3sRYtJ0BPQ0z3lFNlbfyuQ/tilzm7X
         ITPRTx4+OZne7bJc5mZ7Asa38TzFyUyBhW67Fb4pIWrN7YxCqoLOq5v1dMPONaImLo0b
         scAP95QGAUY/uZA9VcJPdQV3IGmFVxwA1ctvDseMTEGSBdgHGr4b0qgR1EqeALe8vR9p
         Y6OnCvJyqSD4wCT3fBomOnuiymCIBuIUW9UDeQ0H4t5ulLAr/GJa0i4JNOuw3ywm3brN
         5hadJqbeOLtISzbWtjhSVDf4Nn4SKvENip3rm5k/mbdDRMnVEjdxbAR/IY7CHrFG5NO3
         UplA==
X-Gm-Message-State: AOJu0YwdJxinCwZkxqzYLq+wsZXDf6BWxg7bHiBYBC+U/b58L29Qoqey
	0rfjncy1naVm64EG5/9PdXCNojJH7AmAx3bKzmmV4NR+frXOucimut4Z+CYOks68
X-Gm-Gg: ASbGncuOoaY1QuQZdqv4tWzS8p+N1HMWXHSc6kC/DzkJ06pu3isfKOuX6ANAnaR9zMG
	Bmvv2bCtZyVjd4kotdd9XI4BeJrEgvmeNRtMsG6kcxd4WoWiMrvGUJTLb6mojKtjpifWXMvrYiu
	RAmGDbwSJtYBpBwVZZEbe/j8kKT9BToPoydZeA8YW3pxbhmZrrmcVN3btxKEAjkVpJ1KXPOVZ2k
	2ncuEQKcRfhkgXSPajOjLhf19qFGF0g+EsiWzEXkN+U6FfkHczBZvHH92vkhPI5nneBJamVX8jf
	Fr6pXVELkZKbVVfGsMc71F0V6FZ6shUj9UvjK+7dTZCfvZha+PRQcw1snYe5szmE66YBL5w0CQk
	ihTXAkN70TvC2n0gNTgnyMSv3BDTS+DQLwxzqOXvkOGuYZlBfuLhG4DjeedcpLtEouj+/H8CKsA
	fR8k0imb+8F13e
X-Google-Smtp-Source: AGHT+IFL373czkbBrjcGBZJ8f3ROjlBAx2q0Z5Rj6jDQDwJ3C0n10tWC591/G0LH6ZW495ocHPIBtA==
X-Received: by 2002:a05:6102:304c:b0:519:534a:6c26 with SMTP id ada2fe7eead31-5accff91aacmr7594084137.28.1759235110968;
        Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae302ee7f1sm4249948137.2.2025.09.30.05.25.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so2873768e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:6122:3c82:b0:544:75d1:15ba with SMTP id
 71dfb90a1353d-54bea23f988mr7144912e0c.8.1759235109983; Tue, 30 Sep 2025
 05:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 14:24:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXeO-gUn9wjedkCM36RSKDCZWM9xFr0V=iPu+QM3ARUg@mail.gmail.com>
X-Gm-Features: AS18NWCxLAVJQ1S9RTeuCdL6-zKzWFNTXwDLwA-hDIPiMJ2Ye2a24eC2rN3ikhk
Message-ID: <CAMuHMdVXeO-gUn9wjedkCM36RSKDCZWM9xFr0V=iPu+QM3ARUg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC shimoda-san

On Thu, 18 Sept 2025 at 05:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> after reset has been asserted by writing a matching reset bit into register
> SRCR, it is mandatory to wait 1ms.
>
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.

Given
https://elixir.bootlin.com/linux/v6.17/source/drivers/phy/renesas/r8a779f0-ether-serdes.c#L219
I assume R-Car S4 is affected, too.

> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, queuing tentatively in renesas-clk for v6.19.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>
> -       /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> -       udelay(35);
> +       /*
> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> +        * On older SoCs, delay after SRCR has been written is 35us
> +        * (one cycle of the RCLK clock @ cca. 32 kHz).
> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               usleep_range(1000, 2000);
> +       else
> +               usleep_range(35, 1000);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
