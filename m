Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424B9C4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 144EA21A4C
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOPrJkIN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbfIIKe0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:34:26 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44493 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730682AbfIIKe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 06:34:26 -0400
Received: by mail-io1-f68.google.com with SMTP id j4so27415625iog.11
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O0QbGRskzrGZBzidNtq9nhCjCnWMKLOTPXNRwEbysuA=;
        b=sOPrJkINWZ9chYhieAt9vKbn3ZaV6zTIHbUkr/LiP+zolndnHYeMB3jd/1o9v0qE/U
         2IAe8eA8gChOJNlFhyCET/dmJPstOTAzXJX+kJKKEUfKz7st/Ce+JhHuzB/WOK2rEKcW
         mhbbhJTgouTkM0oxNby+Xv/6Gjvz3XZ6bYiUVWle9E6lcsMYXrnrkAu9qQQ4MHhB+rxg
         48A7WFPkXTj87gWO11iD9/DRYuEJk0IzUL6ayEjyYJXoi72GK5bNnKzspccA7ej3K2WR
         +w4Wox8+YXhXoiGB9JZ/I5iqB/dLa1pFOjaS03W3xB4aBMEvxuXkO/Bc1sRYZdIvNw3V
         wePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O0QbGRskzrGZBzidNtq9nhCjCnWMKLOTPXNRwEbysuA=;
        b=r6u2/bOG7kipl19X4H2YGF2IM0JYa9iqNj+Yy+7pMk0ZbVoB+TpdNflq+iP4tI8/7S
         zw9Fjl6DYXNajIGJtUenpJP3nURuzBnrB3cbrMzC1xt/4TmkjH90dMlYLDj+v3bPTdeK
         QIMabERJ04eNPZEjKxZjBKO8sUw0IJsQsHD9gZwqvRLFxzZ0CQ+TCt4lT+yPEzUOUQgY
         NKkJPPEln2SrLQl4pu2mLjvbOEMg2u5SYFeht1O/CyI9lbMdCupYH7KuNiZxHGTpR+hU
         /ntR6i9W3HoEKeyaH5O3xcCwxGoYLRGe6PSLjCTtUOVkZqFVcUl7laJN5jjXM3MrRhdc
         mkAA==
X-Gm-Message-State: APjAAAWWus8cVwAObaumAhAVA8P3q0OIV9ydKyyrlzkZaxlzSd6wlPdL
        oyZkOFV9BFd+Nybr30xz6HeJMeKNvuTKsDzV2Is=
X-Google-Smtp-Source: APXvYqzomjPQZpm8daOnKsSrwIo91DYZOw1RSvvtl7CX97sdCj8AUi8cS4AHx4tFCCjv+WbAY18OVtj5PmUY+Q3CPcw=
X-Received: by 2002:a02:cb9b:: with SMTP id u27mr25832579jap.26.1568025265896;
 Mon, 09 Sep 2019 03:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-5-git-send-email-aisheng.dong@nxp.com> <20190906170713.81A1A20578@mail.kernel.org>
In-Reply-To: <20190906170713.81A1A20578@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 9 Sep 2019 18:24:25 +0800
Message-ID: <CAA+hA=QAFJoLVXzY8oSkAOf65psAyiv31EDwO0G1yFUzE9t1xQ@mail.gmail.com>
Subject: Re: [PATCH V4 04/11] clk: imx: scu: bypass cpu power domains
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

On Sat, Sep 7, 2019 at 5:28 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-08-20 04:13:18)
> > diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> > index 48bfb08..5f935b1 100644
> > --- a/drivers/clk/imx/clk-scu.c
> > +++ b/drivers/clk/imx/clk-scu.c
> > @@ -479,6 +479,10 @@ static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
> >                 .args[0] = rsrc_id,
> >         };
> >
> > +       if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
> > +           (rsrc_id == IMX_SC_R_A72))
>
> Please drop the extra parenthesis. It makes it hard to read.
>

Will drop it, thx

Regards
Aisheng

> > +               return 0;
> > +
> >         return of_genpd_add_device(&genpdspec, dev);
