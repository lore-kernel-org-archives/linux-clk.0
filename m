Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDE4C43217
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 03:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiKBDRD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Nov 2022 23:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiKBDQk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2022 23:16:40 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF30D24F17
        for <linux-clk@vger.kernel.org>; Tue,  1 Nov 2022 20:16:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id k19so23197604lji.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Nov 2022 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0FKuPdAXIYX300uZ/xt/rKcm8IpOOmo6yvLqruKEg4=;
        b=niypHrutCHgNxpl26t0c39eSC/75ATCFI2GMdqMsAje9m3mhC709C4YyB0owZQvCJU
         NZ+DuVWmF93aTauDCkJWOBiJiaTeJIKONV7xxdY4n9Uilb3YKlYhhb8m15neh1i21jte
         FyMVFwSm0W6Id5SK84FT8TdsOfchDJSv6qN0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0FKuPdAXIYX300uZ/xt/rKcm8IpOOmo6yvLqruKEg4=;
        b=tdrKqUjmikdqClb2OrohOnDUZbaNXcaZjludpfjrHwamnzmwnopc0XxTSmHfCbGyzS
         BOkb2/YiWj74PtaAVSMhki8fnzZTZxMhkJTlITZa9FHnLAY2ri/+cwkZEmNyHfzUSuWl
         U9qOSZ//MhfCfc8l/rIFFSVROhCR9mLm7FjQa+Or1fz2dHhlvCI58XhRHKBf6MW8Y7jg
         UvkEvJOvuRv2Ogzw4VLcyeuQiixAPa8w3Qe7wTfFnf/VRAjAEdgGUinL4Q0crx47wc5F
         WJ3TYUBIoa6Unojbna+R312y7R9RHJJ0SGLGbPJl/7LO/nSm4V+ymoCDREdMqM0rYSUn
         09Sw==
X-Gm-Message-State: ACrzQf035Ok2UcDJ6WtfwtWssqWz0CguVwZYR7bV6uLRuM/DBdAyZwzt
        DuxrGllIb0Wntl7Tqg//SONClM3dpBUafn6BXg2+vQ==
X-Google-Smtp-Source: AMsMyM40W2NZWoF5xhTZrkOLd2ppkHaScRMtEHKMdEsHi6JZLpdwFR2RE2vQMp6er3Du3ratTGy3rxcgKDgVYk6ONsM=
X-Received: by 2002:a2e:8081:0:b0:277:b:33db with SMTP id i1-20020a2e8081000000b00277000b33dbmr7971726ljg.228.1667358996017;
 Tue, 01 Nov 2022 20:16:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Nov 2022 20:16:35 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XkhtgL_4-cpj-Xi3uH6FAtmWhk5u6sfakXABTnv5eYvw@mail.gmail.com>
References: <20221101233421.997149-1-swboyd@chromium.org> <CAD=FV=XkhtgL_4-cpj-Xi3uH6FAtmWhk5u6sfakXABTnv5eYvw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Nov 2022 20:16:35 -0700
Message-ID: <CAE-0n539akxzrof5nZXb1=8tM9=A7NKaB98LjkQ4tWJmSbWm_A@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Remove direct runtime PM calls
To:     Doug Anderson <dianders@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Anderson (2022-11-01 17:45:03)
>
> One small nit is that the kernel doc for "@dev" in "struct gdsc" is
> incorrect after your patch. It still says this even though we're not
> using it for pm_runtime calls anymore:
>
>  * @dev: the device holding the GDSC, used for pm_runtime calls

Good catch! I can remove the part after the comma.

>
> Other than that, this seems OK to me. I don't feel like I have a lot
> of good intuition around PM Clocks and genpd and all the topics talked
> about here, but I tried to look at the diff from before all the
> "recent" patches to "drivers/clk/qcom/gdsc.c" till the state after
> your patch. In other words the combined diff of these 4 patches:
>
> clk: qcom: gdsc: Remove direct runtime PM calls
> clk: qcom: gdsc: add missing error handling
> clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled
> clk: qcom: gdsc: enable optional power domain support
>
> That basically shows a combined change that does two things:
>
> a) Adds error handling if pm_genpd_init() returns an error.
>
> b) Says that if "scs[i]->parent" wasn't provided that we can imply a
> parent from "dev->pm_domain".
>
> That seems to make sense, but one thing I'm wondering about for "b)"
> is how you know that "dev->pm_domain" can be safely upcast to a genpd.
> In other words, I'm hesitant about the "pd_to_genpd(dev->pm_domain)"
> call. I'll assume that "dev->pm_domain" isn't 100% guaranteed to be a
> genpd or else (presumably) we would have stored a genpd. Is there
> something about the "dev" that's passed in with "struct gdsc_desc"
> that gives the stronger guarantee about this being a genpd?

Not really any stronger guarantee. The guarantee is pretty strong
already though. You can look at the callers of dev_pm_domain_set() and
see that nothing is calling that really besides the genpd attachment
logic when a driver is bound to a device (follow dev_pm_domain_attach()
from platform_probe()). The dev->pm_domain is going to be assigned to a
genpd assuming the 'dev' pointer is a platform device and has
'power-domains' in DT.

It's not great, but it works for now. Certainly if we ever want to
replace the pm_domain with something that isn't a genpd then we'll be in
trouble. I'm not sure it will ever happen. Ulf, can you provide more
assurances here?

>
>
> In any case, I will note that this seems to make the hang that I
> described [1] go away. I never totally dug into why the patch was
> tickling it, but I'm happy for now that it's back to not reproducing.
> :-)

Cool!
