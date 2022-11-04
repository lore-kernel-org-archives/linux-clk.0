Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996B5C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiKDVUF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiKDVUC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:20:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140D4EE10
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:19:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u11so8111471ljk.6
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bco6GFNVU1HGevRBeodLZeLGvp/i5iMrjxMWqPFArI=;
        b=GL5H6SwIQ7SnPyD4oON4xBfjTDtVrCa9/Xki8VGFJD83uINEgUiij95xbgnMm86cqN
         RDxCQFTbMYUGgzg6e1v/y4/nXYkFAQEJ1HKsM9mWwUwjdpv/PWNKkwHP/hYD6RVpTIQL
         KNZiXlL5YoppusYjW8TIwl2fsbKq5X7G45NWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Bco6GFNVU1HGevRBeodLZeLGvp/i5iMrjxMWqPFArI=;
        b=H89y+bbn/Voez47QJn2ejvcgL3quaPnbLExdH2/0Z7GtPrdcqiWcJKUnIIJWWdbctd
         N/TnP8zHu2tJG2msjVWOSgCWqxu3lXQgnTAKREtGjBAQHLW/35DGpsBbOdPYEKGy8SHP
         BUZHn/HBMo4qI6Peh86OLrzvS+ZDyRtRXNnReBL5ra8cmEXJVUi0L14TcNst9nb0EC9H
         pqaDkCI0jw0zazg5C/9gTx07ZEWzulFPSO44feVnLJfEHRBYKYbJPDdVZl+iIBp4GH8o
         ikjUkLAD+UbrJt7ilR4ezvMBereZ3aaPaSniI3MnE5IRfVxi9SH7TnDPiHFwYQ4VvdWH
         l3tA==
X-Gm-Message-State: ACrzQf3J8rysDfF4793Pl2+KJf+s3h5QeEn8XCfr0WTTuZpmXwqroRRG
        m3vuZC8ZtYMKLteu5ibiCsoRpfcLBpgQ4N2nPEg6cg==
X-Google-Smtp-Source: AMsMyM6z0i1Sv3zsd0Jq/pbof/zICrtZpxky+Y+f3KH0VlUri2O47At8vk0jaz4ZKam20cq9Bb5MAyac1cc20XSL2Nk=
X-Received: by 2002:a2e:8810:0:b0:277:4819:a6c3 with SMTP id
 x16-20020a2e8810000000b002774819a6c3mr12733700ljh.4.1667596788296; Fri, 04
 Nov 2022 14:19:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Nov 2022 14:19:47 -0700
MIME-Version: 1.0
In-Reply-To: <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 4 Nov 2022 14:19:47 -0700
Message-ID: <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: lpass-sc7180: Fix pm_runtime usage
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
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

Quoting Douglas Anderson (2022-11-04 06:56:29)
> The sc7180 lpass clock controller's pm_runtime usage wasn't broken
> quite as spectacularly as the sc7280's pm_runtime usage, but it was
> still broken. Putting some printouts in at boot showed me this (with
> serial console enabled, which makes the prints slow and thus changes
> timing):
>   [    3.109951] DOUG: my_pm_clk_resume, usage=1
>   [    3.114767] DOUG: my_pm_clk_resume, usage=1
>   [    3.664443] DOUG: my_pm_clk_suspend, usage=0
>   [    3.897566] DOUG: my_pm_clk_suspend, usage=0
>   [    3.910137] DOUG: my_pm_clk_resume, usage=1
>   [    3.923217] DOUG: my_pm_clk_resume, usage=0
>   [    4.440116] DOUG: my_pm_clk_suspend, usage=-1
>   [    4.444982] DOUG: my_pm_clk_suspend, usage=0
>   [   14.170501] DOUG: my_pm_clk_resume, usage=1
>   [   14.176245] DOUG: my_pm_clk_resume, usage=0
>
> ...or this w/out serial console:
>   [    0.556139] DOUG: my_pm_clk_resume, usage=1
>   [    0.556279] DOUG: my_pm_clk_resume, usage=1
>   [    1.058422] DOUG: my_pm_clk_suspend, usage=-1
>   [    1.058464] DOUG: my_pm_clk_suspend, usage=0
>   [    1.186250] DOUG: my_pm_clk_resume, usage=1
>   [    1.186292] DOUG: my_pm_clk_resume, usage=0
>   [    1.731536] DOUG: my_pm_clk_suspend, usage=-1
>   [    1.731557] DOUG: my_pm_clk_suspend, usage=0
>   [   10.288910] DOUG: my_pm_clk_resume, usage=1
>   [   10.289496] DOUG: my_pm_clk_resume, usage=0
>
> It seems to be doing roughly the right sequence of calls, but just
> like with sc7280 this is more by luck than anything. Having a usage of
> -1 is just not OK.
>
> Let's fix this like we did with sc7280.

Any Fixes tag?

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
