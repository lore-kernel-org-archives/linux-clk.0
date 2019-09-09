Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C617EC4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 11:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A77921924
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 11:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJxbLyn4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390984AbfIILdS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 07:33:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39881 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391081AbfIILdR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 07:33:17 -0400
Received: by mail-io1-f65.google.com with SMTP id d25so27799855iob.6
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lIwVXF9pE1FT7bnrzezd7oAZ7WJ0Y3NJXiACUekNGI4=;
        b=JJxbLyn4OvBhNZjZQXQWA0R9ozhoS2LPM/TA45dfZi43evnpOTEvxDJOPW8wtXHfIf
         ADU8Jn2yshA3gc/3rcqqDfuCl3CIVDLCislKrNeX2hGCXBBum5I4iSnj2J5w/o64CpT0
         IcGaX1/mHmTTx3MGWE+q9pSqKwvhniiu/XkuYhe45ASuOc7Y55bSQDf82+5/XQ+MGpdJ
         laZJ6PuByKG15TKEBs6CbTYCRuX0qHiUXH9xZsRXaBjQXYRHEWzGvVrcbue6G0lz1Zn3
         rEQpou6U4lDfnjWYhMy5TCZTi3U1SkHtyvAnTjGhIvt8fotKkzxRJQq4u/F13WY4f1kp
         vaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lIwVXF9pE1FT7bnrzezd7oAZ7WJ0Y3NJXiACUekNGI4=;
        b=P0CcK4u25WT83mOlMUmKBP/HuOl3tz98VVsRbCSLGfMpUP284223mida7fxsxZpOGl
         QN4BRwAxFmwOraI+50mdwVL7jxpjC4m4Oo6iNPfyVf1TIDm5Bon2dYaXvhmso2o7V2KD
         xFO4xsHiEyBLUSqRsNndBTyt+NZipkU+UzkOMmuDDp2hoAhry3QZ1cmpQte/EJ5hhWZm
         IFMdO6uV0EQ0x6/9vXTx8oesXTz5sMxyo3aVJI3yXNpo0zArMtmC7uM2poH05FhdqVk3
         bNq8mlYaHBiczuirlBoacrLj/ZEeTSjQe8R2wSdISXT0+rvUuZZDOBWAPxV3ChOg3Ncv
         P3lg==
X-Gm-Message-State: APjAAAWHYgdfWPwAEqsYwvHLAKkcUl5jn/t+Qp3Q5Q8Y4XK+eLIeZA67
        oSJg6aGYwJvMHT1tMvBU8+aMDZjeIX9rG+8YoCQ=
X-Google-Smtp-Source: APXvYqzznKrlCoXkzTu0gbF0faeVH29biPOBKSaOYFRVWyrA+6EFFF+BOrMD2Sex/ORaTXzi0JFJ7i3p1tgUMU777G4=
X-Received: by 2002:a6b:ee17:: with SMTP id i23mr3732157ioh.168.1568028795550;
 Mon, 09 Sep 2019 04:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-9-git-send-email-aisheng.dong@nxp.com> <20190906171323.8847820640@mail.kernel.org>
In-Reply-To: <20190906171323.8847820640@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 9 Sep 2019 19:23:14 +0800
Message-ID: <CAA+hA=QJwfHsRA+G2oT2awLxx659qXLPsiECV6VYcJ181c6D8w@mail.gmail.com>
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

]On Sat, Sep 7, 2019 at 5:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-08-20 04:13:22)
> > Add parsing clocks from device tree.
>
> Please describe some more here.

Will improve.

> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       base = devm_ioremap_resource(&pdev->dev, res);
> > +       if (IS_ERR(base))
> > +               return PTR_ERR(base);
> > +
> > +       count = of_property_count_u32_elems(np, "clock-indices");
> > +       if (count < 0) {
> > +               dev_err(&pdev->dev, "failed to count clocks\n");
> > +               return -EINVAL;
> > +       }
>
> Is 'count' expected to be equal to IMX_LPCG_MAX_CLKS? Because later on
> in this function we set the num of clks to the MAX instead of the count
> from clock-indices.
>

No. Here is a tricky to ease the clk getting.
For example, one LPCG supports up to 8 clock outputs which each of them
is fixed to 4 bits. Then we can easily use the bit-offset/clk-indices
parsed from DT
to fetch the corresponding clock by hws[clkspec->args[0] / 4].
And the cost is very limited with only a few pointers.

> > +
> > +       clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws, IMX_LPCG_MAX_CLKS),
>
> This line is too long.
>

Will improve.

> > +                               GFP_KERNEL);
> > +       if (!clk_data)
> > +               return -ENOMEM;
> > +
> > +       clk_data->num = IMX_LPCG_MAX_CLKS;
> > +       clk_hws = clk_data->hws;
> > +
> > +       ret = of_property_read_u32_array(np, "clock-indices", bit_offset,
> > +                                        count);
> > +       if (ret < 0) {
> > +               dev_err(&pdev->dev, "failed to read clocks bit-offset\n");
>
> This isn't called bit-offset anymore.
>

Will improve.

> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = of_clk_parent_fill(np, parent_names, count);
> > +       if (ret != count) {
> > +               dev_err(&pdev->dev, "failed to get clock parent names\n");
> > +               return -EINVAL;
>
> return count?
>

Okay

Regards
Aisheng
