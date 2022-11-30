Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7890AC352A1
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 10:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiK3KVi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235935AbiK3KVS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 05:21:18 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BF57B4C9
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:20:06 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id l67so20959287ybl.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VsMd9vMEW4iIS67puz4SPbkjdi7LKuVxz3yAiVP9E/Y=;
        b=SZPjialpai4Sz9pGYiyF2vAsdc4X36d71Xkf9sx1lvkzRzptfkgbRAgdx6QlDNUEXn
         Uuo+dXGuoBXvsqFbZL7TCqimU7+48b4EV9Jz0JVCe3WcUHZBIRjljAtplOIj8tiECgjs
         ymAF+S53e17XPE2EuX5ZXmdbpTm4iZ6U6Ijfo225cEm/3zV9iepDHd3IWKPOGBj0pKkQ
         eOKT+BgxzsI4ISZeuTJo885P9i4f4MBNEtVVHHaRWRRmC1yURWX6l/hKNzj2RrDtqqHw
         nQ1c21xg+zK1wAxRkjWkWIY3ChMxFG/AfLDSq8z2ZR2OpE0/lLIZezYmGuTUbkEB0jg5
         EWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsMd9vMEW4iIS67puz4SPbkjdi7LKuVxz3yAiVP9E/Y=;
        b=AvvAD1lrrd34HC9L3Ek7Y6zaiFQqgwRNuc0G5m8hmdyQLrNUHDOE5e2P41trfQOmJc
         ip0eqHfkdxISjk3pOH0eNLgNK2d5Vildjqu1NnQgTJEVlUNimhReJvIXadh7X4rGKloR
         lL11IZjnba1A+EPojibNl63aFh/4uMJglAD6AokFq68TfdcAr9Yb0STr4Z1FmMWDkqX6
         D7Z2KxRVw87dDa/RCaooeoiN1bXyyjEAKxUzCLHJ/VaF0Ydosf5jJCFCWcrz/xe/uxIz
         W1MeTcYGAKog8C/VV8QNRFpjrlkoKzb0EGhALyt20LkCZeew/gBCKZaFA8Xp00WVsFVE
         EP0Q==
X-Gm-Message-State: ANoB5pl7hOktGiIf9OUZR9ZeNYFbStoFjAj+sG2anWJpf+ZhP9jxAtr4
        mrlrTujgPpkDX5mhQwCw3XQv+o+01sbDDQ0ZEiUbJeTz75s=
X-Google-Smtp-Source: AA0mqf5ajilJH4RXqHSxNuuscSi1XtOOwrAA0MN288TJXbz1Eljq5KRdSEbKcqOfFSTbi/Gt7JRwMb7Ws08CtQskk5I=
X-Received: by 2002:a25:d952:0:b0:6f4:4ac9:82a7 with SMTP id
 q79-20020a25d952000000b006f44ac982a7mr21007933ybg.152.1669803599326; Wed, 30
 Nov 2022 02:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-4-dmitry.baryshkov@linaro.org> <7aeedf55-5cce-7cca-e0c9-1faff6be3fee@linaro.org>
In-Reply-To: <7aeedf55-5cce-7cca-e0c9-1faff6be3fee@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Nov 2022 12:19:48 +0200
Message-ID: <CAA8EJpqyjW3G=tKxQXKozJGtAt_7fF93+hOSg=pDsJNFb5vRzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: qcom: rpmh: drop the platform from clock definitions
To:     Alex Elder <elder@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Nov 2022 at 00:07, Alex Elder <elder@linaro.org> wrote:
>
> On 11/29/22 4:10 AM, Dmitry Baryshkov wrote:
> > A single clock definition can be used on different platforms. Thus the
> > platform part of the clock name is not correct (and can be misleading).
> >
> > Remove the platform-specific part of the defined clock. To keep the name
> > visible to the userspace add an extra optional 'suffix' argument which
> > is used to distinguish similar clocks in the code.
>
> OK, I like what you're doing here, but I think it could use
> some more thought.
>
> I very much dislike the "empty" parameters passed to the macros.
> I.e., the consecutive commas in the calls
>
> Instead, please find a reasonable way to have a different version
> of the macro that omits the missing/empty argument.

Ack, let's see what I can do.

> Second, I observe that (with the exception of the missing parameters)
> the suffix always seems to encode the divider value.  Can you find
> a way to have that be leveraged in the macro definition?

I thought about this, but I decided against that. For example, bb
clocks also encode the resource type (_a4 vs _g4). Let me see if I can
do better while removing the empty params.

>
> I have a few white space comments below but I'm going to leave it
> at that.

Ack

>
>                                         -Alex
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/clk-rpmh.c | 396 ++++++++++++++++++------------------
> >   1 file changed, 198 insertions(+), 198 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index c4852bbd00bf..513c3a025f4b 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
> >
> >   static DEFINE_MUTEX(rpmh_clk_lock);
> >
> > -#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name, \
> > +#define __DEFINE_CLK_RPMH(_name, _name_active, _suffix,      _res_name,      \
>
> Replace the tab in the line above with space.  (If you have anything
> similar elsewhere, please fix.)
>
> >                         _res_en_offset, _res_on, _div)                \
> > -     static struct clk_rpmh _platform##_##_name_active;              \
> > -     static struct clk_rpmh _platform##_##_name = {                  \
> > +     static struct clk_rpmh clk_rpmh_##_name_active ## _suffix;      \
> > +     static struct clk_rpmh clk_rpmh_##_name ## _suffix = {          \
> >               .res_name = _res_name,                                  \
> >               .res_addr = _res_en_offset,                             \
> >               .res_on_val = _res_on,                                  \
> >               .div = _div,                                            \
> > -             .peer = &_platform##_##_name_active,                    \
> > +             .peer = &clk_rpmh_##_name_active ## _suffix,            \
> >               .valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |        \
> >                                     BIT(RPMH_ACTIVE_ONLY_STATE) |     \
> >                                     BIT(RPMH_SLEEP_STATE)),           \
> > @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >                       .num_parents = 1,                               \
> >               },                                                      \
> >       };                                                              \
> > -     static struct clk_rpmh _platform##_##_name_active = {           \
> > +     static struct clk_rpmh clk_rpmh_##_name_active ## _suffix = {   \
> >               .res_name = _res_name,                                  \
> >               .res_addr = _res_en_offset,                             \
> >               .res_on_val = _res_on,                                  \
> >               .div = _div,                                            \
> > -             .peer = &_platform##_##_name,                           \
> > +             .peer = &clk_rpmh_##_name ## _suffix,                   \
> >               .valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |        \
> >                                       BIT(RPMH_ACTIVE_ONLY_STATE)),   \
> >               .hw.init = &(struct clk_init_data){                     \
> > @@ -111,18 +111,18 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >               },                                                      \
> >       }
> >
> > -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,       \
> > +#define DEFINE_CLK_RPMH_ARC(_name, _name_active, _suffix, _res_name, \
> >                           _res_on, _div)                              \
> > -     __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,    \
> > +     __DEFINE_CLK_RPMH(_name, _name_active,_suffix, _res_name,       \
>
> Add a space before _suffix above.  (If you have anything similar
> elsewhere, please fix.)
>
> >                         CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
> >
> > -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,       \
> > -                             _div)                                   \
> > -     __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,    \
> > +#define DEFINE_CLK_RPMH_VRM(_name, _name_active, _suffix, _res_name, \
> > +                         _div)                                       \
> > +     __DEFINE_CLK_RPMH(_name, _name_active, _suffix, _res_name,      \
> >                         CLK_RPMH_VRM_EN_OFFSET, 1, _div)
> >
> > -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)             \
> > -     static struct clk_rpmh _platform##_##_name = {                  \
> > +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)                                \
> > +     static struct clk_rpmh clk_rpmh_##_name = {                     \
> >               .res_name = _res_name,                                  \
> >               .valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),        \
> >               .div = 1,                                               \
> > @@ -342,55 +342,55 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
> >   };
> >
> >   /* Resource name must match resource id present in cmd-db */
> > -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> > -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> > -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> > -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> > +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div1, "xo.lvl", 0x3, 1);
> > +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div2, "xo.lvl", 0x3, 2);
> > +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div4,  "xo.lvl", 0x3, 4);
> > +DEFINE_CLK_RPMH_ARC(qlink, qlink_ao,, "qphy.lvl", 0x1, 4);
> >
> > -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> > -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> > -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, , "lnbclka1", 2);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, , "lnbclka2", 2);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, , "lnbclka3", 2);
> >
> > -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> > -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, _a4, "lnbclka1", 4);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _a4, "lnbclka2", 4);
> >
> > -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> > -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _g4, "lnbclkg2", 4);
> > +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, _g4, "lnbclkg3", 4);
> >
> > -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> > -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> > -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> > -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> > -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao,, "rfclka1", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao,, "rfclka2", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao,, "rfclka3", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao,, "rfclka4", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk5, rf_clk5_ao,, "rfclka5", 1);
> >
> > -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> > -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> > -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> > -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao, _d, "rfclkd1", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao, _d, "rfclkd2", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao, _d, "rfclkd3", 1);
> > +DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao, _d, "rfclkd4", 1);
> >
> > -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> > +DEFINE_CLK_RPMH_VRM(div_clk1, div_clk1_ao,, "divclka1", 2);
> >
> > -DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> > -DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> > -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> > -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> > -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> > +DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> > +DEFINE_CLK_RPMH_BCM(ce, "CE0");
> > +DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> > +DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> > +DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> >
> >   static struct clk_hw *sdm845_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_CE_CLK]           = &sdm845_ce.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_CE_CLK]           = &clk_rpmh_ce.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> > @@ -399,18 +399,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> >   };
> >
> >   static struct clk_hw *sdm670_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_CE_CLK]           = &sdm845_ce.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_CE_CLK]           = &clk_rpmh_ce.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> > @@ -419,14 +419,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> >   };
> >
> >   static struct clk_hw *sdx55_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sc8180x_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sc8180x_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sc8180x_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sc8180x_rf_clk2_ao.hw,
> > -     [RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1_d.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao_d.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2_d.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao_d.hw,
> > +     [RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> > @@ -435,18 +435,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> >   };
> >
> >   static struct clk_hw *sm8150_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> > @@ -455,17 +455,17 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> >   };
> >
> >   static struct clk_hw *sc7180_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> > @@ -474,18 +474,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> >   };
> >
> >   static struct clk_hw *sc8180x_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sc8180x_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sc8180x_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sc8180x_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sc8180x_rf_clk2_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sc8180x_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sc8180x_rf_clk3_ao.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1_d.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao_d.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2_d.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao_d.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3_d.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao_d.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> > @@ -494,18 +494,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> >   };
> >
> >   static struct clk_hw *sm8250_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK1]       = &sm8250_ln_bb_clk1.hw,
> > -     [RPMH_LN_BB_CLK1_A]     = &sm8250_ln_bb_clk1_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1.hw,
> > +     [RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> > @@ -514,25 +514,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> >   };
> >
> >   static struct clk_hw *sm8350_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_DIV_CLK1]         = &sm8350_div_clk1.hw,
> > -     [RPMH_DIV_CLK1_A]       = &sm8350_div_clk1_ao.hw,
> > -     [RPMH_LN_BB_CLK1]       = &sm8250_ln_bb_clk1.hw,
> > -     [RPMH_LN_BB_CLK1_A]     = &sm8250_ln_bb_clk1_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> > -     [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_RF_CLK5]          = &sm8350_rf_clk5.hw,
> > -     [RPMH_RF_CLK5_A]        = &sm8350_rf_clk5_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]          = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_DIV_CLK1]         = &clk_rpmh_div_clk1.hw,
> > +     [RPMH_DIV_CLK1_A]       = &clk_rpmh_div_clk1_ao.hw,
> > +     [RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1.hw,
> > +     [RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> > +     [RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4.hw,
> > +     [RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_ao.hw,
> > +     [RPMH_RF_CLK5]          = &clk_rpmh_rf_clk5.hw,
> > +     [RPMH_RF_CLK5_A]        = &clk_rpmh_rf_clk5_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> > @@ -541,13 +541,13 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> >   };
> >
> >   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]          = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div2.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> > @@ -556,21 +556,21 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> >   };
> >
> >   static struct clk_hw *sm8450_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> > -     [RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sm8450_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sm8450_ln_bb_clk2_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> > -     [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div4.hw,
> > +     [RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
> > +     [RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao_a4.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2_a4.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao_a4.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> > +     [RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4.hw,
> > +     [RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> > @@ -579,19 +579,19 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> >   };
> >
> >   static struct clk_hw *sc7280_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
> > -     [RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
> > -     [RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]      = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> > +     [RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
> > +     [RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div4.hw,
> > +     [RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2.hw,
> > +     [RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_ao.hw,
> > +     [RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_ao.hw,
> > +     [RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4.hw,
> > +     [RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_ao.hw,
> > +     [RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> > @@ -600,14 +600,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> >   };
> >
> >   static struct clk_hw *sm6350_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK2]       = &sm6350_ln_bb_clk2.hw,
> > -     [RPMH_LN_BB_CLK2_A]     = &sm6350_ln_bb_clk2_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sm6350_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sm6350_ln_bb_clk3_ao.hw,
> > -     [RPMH_QLINK_CLK]        = &sm6350_qlink.hw,
> > -     [RPMH_QLINK_CLK_A]      = &sm6350_qlink_ao.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div4.hw,
> > +     [RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2_g4.hw,
> > +     [RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_ao_g4.hw,
> > +     [RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_g4.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao_g4.hw,
> > +     [RPMH_QLINK_CLK]        = &clk_rpmh_qlink.hw,
> > +     [RPMH_QLINK_CLK_A]      = &clk_rpmh_qlink_ao.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> > @@ -616,20 +616,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> >   };
> >
> >   static struct clk_hw *sdx65_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> > -     [RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> > -     [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> > -     [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> > +     [RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
> > +     [RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div4.hw,
> > +     [RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
> > +     [RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao_a4.hw,
> > +     [RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> > +     [RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> > +     [RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> > +     [RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4.hw,
> > +     [RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_ao.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> > @@ -638,8 +638,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> >   };
> >
> >   static struct clk_hw *qdu1000_rpmh_clocks[] = {
> > -     [RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
> > -     [RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
> > +     [RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
> > +     [RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div1.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
>


-- 
With best wishes
Dmitry
