Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE24CCA473
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 05:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbiFXFXh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 01:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbiFXFXf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 01:23:35 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C44F33E31
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 22:23:30 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id p21so1188451qki.7
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 22:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vw/UoiwvK9CBQdZPgJYpZAoWqDy1oEVc4K0WeqOXQNM=;
        b=cEypyWf0VXswY9oskyM4U/nFraLP7MwIC4DTs7Ya0j9Wtn0bO0i+/lLsyb2ybzcSm1
         LVX5GilwaqCclpyQdO2StD2qBG+GJB0hKAO88Wbaw3oKastFR491Zz2cuAWa6DicI8lU
         +XCJGt7AwGG9QmxB89NrE0AIG5DY5HuTTs8ubSZ9L5p+m/Mb84NcBllaZdG+q52+Fqvj
         S4ptaCRZDf0sVCNKRrJ3iDFCJlDdrsZQMI9/VbZ4UFe93pFfrshIetAsL0c0k9hUT5Di
         goO4PdStb3QEFy9mWRR2mkmeqaGoZQu6fTiSg/6s3L5fJ489K3pEmK4DE7IxIvQzGxkB
         Sdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vw/UoiwvK9CBQdZPgJYpZAoWqDy1oEVc4K0WeqOXQNM=;
        b=sKvwBjPQPMRrAKyhmMXKxSZ45oEL2gV4CxieSuNwRi62lrumpXRNr8PFkHZkyx9SIj
         sckXO178IurNxqJFTWMh/r7TjfuPgGiIc2YT+KbykFIn2sFUdYFJZVJU3B1Lyn3WJTwt
         DPsD2t2EL9VnCveJVm8cVt/3Hit7BWdIEW/rDWBs5PEbCIwP48K8kV5CAhril4f8d+OV
         VnuQyKv5bmCsCLLb9CwDlOqqgqNpVM+tWd2YEXAlF+ZS6A1wV7671b7f/O1ND6ZAKjjh
         laxXzgs2s9svX5KGh3q8ivUgmILkBC17pgsRI3OcjUAWrp21GF9xCiaOsvVJLa8SZW2P
         yHAQ==
X-Gm-Message-State: AJIora8Vjxi9OyslXT0V3fNCEQrb44dWezC/j5Bya+5T5AAEeO91qW8w
        BpX5bfsn1Dx7q4WNXPB1pSiBdDnBAAWcNsXCkkqrhQ==
X-Google-Smtp-Source: AGRyM1sNr4fI9+yGxWY/ce9VHAQqUW8SYPxj8L9hUyTsmXEv3KpI1qNql5qnTiqjjuaLMQ0FAcIc83MoU4RvvD/OKTY=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr9344994qkp.593.1656048209488; Thu, 23
 Jun 2022 22:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com> <20220624003714.918ACC3411D@smtp.kernel.org>
In-Reply-To: <20220624003714.918ACC3411D@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Jun 2022 08:23:18 +0300
Message-ID: <CAA8EJpqZGJ_fXC-Ku=Wzt-_MS9+51T2WoDHCv1gm=P_FsJXJMg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 24 Jun 2022 at 03:37, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2022-06-23 17:27:18)
> > Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> > > Use parent_data for the last remaining entry (pll4). This clock is
> > > provided by the lcc device.
> > >
> > > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > index 718de17a1e60..6447f3e81b55 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> > >         .enable_mask = BIT(4),
> > >         .hw.init = &(struct clk_init_data){
> > >                 .name = "pll4_vote",
> > > -               .parent_names = (const char *[]){ "pll4" },
> > > +               .parent_data = &(const struct clk_parent_data){
> > > +                       .fw_name = "pll4", .name = "pll4",
> >
> > Is there a DT binding update?
>
> Also I'd appreciate clk patches be sent to my kernel.org email instead
> of chromium to help my filters.

Ack, excuse me.

-- 
With best wishes
Dmitry
