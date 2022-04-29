Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D5EC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 15:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378268AbiD2PRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 11:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378255AbiD2PRR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 11:17:17 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F45D4CAF
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:46 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2f7bb893309so88181227b3.12
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fOXimSCWoaVOE75jYDyXyVZtWa+IqFp/UvK677qe1Uk=;
        b=PDcGimo/5s3U9nmlgqUxiJVzyUi9WZgblxXKb+cIYX+nHz5/aTWd3qO63NTaYXOIG2
         ephTbM10gm0qGHp9Xg8IAcj7v8rI1/VUay8WcOgm2YfeCARpjP0QIqK0chU9IfVcE5Z5
         rq1YtWNw4KXwRzo3Xt86/LxFUyZDLLXnfWxYLVwuGZYpVasgiXRd3VDh/k2uiV/eY5K9
         zI/Ldu0Nti/Z1IRGPL0IFzgTruprZQH6YooGDmCilYl4UeyvIhr/kSDR1Sp72lAc/2hn
         LpXx2YGPZ4IriZ28HQBctK1zf3Bvp3Ha9WjaX2nfQNnFN0YGFdbR81WVrqZjd00w2bL4
         Sjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOXimSCWoaVOE75jYDyXyVZtWa+IqFp/UvK677qe1Uk=;
        b=IQ9Qtd+O0rPGIzqcwHgFm6JSqyihCng5doQB8QO1iGpYdzGZ4MFVOTv0TUODVG4L98
         go5U2y2xwrosLptinHZmDmqpwJPwkhMHLNyqBkHm03FZzYiBEjBR2jmE6iujhR88Z9F+
         m1Cgc06uq/k+PTVYckqrxV357GBabP7QkU6eq9nL+QURQNbdHR5aHDIMWpMQr3rGJDk9
         p+TXMWD9oaW0B1ol3lfeirmuUE0FGLior88oWdZe729/WC5oSXqCcDmUFDoKYgnOapTG
         n0+ipzQduiD9nMkJr3bYbiaECz/288qCV/dxb1Dnsy2CKfH9flDyppnFHnyXjVdc7V+w
         v0Pw==
X-Gm-Message-State: AOAM532hZRimKs0XUALnbwtW2txkjbzjZbpAtk1nSBwCOYxlc4odZQYO
        cdW+bDL87SRGzra/GhmDbWDR7j/q4F+F4cCsYGacpHk21EI=
X-Google-Smtp-Source: ABdhPJyU2T98l+dDUUN+TqVFXfp4urNMrgRil/xWQSQfajPv5Q5lFfjL9/rvXHau5ituz1aDGEmtlFm20S6u5dxO8UI=
X-Received: by 2002:a81:5603:0:b0:2f8:3187:f37a with SMTP id
 k3-20020a815603000000b002f83187f37amr16995409ywb.255.1651245225429; Fri, 29
 Apr 2022 08:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429120108.9396-1-ansuelsmth@gmail.com> <20220429120108.9396-5-ansuelsmth@gmail.com>
 <1f013429-8a5b-47c8-a146-41bb66af3f03@linaro.org> <626c0034.1c69fb81.d55d4.4f09@mx.google.com>
In-Reply-To: <626c0034.1c69fb81.d55d4.4f09@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 18:13:34 +0300
Message-ID: <CAA8EJpqF74gUrPnOjVmZhwmdE-sR4G_SCOxK6Wvmh1ss1Rv_jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: qcom: clk-krait: add apq/ipq8064 errata workaround
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 29 Apr 2022 at 18:11, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 06:00:45PM +0300, Dmitry Baryshkov wrote:
> > On 29/04/2022 15:01, Ansuel Smith wrote:
> > > Add apq/ipq8064 errata workaround where the sec_src clock gating needs to
> > > be disabled during switching. To enable this set disable_sec_src_gating
> > > in the mux struct.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >   drivers/clk/qcom/clk-krait.c | 16 ++++++++++++++++
> > >   drivers/clk/qcom/clk-krait.h |  1 +
> > >   drivers/clk/qcom/krait-cc.c  |  1 +
> > >   3 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> > > index 6c367ad6506a..4a9b3296c45b 100644
> > > --- a/drivers/clk/qcom/clk-krait.c
> > > +++ b/drivers/clk/qcom/clk-krait.c
> > > @@ -18,13 +18,23 @@
> > >   static DEFINE_SPINLOCK(krait_clock_reg_lock);
> > >   #define LPL_SHIFT 8
> > > +#define SECCLKAGD  BIT(4)
> > > +
> > >   static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
> > >   {
> > >     unsigned long flags;
> > >     u32 regval;
> > >     spin_lock_irqsave(&krait_clock_reg_lock, flags);
> > > +
> > >     regval = krait_get_l2_indirect_reg(mux->offset);
> > > +
> > > +   /* apq/ipq8064 Errata: disable sec_src clock gating during switch. */
> > > +   if (mux->disable_sec_src_gating) {
> > > +           regval |= SECCLKAGD;
> > > +           krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   }
> > > +
> > >     regval &= ~(mux->mask << mux->shift);
> > >     regval |= (sel & mux->mask) << mux->shift;
> > >     if (mux->lpl) {
> > > @@ -33,6 +43,12 @@ static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
> > >     }
> > >     krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   /* apq/ipq8064 Errata: re-enabled sec_src clock gating. */
> > > +   if (mux->disable_sec_src_gating) {
> > > +           regval &= ~SECCLKAGD;
> > > +           krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   }
> > > +
> > >     /* Wait for switch to complete. */
> > >     mb();
> > >     udelay(1);
> > > diff --git a/drivers/clk/qcom/clk-krait.h b/drivers/clk/qcom/clk-krait.h
> > > index 9120bd2f5297..f930538c539e 100644
> > > --- a/drivers/clk/qcom/clk-krait.h
> > > +++ b/drivers/clk/qcom/clk-krait.h
> > > @@ -15,6 +15,7 @@ struct krait_mux_clk {
> > >     u8              safe_sel;
> > >     u8              old_index;
> > >     bool            reparent;
> > > +   bool            disable_sec_src_gating;
> > >     struct clk_hw   hw;
> > >     struct notifier_block   clk_nb;
> > > diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
> > > index 4d4b657d33c3..0f88bf41ec6e 100644
> > > --- a/drivers/clk/qcom/krait-cc.c
> > > +++ b/drivers/clk/qcom/krait-cc.c
> > > @@ -138,6 +138,7 @@ krait_add_sec_mux(struct device *dev, int id, const char *s,
> > >     mux->parent_map = sec_mux_map;
> > >     mux->hw.init = &init;
> > >     mux->safe_sel = 0;
> > > +   mux->disable_sec_src_gating = true;
> >
> > This has to be guarded with the of_compatible checks. Otherwise you'd apply
> > this errata to all Krait CPUs, not only apq/ipq8064.
> >
> > At least this should be limited to krait-cc-v1 with the note that there is
> > no way to distinguish between platforms.
> >
>
> Mhh can't i check the machine compatible directly to limit this to
> apq/ipq8064?

Yes, use of_machine_is_compatible(). Add a comment that you have to do
this because of the lack of soc-specific device compats.

> > >     init.name = kasprintf(GFP_KERNEL, "krait%s_sec_mux", s);
> > >     if (!init.name)
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
>         Ansuel



-- 
With best wishes
Dmitry
