Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB226C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 11:49:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B6C021924
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 11:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFkbYU0u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404461AbfIILtq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 07:49:46 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38266 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404455AbfIILtp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 07:49:45 -0400
Received: by mail-io1-f67.google.com with SMTP id k5so2585656iol.5
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M21UYXJyYebbHCHFFmhcntmZuuRnDyVimorrVNeCzlo=;
        b=fFkbYU0u2ypzChewVrqRwuJpt84/NW3foUpfTgiGUS9mscuErEVh6S/LyVaKNuzWpb
         rQfRpN/WeaxkQqc+XZgqqpWPxoxi/UqYMlsuAUha5Y0/w66eYaS3xlJod8seR0RT1tz8
         mG+vLOECAbp+8QjtXAq+acAJqz1ocd5h8eBBWeLObWUnF/wquu4BWOcJfuQL1PQzkXv1
         K3lDjBomyxvJpg2oHhWN9AUm5sDC991rvS1+Sc6auZOtaYKY18xXLM1dBkVoDq9G8D2y
         GGQ2uUBqCCtw6/XGuebPsbmeo7I3FAlLYlJXEj+vRbh0e5+ztwfOs5AeiuOeuWKgQa0+
         aRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M21UYXJyYebbHCHFFmhcntmZuuRnDyVimorrVNeCzlo=;
        b=tlFp4QaiIQBK5BxWM//3HmfJUuWbHHLfqDdSW/Io11ICmQBzE+jaHB0zC5r0iGDsvZ
         fgoaos52rBefmO2SQOorVEV4smtPlCqVrVtgcgAwtyAF+smfJX/kj4RU0EtF5KGR9ZGC
         vx1em77Bo5WfuQSHB0MHZG2sMdD8vpgXy3PLZknUwX8leqnfHcIu086Zrr9M/Lwpfw3b
         ptnnx1AKY/AyM2gfM5CBsjz7E79LZXzBUTGoFHDix7HapEAeYW+ZxWjAS2ecbr/ttXCr
         SM7Sdu7JViediO+Hi61QZLW3M2eecFjxIc5AixPFfSL0uxnNBuYhOwjFr5xIybrXiwkh
         MfIQ==
X-Gm-Message-State: APjAAAUPC39Cp1rri2QqYWUWmwCx6sEqVAH2KXMXSXwTZvtNOOPAfNO/
        WS/vgos+nv1c9kLyq50Z9siRqXUHStf+0Xubckk=
X-Google-Smtp-Source: APXvYqzjGqfWDT6ZIpciIE24q+d4sdKvSrtYbGzyXxi6pqsxLQVMj6YBwVO/W1OR5iRPtVFXjC6cuC3EvoFajlMG/gw=
X-Received: by 2002:a6b:e514:: with SMTP id y20mr18875550ioc.197.1568029784817;
 Mon, 09 Sep 2019 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-12-git-send-email-aisheng.dong@nxp.com> <20190906171454.167BF20640@mail.kernel.org>
In-Reply-To: <20190906171454.167BF20640@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 9 Sep 2019 19:39:43 +0800
Message-ID: <CAA+hA=TApgehM8kTdA2Py5Uuiy8=5eG7GvuyhUdPrFj_SEkR_g@mail.gmail.com>
Subject: Re: [PATCH V4 11/11] clk: imx: lpcg: add suspend/resume support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Sep 7, 2019 at 9:22 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-08-20 04:13:25)
> > diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
> > index 3c092a0..4df0818 100644
> > --- a/drivers/clk/imx/clk-lpcg-scu.c
> > +++ b/drivers/clk/imx/clk-lpcg-scu.c
> > @@ -33,6 +33,9 @@ struct clk_lpcg_scu {
> >         void __iomem *reg;
> >         u8 bit_idx;
> >         bool hw_gate;
> > +
> > +       /* for state save&restore */
> > +       u32 state;
> >  };
> >
> >  #define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
> > @@ -112,5 +115,35 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
> >                 hw = ERR_PTR(ret);
> >         }
> >
> > +       if (dev)
> > +               dev_set_drvdata(dev, clk);
> > +
> >         return hw;
> >  }
> > +
> > +int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)
>
> static?
>
> > +{
> > +       struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
> > +
> > +       clk->state = readl_relaxed(clk->reg);
> > +       dev_dbg(dev, "save lpcg state 0x%x\n", clk->state);
> > +
> > +       return 0;
> > +}
> > +
> > +int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
>
> static?
>

Will fix.

> > +{
> > +       struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
> > +
> > +       /* FIXME: double write in case a failure */
>
> What does this mean? Sometimes writes don't work unless the CPU issues
> them twice?
>

Yes, it's a hardware timing issues.

Regards
Aisheng

> > +       writel(clk->state, clk->reg);
> > +       writel(clk->state, clk->reg);
> > +       dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
> > +
> > +       return 0;
> > +}
> > +
> > +const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops = {
> > +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_lpcg_scu_suspend,
> > +                                     imx_clk_lpcg_scu_resume)
> > +};
