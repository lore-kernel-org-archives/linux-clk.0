Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB40C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 10:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50ACB2086A
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 10:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD4lBNWk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfBUKex (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 05:34:53 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37537 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfBUKew (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Feb 2019 05:34:52 -0500
Received: by mail-oi1-f193.google.com with SMTP id w66so1001140oia.4
        for <linux-clk@vger.kernel.org>; Thu, 21 Feb 2019 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iIAmxPn99UJSLULAPX5kBKtGCz1DGhBud8hKmEjk0Ms=;
        b=FD4lBNWkOZJ2XUwI72no5ez3H6FO1gktI9Blik9Afu4/mjykLj7XnFS23PaSj5gQk6
         P8ipnymsksBVNYcVGo44ibaqa23C+Q3me9mt6u8IzFEIEYsEVHbpAu3mr4U5vsBj6J8o
         fP+xW0LhZKWwF/wyFvWw/BXMH9GR/LfuCgIPXMKwsR4rp0n7F5d2cfUu3i7qZe+CjTon
         S24n/lM14fJvylvTbO53znWQbzoaOiO3HzGy49KmsZSYp6sTLiWtgnTElz64GV/bjqIi
         oBSroZjLQADW7HkYy+vvVwn3GUyHmaiKoH04oFHYoBPans3yNEGrzSo5xvAF+K50rs8j
         j3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIAmxPn99UJSLULAPX5kBKtGCz1DGhBud8hKmEjk0Ms=;
        b=QDpxlKjUDtaeTog6Wv6dA/6UQ8/27ByhE0jqPFOxTZvsYSs/4zT4mICpzx6eX4GV6S
         lYNaP9odWIOyAtcuYRHNFZBLCbq8epIuJtZkHtHpmqncCdtmzTvtt0sZn75Oz+9zB2Zx
         bNCFgNzL8+DDjH5giY9GGf55/+nOdWX6iIBjY9dY2cb2tbpiT1MZj61SYQ92XtETnBNC
         7IpH30nFm+mlh1B889jonuuUaC7gzq2Kb/MIQRhXsekhutZhCUyJ5Au69RwQNPohM0d5
         45a1/3vCkN14dByfm8l0R6q24qBrd9EFEXGzxYH0Yh+xXtNKJUx7GCnKp+kJcXJKZXGv
         zhmg==
X-Gm-Message-State: AHQUAubUXAh0OFjHFL2+vdXjEZQlKjq9P0z3ZpKoCXSzsavYw6Yu2tAB
        KLhzqOrojdfgsqo5uEaJxeryJagzjZ+7+mU51LY=
X-Google-Smtp-Source: AHgI3IbfLEn4k5Fu0qMUeThwo9zg7+FvBKevvZd8j6A+Us2IeWQizYQq6mPXr3/TxqjfrJrJE6DYd8I2/IXoXO/Vjbk=
X-Received: by 2002:aca:4a95:: with SMTP id x143mr9033108oia.18.1550745292035;
 Thu, 21 Feb 2019 02:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20190130192102.7065-1-festevam@gmail.com> <154940574088.169292.15304825462770873584@swboyd.mtv.corp.google.com>
 <CAOMZO5BYr_JXZ-ibb5JBvVtF0=Y-cz+qNsPHd0i-kkrC9Ok4ag@mail.gmail.com> <154947421987.74891.17150055410578722741@swboyd.mtv.corp.google.com>
In-Reply-To: <154947421987.74891.17150055410578722741@swboyd.mtv.corp.google.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 21 Feb 2019 07:34:43 -0300
Message-ID: <CAOMZO5DgQmxrrC1YzXeB8Rcyzckv9uPQ_C9x5PRv0LC+h+yJBg@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rogerio Pimentel <rogerio.silva@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, Feb 6, 2019 at 3:30 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Fabio Estevam (2019-02-05 14:35:49)
> > Hi Stephen,
> >
> > On Tue, Feb 5, 2019 at 8:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > > Do I need to fast track this into v5.0 final? Or this is a non-critical
> > > fix for something that isn't used right now?
> >
> > This is a non-critical fix and it can wait until v5.1.
> >
>
> Alright, thanks!

Can this go to clk-next?
