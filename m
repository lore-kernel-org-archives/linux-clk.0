Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4ABC43457
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B406822258
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eudd9Igd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732482AbgJOB7i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732510AbgJOB7i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:59:38 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FDDC0613A9
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:04 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id t67so105920vkb.8
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RC25HY5NnJ5FNFugLVlYGqgrjVBJgiwdGnqPIb+Pkec=;
        b=Eudd9Igdl/h4VlLzh+aptHOEYif6JqCGyjeEgznhJwQJ1ttBoPa1uqULYPz9oPlCXy
         c7SM6xDD18LjK/c5U+87y0gfMTersHROiToiRFTAD/yQO1OsuN7uOr2MLccaOEP05GV5
         mbjFG5TewOySMnmNVW5yP7KHxfDdQZEsCE11w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RC25HY5NnJ5FNFugLVlYGqgrjVBJgiwdGnqPIb+Pkec=;
        b=dSMNlRAeabzkWLAuUco15v9OQYBUNKjTldDSzUNbRpuZ9aOwk+ihMyYED29iEQMncl
         7TZYiE8tGUHC/yNeb8dA6a9CvfuhpKkhd4nIaFBjxgO6mKyR0dZR6HOHAlsVtFiJQy/z
         vScOM9egZ3DJbgR/x7svJPOxmrpjthzY0jPYBp0Mp8chP1h3wJA34CVLMgDVoiHm3osL
         /t2yr1IykdiG61fjYA5iiaDSgDqdTLUn7zHVkr3IbUK+wgBruHPS/hNsOxEvb+N7TgW+
         ARMPMhdgCu5nUan63OQRj0O3u3RD5b2K5DhZGBR1qpupKr3WUSMfYFHNyB/+lcT5mBZI
         RFMw==
X-Gm-Message-State: AOAM530zqytzPHpNNhdFBzZc5ob6SmKtXeHTJGuyfxnJWjqB/6DAcjZc
        FHNzgNd+zzh+JD6HqqMVcQ5OGerqK9NoFw==
X-Google-Smtp-Source: ABdhPJy1v7xwPjI1z4eiZkpAN4LJQYrgWd/PkpFA1mgfwodoVSC2Jk7SnFoJh00dg6WAl0MX8ZIAoQ==
X-Received: by 2002:a05:6122:817:: with SMTP id 23mr750870vkj.24.1602710043304;
        Wed, 14 Oct 2020 14:14:03 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a13sm123279vkm.47.2020.10.14.14.14.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 14:14:02 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id r24so255200vsp.8
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 14:14:02 -0700 (PDT)
X-Received: by 2002:a67:b405:: with SMTP id x5mr993311vsl.4.1602710041706;
 Wed, 14 Oct 2020 14:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
 <160269519265.884498.6320532206038624483@swboyd.mtv.corp.google.com>
In-Reply-To: <160269519265.884498.6320532206038624483@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 14:13:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcH0DKhiKp4X8j0mxUUCm-yZmJp1boXqVOhCWeySydiQ@mail.gmail.com>
Message-ID: <CAD=FV=WcH0DKhiKp4X8j0mxUUCm-yZmJp1boXqVOhCWeySydiQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
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

On Wed, Oct 14, 2020 at 10:06 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 08:58:24)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index 228d08f5d26f..ee23eb5b9bf2 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> >  };
> >
> > +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> > +{
> > +       struct regmap *regmap = dev_get_drvdata(dev);
>
> Can we use dev_get_remap(dev, NULL) instead?

Good idea.  ...but as far as I can tell there are two regmaps.  I'll use

dev_get_regmap(dev, "lpass_core_cc");


> > +       unsigned int l_val;
> > +       int ret;
> > +
> > +       ret = pm_clk_resume(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Read PLL_L_VAL */
>
> Please drop this useless comment. Replace it with something like this
> (if at all):
>
>         /* Reconfigure PLL if PLL was reset across suspend */

We reconfigure more than just the PLL.  I believe that the PLL being
zero is just a clue that we use to know we should re-init the whole
thing.  I've tried to convey this in a comment in the next version.
