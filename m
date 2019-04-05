Return-Path: <SRS0=2G6t=SH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83ADC4360F
	for <linux-clk@archiver.kernel.org>; Fri,  5 Apr 2019 15:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E27B2175B
	for <linux-clk@archiver.kernel.org>; Fri,  5 Apr 2019 15:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luuB6phm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfDEPTj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Apr 2019 11:19:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43166 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfDEPTj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Apr 2019 11:19:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id c8so3448554pfd.10;
        Fri, 05 Apr 2019 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RN1Lrg83FfIWkxdnourqDl71W3vXZvLTSWqnA7ilcK4=;
        b=luuB6phms8cPAsuYidZ0K9F4qHQZH6g9A8U1Z3v52sm4wsiOjSAgnSrTG4MbcnlxrH
         OKo5hrq39EKTs9XFdN8P8ZkGCwMyj9XmuGBKfPVwtEiwrtnXX9VW6eCntdDinB7m/KcL
         djk67HBWkmKkmZ9bSsykYX/sq9kw7UrYu7JXJlc0eoKsGar/dGFnMuFAUZkCA2Qwf9iu
         x9NAdzTjc4fJxZmQPB8iaUVMWFuO/VuoKVouWP28iykUqRnBpxIjiHLqdO0e/+X9UBDc
         k/aBlzUjozo9en7Yw0BXInhxJAjRE8aFm0YWn+x9qmE/fWV1qrL1teBTbZN2LpDJT4BJ
         Iuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RN1Lrg83FfIWkxdnourqDl71W3vXZvLTSWqnA7ilcK4=;
        b=KlIcp5EOU32NH2gs6gCs7xesEbFrpyaBiWmS8+qu/q03c2XbQvNt4O1B4l7T25NFsq
         2aFUaReRGtphDwM1KnqHjFpFnfv1qceTq6Rx/b9oiXhcTo6RbXRg/Iqco6sHDlMEGAmN
         KXnz7SM5xVzePewH+HPH2tz/z6w0pevAT5DVfzw5LfRO4GFNkO+C2+USyF8Wj3KCrD4C
         Iu6BDPzDw8XZUUWoOXRuhwkj/YucJRmYc+Nk3qnKqdaa4WelssO4lHbTqAOzBsx9V2tu
         nKBueXMYqB6xDr3eje02V5cI9/dYMATtXo5LezDEYkXZssqzZtxzykqqArIFWF4Eb8Zm
         uxBA==
X-Gm-Message-State: APjAAAV0QKSJ5vCBYVCkPEmnvqzF/QgVSzK+PW2aq614S52EEkTUlYbS
        yXJFnczDW8NDqTROXf7tBOIZuHdcErpo1nYtpIY=
X-Google-Smtp-Source: APXvYqzpf1MXwvXN3iMSXlKJsp0bdbFR/cmaTzCDIcv5qg8LDA/hjLoa3DSEV5BtrLTAemuYzTdbt3AF0A9yfbY7JIw=
X-Received: by 2002:a65:4302:: with SMTP id j2mr12036150pgq.291.1554477578182;
 Fri, 05 Apr 2019 08:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190328124939.23139-1-dave.mueller@gmx.ch> <20190404141325.21952-1-dave.mueller@gmx.ch>
In-Reply-To: <20190404141325.21952-1-dave.mueller@gmx.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Apr 2019 18:19:26 +0300
Message-ID: <CAHp75VeaWLW4GdknPHeh69enOFc_3izcwwpAhKXGJfk45QMLgw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: x86: Add system specific quirk to mark clocks as critical
To:     =?UTF-8?Q?David_M=C3=BCller?= <dave.mueller@gmx.ch>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 4, 2019 at 5:14 PM David M=C3=BCller <dave.mueller@gmx.ch> wrot=
e:
>
> Since commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
> unconditionally gated off. Unfortunately this will break systems where th=
ese
> clocks are used for external purposes beyond the kernel's knowledge. Fix =
it
> by implementing a system specific quirk to mark the necessary pmc_plt_clk=
s
> as critical.
>
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: David M=C3=BCller <dave.mueller@gmx.ch>

I'm fine with the patch, though few minor comments below.

> +       /*
> +        * On some systems, the pmc_plt_clocks already enabled by the
> +        * firmware are being marked as critical to avoid them being
> +        * gated by the clock framework

Period would be nice to have at the end.

> +        */

> +       if (d) {
> +               clk_data->chk_critclks =3D true;
> +               pr_info("%s critclks quirk enabled\n", d->ident);
> +       }

I would go with callback, but for now this is okay as well.

> - * @base:      PMC clock register base offset
> - * @clks:      pointer to set of registered clocks, typically 0..5
> + * @base:              PMC clock register base offset
> + * @clks:              pointer to set of registered clocks, typically 0.=
.5

> + * @chk_critclks:      flag to indicate if firmware enabled pmc_plt_clks
> + *                     should be marked as critial or not

Perhaps simple critical? And do not touch the rest here.

>   */

--=20
With Best Regards,
Andy Shevchenko
