Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C83EC4332F
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 16:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239531AbiECQ1k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 12:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239537AbiECQ1h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 12:27:37 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B56E3D1DC
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 09:23:57 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d15so15411452plh.2
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AkYi5rm3JrkNa6oYMAoWigJsfTCjd2LW4h2+4/5a098=;
        b=F9ulL9gHrJ+nfPD2aVGHUU5AZgG8kVfQ0usoeG3UriqrSG9TU2ZQZwpoQaeP3LRLsh
         9PGzJMVyvlkdrCp7fn5YSCLCAKZKhHLzvpekhd0oBFTpAHwSMl2Y9ibPTF8wjdx+mFLU
         vX+XfDiSk4VtY4tZfNgvNSDuF7y2BRxWALiyPQLwCLyE+hTwyNoUWRVbYEC5l6K7lroZ
         JZAmGE270RI1vF1nOjx8NHDraKhU0oLXKHxefQzjD4s8yu1t1cvId8/9xPfl5njQUJlr
         p+0DqWAhcXnN9pzh8MHiPgh7ozdJBGKHMM866XQG0uqANsrp+Qgy08YaOE2lhvs6RFQ8
         AzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkYi5rm3JrkNa6oYMAoWigJsfTCjd2LW4h2+4/5a098=;
        b=PbFkE9cO/zCJ/HGjalSmwqbMm42x/hI58SBQyIpnsAWvqQlmIM1ag9eCRQTk/aLQ3s
         mnIKXQXQd53rdD2W4K0IVxYHzeKdgsD9jXsBklbJKRQajQD+FlgyX2AUX3zkgBkVFf7R
         bIIaIaTOIYGjGrIiDXBZ6CPTClxRb/zResuLXII6CBp/RlRzZs1vkEGv5MsajuGUIPfJ
         h38qaxRFe6FDwiZC4NLiKh4RDeiPWGBx/9Eu+uq0/juMfArcR6QAi/3GywpEFkiQglla
         l13UGNgbBOl4RC+l1QD+dXsd3criogjSSVtb/p6ndVpqBewtv04T7TeasMjKOJsbJ0Fk
         vyaQ==
X-Gm-Message-State: AOAM530mHIA8vR+La5fuM8MmcGL1A0H50di8c60Rfjabacs8UKskgSd/
        g+9sFZBmswoAiI1xn//QNN1BqxcAFcQXSrP6C04g+Q==
X-Google-Smtp-Source: ABdhPJwZwYNmYVzRLpeDt8whr8PdLAN/XsVEJ73jj69wIXUdug2jw+h3tkhkSky8/B7L8VRDCiQhM7NWXrPPBxfq3pk=
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr17412620pls.65.1651595036939; Tue, 03
 May 2022 09:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220503130448.520470-1-robert.foss@linaro.org>
 <20220503130448.520470-2-robert.foss@linaro.org> <YnFEGzTQMsNpczai@builder.lan>
In-Reply-To: <YnFEGzTQMsNpczai@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 May 2022 18:23:45 +0200
Message-ID: <CAG3jFysjzTMJM=DbLGNXBfWYjQKxxRvGQMZp6GOL7uBvRUwRYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 3 May 2022 at 17:02, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
>
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Some clock implementations doesn't provide means of implementing
> > is_enabled(), but still requires to be explicitly disabled when found
> > unused as part of clk_disable_unused().
> >
> > One such set of clocks are Qualcomm's display RCGs. These can be enabled
> > and disabled automatically by the hardware, so it's not possible to
> > reliably query their configuration. Further more, these clocks need to
> > be disabled when unused, to allow them to be "parked" onto a safe
> > parent. Failure to disable the RCG results in the hardware locking up as
> > clk_disable_unused() traverses up the tree and turns off its source
> > clocks.
> >
> > Add a new flag, CLK_ASSUME_ENABLED_BOOT, which clock drivers can use to
> > signal that these clocks should be disabled even if they don't implement
> > the is_enabled() ops.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
>
> I discussed this with Stephen a while ago and we agreed that in a
> sufficiently complex system with kernel modules booting without
> clk_ignore_unused simply isn't supported.
>
> We will have to design something better. So please drop this patch from
> the series.

Ack
