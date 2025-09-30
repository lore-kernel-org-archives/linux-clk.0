Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8252FB0A4
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759236004; cv=none; b=D5EitLTcZHRJ3npD+N+2rmji9YixQgWunhU3eBecsJ7pi4jMuqTn99kP0wrTlJUtIr8SoChgr8RvLHCMYwXLfD8xXTVjZ3YrN04kYP3I5HDKHGndRbY8It8WaOmTSfKPjEZPnxV3DfZ2K4BtN0D+GXJnk+2kVbblMIRVkCHf9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759236004; c=relaxed/simple;
	bh=GXQB96bE0zEd8993DIrSt2OVhCsFyOqLR7Jg32C8ae8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0bhy3pjBN1kHbP9ghO/6nKvh8yijtn+ETmqEtrCJ59iV/ojsYeCvih5jnHiBEX1dJIYO7WtRD8VkyqthvZpZmiX0vEtcDowP9e8IejFusYId8quoj/gtTCuOpoUcU45I3Ce4VDMKdvmpBMfSTWBNvc8AXkCQ4S/nQmtNTvAaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54aa6a0babeso4927207e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 05:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759236001; x=1759840801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfS1Jf1f/1r9RWyL6t03hbkwSL2mPImc6nfWL2Sk4VM=;
        b=bl0V6GYArEsLEGflXwgW6Trz/VrHNbpAkpRT+tEHdIc5fpjE39sSTUuAtyQS3coULk
         7WK+L6946H0WhS5zIK5R9lVI+LmSwX5gfvzPfLSJDIqqKA6woSJqxXTtvliQ0XQipCkG
         OVyKsV2lxFkr7X4FEAuL7osyl+3ikQlQtdInZXWxJs5OiufALNUBD4uQBgvaJs1YP79O
         alKZKtGiOFuzprfbimdbvNe8Wb1XWekUkosbmks44b3L47eg9kVLxkIqVUu368Qd5sld
         bt/w1sipFbVwf2QZjY/ezo1pB6IhD9R7JrEQTYdFen8VC+5FZdvZ+N2vBCc7RjInFLlh
         IyXg==
X-Gm-Message-State: AOJu0YznODoUCmLzCCHIblLMysnDKM3zaNjniw+QP7eBojaa4GXdWP1c
	bMc/hoWVORXWvtNUFrSkawcOcXPEIRZDuh7KJCMEuTNfPlZYc8/+jZQfH1CdgAji
X-Gm-Gg: ASbGncvlxyadqsvBK2XWXihxEjyNiCUKAYoMiaYYemU53bpwQlPYxzScHgJPffm8W++
	0Y2jGN7u8J0Qdf4mEKKLmZMGzKzTP8I0Szm6fv8nhA51zZrUkyKmCtO/q6ZNPoZfsg+t5DTEWOf
	zQGPRXood7LJJXz3rhzLprP9wFG9Z7ctpYPFLr/qwPP15TTfiPvAUaBcYk92u2P+O+z2nIiz+TM
	HKEmp8LayxWDshyGaqjFr5dnpp06NAIdJAiYeOPoVX7EyD515dpg0hWNyAkiQfppkR1Ah6vtGgZ
	fX5H/DwlLrvEPmfzmafmicFs/ZO8i/SZRH4pL8PMRD2yXRnPw+HRflKUbu+G9giuQqpez0PM0NN
	XbpT2pjGq29DnuXnLuQW+8447mVOu4wwwkz2M+CeqItJIGXKd8Q+h9aWUN1nE8TusqPRRzZWDrH
	sp8tCgATdf
X-Google-Smtp-Source: AGHT+IGnB9ZHB8NyGk3efUZWLp3QBrB3HZDdDMT5JMrGm79PdNXBq81EcetToTdSqebyMy7dS+3oCg==
X-Received: by 2002:a05:6122:c2c2:10b0:54a:76f6:99e6 with SMTP id 71dfb90a1353d-54fc6e3f7a8mr1543438e0c.2.1759236000969;
        Tue, 30 Sep 2025 05:40:00 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bf7ecbdc4sm2639868e0c.6.2025.09.30.05.40.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:40:00 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-528a601a3cbso4221090137.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 05:40:00 -0700 (PDT)
X-Received: by 2002:a05:6102:33cb:b0:59f:54cb:205a with SMTP id
 ada2fe7eead31-5ced8765283mr1513391137.13.1759235999948; Tue, 30 Sep 2025
 05:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922162113.113223-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922162113.113223-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 14:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRgPSG+f0DyR0pDvBf2zDWLKVUWnQTfVohskNKqHD40w@mail.gmail.com>
X-Gm-Features: AS18NWAWfUchS0KY7_kZj5i7BhpV5L3ORtcNpOjrQEl1tzKxw1bTwgFJye0pobw
Message-ID: <CAMuHMdXRgPSG+f0DyR0pDvBf2zDWLKVUWnQTfVohskNKqHD40w@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 18:21, Marek Vasut
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
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -676,53 +676,47 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>
>  #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
>
> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> -                         unsigned long id)
> +static int cpg_mssr_reset_operate(struct reset_controller_dev *rcdev,
> +                                 char *func, bool set, unsigned long id)

const char *

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queuing tentatively in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
