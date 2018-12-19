Return-Path: <SRS0=x0k0=O4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFCFC43387
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 22:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 656A520873
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 22:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up8owSfo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbeLSWeo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Dec 2018 17:34:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39641 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbeLSWen (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Dec 2018 17:34:43 -0500
Received: by mail-ed1-f66.google.com with SMTP id b14so58932edt.6
        for <linux-clk@vger.kernel.org>; Wed, 19 Dec 2018 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jKP2px27KTzzQrWhR+f/O0lmfHo7sDHuQhoWWp6cUhU=;
        b=Up8owSfoD5Ge7R2dE2jQHEALphgGJGPboAZrSiWAi3QkQPRcuEQJjZWIHEKYzmCC+t
         2NMcOApwPCUVHrAfP08h4ZDze2hKsZ3XDI3tGK3dhbu005nfXXFkIFQxn2BxsVBTV40o
         +3jke85unc3vD1PAEErvdIsI08umwNH2rE1pXZl7qu05vGmT7OPavkzkfIJDStHsPEyP
         zF9xOSz5BnXfVfai8hpmR5pjcoMPQc4cC66JtoS35Af/tzMCA7TVTOTXhJscHr8RC162
         tZnqQTun7gURVJIFW14PZonCBFGNQrVi797qsUh2FgwlZljx0RqtXSOLrLAY+I1upBTe
         ixFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jKP2px27KTzzQrWhR+f/O0lmfHo7sDHuQhoWWp6cUhU=;
        b=FYua747u8NZDIeng571HtNnU8jRyaVexX6YMuQv1uy8+kT/z62nekMq4MMdWRMr19D
         fIsQxkGm6LCvd1+/J3T+1zRmQyYlTFnKniS9q3f2BjNt3Csxwx5x00pHNKVlXGd4UC/H
         hpAEmEqx3Pfpf8wR/iC5BY5T9g1PFLjU6lzbDjuKXKlDKFJ7D3SR4VzLIjCpADrgVWuv
         +6ElEcCL0YvraX/o4z31CNzexLqy58k4WPFirZhoWWqxvkBa0+mEujQQegux4UnUUL7l
         YCVN875XyQsSXyf4RowuNKNvI4El1OEzVosHMiQ5IXhkyjAyZbyAd+kf/zAoTSuBGXbb
         3EJg==
X-Gm-Message-State: AA+aEWaX8ttY18OFAywMW/JsCoo5aavtdJkeRPGX0IOqtUWzzspVmI2+
        FH5t4Z53Q5Gl+JAwnQSSWYwhhkWKGZML6JAhIAHzG01M
X-Google-Smtp-Source: AFSGD/XGOnQfbRbGeM8vgvUVuhlrlt9Sjthb/Vu2DvwMh/+geTxKGMKLuqGhmAf87aTz+OdEOSTN7s/XAyWcvlJV8bk=
X-Received: by 2002:a17:906:753:: with SMTP id z19-v6mr17450015ejb.175.1545258882014;
 Wed, 19 Dec 2018 14:34:42 -0800 (PST)
MIME-Version: 1.0
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
 <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com> <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
In-Reply-To: <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Thu, 20 Dec 2018 00:34:30 +0200
Message-ID: <CAEnQRZDiUcV5svjmQ=ofUsxy5y+YBgOwgbca+ExkvHv9AzJSEQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 19, 2018 at 7:08 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Aisheng,
>
> On Wed, Dec 19, 2018 at 1:29 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
> >
> > SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> > Let's make the name of clock ID generic to allow other SoCs to reuse
> > the common part.
> >
> > This patch only changes the clock id name and file name, so no
> > functional change.
> >
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 146 +++++++--------
> >  drivers/clk/imx/clk-imx8qxp.c             | 152 ++++++++--------
> >  include/dt-bindings/clock/imx8-clock.h    | 289 ++++++++++++++++++++++++++++++
> >  include/dt-bindings/clock/imx8qxp-clock.h | 289 ------------------------------
> >  4 files changed, 438 insertions(+), 438 deletions(-)
>
> This seems like unneeded churn. Just keep the existing naming and
> other SoCs can reuse it without problem.

Thanks for review Fabio.

I get your point with churn and touching git file history. Anyhow, I feel that
the code is more clear this way.

Anyhow, it is not me to decide.
