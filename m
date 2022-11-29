Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1F4C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 09:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiK2J2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 04:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiK2J2S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 04:28:18 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF58A31EE9
        for <linux-clk@vger.kernel.org>; Tue, 29 Nov 2022 01:28:17 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id l67so16700085ybl.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Nov 2022 01:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6wMpDXGwqSEa5zIifOleCzBwuNiNpLrKwZxtl7KmLTs=;
        b=x33agDxBeO4O7EFSCRWCTdcNkb/iPgF4+EarkrOVhOk/yL7Jio8FSIU8SnSpw3fCuv
         3UVICBryhGAQo26F2hG0wR6ZqG4oKEpuT7vdcYC/Zh6V5hDhYAh0j4NxT2qT7CX2QDoP
         72SEWndv0o77xsrP/MTMYNk14KdZu17R/zAqQJh8m1F4DVyVYdEiiyKX3Uk0FvIKVXcq
         5jxrGeljkjemcKmL8woVADwiL2QZ+SFLsI6SqEUOy60l58419HRlCaQuT8NtrOL50n0Y
         ulFFUf8zpUX1vXKWM2Wkz6TZdhzbmIYuM9tGEMZBx2FCvhZ1Zxgo5dD+9ualzV0/FzUY
         D9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wMpDXGwqSEa5zIifOleCzBwuNiNpLrKwZxtl7KmLTs=;
        b=tnU5zyANDmWcD3XMoMd3jdXikGnkC3zTX8GlfG2u/Ih0tBtbymrtQaJQ9hpXJ2ixJP
         nCWbq2JJH4cRTb3NwOyZPu7misM7NpRquAoMu8EbVyHbmsJSsYQYe3fqnn8BEQVsByQw
         Vhhu9gRQlWqmgeZcC00O1j5OXxiR/5B6UoYMdnaZUd3a1F1s1R9B8DjA3Txx7ONxSCEz
         XTOMUI2J9y3/t4NxY7tEcBe4yd30hivvndTFFxz/OA7SJZbGY8gaGYMqWzre0gBPEs59
         ndXZZc6m9sh6zekOz8Q2EZfEnpKiN8u1VQEyXcLcQquCEHXD6J9gkBDlzEbwtbCKoDJn
         ANXw==
X-Gm-Message-State: ANoB5pmRO2j4xr3B1wa6A7SNJufBnDyP0WdXWjbqk8fDCyWc2CDCbRl+
        bZhwhvnQsKwchezjG41BQz3Bfd+7RblI1RcUJgvJAw==
X-Google-Smtp-Source: AA0mqf5Xv4hdzu5fBQxmb4pQkE8zkCXT1qOMN7Ms1zeAxNUa2fHbImjJTivoKFNGn+j6CCDrUiKzS6b74XciRfHzNl0=
X-Received: by 2002:a25:4dd7:0:b0:6f1:535f:2f38 with SMTP id
 a206-20020a254dd7000000b006f1535f2f38mr25793379ybb.153.1669714097062; Tue, 29
 Nov 2022 01:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20221129000047.697089-1-elder@linaro.org> <CAA8EJpqcQaamPn=6Z0GRKVDvFu8BGQ190EYJH34dApBcC3nzdA@mail.gmail.com>
 <35be9c2d-63d4-01cf-b8d7-de3306d50e64@linaro.org>
In-Reply-To: <35be9c2d-63d4-01cf-b8d7-de3306d50e64@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Nov 2022 11:28:06 +0200
Message-ID: <CAA8EJppyYmyiG8U5MdB3_ZsqAO+Cze5RwOMQmMN+GyNNEP260Q@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
To:     Alex Elder <elder@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 29 Nov 2022 at 03:54, Alex Elder <elder@linaro.org> wrote:
>
> On 11/28/22 7:35 PM, Dmitry Baryshkov wrote:
> > On Tue, 29 Nov 2022 at 02:00, Alex Elder <elder@linaro.org> wrote:
> >>
> >> From: Luca Weiss <luca.weiss@fairphone.com>
> >>
> >> The IPA core clock is required for SM6350.  Define it.
> >>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>   drivers/clk/qcom/clk-rpmh.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >> index 0471bab824642..6a5887aae21a4 100644
> >> --- a/drivers/clk/qcom/clk-rpmh.c
> >> +++ b/drivers/clk/qcom/clk-rpmh.c
> >> @@ -603,6 +603,7 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> >>   DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> >>   DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> >>   DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> >> +DEFINE_CLK_RPMH_BCM(sm6350, ipa, "IP0");
>
> So you're saying that the above line is unnecessary...

Yes

>
> >>   static struct clk_hw *sm6350_rpmh_clocks[] = {
> >>          [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> >> @@ -613,6 +614,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
> >>          [RPMH_LN_BB_CLK3_A]     = &sm6350_ln_bb_clk3_ao.hw,
> >>          [RPMH_QLINK_CLK]        = &sm6350_qlink.hw,
> >>          [RPMH_QLINK_CLK_A]      = &sm6350_qlink_ao.hw,
> >> +       [RPMH_IPA_CLK]          = &sm6350_ipa.hw,
>
> ...and that this line (above) can instead look like this:
>
>         [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
>
> Correct?

Yes

>
> > This can use sdm845_ipa.hw instead of defining new clocks.
>
> Your statement seems to also be true for the [RPMH_IPA_CLK]
> entry in sdx55_rpmh_clocks[].  (For the record, the commit
> that added that one was authored by me, and I didn't realize
> what you have stated here.)
>
> Please confirm, and I'll update.
>
> I'll also send another patch to remove the definition of
> sdx55_ipa if Mani is willing to test it for me...
>
> Thank you Dmitry.
>
>                                         -Alex
>
> >>   };
> >>
> >>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> >> --
> >> 2.34.1
> >>
> >
> >
>

--
With best wishes
Dmitry
