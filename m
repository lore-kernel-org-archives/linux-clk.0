Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5553C432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89DED20862
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8jwgOqA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfKQMSN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:18:13 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:42954 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQMSM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Nov 2019 07:18:12 -0500
Received: by mail-il1-f195.google.com with SMTP id n18so13380983ilt.9
        for <linux-clk@vger.kernel.org>; Sun, 17 Nov 2019 04:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOmkNME1TnaceMt+tkFudQs07FT2wu+ZDBouJ09Uj1c=;
        b=X8jwgOqATtJsmEM6D6Mb+YhgxmxDAfq/gtrLXURG39AAv47043tQZba2Kooer5/urp
         pj4X9rHyaJBZeno7FFGc796K3alQdtYMr0mGe2XoWWrU6gkMQnM6f1CVEIR+JYCgtvyh
         h0rjzbE3Yp4AwPxigMCQf5Xc3lQW6QVdI+oJE2wLVSD68TwkadP6cU3aQQp2hZTX1usy
         kkPsAOIW4ZOj16nZi4Nu3dIxbqjphls/kdWGV8NDXyA7rmpd7daygdlCpln2YscJyGuT
         wpc37RNVG2lPjfQXZ7TniAbh8jnG8sv7nWl/FG/qqzfS0+17WQsw3Q7tsFfzeR1xf7/s
         zYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOmkNME1TnaceMt+tkFudQs07FT2wu+ZDBouJ09Uj1c=;
        b=nR/xz7EMieQYD18lFfX+h8TxrmEG0JrXM/dimPV7LsFn5cEpyTLeRobTao0nbWmo46
         KF7VUTH7QOSvuEfTZHxT6KycvAP/cLl2tIQlKfAH6YfnnQA00IA1c8YCKK3irlX8PGFF
         OkZCy46R1QgHF85EbYHMmmMFYucCzgvwjTm3ZiYAec2Z5HfQpDx0UHA6HY+JAM4QSvM0
         L1JoM40NCFhIIIS6Ww2AqGmaZIITMClpWTE3iH5QKjX2mKmNurKnhIiDgklM7kB+sKlq
         EjD4hkozvDygr/TAB+MUhfnJkEc/HUbkROGUTJZn/ebUA8jQB0oi/ZX7gpnuZgStLDbQ
         4NDA==
X-Gm-Message-State: APjAAAXu4zhKQ8IEHeCIRaUJbXQ1mOfi2PwE/p29S4KtpISzSFxtcCSn
        T62ca2DU+TNhCkwJlXFYHAZ8N4ahGdLvu0y/TKQ=
X-Google-Smtp-Source: APXvYqz1MK2QvIKuUQAqSX873T6Wv8NlMSXbqt3V6crWUTwDLNaKooKPYrX59aCJ5yUUQwQs9iPIB0a70ShCUB3sh6U=
X-Received: by 2002:a92:3ad4:: with SMTP id i81mr10078405ilf.18.1573993092209;
 Sun, 17 Nov 2019 04:18:12 -0800 (PST)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-4-git-send-email-aisheng.dong@nxp.com> <20190906170643.B310F20578@mail.kernel.org>
 <CAA+hA=QoZFFb_EVfxcDuJB-9VobVd-1-RyhWeNTSePxW50P8Eg@mail.gmail.com> <20190916184408.8A55720665@mail.kernel.org>
In-Reply-To: <20190916184408.8A55720665@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Sun, 17 Nov 2019 20:07:11 +0800
Message-ID: <CAA+hA=SbcophCfF3xGTe1R1awSrFxDRYqESut7uFQPQFOV86eA@mail.gmail.com>
Subject: Re: [PATCH V4 03/11] clk: imx: scu: add two cells binding support
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

Hi Stephen,

Sorry for the delay due to a horrible busy months. Just a bit relax now.

On Tue, Sep 17, 2019 at 2:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-09-09 03:23:25)
> > Hi Stephen,
> >
> > Thanks for the review.
> >
> > On Sat, Sep 7, 2019 at 5:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dong Aisheng (2019-08-20 04:13:17)
> > > > diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> > > > index 5e2903e..1ad3f2a 100644
> > > > --- a/drivers/clk/imx/clk-imx8qxp.c
> > > > +++ b/drivers/clk/imx/clk-imx8qxp.c
> > > > @@ -134,7 +134,12 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
> > > >                                 i, PTR_ERR(clks[i]));
> > > >         }
> > > >
> > > > -       return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
> > > > +       if (clock_cells == 2)
> > >
> > > Can you just read this from the DT node again instead of having a global
> > > variable called "clock_cells" for this?
> > >
> >
> > I tried thinking about it.
> > One problem is that we also need this information in the exist clk
> > registration API to
> > keep the backwards compatibility:
> > e.g.
> >  static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
> >                                          u8 clk_type)
> >  {
> > -       return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
> > +       if (clock_cells == 2)
> > +               return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
> > +       else
> > +               return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
> >  }
> >
> > Parsing it for all clocks seems not good.
>
> Can you parse it once for the clock controller and then pass it to the
> registration function as the number of cells? I dislike the global and
> the name of the global.
>

Yes, i can do it.
Why i didn't do it before is because there're tens of APIs callers already
and finally we will back to the original API again after removing the
legacy users.
So i used a global variable as a temporarily workaround during transition phase.
But i do agree that make the code look ugly.

Regards
Aisheng

> >
> > In the future, i planned to totally remove the legacy binding support which
> > is a premature one and missing continued support.
> > Then we will also remove this unneeded clock_cells.
>
> Ok sure.
>
