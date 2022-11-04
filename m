Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C353C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 22:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiKDWIi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 18:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKDWIh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 18:08:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64ABFCED
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 15:08:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id t25so16679727ejb.8
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUWMpfCp8yMYMN27hOBTPmmaRDIODrfLy/QYyrxVC9U=;
        b=N/5MobyCqMqaDHUf0VYAeGDlaShVI6gW3R/fr1tLkTjRzSd0mrwTwe6AgO1bc6rMAQ
         vGqaYuhfvQ82vWTraoh76WIR9XOumQyzsOIhiQlm7A5wwEuKKd3o4BWpzigWjyVJAaHB
         lXa1OaNbz5gonB88NC84ox0/3fAaw8jeOZ6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUWMpfCp8yMYMN27hOBTPmmaRDIODrfLy/QYyrxVC9U=;
        b=dUCd0HjT6ZAXIaPIY3kbzTm6hM0QG9fq//szkC6m0StGQQBwN/n8FNWtxqZDG8BWg1
         i2PnEc/wvE3e6YRdD2qTLhvISVps6z+iArP+sxJwXft3FSANC+B3N+fDdDP0KKd29C/K
         52upNCzbY1EojP3ArAr0EAWaCtdzx9FplAzr6vdUZOFRLAun0ANm0Zz4aQTT5nHMhrVZ
         ljKT/LKN42xy5yC5qGvoBEQ5yH11nhJS66mLgnSRgeNfNbcjPpj4pZg/Fq/3x8aXSfDe
         Jar0V6dV6BRtxTew1LojMhrVkmkz5S7RYdwlY3zo3wneVkDTMGXAVrHTCfzZYNTXWVvi
         rUOA==
X-Gm-Message-State: ACrzQf1v25oLZOzuoVAxkNKC8QGpbRJE3VDxT68YKkH6Eg6LiSfdvNPL
        UkOdnxrzpZg5mwgB4KYh8ohQEHHnD40/Qw9x
X-Google-Smtp-Source: AMsMyM4NNCUZFB2BetUa2/Us1A9Z1nJa8g0m65zBZAMRqVbrPtHsystPfRjCwi+whQBKKRZ1BGjzbQ==
X-Received: by 2002:a17:907:7208:b0:78e:176e:e0c6 with SMTP id dr8-20020a170907720800b0078e176ee0c6mr36735080ejc.594.1667599713741;
        Fri, 04 Nov 2022 15:08:33 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b007a1d4944d45sm71889ejm.142.2022.11.04.15.08.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 15:08:31 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso6214880wme.5
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 15:08:29 -0700 (PDT)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr25419745wml.57.1667599706005; Fri, 04
 Nov 2022 15:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid> <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
In-Reply-To: <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Nov 2022 15:08:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSh90tdSDaxThoGaE_uYWPTMrGYBMM0UqcH=HUZaScNg@mail.gmail.com>
Message-ID: <CAD=FV=VSh90tdSDaxThoGaE_uYWPTMrGYBMM0UqcH=HUZaScNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: lpass-sc7180: Fix pm_runtime usage
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Nov 4, 2022 at 2:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-11-04 06:56:29)
> > The sc7180 lpass clock controller's pm_runtime usage wasn't broken
> > quite as spectacularly as the sc7280's pm_runtime usage, but it was
> > still broken. Putting some printouts in at boot showed me this (with
> > serial console enabled, which makes the prints slow and thus changes
> > timing):
> >   [    3.109951] DOUG: my_pm_clk_resume, usage=1
> >   [    3.114767] DOUG: my_pm_clk_resume, usage=1
> >   [    3.664443] DOUG: my_pm_clk_suspend, usage=0
> >   [    3.897566] DOUG: my_pm_clk_suspend, usage=0
> >   [    3.910137] DOUG: my_pm_clk_resume, usage=1
> >   [    3.923217] DOUG: my_pm_clk_resume, usage=0
> >   [    4.440116] DOUG: my_pm_clk_suspend, usage=-1
> >   [    4.444982] DOUG: my_pm_clk_suspend, usage=0
> >   [   14.170501] DOUG: my_pm_clk_resume, usage=1
> >   [   14.176245] DOUG: my_pm_clk_resume, usage=0
> >
> > ...or this w/out serial console:
> >   [    0.556139] DOUG: my_pm_clk_resume, usage=1
> >   [    0.556279] DOUG: my_pm_clk_resume, usage=1
> >   [    1.058422] DOUG: my_pm_clk_suspend, usage=-1
> >   [    1.058464] DOUG: my_pm_clk_suspend, usage=0
> >   [    1.186250] DOUG: my_pm_clk_resume, usage=1
> >   [    1.186292] DOUG: my_pm_clk_resume, usage=0
> >   [    1.731536] DOUG: my_pm_clk_suspend, usage=-1
> >   [    1.731557] DOUG: my_pm_clk_suspend, usage=0
> >   [   10.288910] DOUG: my_pm_clk_resume, usage=1
> >   [   10.289496] DOUG: my_pm_clk_resume, usage=0
> >
> > It seems to be doing roughly the right sequence of calls, but just
> > like with sc7280 this is more by luck than anything. Having a usage of
> > -1 is just not OK.
> >
> > Let's fix this like we did with sc7280.
>
> Any Fixes tag?

Ah, right. I guess the most obvious one is actually:

Fixes: ce8c195e652f ("clk: qcom: lpasscc: Introduce pm autosuspend for SC7180")

That's what got us going negative. One could _sorta_ make the argument
for a "Fixes" tag all the way to the start of the driver, though. The
driver never did a pm_runtime_get() during probe and so there was (I
guess) a chance that some of the bare register writes in probe could
have been unclocked. I'm not aware of that ever being a problem, so I
guess just the above "Fixes" is fine.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks! Yell if you want me to spin a v2 with the Fixes in place.

-Doug
