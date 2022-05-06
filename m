Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C2FC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  6 May 2022 23:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444980AbiEFX2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 May 2022 19:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbiEFX2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2022 19:28:00 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81920712D1
        for <linux-clk@vger.kernel.org>; Fri,  6 May 2022 16:24:16 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id e7-20020a4aaac7000000b00330e3ddfd4bso1498518oon.8
        for <linux-clk@vger.kernel.org>; Fri, 06 May 2022 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/ElELV4+QaCmbQivuCO+s3nmw20xVvpsLHj2VQCOczQ=;
        b=Q/mL5LmBEmb9tU2w0cn5NhXVWbyWIiPZkShqLXDDa+rVYo+1WH5J6y4cbFsJ/GHnIC
         cRQnPAAT2Uuv1KT9qQMyQhEBwSwfFhY1cgAJT+RawLfPkt8k09bvKbPuhGRMAXoU9bmo
         oaM+z+Z1SZgTAZFMlrKYNiQUFUqDmFkNmJnYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/ElELV4+QaCmbQivuCO+s3nmw20xVvpsLHj2VQCOczQ=;
        b=6GybVbqDCgFMIZDua0SajHgts8Cx18QUd13cmJzfIvKkC49RwUdwxSHuaK0ki086QZ
         lJgafS03jF7B66izcZlN+zJwhk5/hX9pUPx9npL+aHBDPjsHZFvI7onnWi50CG1y9ICq
         fxLM0YWeyojre62VyF0HRyXh4sr99t5yWN5/Uky+BJBee6xBpfP55lbP9QBgpl/kYr/y
         esFJguAqKqhhiuYtFAVCjKFJkBVFjBi71zHt0uHIJ5U4/CKDDvwqGVCMHyz+KIiJzsVM
         UCSArK+7p+OD+flKdAJYdaU/qrx6yMbxmiNpIBe8UhdcEajAM4lMLWYfyYi6/BVuUXTV
         dIiQ==
X-Gm-Message-State: AOAM53269RJyCKVhJCPlJ/h1+OSItWNj1qCt4s52d3eHKFQ2nEHGVaai
        rVcALknnKcwOZgimc2hpMU1VjU+Lsn00JNh2Sy0Kmg==
X-Google-Smtp-Source: ABdhPJyUJ6tVOobOozeBnxyxa8RgSY9d+Hm2+Rmx0y+yjUzUjdvUB/hoshBRw+G0Dpmcp5sPU11pJETcqoz8VXu5aq0=
X-Received: by 2002:a4a:6b49:0:b0:329:99cd:4fb8 with SMTP id
 h9-20020a4a6b49000000b0032999cd4fb8mr1917932oof.25.1651879455825; Fri, 06 May
 2022 16:24:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 19:24:15 -0400
MIME-Version: 1.0
In-Reply-To: <YnKvoh+h07at8b65@builder.lan>
References: <20220412194505.614002-1-swboyd@chromium.org> <YnKvoh+h07at8b65@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 19:24:15 -0400
Message-ID: <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2022-05-04 09:53:54)
> On Tue 12 Apr 14:45 CDT 2022, Stephen Boyd wrote:
>
> > Set the wake and sleep state for BCM clks here, not just the active
> > state, as the active only state is dropped when CPUs go to deep idle.
> > This ensures the clk is always on when the driver thinks it is on.
> >
> > This was found by inspection, and could very well be incorrect if the
> > RPMh hardware copies over the active only state to the sleep and wake
> > states.
> >
>
> Taking another look at this patch and now it makes perfect sense to me.
> Sorry for not grasping the problem earlier.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
>
> Will you take this in fixes, or do you want me to pick it for 5.19?
>

I'm waiting for Taniya to reply. For all I know this has no effect
because there's some sort of copy/paste from one state to another. Until
then it doesn't seem like we should do anything.
