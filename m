Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CF2C4363D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 02:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDAC522258
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 02:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fbGylXQG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389298AbgJOB7z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732514AbgJOB7i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:59:38 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180D1C0613AE
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:09 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id x185so277848vsb.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjjCKgHRiSdhOv3GjTVmYdXAR0Q27Esr7gX8IJ2PGgg=;
        b=fbGylXQGT0bGv/tXhZxfgCcgkYBHpFQvYprl9xZastfU57/sC9098a6YEbYWQLIlih
         bDtfiMmvZ15E4/LS5aXg2bkeG3ZJ0Kewd0dsXpPuXizTWwXEhBXdC6WWJUeVbJRCHviD
         DO9lNakGlnwvA8cX+7Zw5Cn92xqCfGuvm3r9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjjCKgHRiSdhOv3GjTVmYdXAR0Q27Esr7gX8IJ2PGgg=;
        b=i9VHkCfc7Cv/Cezlj5n24TCo9vvlG/LE3nDZINwOjhfR0B0TQRR9hPrdRQjTSc8ZN6
         qBwsYsMhhnqZHQ/kOB7wKoDU28A/Kun8tL51Y3J9WgIsL/ZcTq3tTUHhItFy4RGF04l3
         uUyFpMbV3Y31xDELwff+0wTF6TxCGda9wCNYUALtaTP4xfQ4+nGZewljz9yRugWZQgis
         l0eYeTBMnw0nbff0ri4+5RkVe0EvBUSDiceV2xKPPW3em9+5wdWSTJ2/GQzmOPiZMhVW
         oCmA7/ujU1xsLN6x+gLfM6g0ZlLUkvzRhPi4wWu4DlTi24BZsHyfnsNz18Og0tI9JOPh
         iziQ==
X-Gm-Message-State: AOAM533tYdYjKbSE2bybkqtdyuWG3AKcxV5EJ1FDY8aEh4/iLZo0tBxo
        mX800CNl3rj+8lkw+vQfU06Uj/bk8/+3qg==
X-Google-Smtp-Source: ABdhPJyb/LlkrU16g//LJjfJ6aeXcMp9GEACVxmZEsF17JxIccUKUgLVba5vJ8DZToC1DmbP4QHDkA==
X-Received: by 2002:a67:ea4e:: with SMTP id r14mr895452vso.47.1602710047980;
        Wed, 14 Oct 2020 14:14:07 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id g13sm89200vso.2.2020.10.14.14.14.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 14:14:07 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id r1so241474vsi.12
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:06 -0700 (PDT)
X-Received: by 2002:a67:1e01:: with SMTP id e1mr953244vse.49.1602710045975;
 Wed, 14 Oct 2020 14:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
 <711a8178-dcf7-d541-a468-ac34d6d14bb1@codeaurora.org>
In-Reply-To: <711a8178-dcf7-d541-a468-ac34d6d14bb1@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 14:13:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDv2-gUErzoTUsOfvqnO3pLpegozjzTkU-Hg7sUKR5JQ@mail.gmail.com>
Message-ID: <CAD=FV=UDv2-gUErzoTUsOfvqnO3pLpegozjzTkU-Hg7sUKR5JQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 10:21 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Thanks Doug for the patch.
>
> On 10/14/2020 9:28 PM, Douglas Anderson wrote:
> > From: Taniya Das <tdas@codeaurora.org>
> >
> > In the case where the PLL configuration is lost, then the pm runtime
> > resume will reconfigure before usage.
> >
> > Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I took the liberty of fixing my own nits that I had with Taniya's
> > patch, AKA:
> >
> > https://lore.kernel.org/r/1602614008-2421-2-git-send-email-tdas@codeaurora.org
> >
> > Changes in v2:
> > - Don't needlessly have a 2nd copy of dev_pm_ops and jam it in.
> > - Check the return value of pm_clk_resume()
> > - l_val should be unsigned int.
> >
> >   drivers/clk/qcom/lpasscorecc-sc7180.c | 23 ++++++++++++++++++++++-
> >   1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index 228d08f5d26f..ee23eb5b9bf2 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> >       .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> >   };
> >
> > +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> > +{
> > +     struct regmap *regmap = dev_get_drvdata(dev);
> > +     unsigned int l_val;
> > +     int ret;
> > +
> > +     ret = pm_clk_resume(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Read PLL_L_VAL */
> > +     regmap_read(regmap, 0x1004, &l_val);
> > +     if (!l_val)
> > +             clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> > +                             &lpass_lpaaudio_dig_pll_config);
> > +
> > +     return 0;
> > +}
> > +
> >   static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
> >   {
> >       const struct qcom_cc_desc *desc;
> > @@ -373,6 +392,8 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
> >       if (IS_ERR(regmap))
> >               return PTR_ERR(regmap);
> >
> > +     dev_set_drvdata(&pdev->dev, regmap);
> > +
> >       /*
> >        * Keep the CLK always-ON
> >        * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
> > @@ -449,7 +470,7 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
> >   }
> >
> >   static const struct dev_pm_ops lpass_core_cc_pm_ops = {
> > -     SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> > +     SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)
>
> There are two devices and "lpass_hm_core" and the PLL is not part of the
> HM_CORE, thus was the reason to separate out the pm_ops.

Oh, that's really weird / unexpected.  I've tried to disentangle this
in a v3 patch series so I'd be curious to see what people think.
Though it's probably fine to jam the "pm" value like your v1 did I
think it violates the "principle of least surprise" a bit.

-Doug
