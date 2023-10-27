Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B354C25B67
	for <linux-clk@archiver.kernel.org>; Fri, 27 Oct 2023 00:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjJ0AgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 20:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbjJ0AgA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 20:36:00 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C991D6C
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 17:35:55 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-57f0f81b2aeso835785eaf.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 17:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698366954; x=1698971754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
        b=SK7PZAym90wWs513+oR25dOXgCMWUIcqNwctSiJ1el5uMYcS2+No7nAW3KcdTrrfxU
         V2/yjKfO10Yupr+OkpfocNRdL0srjNZRETo5NO2h4lk9mRvUOmsjw7vCK8ICJMaxs2w2
         5b4X2JcJJUWwV9035S1EOXToEWGVFjG3w32ljC71nM1BJslvkcmhsdvyVXdBU7aPC5gE
         rxBp80Yl6FrTWR4XHECoFN05bTPtMl8mJ1YCN78mRQVpLW0eSjgjkVBQc2T+H9KVwIVb
         aUWR0cBahCUP74mQWkeKPTupkh2K20NqDdiJIQIZ9qmzeXddSBERwKt4r53fNHh8ISKV
         Lb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698366954; x=1698971754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
        b=MYKdwC2JBHVnoRpWqJU1KZQwJEf+3YPXtBgIrgwnyC/euY/d86a9bx4s7Nl4fdItbA
         r5lGysdl/6SlNFod4G5BA/iA6LLW5+jPSpcEtAJROE4+BvGyc/1EVbp6HKmXSPO8fW4X
         1Jv0aD5ugq5Ws8NHcUq6HZKT88aZX0ZHKGNO00wHsjirowhy8FKUDlu2wztuSk6BtrYz
         qVOxZIQ5f4PWd9wVHn7FMoK2tRDdBEzB0g7iVpD5kAW/YUanhBwsLdVGShAcqB3Ij7Hf
         UBWEIo8FZJ1A03Kmv5Kj9beSjpDECOkBVziMH3KC4p0k6PADakjT+Fik2cckzIQ+f6up
         y6Ng==
X-Gm-Message-State: AOJu0YwATGRn604phvHR1IMjQHt4O5Wa1dbdjvzvESfodth43zH55+9/
        +wdw/ldAVaRVW1hLSqas67cq74s4k8jmejs4Hj+oew==
X-Google-Smtp-Source: AGHT+IEcUzbPOkOWvjp/fe5w7R1pKSB7pe+4Z7WOc6Z7tCpLWBp758kcYR8l2Wn8zbZmVR88yiUuEXQOI6d+Oe8PUJs=
X-Received: by 2002:aca:1907:0:b0:3b2:df83:3aec with SMTP id
 l7-20020aca1907000000b003b2df833aecmr950492oii.54.1698366954184; Thu, 26 Oct
 2023 17:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Oct 2023 03:35:42 +0300
Message-ID: <CAA8EJpr3VZiyCHCDPh6uhYKOPruLGF=WbOHdGYNZWiZBxU9UMA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Oct 2023 at 01:56, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Wed, Oct 04, 2023 at 03:31:24AM +0300, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
>
> I have some behaviors in mind when reading this, others might not.
> Please give some specific behavior(s) here.

Bjorn (and other interested parties). At this RFC stage it would be
really nice to check whether the patch idea is worth the trouble and
if it fixes the issue.

>
> Thanks,
> Bjorn
>
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rcg.h  |  1 +
> >  drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index e6d84c8c7989..9fbbf1251564 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
> >  extern const struct clk_ops clk_pixel_ops;
> >  extern const struct clk_ops clk_gfx3d_ops;
> >  extern const struct clk_ops clk_rcg2_shared_ops;
> > +extern const struct clk_ops clk_rcg2_parked_ops;
> >  extern const struct clk_ops clk_dp_ops;
> >
> >  struct clk_rcg_dfs_data {
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 5183c74b074f..3f52abf0025e 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <linux/kernel.h>
> >  #include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/err.h>
> >  #include <linux/bug.h>
> >  #include <linux/export.h>
> > @@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
> >  };
> >  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> >
> > +static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
> > +{
> > +     struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > +     u32 cfg;
> > +     int ret;
> > +
> > +     if (!clk_rcg2_is_enabled(hw))
> > +             return false;
> > +
> > +     ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> > +}
> > +
> > +/*
> > + * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
> > + * parent_map. This allows us to implement proper is_enabled callback.
> > + */
> > +const struct clk_ops clk_rcg2_parked_ops = {
> > +     .is_enabled = clk_rcg2_park_is_enabled,
> > +     .enable = clk_rcg2_shared_enable,
> > +     .disable = clk_rcg2_shared_disable,
> > +     .get_parent = clk_rcg2_shared_get_parent,
> > +     .set_parent = clk_rcg2_shared_set_parent,
> > +     .recalc_rate = clk_rcg2_shared_recalc_rate,
> > +     .determine_rate = clk_rcg2_determine_rate,
> > +     .set_rate = clk_rcg2_shared_set_rate,
> > +     .set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
> > +
> >  /* Common APIs to be used for DFS based RCGR */
> >  static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
> >                                      struct freq_tbl *f)
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
