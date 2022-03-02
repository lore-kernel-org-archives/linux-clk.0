Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB8C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 17:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243797AbiCBR0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 12:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243829AbiCBR0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 12:26:17 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9E4CCC53
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 09:25:31 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id j9-20020a9d7d89000000b005ad5525ba09so2242140otn.10
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7p+Sua3vWTnrJZHdXkQWaCDCi1ogBb2wcZTsYiqgV4=;
        b=kSgjDYJtPfb9ROCmWxhJKur8Uaw3MOy+15dIiLp2BSKjF6NgN4VZPpOm11PH5Q2XrA
         r7UqQ8AaC5RLrjGi485c5S8PablqMesWLFYHzsnpfcYXW5sH7ojPTvi/b4Wtn1+Lb4LI
         u8Ki+p4BrjOZDvRVCNP8Yq6NvOGZ/t85CEOYWpgTSqxC7K326FpV9CyYlRyr7Dbr2eNx
         FAVu6BaRigJcOwFcbBaJDzoIRdc8l5qu53ZMTrJiSXmNLtU9wGjUkOmDJ9OFe1KyB66C
         FfM9f9NRMOu0nrjn4rjNuOs/xijBjaPfQMoRJ0OArmgDe2qhxEE2dOoW/gkO3qeFidbu
         eyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7p+Sua3vWTnrJZHdXkQWaCDCi1ogBb2wcZTsYiqgV4=;
        b=AXaVGTWazNG4teGliUtkrDhWzdCTQnNsO2qerf84BRNhQQ4xFQX9fcoO5VXEOo56ok
         bQbsrmyI3CF6kDgKsLmoAZl1xG7JqJzxMG5nvX/sIO2GnAofmGG/ozObfmGphXwL8oKm
         Zp/IUXcD78ZBTfSiHE402OLgG3R0QhxqlwEBrDL4tZT9iLiE1AK1C/q7oukUuwOKKr6d
         7g6LBrX5HP5HTtZaoK4RYZ4Xu46zeZRrg1N45KVtScJNKcunv//NhEYRgUFzMDrWhmoe
         TnYmGl/V1WVJexEkHKsgZEVPIjK0pazUNmdU/4HbxQ4NXMdbvbbnC5VEOfIqF4xkepS0
         LstQ==
X-Gm-Message-State: AOAM530mrCBJqGemzEZdU9xSNWOTaEZLE7Amkx/qxl0ISPzV3ygoHWAH
        dIxchuUi14Vh2LQDJgnd8bibYQKnOQwMPLnRUezjVw==
X-Google-Smtp-Source: ABdhPJwwxzHWuf8viqR1OdWBAi0a7r41AOauclraB7d347YvqjAztRTJua35obzbRfApLE3btcmqP+cYlOjzbV8E/Ns=
X-Received: by 2002:a05:6830:314c:b0:5af:dc8a:d066 with SMTP id
 c12-20020a056830314c00b005afdc8ad066mr13881461ots.28.1646241930640; Wed, 02
 Mar 2022 09:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
 <20220302110508.69053-3-bhupesh.sharma@linaro.org> <CAA8EJprTiGfEnkPOeDPyobdRGkyzyC6=vHivfQ9zsk22JPjM3w@mail.gmail.com>
In-Reply-To: <CAA8EJprTiGfEnkPOeDPyobdRGkyzyC6=vHivfQ9zsk22JPjM3w@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 2 Mar 2022 22:55:19 +0530
Message-ID: <CAH=2NtySLVEk_aLdftCS9DcfPS6egUxVAJTZnxjxLPQQnGb4aw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: qcom: gcc: Add emac GDSC support for SM8150
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

On Wed, 2 Mar 2022 at 18:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 2 Mar 2022 at 14:05, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > Add the EMAC GDSC defines and driver structures for SM8150.
> >
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-sm8150.c               | 34 +++++++++++++--------
> >  include/dt-bindings/clock/qcom,gcc-sm8150.h |  1 +
> >  2 files changed, 23 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > index 245794485719..08ba29e3a835 100644
> > --- a/drivers/clk/qcom/gcc-sm8150.c
> > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > @@ -3448,22 +3448,31 @@ static struct clk_branch gcc_video_xo_clk = {
> >         },
> >  };
> >
> > +static struct gdsc emac_gdsc = {
> > +       .gdscr = 0x6004,
> > +       .pd = {
> > +               .name = "emac_gdsc",
> > +       },
> > +       .pwrsts = PWRSTS_OFF_ON,
> > +       .flags = POLL_CFG_GDSCR,
> > +};
> > +
> >  static struct gdsc usb30_prim_gdsc = {
> > -               .gdscr = 0xf004,
> > -               .pd = {
> > -                       .name = "usb30_prim_gdsc",
> > -               },
> > -               .pwrsts = PWRSTS_OFF_ON,
> > -               .flags = POLL_CFG_GDSCR,
> > +       .gdscr = 0xf004,
> > +       .pd = {
> > +               .name = "usb30_prim_gdsc",
> > +       },
> > +       .pwrsts = PWRSTS_OFF_ON,
> > +       .flags = POLL_CFG_GDSCR,
>
> Please move alignment changes to a separate patch

Right, Will fix it in v3.

Regards,
Bhupesh

> >  };
> >
> >  static struct gdsc usb30_sec_gdsc = {
> > -               .gdscr = 0x10004,
> > -               .pd = {
> > -                       .name = "usb30_sec_gdsc",
> > -               },
> > -               .pwrsts = PWRSTS_OFF_ON,
> > -               .flags = POLL_CFG_GDSCR,
> > +       .gdscr = 0x10004,
> > +       .pd = {
> > +               .name = "usb30_sec_gdsc",
> > +       },
> > +       .pwrsts = PWRSTS_OFF_ON,
> > +       .flags = POLL_CFG_GDSCR,
> >  };
> >
> >  static struct clk_regmap *gcc_sm8150_clocks[] = {
> > @@ -3714,6 +3723,7 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
> >  };
> >
> >  static struct gdsc *gcc_sm8150_gdscs[] = {
> > +       [EMAC_GDSC] = &emac_gdsc,
> >         [USB30_PRIM_GDSC] = &usb30_prim_gdsc,
> >         [USB30_SEC_GDSC] = &usb30_sec_gdsc,
> >  };
> > diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > index 3e1a91876610..40596b9ded06 100644
> > --- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > +++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> > @@ -243,5 +243,6 @@
> >  /* GCC GDSCRs */
> >  #define USB30_PRIM_GDSC                     4
> >  #define USB30_SEC_GDSC                                         5
> > +#define EMAC_GDSC                                              6
> >
> >  #endif
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
