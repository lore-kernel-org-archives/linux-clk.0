Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E377C83F12
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 11:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239114AbjHaLcc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 07:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjHaLcc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 07:32:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F451CF9
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 04:32:29 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7b66b5641eso464271276.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693481548; x=1694086348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Y4Cq/IHdVsRZWccJ+nEpibfReLfGO5CUKhv7KNNEEs=;
        b=r22IQQCEFtQcbJRHBCq5qEcauLLGwMO++3wX21yyE8QrruYLJ2o5hdnH6eYCbDaH6J
         Lm7/PFLFfckGz+upSVnz3h6l9DwrWIEMMO2rLLzZU1vjBNJ2HF9nII3t0JvFTHsY3bEI
         yXXS07bojLRSxMlPSKr7E/zxvwJ8cRKB2ODJ5wEf+ntLb90dnz3zvs3YqZdQ1Aq6xcNc
         72LTT3v1RXqZQZIZf0jUUXqrrQkqggN7TBssKGpzvGYDc2iipFnEYxCxohNs39ONx/Mf
         ORL9L58hFjfyPS6dEYKjdyxQBBWnxhAL+tlBP1LAaerW4GOxyNniBLv44khEOKROGj5Z
         9Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481548; x=1694086348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Y4Cq/IHdVsRZWccJ+nEpibfReLfGO5CUKhv7KNNEEs=;
        b=Nr1oGHYX96MEf4KICtfpEzRukndQZ9Otm/3FFEYV+7zY+am5jpgxjcUi/rSXcHWsSy
         kUlIsd98rkKZPXua1p2zIYKCbCOrrRfb34yg1JWiWuY/QJO6MiDaeIvanw+KVlGvMZwa
         SR4wrk1DaTVRYicCKmdJbLbhNdaRyfAHdhFURFtGNZdCSMBTZgMgp0mwCeTOBS2X93nx
         a7EBcUKPPMFkMImkzEBsw1TRZcZhygoDkR1iA/WJ8oHrYgDpAA1YxA7fZbHib6r0sCov
         dJksnUuEPjzDVEWBUQI3quFYEDswWPtABPRgKJ7bDPGaAiN5TKkSNNDi/zuLZsteqMhJ
         k9hg==
X-Gm-Message-State: AOJu0YwVQ71yRZeKhCBe0+XUsxfici4S4xdlSB69YNRsZImeB8kuJA0c
        Bf+lCnDsiZJruPkfNHm3DUrtpF/mW++Cx7Xq6YC3Mg==
X-Google-Smtp-Source: AGHT+IGmZkwOv9/T3myqmvLQt+2FQYaNTQx2vhwnosm5z0c5JuszozfA/F3Oh1I0GuscrvpOIc2G/zJJoa5FiM3GqoA=
X-Received: by 2002:a25:b8b:0:b0:c73:e6b5:c452 with SMTP id
 133-20020a250b8b000000b00c73e6b5c452mr4431574ybl.2.1693481548627; Thu, 31 Aug
 2023 04:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-topic-rpmbusclocks8996gcc-v1-1-9e99bedcdc3b@linaro.org>
In-Reply-To: <20230830-topic-rpmbusclocks8996gcc-v1-1-9e99bedcdc3b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 14:32:17 +0300
Message-ID: <CAA8EJprupMJY7xKq4qO_+vBsrtBDvEPr+HEZqc2S+o0B1tQsWg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: Remove RPM bus clocks
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 31 Aug 2023 at 12:39, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> The GCC driver contains clocks that are owned (meaning configured and
> scaled) by the RPM core.
>
> Remove them from Linux to stop interjecting the RPM's logic.
>
> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Evolution of:
> https://lore.kernel.org/linux-arm-msm/20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org/
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 237 +----------------------------------------
>  1 file changed, 5 insertions(+), 232 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
