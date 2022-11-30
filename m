Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF28C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 10:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiK3Kva (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiK3Kv3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 05:51:29 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3107273B8D
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:51:27 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id i131so20984351ybc.9
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4CpaiDvkikIdV++1GDlZsKlG25lJg4ulLWdXNMfF4Qs=;
        b=RqbbVosSmFsuEfBj6C+JVS8UjKDAmfMgTMRQqIjw5KWXWc9RyuBhW/XDLlMbaHoBKj
         rkjOgVPgY1AvOc84JWCS+B12zJZxuBq5Yqw6oVjfNurklePVmCzMvVorCSYd2KrdEMMD
         GrM/NvB8ol8FkrfvcWjqxyWqaep5PLl4J0Lsrh+njzqj0nTxmc7gsFBOTUnE4YC203Ai
         eWOJtrRo5ICu8YuBk+zFzV8mLROWk50dWwSLzJw6Gdssz3w++nMXYfQL/CU9DHppA6mN
         GeCz8ef4L+miyYOkztszqeJRuSXYlPTpDLLSnruGpGMxyHqLoMrG2VrzVAHOTRCCzmNi
         grYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CpaiDvkikIdV++1GDlZsKlG25lJg4ulLWdXNMfF4Qs=;
        b=UOPNdu54M9eZznU71K7UWwMjkpfclK8pDmi7vVVlz9Wl5L8aoTR480qyWzwDj2I/Q2
         hnFvu6P1oznIUNRlOZfEqwZ8Tyc0z4JFJBNatUuKyNDxmfXYLr8jBnDvFEIt4KR6N92U
         4lblZleGgOc6+9+r9wwRi5uD4MSXt3JHzzj7g3mq8byq9a++OSczv0FIXYut/zBkUbU4
         4nu4PmBGkF2oQVWaI24BvRMCXlWAYCAoLwm0vUHrO0uAqgm6QJYfRzCrrgeUCG44xLqZ
         18+pDbUElcBVtEifQRuovCUbySbDvvDal8CxuSlpCCFGSl2u76d68+NFumCXkmSEoeqa
         bkwA==
X-Gm-Message-State: ANoB5pmhwMxv5epQJlKXhH9TsCUBAmNQp5X09GvgXlTp09ttsVNFx+f3
        BIinRKNp0Ifdo0k7PlzbL9ZYSCXWhcb2mQL/C/YzKQ==
X-Google-Smtp-Source: AA0mqf4Jr9cpqeWBif867exd7AVBURiCCnZVI3x2qsgMr2YXiEB9Zof5kYQtso+grwjHmX7Yn7E+3Ct51qK5R6uY1QQ=
X-Received: by 2002:a25:bdd2:0:b0:6e0:c7d3:f026 with SMTP id
 g18-20020a25bdd2000000b006e0c7d3f026mr42989434ybk.275.1669805486319; Wed, 30
 Nov 2022 02:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-2-dmitry.baryshkov@linaro.org> <9d4c660c-d3d8-dc8f-ad6e-c4dd1e9a74e3@linaro.org>
In-Reply-To: <9d4c660c-d3d8-dc8f-ad6e-c4dd1e9a74e3@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Nov 2022 12:51:15 +0200
Message-ID: <CAA8EJpoJFRJdPTmgjuXGGUV8MjsLt-N3sVKvXOy1pfPVEmtpMQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: qcom: rpmh: group clock definitions together
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
> > In preparations to the further changes, group all RPMH clock definitions
> > to ease review.
>
> It isn't completely clear to me why these were grouped
> in the way you did.  Do you happen to know what ARC and
> VRM stand for?  BCM is bus clock manager, and RPMH might
> be resource power manager--hardware.

H stands for hardened, an improved version of RPM, which was used on
previous generations.

VRM = voltage regulator module
ARC - ?? (C probably stands for corner or CPR)

Basically I arranged the clocks by the type, to make similar ones stand out.

>
> Anyway, I can confirm you simply rearranged these definitions,
> and that it still compiles, so...
>
> Reviewed-by: Alex Elder <elder@linaro.org>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/clk-rpmh.c | 55 ++++++++++++++++++-------------------
> >   1 file changed, 26 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 1da45a6e2f29..f13c9bd610d0 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -342,19 +342,45 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
> >   };
> >
> >   /* Resource name must match resource id present in cmd-db */
> > +DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> >   DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> > +DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> > +DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> > +
> > +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> >   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> >   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> > +DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> > +
> > +DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> > +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> > +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> > +
> > +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> > +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> > +
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> >   DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> > +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> > +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> > +
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> > +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> > +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> > +
> > +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> > +
> >   DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> >   DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> > +DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> > +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> > +DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> > +DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> >
> >   static struct clk_hw *sdm845_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > @@ -398,11 +424,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> >       .num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> > -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> > -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> > -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> > -
> >   static struct clk_hw *sdx55_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > @@ -478,8 +499,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> >       .num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> > -
> >   static struct clk_hw *sm8250_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > @@ -500,12 +519,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> >       .num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> > -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> > -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> > -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> > -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> > -
> >   static struct clk_hw *sm8350_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > @@ -533,8 +546,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> >       .num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> > -
> >   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > @@ -550,12 +561,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> >       .num_clks = ARRAY_SIZE(sc8280xp_rpmh_clocks),
> >   };
> >
> > -/* Resource name must match resource id present in cmd-db */
> > -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> > -
> > -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> > -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> > -
> >   static struct clk_hw *sm8450_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > @@ -600,10 +605,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> >       .num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> > -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> > -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> > -
> >   static struct clk_hw *sm6350_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > @@ -620,8 +621,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> >       .num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> > -
> >   static struct clk_hw *sdx65_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > @@ -644,8 +643,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> >       .num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
> >   };
> >
> > -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> > -
> >   static struct clk_hw *qdu1000_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
>


-- 
With best wishes
Dmitry
