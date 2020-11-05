Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B7BC4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5462821D46
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJTzDyH0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKEJ4M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgKEJ4M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 04:56:12 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAB8C0613CF
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 01:56:12 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id 9so1085429oir.5
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndz5Vv+R7dwHwUNh16wYXBC3DQLbUHpsCLSiSv8wpGw=;
        b=OJTzDyH0esN9OPZyPAj6631qDN2gKy7xWH7yicsOC4KQfdY/dTXwvMSG+gayb42JMW
         Zd/x5gaJCd1Fd83MFYkkQtVXu4HRcd0xYvhCht5PuM8n/y0vmnjRUNr7kfyp6JuTPc0t
         3pOSPwss6bXAbAz66A7tfLPQYYIxd1R4nBfTxWE6YE0M8B95RUVqmukEWLcGzYQfo8IJ
         ICjj3djjZKHIxfyqy97mleTfyxxBPMLq33nSs4iDShPqcud/W7qrrZubYKqyfVaxGUq0
         WEetyzgIJLqHpCLiv5WwC07b/98nOMNmPs7zYMKduro2vUZaUFNLvO4s5uojDUZMzqBI
         PG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndz5Vv+R7dwHwUNh16wYXBC3DQLbUHpsCLSiSv8wpGw=;
        b=cIQ/0PumLX9ynY8wjUU7M0MjgPcbBV6DPk3+wpLwAdKGVE9B1HZxrV+6qc/ezbkB6F
         7aAlAEXy/hnFjX1GELbiuQQyI+AvHjhwZcLHV4PusCDuE6yG6CTAF1puhePKUxaFACQc
         75JdTFw21Xv8k5xnZkFOp24wZX9Aj9k2rB8qcZRkUodi+WnDWeUarmKJyWoqvZZiCbbu
         4qasu5+vvASr87m3wwUbMEgTFd3BSSSPUzQP+Mi15fbuzZuij+tqRP4jO7yWqGVyEMMm
         jQOLSlj5cuwBll3L+kqhi6Tq22fLSYGVDnzGs46iasjjbib3RVxVIVmRflivLuNOhbM3
         bqPA==
X-Gm-Message-State: AOAM532yG+U+zD5HnlNy0Unt2j8oTrfYddpfJ9RDH/Db3o1FG7ypaxQP
        +uH6m+3KCNRvNJ2uWpFnargLmHjTgQnRDYqjnZgeog==
X-Google-Smtp-Source: ABdhPJzpNj4ARWML+b5ZkSBTL/EAiEsuc6lD/J3O0DQRD37LBqn+eu39NyqkN4z3f9pG87siPsVjo40h8K1SFJ7cKWA=
X-Received: by 2002:aca:f1c6:: with SMTP id p189mr1076089oih.18.1604570171786;
 Thu, 05 Nov 2020 01:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
 <20201023131925.334864-6-dmitry.baryshkov@linaro.org> <160454417608.3965362.16775651224166864448@swboyd.mtv.corp.google.com>
In-Reply-To: <160454417608.3965362.16775651224166864448@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 Nov 2020 12:56:00 +0300
Message-ID: <CAA8EJppY3gnumEWHiVtm-T9vBDLVkpojVC-BD4qpfQ0rzhymtA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: handle MMCX power domain
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 5 Nov 2020 at 05:42, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2020-10-23 06:19:25)
> > On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
> > This power domain is expressed as mmcx-supply regulator property. Use
> > this regulator as MDSS_GDSC supply.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/dispcc-sm8250.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> > index 07a98d3f882d..588575e1169d 100644
> > --- a/drivers/clk/qcom/dispcc-sm8250.c
> > +++ b/drivers/clk/qcom/dispcc-sm8250.c
> > @@ -963,6 +963,7 @@ static struct gdsc mdss_gdsc = {
> >         },
> >         .pwrsts = PWRSTS_OFF_ON,
> >         .flags = HW_CTRL,
> > +       .supply = "mmcx",
> >  };
> >
>
> Can this patch be applied to clk tree or will it break the tree without
> the dts/regulator bits in place?

It can be applied to clk tree. Regulator bits are already accepted by
Mark Brown.


-- 
With best wishes
Dmitry
