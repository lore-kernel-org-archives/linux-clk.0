Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C63CC4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FE5C2086D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIHnj+NX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbfIIKpQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:45:16 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46508 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbfIIKpQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 06:45:16 -0400
Received: by mail-io1-f67.google.com with SMTP id d17so5594757ios.13
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w5dfQIfclsaxzYHBXRshhSGRuyP1tO5QBkMM8Tmc/wc=;
        b=sIHnj+NXsmewoJ6E9temqBg6go0OyzlInmMm+ojBsMNeMbAHovv2AUcKI9sRROhtSz
         6snHeDqjoNLHSPIs/cSa24aiRxuWbUyq2/St+L9j2DlixFP2p8eweAABDowm0VaVb6XG
         pSy5wTWwiA6NjjNxcdGp6XznrfbHrwKGuhtXmQhs6ojRo6iMZnaNnv+zE4W8P/o4cKuR
         1KD2sB8zFbswPTldfl82dN3OUK9doFOeI1pZsZA7/KPMncv7MHlyH96E0zMKFCBa4CKa
         DmfEToVzb+hhnbiwY6sfgN/VKqd0WmHAJj/h5rgA02zl7kFWqEGVcSxj593gpIBaxMqQ
         6WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5dfQIfclsaxzYHBXRshhSGRuyP1tO5QBkMM8Tmc/wc=;
        b=jDx/004U97uF7ugwJ8B15t1am10KqiRgqwcxFi9FdlNi6ZEuEjGNTvoAhNQUs8t66o
         4AX0tsuSlGyawvE+iyBklTS/p8mbDC1Wm2l+IX012V+Qs5p8fs/aQ5q1cBn/4NOAnCIF
         2GWl+nSh9rTBq6HQl0M4YEjQilaI2+IEwZCe/8P6r+xgPyy2kmkB5/Lp5S7A1SOuOLBJ
         hgvCCmPC1vnX8ADR/ZjdQBZG18fkvAZlMo6ucUkcWxWowxtki7q78NLHnq+VPF4AODa0
         wSkSs9AzSRrHCJcDtez21pl/89I3oxtRw7Mw/qk3bCkA2lt4xfkuwpk0C6knAOj1Pukd
         37Kg==
X-Gm-Message-State: APjAAAUNbl6eL30dZreybRbcmcEFRveGk+7OHTSCEhACqPdbxQ8FYuXz
        AUsv6QdD+pLmlzkPaTZd/D4De0HF8DTQno+jzbM=
X-Google-Smtp-Source: APXvYqwFJ0Nc1ve8XGIHwiINnyPrRCrW2wXL5aRsXNiJ16FFueAHgNcf7/uvqROaQkFwe+iPu+20SpGdjm44lqD3O6M=
X-Received: by 2002:a02:7f8a:: with SMTP id r132mr5492024jac.46.1568025915953;
 Mon, 09 Sep 2019 03:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-8-git-send-email-aisheng.dong@nxp.com> <20190906170944.B861620578@mail.kernel.org>
In-Reply-To: <20190906170944.B861620578@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 9 Sep 2019 18:35:15 +0800
Message-ID: <CAA+hA=Rds2Pvv0iJVhFr3nb0N8iKjTtO=uu8c_gTymiVr-dewA@mail.gmail.com>
Subject: Re: [PATCH V4 07/11] clk: imx: scu: add suspend/resume support
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

On Sat, Sep 7, 2019 at 5:32 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-08-20 04:13:21)
> > Clock state will be lost when its power domain is completely off
> > during system suspend/resume. So we save and restore the state
> > accordingly in suspend/resume callback.
>
> And this doesn't need any coordination with other clks in the clk tree
> right?

AFAIK no as SC firmware may have handled it properly.

>
> > diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> > index edc39d7..8d9cfa2 100644
> > --- a/drivers/clk/imx/clk-scu.c
> > +++ b/drivers/clk/imx/clk-scu.c
> > @@ -46,6 +46,10 @@ struct clk_scu {
> >         struct clk_hw hw;
> >         u16 rsrc_id;
> >         u8 clk_type;
> > +
> > +       /* for state save&restore */
> > +       bool is_enabled;
> > +       u32 rate;
> >  };
> >
> >  /*
> > @@ -425,6 +429,9 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
> >                 hw = ERR_PTR(ret);
> >         }
> >
> > +       if (dev)
> > +               dev_set_drvdata(dev, clk);
> > +
> >         return hw;
> >  }
> >
> > @@ -481,10 +488,52 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > +int __maybe_unused imx_clk_scu_suspend(struct device *dev)
>
> static?
>
> > +{
> > +       struct clk_scu *clk = dev_get_drvdata(dev);
> > +
> > +       clk->rate = clk_hw_get_rate(&clk->hw);
> > +       clk->is_enabled = clk_hw_is_enabled(&clk->hw);
> > +
> > +       if (clk->rate)
> > +               dev_dbg(dev, "save rate %d\n", clk->rate);
> > +
> > +       if (clk->is_enabled)
> > +               dev_dbg(dev, "save enabled state\n");
> > +
> > +       return 0;
> > +}
> > +
> > +int __maybe_unused imx_clk_scu_resume(struct device *dev)
>
> static?
>
> > +{
> > +       struct clk_scu *clk = dev_get_drvdata(dev);
> > +       int ret = 0;
> > +
> > +       if (clk->rate) {
> > +               ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
> > +               dev_dbg(dev, "restore rate %d %s\n", clk->rate,
> > +                       !ret ? "success" : "failed");
> > +       }
> > +
> > +       if (clk->is_enabled) {
> > +               ret = clk_scu_prepare(&clk->hw);
> > +               dev_dbg(dev, "restore enabled state %s\n",
> > +                       !ret ? "success" : "failed");
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +const struct dev_pm_ops imx_clk_scu_pm_ops = {
>
> static?
>

Sorry that i missed to update here as those function are changed to be
used within
this file now.
Will fix.

Regards
Aisheng

> > +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_scu_suspend,
> > +                                     imx_clk_scu_resume)
> > +};
> > +
