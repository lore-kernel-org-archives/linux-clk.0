Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3AA28D83D
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541041; cv=none; b=mouQSp0aEeMMXnTtBtmdm7Mr+wmQ2yDjnEjvxlwuHpmKEd3NFbAKcbv8VR9/Vf2mM8lS9IHZ64BP3WvnQpeIgP64TMVjL+lDanGPlJJe05gT2jgeUYiJ/n/c/V5Wjxr5R8nKR0C9cox9fQ1uybGVJto1tEknQKnuY/9uNyF2Pus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541041; c=relaxed/simple;
	bh=KjAb3biKs5IKYFkpcrM0PPHOxjgtBLExqjXICPKzEok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/8OlphendiKhFbMIFJjw1D3bliCeWjJXKwKtACKChP02j110WD6TqUhFZjMzB5A3/VBK0UjRu6UZ4cCZDi3ZgR5lvQv8zG16Y4PJRyo04TGivQVjuaBwBTqz+w4vSRfx9HYvfYWoxCevUDKZULrySCC1DPA3GV1IKVWrghLPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54aa30f4093so427632e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541039; x=1759145839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROYCyCVqLUt5LfTOrqhdvPKBx0e3pCdCYXBB1uXy4gw=;
        b=OVBXEnj+CDEjv27s88wP1dM/0NazW8pEvrB1QAGtVdkFKQrEC8n43bdCzbNscCBMsu
         ZAZmQ0B517cH7Ghndg8ETXBmOFRa8sSqBxDrqjVdCbhXqKXAP524lS1wvmS/2VoDNe2o
         rQy/EH3lJFoefGxbK4cDaMuzrYT2vh36+M0hPIp2TAiB9Ob1Up3BsGWCfnLNP5AbPuXV
         Ju1aBXD9BqUdTJL/4oVqS0S2ZVRdrDpPDBdxuyOYuHxkx0DGHvsoMfOFwjB7acKDndjj
         togRTzWEWg2k2jzOojSCenZODurayebtBpwNIS7SL1bqWuHfyOS4kXc8/ahtqX9GcAMc
         9gcQ==
X-Gm-Message-State: AOJu0YyZj6jKWsNydiQiNM7MR9hCvOF/aReUiHR9f7aQmG+S2iCRVgaX
	3EpF5fKZwtUkL5iTsSLXdQJWtbLSGQfuxsgTABLlfDzZk7AVx51j0eN6vYr+mdOc
X-Gm-Gg: ASbGncskJni1suQUAL5l7qvRiuvGet8ffEBHXWwDdA44HFSpb426g4cAI3y54hl9Py+
	oA6JleNXLJlGjefLBB03EyOXeq46b6dhiJRRtOYmmJms1QwlUkdZ1Q/1cnZ5lmlR1cC7IAdMeqw
	R8yqUfywTeh9oc3li5W7kVrpcjM7zTj/5BtSHbfSOkzB3h+MX0tU+aga5229tEuRm2BM/QZJLJa
	+A0d6YrTf1JirgUorqkag9oppeQpUSJMIIOihzrvXl7sKAvpKM1gj+lugfNEhvJK7FIMymDkFgK
	Ya9hI8I1Jbms8AXr0pKom/sFQ5Okh1x+8wTxDNC4aufPTMB8lRH1Uj4IcVei5NNGyOUV7yn8u5H
	QpuBy7MK50p/gQCEOe3ETgJVV/PMEjqoD0mukb7BNpSSo+4iuPXpQulVE4S9E
X-Google-Smtp-Source: AGHT+IHwXv8l7jRkcZThcLlTMYfqSN9OfXi+LXcAJs3NOQs4oTNsA9cTzezRybsWZ32Z59JrLU2BpA==
X-Received: by 2002:a05:6122:2527:b0:54a:a569:9564 with SMTP id 71dfb90a1353d-54aa5699a15mr995483e0c.6.1758541038769;
        Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54aa5e14d17sm698615e0c.20.2025.09.22.04.37.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-51d14932f27so1304255137.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4487:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-588df58f328mr3311481137.10.1758541037754; Mon, 22 Sep 2025
 04:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:37:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
X-Gm-Features: AS18NWB0ZbiLxBQ1qIPMQCacT6038FORzoGIYENzCu_TZOfhMidXT2cF4wVG2p4
Message-ID: <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

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
>
> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

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

s/cca/ca/ (I can fix that myself).

> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               usleep_range(1000, 2000);
> +       else
> +               usleep_range(35, 1000);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

LGTM, but wait for more feedback?
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
