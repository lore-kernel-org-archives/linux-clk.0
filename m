Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979DCCCA473
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 05:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiFXFXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 01:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbiFXFXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 01:23:16 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9241E2B193
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 22:23:15 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c137so1204952qkg.5
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yl4RQmeDwLz9nkuUQqjK9sXArcf/+1jvTW/uw9Xfl2I=;
        b=bkxR24CXCbUYXMtPJhEeGzpL+GGnnHhwRTl1FXuAr+ldO/dbcDV/k8KRrMbd6ZfAbd
         GDcg4OQAsE5rXjhomUcmTXVWGdoNF3Tf9NHP0L8tgD+ZDDYqefTID3831mEpL8+XD1va
         T/+9LEkgjo5TTZwC433t2ms4t9zrdydkAKA6lWAJaAjSKKC3cEdLl8C0CZic3NXCKvF8
         reDN8I33Sp8q8I7HG1NeOwj2m9LlLl4Bir/VTd1VYrXgcq/6TDWM6zUWDmy92S93pByc
         XM2U7W2821hgJ7FpfKDHqHB4YB6xdQ8zRwMCKCLWJIYBftifCj48V4NVMGvwKWidyb0I
         UEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yl4RQmeDwLz9nkuUQqjK9sXArcf/+1jvTW/uw9Xfl2I=;
        b=c2Oq6iibVyBe/DNv5Ko35h9Xq/Ok3K39Vs8LQI/QwZP37WwXhUkTKmsxEhqaHVMtB8
         5676MNZO6ighBRMeNzisLuOofw+AWKev4n7ITXJOyGBKlTTnc6W2y5W6DrpLUrn90Wll
         BMfOqWtuceBjNL4pFI7+t2ArIKJPcUwp5yRZSjvWKw5X8NTwwPixc//glm3B3hAcixX/
         1pBUe3EgdRM4WX44St1ocI0s/7GONNZ+bGXqo4qicXEJQ8yhhs2YpaeIN2dtkawIWeVg
         /XRJwmljXz+0LBNh1JUvu9SwElHAu0Cev4eYqEv93P/42UUmo4/cfulpXlXzh0Bi8kQw
         qe7g==
X-Gm-Message-State: AJIora9Spu0Szgq22NhKs/MYa5gHezwJWNrV9RtyLFzEgtpUuKlnHb6L
        EarHfuz27x8Yj0qTR2lmO3VIDz08EwvWH3BxklkO2w==
X-Google-Smtp-Source: AGRyM1s0WpY+/3CRy5hH1oeYzxu9eGU6p6MwlHU3YyOfOdzZLpNPxgroBPT004zE6BsNToAK5wTgottIKl4t+Boo6u8=
X-Received: by 2002:a05:620a:31a0:b0:6a7:549f:a788 with SMTP id
 bi32-20020a05620a31a000b006a7549fa788mr9288637qkb.203.1656048194761; Thu, 23
 Jun 2022 22:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org> <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
In-Reply-To: <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Jun 2022 08:23:03 +0300
Message-ID: <CAA8EJpoYJx5KumZugdCSBwz4JXf6fJyKDMPqG3G1bVBdB+y5-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Stephen Boyd <swboyd@chromium.org>
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

On Fri, 24 Jun 2022 at 03:27, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> > Use parent_data for the last remaining entry (pll4). This clock is
> > provided by the lcc device.
> >
> > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > index 718de17a1e60..6447f3e81b55 100644
> > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> >         .enable_mask = BIT(4),
> >         .hw.init = &(struct clk_init_data){
> >                 .name = "pll4_vote",
> > -               .parent_names = (const char *[]){ "pll4" },
> > +               .parent_data = &(const struct clk_parent_data){
> > +                       .fw_name = "pll4", .name = "pll4",
>
> Is there a DT binding update?

I will include it in v2.

-- 
With best wishes
Dmitry
