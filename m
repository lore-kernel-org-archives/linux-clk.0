Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADCCC282DD
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 10:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36016214AE
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 10:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPpI+Wyu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfDWKkJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 06:40:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52049 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfDWKkI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Apr 2019 06:40:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id 4so18050500wmf.1;
        Tue, 23 Apr 2019 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l1jRs+VjgKr89zOhBdbqqRIIlbputC+F8Zk2yYKbNgU=;
        b=GPpI+WyuDh9UF5YRcVMFIyZObqeJT7d8pRfSxWxEbzxyzzD9g/f+mpHEGsKZFjyHzW
         SJQPFd2bbh0inepg0kGnTIe/uhPn3qKZ/asAgPNLZ+VYjQ/oS9Oc3FeWV639bNQKN1ck
         4JcDhIaLrfyL2h9DDF/J76du516p8NyeGLpwMpGi4L58lEv/h2Xq5TFwhl/5PbkCskzN
         P4xac557sOvWB0r4P3AuMnhwUktvbEFAkdUBM1c7jk2xyUKHcXeWkCpd66OcSAs3+CFc
         LFxlycJm8IJushgZTkJaxWI1RX86iDBfEt9g/ydIMmosfulsQFvXS4M5VuF4oLeSXMgx
         8MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1jRs+VjgKr89zOhBdbqqRIIlbputC+F8Zk2yYKbNgU=;
        b=gD7B8JVR0O2d8YMeOvrg3oYGr7jfF2FK390cLJCzo7WGojpkINPFep1o4I0vgVqNHn
         qnu0rt1e8H9xlXCvx5aFHIbvFX2br1IzLVodhCNshqPPkGKXR7CnPnGYRWNW3Gpr5rO8
         +e6Y38pLMSpIcL4R/tY5BWiNvZXGuv/pD8gcd+cdrQ6K6if5B8PpBKfgBzsjjPENbLpQ
         rmZvjyswcWBonMtjszyN2iCSMO9aXeiyOlJafrhZL7N9YZ2S0OPrMBUKmJ2c7NMI2z4w
         9OYQHgJt6iCb0+y/pGLhcIosa4T33YyRzH5CC1j7Ipcy31c3KXCEVFxObEfpGEMSYrgp
         e0fA==
X-Gm-Message-State: APjAAAVF2mfK35x/+1QkbubKeS60vHBMP4qAfFxiUL71cd0laYhSA/5q
        E9uzCYvcj2e5Fh7vpv5L5UFIFPz2o0d521iwNrc=
X-Google-Smtp-Source: APXvYqxX3ua8Qip8sefdRbffrTTXZjOWBfJVKhjRipliVEu+qqlgPQ7lY15svXgVJ4//LFGPkaoS3e4lRfjlEplbk9A=
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr1754113wmd.124.1556016006820;
 Tue, 23 Apr 2019 03:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
 <20190418111211.10474-2-jonas.gorski@gmail.com> <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com>
In-Reply-To: <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Tue, 23 Apr 2019 12:39:59 +0200
Message-ID: <CAOiHx=mjhzG-i8H5R0A+Mu3mcBXTNEaaBhC8rwCQPMWArDA+1A@mail.gmail.com>
Subject: Re: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Paul Mackerras <paulus@samba.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Anatolij Gustschin <agust@denx.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On Tue, 23 Apr 2019 at 09:49, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Jonas,
>
> On Thu, Apr 18, 2019 at 1:12 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > Add a clock specific flag to switch register accesses to big endian, to
> > allow runtime configuration of big endian divider clocks.
> >
> > Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> > ---
> > V2 -> V3:
> >  * fix passed arguments to clk_div_readl found by kbuild
> >  * drop unneeded else in clk_div_readl
> > V1 -> V2:
> >  * switch from global to local flag
> >
> >  drivers/clk/clk-divider.c    | 26 ++++++++++++++++++++++----
> >  include/linux/clk-provider.h |  4 ++++
> >  2 files changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> > index e5a17265cfaf..25c7404e376c 100644
> > --- a/drivers/clk/clk-divider.c
> > +++ b/drivers/clk/clk-divider.c
> > @@ -25,6 +25,24 @@
> >   * parent - fixed parent.  No clk_set_parent support
> >   */
> >
> > +static inline u32 clk_div_readl(struct clk_divider *divider)
> > +{
> > +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> > +               return ioread32be(divider->reg);
> > +
> > +       return clk_readl(divider->reg);
> > +}
> > +
> > +static inline void clk_div_writel(struct clk_divider *divider, u32 val)
> > +{
> > +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> > +               iowrite32be(val, divider->reg);
> > +       else
> > +               clk_writel(val, divider->reg);
> > +}
> > +
> > +#define div_mask(width)        ((1 << (width)) - 1)
>
> What's the purpose of adding this definition?
> It does not seem to be used.

No purpose at all, it's an uncaught artifact from rebasing ._.

Stephen, which one is your preferred way of fixing that?

a) a new V4 patchset without this line
b) a follow up patch that removes it
c) just removing the line yourself


Regards
Jonas
