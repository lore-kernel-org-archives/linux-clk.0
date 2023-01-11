Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012ADC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 04:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjAKEto (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 23:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjAKEtm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 23:49:42 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8855F9F
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 20:49:41 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p188so13939335yba.5
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 20:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dulW+mDs3mdxOnkK4txbbtBe+bJDNLN5lWpQRHpUhwU=;
        b=oc2Qh78TxCslQnFWhWEWZfT0R7/L81Tf4Ck0tqIy61YLWrnYxZpNVrnwyDw5RO/5Xi
         +pQKaxWO3i3K8Kt556j1+zambVmsBZ2SuwfDhoayvrIsoUU8Xdj6sbY7vhyBgOW0LFsE
         aCcASrXeLhtf2ZsGXS2eV8pQ1+Bdbjzt7JRk02/aQMSepIwuQR2llZV2fYwWQplYVV6E
         DtomNCteAO29BjzxGwmcWvqw80nyY/VVnif0hLXfN3/rEQBiGUsjdVEn91Vh/BBRp0JK
         fTjWQWyu4d+MCIwpw0EPs361Hh3Vnxp1nOLZOKvSO+K4ahfsBVit0Q1VzjaZEm02FkdG
         gt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dulW+mDs3mdxOnkK4txbbtBe+bJDNLN5lWpQRHpUhwU=;
        b=Iy6RXgxm3kTFvdhQYnLyCPRQI62KUsrU2iPznkPiZNROVLwHcxYIxbSEkeWnfAChYj
         BRIgGLoaALe2dRw1nItSGKVrmOJACnYnx+TXOhBgAcV06FOkXVE8/4q63li7CXpnMjvJ
         LoYhNAtLJWaellhn7za/pz60FXx1qJ8lA9MjuJI551SKjdKVKAQzQjtQieWkk6DsmS14
         vTk2f8LBUDPJGmuVkgRFzgzuuzB8rzWfnaaVlL3W3YxyXJ0GrjU5jpQR5TNqBq1bTkJw
         2jZJ5Ksbc1/XeSlU9W4LTWXgOSMrq0ZJZGOAPtVtGX9R3uwQ0XfFLN92Fo71MRql2GrV
         mmDQ==
X-Gm-Message-State: AFqh2koMlFnVSM1qxFApu1x1Ga5wRgEB1coKG7nsn/OFksaXmJf2tDVu
        WGS1SWaOLLQwhdV4vs4IvyytXHa+WMKp1fF5B9U4Hg==
X-Google-Smtp-Source: AMrXdXuj5GAZaQZyRcxNYxlWIZXOHCEuF32dh1iXsTwC+LLssWh/vzu3u3pffIqEXRbqcJJU8/zCZJ5do1t0KebEBN4=
X-Received: by 2002:a25:c404:0:b0:757:591e:cee3 with SMTP id
 u4-20020a25c404000000b00757591ecee3mr7659274ybf.15.1673412580422; Tue, 10 Jan
 2023 20:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20221228203555.3130090-1-dmitry.baryshkov@linaro.org> <20230111044715.5nbxasuhlqv6t2fw@builder.lan>
In-Reply-To: <20230111044715.5nbxasuhlqv6t2fw@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 Jan 2023 06:49:29 +0200
Message-ID: <CAA8EJppzHoHp5BVBJN-ZF0OmwbtKfxhX_qTEPc5cwSnLTvTcJQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 11 Jan 2023 at 06:47, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Dec 28, 2022 at 10:35:55PM +0200, Dmitry Baryshkov wrote:
> > Switch _qcom_cc_register_board_clk() to use parent_hws.
> >
>
> There's more to this patch then this short sentence, please describe it
> further.

True, I'll fix it for v3.

>
> And given Dan's reported-by, I must assume that there's an issue with
> the current code. Is there a Fixes?

No. Dan reported an issue with v1, thus his Reported-by was included into v2.

>
> Regards,
> Bjorn
>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Properly fix the clock's parent data in case parent clock is present
> >   in the dtsi.
> >
> > ---
> >  drivers/clk/qcom/common.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index 75f09e6e057e..9f2bd37c9540 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -133,7 +133,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> >       struct device_node *node = NULL;
> >       struct device_node *clocks_node;
> >       struct clk_fixed_factor *factor;
> > -     struct clk_fixed_rate *fixed;
> > +     struct clk_fixed_rate *fixed = NULL;
> >       struct clk_init_data init_data = { };
> >       int ret;
> >
> > @@ -161,6 +161,8 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> >       of_node_put(node);
> >
> >       if (add_factor) {
> > +             struct clk_parent_data parent_data;
> > +
> >               factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
> >               if (!factor)
> >                       return -EINVAL;
> > @@ -168,8 +170,13 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> >               factor->mult = factor->div = 1;
> >               factor->hw.init = &init_data;
> >
> > +             if (fixed)
> > +                     parent_data.hw = &fixed->hw;
> > +             else
> > +                     parent_data.name = path;
> > +
> >               init_data.name = name;
> > -             init_data.parent_names = &path;
> > +             init_data.parent_data = &parent_data;
> >               init_data.num_parents = 1;
> >               init_data.flags = 0;
> >               init_data.ops = &clk_fixed_factor_ops;
> > --
> > 2.39.0
> >



-- 
With best wishes
Dmitry
