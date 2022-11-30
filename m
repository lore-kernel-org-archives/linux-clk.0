Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290BEC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 10:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiK3KyU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbiK3KyO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 05:54:14 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C851DA58
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:54:13 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id v206so4318559ybv.7
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 02:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9YJD67o0tWbDysUdVQdMWYQr2pNforC9l+JA9KqhpqI=;
        b=wH85ZMD9GaFwV+ohJWXHeFLQ/5yNw6OXgI3oYlDX8kKYUNXqYF6Y6MJgsnwReul4eh
         futyr5qJY91+yn1ZSdACUrAyD7JJ2HyX/ii5o4ue8AcydiSI6ySpZNimn1ZckE8FpXru
         Qure6YpNlid8Xnm8X5JdRPaKaT32GBv1nz6fSf5ZrxUFTVJdkxTQ+v0RGLzppUsgZr9p
         Ke1LEj3Q5hNcbTJWfh0c0vt2GfUdrAazyGfUxr19izKQS78P9yVuPH6K859vSgrxIxhr
         6ohhmlh5NNz8EY3d+l3Jp0mEIkh8lgNzhRLfSo0hgA67LFooQbrWC6kDkf2PFv+1J8UB
         YN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YJD67o0tWbDysUdVQdMWYQr2pNforC9l+JA9KqhpqI=;
        b=E7C+M2CAtFUUpP+EAa1QRa9pc3UWLvJXXLZVh5lpxO6fsq+Qq/GmRwC1r88pyXR4qo
         w9IfvTvA3BntAV1q4VkcbzIfTxzRClF3Of7JQNxs1MupkR4ejho+iK8n1hb4SNuz3ZCK
         no3Q3pOY82E7ePwPECwzHbEIDJaJ1KrCT4eTTDUimLYgBDpM6c7/9PbOqHHAU6zo+dNt
         0+0iTNaed+0R6k5UoDWbnNI5oHNxZSjjxRW8W/RJOdk4Q+Qfb7jYENEg4PasWtDyDs8d
         Gs8VzgKK33fdKwf4Crn9zVAdKvJbU9yo63ZDSiuyJdYkLeKI0MbLvfNurfSDqyFN+xOH
         4AxA==
X-Gm-Message-State: ANoB5plJ8hrW0d3enhevqGQUmectjxZni0kErip5sa0j/KstDSE6YEZ/
        iRTBdkoz6A0bfRCdY3BsJrQd6T8jTu9olsEaZ16t6g==
X-Google-Smtp-Source: AA0mqf528uIN0L3FxcZyvsDFpsRNVcazyDJW4diD8hWdICRVc7W75P71f/3KBmtoATpS3A3Wz1C+zP1pbXUKkDB/D9o=
X-Received: by 2002:a25:8c9:0:b0:6f8:9c91:4503 with SMTP id
 192-20020a2508c9000000b006f89c914503mr7916206ybi.15.1669805653104; Wed, 30
 Nov 2022 02:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-3-dmitry.baryshkov@linaro.org> <25a47edc-de8b-e217-6470-682603ee31d6@linaro.org>
In-Reply-To: <25a47edc-de8b-e217-6470-682603ee31d6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Nov 2022 12:54:01 +0200
Message-ID: <CAA8EJpo-oMwwez07pny7VgmfQsqxYAXE3RXwuXSiokJWyA=4tw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: reuse common duplicate clocks
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
> > After the grouping it is obvious that some of the clock definitions are
> > pure duplicates. Rename them to use a single common name for the clock.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> This looks good.  One observation below.
>
> Reviewed-by: Alex Elder <elder@linaro.org>
>
> > ---
> >   drivers/clk/qcom/clk-rpmh.c | 24 +++++++++---------------
> >   1 file changed, 9 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index f13c9bd610d0..c4852bbd00bf 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -350,9 +350,7 @@ DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> >   DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> >   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> >   DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> > -DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> >
> > -DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> >   DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> >   DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> >
> > @@ -362,7 +360,6 @@ DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> >   DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> > -DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
>
> So the above one was never used?  (The sdm845 one was already
> used instead.)

Yes, see the commit f5790382edef ("clk: qcom: rpmh: Reuse sdm845 clks
for sm8150") which rewired sm8150 to use sdm845 and removed all sm8150
duplicate clocks except this one.

>
> >   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> >   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> >
> > @@ -370,14 +367,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> >   DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> > -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> > -DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> >
> >   DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> >
> >   DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> >   DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> > -DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
> >   DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> >   DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> >   DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> > @@ -427,12 +421,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> >   static struct clk_hw *sdx55_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_RF_CLK1]          = &sdx55_rf_clk1.hw,
> > -     [RPMH_RF_CLK1_A]        = &sdx55_rf_clk1_ao.hw,
> > -     [RPMH_RF_CLK2]          = &sdx55_rf_clk2.hw,
> > -     [RPMH_RF_CLK2_A]        = &sdx55_rf_clk2_ao.hw,
> > +     [RPMH_RF_CLK1]          = &sc8180x_rf_clk1.hw,
> > +     [RPMH_RF_CLK1_A]        = &sc8180x_rf_clk1_ao.hw,
> > +     [RPMH_RF_CLK2]          = &sc8180x_rf_clk2.hw,
> > +     [RPMH_RF_CLK2_A]        = &sc8180x_rf_clk2_ao.hw,
> >       [RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> > -     [RPMH_IPA_CLK]          = &sdx55_ipa.hw,
> > +     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> >   };
> >
> >   static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> > @@ -549,8 +543,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> >   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK3]       = &sc8280xp_ln_bb_clk3.hw,
> > -     [RPMH_LN_BB_CLK3_A]     = &sc8280xp_ln_bb_clk3_ao.hw,
> > +     [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> > +     [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> >       [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> >       [RPMH_PKA_CLK]          = &sm8350_pka.hw,
> >       [RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> > @@ -624,8 +618,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> >   static struct clk_hw *sdx65_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> >       [RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> > -     [RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
> > -     [RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
> > +     [RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> > +     [RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
> >       [RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> >       [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> >       [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
>


-- 
With best wishes
Dmitry
