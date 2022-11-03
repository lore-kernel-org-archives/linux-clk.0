Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4DDC433FE
	for <linux-clk@archiver.kernel.org>; Thu,  3 Nov 2022 16:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbiKCQzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Nov 2022 12:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKCQzt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Nov 2022 12:55:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D076252
        for <linux-clk@vger.kernel.org>; Thu,  3 Nov 2022 09:55:47 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h12so2963965ljg.9
        for <linux-clk@vger.kernel.org>; Thu, 03 Nov 2022 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfNKvOanyjhHXBelrkaChFOyOSO1zGtjsNg5Ut58HCY=;
        b=l8L5GV5CeR9wDYO+5JynTcHeJOpgCRiyXIH0gjfjyzpIYPBguREKcqoOHAxE9yxwcp
         lsTsT2CcIczlSniwSfhfBeCvg+XNVj5J7fyDcwS2HIuZeNMJ9hxfjr88MBOgvMH/BTaV
         nVU7d3mVSTMTgAT4Cw4Wh4IOS3OEw8YEr61m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfNKvOanyjhHXBelrkaChFOyOSO1zGtjsNg5Ut58HCY=;
        b=4Tuf2N3mUV6eWI6mUHSGw4Ovlty+rutXGSi1ObJM+7lX1r1Jqnpe1u03Jq0p3R2Acf
         TM1b2pVmTaNpvQgH6owEYu92hQvNr7UKUdTX5WzM+srP5/qpd9h/LCHOlYV1/XHfwS/v
         sIy2gugFcC05b9LI3952zBTiehXNsIa6uvCxuFCVJ0ZhYy1HhoBFeJSkHiwrd2XE01MO
         vnxGSIofbnELlZoE3EYe3wPSjSFZx3n1D57N3nmU3k5DQLbz7RY/qdLT1TfrqgaeDY5m
         +QYfGgS2Awq9w7qGXW2z/vohf2zsNy3GGs8b61CwZJHSzmTUilm8VcmXJZA20jy60hDk
         /eGg==
X-Gm-Message-State: ACrzQf0hAuKIdWF2nrAg+LGfIxaJuixTWlnSraf6Utx0fh7luvcHJy99
        ikfNHlOPChXQMMreQOOleqVnNMe0HaGFy0/glI7rQQ==
X-Google-Smtp-Source: AMsMyM7F6w1WR1rSV9GSlSeTP7m094zPjzqZZijj6DLJBRqC4jr2/5t8eFRsP4KqYMeT2vVp5eZ7kbdeNtIZBiT0/mg=
X-Received: by 2002:a05:651c:222c:b0:26b:dec5:a4f0 with SMTP id
 y44-20020a05651c222c00b0026bdec5a4f0mr12924242ljq.359.1667494545853; Thu, 03
 Nov 2022 09:55:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Nov 2022 09:55:45 -0700
MIME-Version: 1.0
In-Reply-To: <Y2PQrRkGTEE40m4Q@hovoldconsulting.com>
References: <20221102170717.1262547-1-swboyd@chromium.org> <Y2PQrRkGTEE40m4Q@hovoldconsulting.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Nov 2022 09:55:45 -0700
Message-ID: <CAE-0n52zxYSdbQg5VqVQ9gboZy2BSgJUgJ5orvNkzrz-3-81SA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: gdsc: Remove direct runtime PM calls
To:     Johan Hovold <johan@kernel.org>
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
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Johan Hovold (2022-11-03 07:31:09)
> On Wed, Nov 02, 2022 at 10:07:17AM -0700, Stephen Boyd wrote:
> > We shouldn't be calling runtime PM APIs from within the genpd
> > enable/disable path for a couple reasons.
> >
> > First, this causes an AA lockdep splat because genpd can call into genpd
> > code again while holding the genpd lock.
> >
> > WARNING: possible recursive locking detected
>
> > Second, this confuses runtime PM on CoachZ for the camera devices by
> > causing the camera clock controller's runtime PM usage_count to go
> > negative after resuming from suspend. This is because runtime PM is
> > being used on the clock controller while runtime PM is disabled for the
> > device.
> >
> > The reason for the negative count is because a GDSC is represented as a
> > genpd and each genpd that is attached to a device is resumed during the
> > noirq phase of system wide suspend/resume (see the noirq suspend ops
> > assignment in pm_genpd_init() for more details). The camera GDSCs are
> > attached to camera devices with the 'power-domains' property in DT.
> > Every device has runtime PM disabled in the late system suspend phase
> > via __device_suspend_late(). Runtime PM is not usable until runtime PM
> > is enabled in device_resume_early(). The noirq phases run after the
> > 'late' and before the 'early' phase of suspend/resume. When the genpds
> > are resumed in genpd_resume_noirq(), we call down into gdsc_enable()
> > that calls pm_runtime_resume_and_get() and that returns -EACCES to
> > indicate failure to resume because runtime PM is disabled for all
> > devices.
>
> Probably worth mentioning the fact that those runtime PM calls
> unconditionally failing during resume means that the GDSCs are never
> even enabled.
>
> Seems like the PM runtime usage counters would still be balanced after
> this though as they are decremented also on failure during suspend (i.e.
> domain remains off and no usage counter is incremented during resume).
>

I'm seeing negative usage counts.

> But this is clearly just very broken.
>
> > Upon closer inspection, calling runtime PM APIs like this in the GDSC
> > driver doesn't make sense. It was intended to make sure the GDSC for the
> > clock controller providing other GDSCs was enabled, specifically the
> > MMCX GDSC for the display clk controller on SM8250 (sm8250-dispcc), so
> > that GDSC register accesses succeeded. That will already happen because
> > we make the 'dev->pm_domain' a parent domain of each GDSC we register in
> > gdsc_register() via pm_genpd_add_subdomain(). When any of these GDSCs
> > are accessed, we'll enable the parent domain (in this specific case
> > MMCX).
> >
> > We also remove any getting of runtime PM during registration, because
> > when a genpd is registered it increments the count on the parent if the
> > genpd itself is already enabled. And finally, the runtime PM state of
> > the clk controller registering the GDSC shouldn't matter to the
> > subdomain setup. Therefore we always assign 'dev' unconditionally so
> > when GDSCs are removed we properly unlink the GDSC from the clk
> > controller's pm_domain.
>
> This last bit makes no sense as 'dev' was only used for the runtime PM
> management and should be removed by this patch.

Oh sheesh, the name 'gdsc_register()' really throws me off. I think it's
one gdsc being registered, but it's actually plural gdscs, sigh. I will
fix it.
