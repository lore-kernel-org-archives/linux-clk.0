Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEF0C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 09:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhLHJ0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 04:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhLHJ0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 04:26:18 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5EDC061746
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 01:22:46 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id k2so2870097lji.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2tSCHCqfSK4pEQWNDYT3sY9fxle9rvZ4/DzOIeyubM=;
        b=ngH69gtt+KeOf6V7oXzPHyryzf0BV6LzodeqY8KXBnAakFu1+BKYZvqZNM7GN1ibLr
         /YyGgMmPoGQuUKZ+GxyTa2YD91fRUC+AKQ5WtiaqAubVPKKFi8lI6/9+jCPXx0I6Ygny
         7i+aZqW2EgeyuRRzaJgaIX00ziMi9BHg4c6k937I8mRkUFSAK39xIImY78xbxahZVMbb
         EA9QzubZKV4b4u7LSBDqqM3FGKW5EI7/y8Yq38znW7lYQ/ELgh4mQZfh1AF19hBR8dvA
         vSoHn7g2wY+nrBMV0X4S476APQ01GbU9LZLz+3BQw1L6yRZcgLMDoqILoNe2t9tk6v5X
         Bi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2tSCHCqfSK4pEQWNDYT3sY9fxle9rvZ4/DzOIeyubM=;
        b=puvAHQ0jVmk2nmOpcNIw++e7Et+88MgdRyu1r/FNNV9TRIopuoZrROoMooARsRLJy9
         061vcdkvtumdDBTx4ICoH4PityYOfIYkQwW1Wyc09kaqL8WnTy+N/zQhNY+FOGxOPvOs
         DDVw9J719H+WHW2u+pZ9sMZCeK55h9YRYPIZKr3AZLTXNrXCwrieTGdCorgSubC99oyL
         k2Cijaggh9ti/fHgtLDgtCtyRRzNaZ/oDraB5LjQGEB+2dEf/p2peYCx8/rxert/y4uz
         a4VUabEzI8nIabS/eHslug0T5Ux/5WE7opEIznUb07BvZ/Jvl405W0IW5keGoQHZBbi1
         uF2Q==
X-Gm-Message-State: AOAM532gKDGqlo4tWmOftYBzTtpbmlmWdikY3AsE36JXS0xOl73IeLzZ
        rCzE1klKQtHroC32nwbox5AEBebHTVrp1GVYL18SBA==
X-Google-Smtp-Source: ABdhPJyBc//wB/JpYHeEC2IZ5cZZrH09/mGfMorl76XoRyb7O48UNZ3bKFR2OlH0yvV5HRH3AhgFOBjdHgsL3vzA3nE=
X-Received: by 2002:a2e:b6c5:: with SMTP id m5mr1878864ljo.220.1638955364580;
 Wed, 08 Dec 2021 01:22:44 -0800 (PST)
MIME-Version: 1.0
References: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
 <87pmq7qyzt.fsf@igel.home>
In-Reply-To: <87pmq7qyzt.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 8 Dec 2021 17:22:29 +0800
Message-ID: <CANXhq0rR1KRunK1iCH==23wJXuyZm2kMLzKCTd3aJpfazh+rOA@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, lee.jones@linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 8, 2021 at 4:31 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 08 2021, Zong Li wrote:
>
> > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > index c220677dc010..c8271efa7bdc 100644
> > --- a/drivers/clk/sifive/fu540-prci.h
> > +++ b/drivers/clk/sifive/fu540-prci.h
> > @@ -13,4 +13,9 @@
> >
> >  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> >
> > +static const struct prci_clk_desc prci_clk_fu540 = {
> > +     .clks = __prci_init_clocks_fu540,
> > +     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > +};
> > +
>
> A header should only declare things, not define them.
>

oh yes, let me move them to fu540/fu740-prci.c respectively, thanks.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
