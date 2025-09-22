Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85B2EC54B
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540917; cv=none; b=dMOZ1yL4UMAPlxgPeX1RSNrBVVjZmkrTJCkKoSbzphNx+nT4Zzf8dj5c7q6/DtpWqgoAFClCjo/EgydqpNySjbSKf/MMdlUfg2r16UGMNmZVfSDPHngyHm8dx6dA6nc5ohKz/7nRVXeDlCP7MSFgJdKzP2UJw8S+59O8uy/WF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540917; c=relaxed/simple;
	bh=pC2LETsInlFYWoF2ndCVBnfYZpgXuZph/Fs+0bvzz18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA9IN3hI5+x1taL14qbMBMmlu7UuLexvcymS57EiYhh3kHJw3kvW5eLFi8qQbIAqIg6xWi8pwAXQIm8M7j1lZmztv9E+83r3pyC5BJ89N6yFDFH8k2lgBxLUr2bbCFpM0hPrY0QN7yCc22qoB+8+gk3Pn6MDvA4cbEFj5y5whAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso236153e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540915; x=1759145715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyqZ9tpDjoz0HB6ZaIemgMAwpqfH9pb6N4giUusI5MU=;
        b=t85mCmbrfguAtaMxb72iVeFTRHKMtCUCdIQQhRiUVXI8t0ykW2Zf0HwrBA+M+FpEPd
         cyGLN4cnP+6Isu//k6jdnitE/Ztj/lUY9GsgA5yjl8R0+xjmsxf1TKLFAolFVzp7x8Xa
         Y28wlMlk5i1sEwGGcDVTrSO3MKP5E6CoH5RVMNpys8Vz0O7XU9vpYcsro34COt8C3EMZ
         gBK/Bf3sOG4a9Tlod6mz5sqeHW4WNwHTLy9hB9+az3t9fa6Z3ezPVyRpIdG0IAZLVJ2F
         lTZXcDNsrufefm6gNLwhizOTDKwdJ4cxThD2dzMK70S/+nSjcGW346QB8wS1nUnU1kyU
         Smqw==
X-Gm-Message-State: AOJu0Yz3EOLWb3xIwwz9Z5S3tu4OHJDwfRshiu0seugBNt12aLMJj2c0
	0ZGANdzYBgX0hS212hJVY7mIMwgv17VDUTwXpdFsaLzhNAlgtEmmbROQIZFqMLJT
X-Gm-Gg: ASbGncvGdw3r29Ugj2xbLew0i5Ix6FmV3OjgwM+Iy/qcRy+D7xxzNXPeD1irHFfk8du
	96FMbKSxheL6zZ2TZ6B3+9wZ1/zElquICnxnKjlg4XICMp8cBJqPIRyr2F1NOvq9FAQuiUgSPov
	LIci5MAbpk+vi9yNBlpGjf+Ku18VDJEGpidC8c8NWvEdnQwFv8WfcXK0zZCR+VGYHHFweK1hmMv
	Laz0TBapsmaS1VywtDXiTZChw9EtUiJiLbRN3lSpQaOMFtW/DyOv17sSizUNPYH5wwQcb7/whSK
	YwLqoGQUc+CFb6mDTqYujWo6BKbW9OjP1zvcC/39BVyLD1dNcWUSUoYvcU7uCyj8MD3oFGWBAV6
	9iKRJOZnfnD98zQ+6piIUx1rltlh9xnF82lOvVxlBMYYDHEYPGz4iT6FiQRyG
X-Google-Smtp-Source: AGHT+IHYT3WsCE8DEUdcQF6uBU2QRTPBPWPERZ4p7C+O5op2EFrMkyh6bZYH23lAwfFLg61Jc4jMpA==
X-Received: by 2002:a05:6122:4594:b0:544:4ee5:1334 with SMTP id 71dfb90a1353d-54a837232bfmr3816749e0c.2.1758540914449;
        Mon, 22 Sep 2025 04:35:14 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a8d400684sm1589322e0c.17.2025.09.22.04.35.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:35:14 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-52dd67b03c8so3003077137.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:35:13 -0700 (PDT)
X-Received: by 2002:a05:6102:c0b:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-588dada35dfmr4060461137.10.1758540913268; Mon, 22 Sep 2025
 04:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:35:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
X-Gm-Features: AS18NWA-wZX_6-T1SyUmh1jF7OGLy8IIlD-83kuaXAMxnaI4vnu46kVW6CwdYiw
Message-ID: <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 18 Sept 2025 at 15:45, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch, which fixes the PCIe SError for me, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>
>  #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
>
> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> -                         unsigned long id)
> +static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
> +                                     char *func, bool set, unsigned long id)

This function does a bit more than writel()-with-latch, so please find
a more suitable name. Or... continue reading.

>  {
>         struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
>         unsigned int reg = id / 32;
>         unsigned int bit = id % 32;
> +       const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
>         u32 bitmask = BIT(bit);
>
> -       dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> +       if (func)
> +               dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
> +
> +       writel(bitmask, priv->pub.base0 + reset_reg);
> +       readl(priv->pub.base0 + reset_reg);
> +
> +       return 0;
> +}

Now, do we want a special de(reset)-with-latch() function (which does
reduce code duplication), or would a simpler variant be more useful?
After this, we have three different "dummy read" mechanisms in this
driver:

  1. Clock enable/disable and resume on RZ/A:

         writeb(value, priv->pub.base0 + priv->control_regs[reg]);

         /* dummy read to ensure write has completed */
         readb(priv->pub.base0 + priv->control_regs[reg]);
         barrier_data(priv->pub.base0 + priv->control_regs[reg]);

  2. Reset handling on R-Car:

         writel(bitmask, priv->pub.base0 + reset_reg);
         readl(priv->pub.base0 + reset_reg);

  3. Reset release on RZ/T2H and RZ/N2H:

         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);

         /*
          * To secure processing after release from a module reset, dummy read
          * the same register at least seven times.
          */
         for (i = 0; i < 7; i++)
                 readl(priv->pub.base0 + priv->reset_regs[reg]);

So perhaps a simple helper like

    void writel_with_latch(u32 val, volatile void __iomem *addr, unsigned int n)
    {
            writel(val, addr);
            while (n-- > 0)
                    readl(addr);
    }

? Do we need barrier_data(), like on RZ/A?

Unfortunately RZ/A uses byte-wide registers, so that one needs another
copy.

> +
> +static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> +                         unsigned long id)
> +{
> +       struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);

"priv" is unused (no compiler warning on your side?)

>
>         /* Reset module */
> -       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       cpg_mssr_writel_with_latch(rcdev, "reset", true, id);
>
>         /*
>          * On R-Car Gen4, delay after SRCR has been written is 1ms.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
