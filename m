Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B01C432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAEB82071E
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHzbIHhq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfKQMT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:19:28 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38732 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQMT2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Nov 2019 07:19:28 -0500
Received: by mail-il1-f193.google.com with SMTP id u17so13400296ilq.5
        for <linux-clk@vger.kernel.org>; Sun, 17 Nov 2019 04:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=famP/2hJ9uAvuRMVp168RFH84x0OwGqk3aUiNnJd1SM=;
        b=nHzbIHhqDl8yTZsGSphEaEA+LB4yRqbWmFfO/T0wfs0rpPo5JRdEuDu6aIOzLq5j5M
         5aTAA444SsBU71RprHfmqnI821VI1kcvoZIVUq3vWHk+s2Y5AjMuHI7Re42XcMteTJrF
         VcrdwypoR69pAKuX8vWY1KeXn2pBUPjQuqum33eyoM2dLjNSWJQK+x8D993BmfveMjFn
         o47bRc+U31pd1kx9pnik4pw3sFswTuxz09J8keWJzOgW0Yr9XyZlr9C1EK6ZNLMMKgQn
         QSSkh4ZCpJOEGaolIc1pNtnubuZ/TQnMnBECuURh2GvL+3bin0cM0j9JJtbIllcngPQm
         Wbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=famP/2hJ9uAvuRMVp168RFH84x0OwGqk3aUiNnJd1SM=;
        b=r/rgFnGr0KSM3lXXgiltnZqcCZWNJUdX73Ant62taxB8wrQIsl9Q6F6Xn8Yoyaj5zD
         CsAIisr4GaFU8bRxVnU2+6clIfJpESm2u55HaDz7BHxWeeT9Hk8tozF6UDTOUpI3G6x+
         3PJRcIcsGwtwVeIV9mxR3Ih4mnkdBBZJ/+2lLH1zBG02KgmzeQUrkw2WCodu02ik1Msx
         OOzuz9SMKrcqU2prhL8Tcan3pXjEkp3FLoatPI09g+pwNJNl6xILvyRnfBiMigVHVMzG
         G0fZBlRrRhWUYsD+DqRcc7kMjDZpXZFecHOROCtP8/fMEHz5Hcm0wxAt3ly6jhrcCa/j
         hS4A==
X-Gm-Message-State: APjAAAXyew50jObp8axAAqhKcN0MGc0p/m5z0CtNUdBXFzyDWfDIEEiO
        8Ay0WnTGfPY0vny/2s2aD0Td7y77NWXtOMPUzgo=
X-Google-Smtp-Source: APXvYqxLm1u0aSA6zD2wVwO+dZwpC6iGKkqETTFeK2Nl5gSCjEZuFkUpQfLDv0+1Ms3fYIONFbGZqestzDAgfwyTSX4=
X-Received: by 2002:a92:c8c9:: with SMTP id c9mr11184068ilq.197.1573993166254;
 Sun, 17 Nov 2019 04:19:26 -0800 (PST)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-9-git-send-email-aisheng.dong@nxp.com> <20190906171323.8847820640@mail.kernel.org>
 <CAA+hA=QJwfHsRA+G2oT2awLxx659qXLPsiECV6VYcJ181c6D8w@mail.gmail.com> <20190916184505.256CB20665@mail.kernel.org>
In-Reply-To: <20190916184505.256CB20665@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Sun, 17 Nov 2019 20:08:25 +0800
Message-ID: <CAA+hA=Rrscs8gSXa8QhbXkf85KkGCP5iB9qPq=RL+nGu5_UAew@mail.gmail.com>
Subject: Re: [PATCH V4 08/11] clk: imx: imx8qxp-lpcg: add parsing clocks from
 device tree
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

On Tue, Sep 17, 2019 at 2:45 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-09-09 04:23:14)
> > ]On Sat, Sep 7, 2019 at 5:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dong Aisheng (2019-08-20 04:13:22)
> > > > Add parsing clocks from device tree.
> > >
> > > Please describe some more here.
> >
> > Will improve.
> >
> > > > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +       base = devm_ioremap_resource(&pdev->dev, res);
> > > > +       if (IS_ERR(base))
> > > > +               return PTR_ERR(base);
> > > > +
> > > > +       count = of_property_count_u32_elems(np, "clock-indices");
> > > > +       if (count < 0) {
> > > > +               dev_err(&pdev->dev, "failed to count clocks\n");
> > > > +               return -EINVAL;
> > > > +       }
> > >
> > > Is 'count' expected to be equal to IMX_LPCG_MAX_CLKS? Because later on
> > > in this function we set the num of clks to the MAX instead of the count
> > > from clock-indices.
> > >
> >
> > No. Here is a tricky to ease the clk getting.
> > For example, one LPCG supports up to 8 clock outputs which each of them
> > is fixed to 4 bits. Then we can easily use the bit-offset/clk-indices
> > parsed from DT
> > to fetch the corresponding clock by hws[clkspec->args[0] / 4].
> > And the cost is very limited with only a few pointers.
>
> Ok. Can you add a comment into the code to explain this?
>

Yes, added.
Thanks for the good suggestion.

Regards
Aisheng
