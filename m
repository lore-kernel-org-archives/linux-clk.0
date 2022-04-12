Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED3AC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 19:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352773AbiDLTWy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 15:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347614AbiDLTWx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 15:22:53 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F63FE0
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:20:34 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id r25so6562776qtp.8
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chVyhFxixwoz7zNbu99F11TKHFQnl3/UVYBDPB80ZHY=;
        b=gXpCS89SV25uD/Y+1x2aHYvQ4vgt3R0Xu8swk6osxevhzyMgEDaPNW9ZP/NFJNuPHz
         28TaViXb9L44buYRbeek8mPQATl09OQ79rU7Z3vikUf8fC9CMeEtxoBc20+ak86yhtyJ
         frFm6Pn3raz0+A/40BKzY3O7/vPlZktKTHmUJQDZM+eSJneDV8Q6568Y70BWO4GhTcgy
         eVEoeFmqKEpZc2RCRauAr7aKhDGpHi/ukxgVxu4alQ5aDJTSCJAJ/pdyygki/zCHbuN+
         F1osIdGDrMeDJsLmaphrdl1NYjQqnyYcFDCrHCkgbVNURgnm8xNBbKuiqeudtRZSVYtY
         FakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chVyhFxixwoz7zNbu99F11TKHFQnl3/UVYBDPB80ZHY=;
        b=1ceGjG+jsVN9h+M806ApAqrhe8QKcn9Z4+cvztkO9AZEnXT60TCrUt5SwF2OiHPYBp
         f6OBXRpURb/PEQyR5BjU6dcAtrM7i3FAgorpQ0J8HREdhbzMQ1U6iwDhwSedeuFRBrr2
         HEZOMbe+GLqzeW2tCNh9UeO4SXu5cbHAF0EAOZSFE6ZjkrVA50b5qmBnUERmPBYEu01l
         8xkOJ4PxkGqF9154YeTm89tG7gh/XPLDZIK8SG6t7qiSWOJjWSTu8zDl/eR+JGnCvEYi
         3fxJbaJGglpaItv215caWxI/1uCBlKPoPnhgLMrjnqaaFhM6Kh6mjLydSuvCi6nIMJQP
         rImw==
X-Gm-Message-State: AOAM531E8pDAP6p3Bc9UowR6aZKKnlWr4KlOGFz837IkunLlv+YwdC28
        A2FbYmhVg5FBVoqNIddPgVWmNWlFtHI/kw6CuTGqJA==
X-Google-Smtp-Source: ABdhPJyLIBZR72VaDtuzWmfwbKyURkZFlbzUnKCwIee1kql6f59UqrnPndVBLSVdTBBd76Xhj9Y/B4Xwa0ph4v4E8kU=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr4570468qta.295.1649791233793; Tue, 12
 Apr 2022 12:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406154028.EC897C385A3@smtp.kernel.org> <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
 <20220412184304.79012C385A8@smtp.kernel.org>
In-Reply-To: <20220412184304.79012C385A8@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Apr 2022 22:20:22 +0300
Message-ID: <CAA8EJppha+V77S6LAZW9us6XiVu9vD9X=RF+RKd+5cvCz+NxEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Apr 2022 at 21:43, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-06 12:57:30)
> > On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
> > > > Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> > > > the device using DT node instead. This follow the IPQ8064 device tree
> > > > schema.
> > >
> > > Why can't the schema be changed?
> >
> > But these commits change the schema. They make apq8064 follow more
> > logical scheme of ipq8064.
> >
>
> Sounds like ipq8064 and apq8064 follow different schemas. Is there any
> benefit to harmonizing the two vs. just leaving it as it is in the dts
> and making the schema match whatever the dts has?

I'd prefer to harmonize them. It makes no sense to have two different
approaches for the single IP block (shared between ipq and apq/msm).
And having a separate device tree node for the tsens removes a
dependency from gcc on the nvmem/qfprom.
Note, upstream qcom-msm8960.dtsi doesn't describe tsens at all, so we
don't have to worry about it.

-- 
With best wishes
Dmitry
