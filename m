Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07E7C43334
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jul 2022 03:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiGCD7s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbiGCD7V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Jul 2022 23:59:21 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89D4BF70
        for <linux-clk@vger.kernel.org>; Sat,  2 Jul 2022 20:57:50 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be0d7476aso1956260fac.2
        for <linux-clk@vger.kernel.org>; Sat, 02 Jul 2022 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fjxhfrcAd5E9YXX10rRhBbkMnenLUuaD46OS0l1Bqk=;
        b=uWchCE1orcy5/neOuZil7FgjuVZuAxDDpsvDYWcuJHRj08iJNlyst2+dTV8dicqqKb
         bd21T+baWzKcQsu7Mdelx5LVLXLlJawCpM6YZSvW2mFKNlnw+sSb6ezyCcgwqhS+1SIE
         cnN6J/xzSfr2MwwVC+fmUDPHGySDeUB3p6J2FQp/THNTqRgPXFXM3ygDLn5ePSdYidGt
         FqkLfn7XvIv5z8iRWTY2IzyjzvwJsNjwucu4TAUoLc1As6wYq8gXUbJHjpPa5AhTe2tu
         ioEwxhnTwgBhh4K+FbhCpOepF/Ti0K8N1TC8nQYfoljHvKEokzp8ZbqGC/qDz74NwAnp
         AXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fjxhfrcAd5E9YXX10rRhBbkMnenLUuaD46OS0l1Bqk=;
        b=1mH45x8ptLGpJ2vGh1ceTdzsvQ2zt7+Kji/tTJc8yBMG4k+vJzvjieI0cED9x+LUoZ
         qummnnjiT0pxYxl8h/TjlrPupgbypKMG4fwXtmdVg52gFxkOEu2mT/d8/2djeUfV1OzG
         DTiRRqrWWZ6Spzm8JNcU3wAmpFXyMdhq/LV7eV3tZ9f9hygiwEKF4IfKJC85hydIHkxr
         M4MhsLRdvP0Vff06cb561GYaKjkr2Lz/0IYxAnLqFU53kvFziAzGvof3jVXPUgN1QyyA
         sh34ewtYKXF295tWjVj7H7kvk36689IdmQa8Ya/xn961mkjmGZUyn2H3PfLq8JnehgC8
         4oMw==
X-Gm-Message-State: AJIora9VfjBdDgUD2APv+AZqabRjjcZidG3mP471WdIykdwQYcq1Srl5
        7An9zsWYqPt5ajiQv+gZ45cv6w==
X-Google-Smtp-Source: AGRyM1uitoAiFuzW3NKMABJ60JG++lOvVEFMB3qDmMddBY+/TLFF5+5GARAAGDpzP27XPjcG36x5bw==
X-Received: by 2002:a05:6870:3482:b0:e2:d03a:41e8 with SMTP id n2-20020a056870348200b000e2d03a41e8mr15156839oah.79.1656820670055;
        Sat, 02 Jul 2022 20:57:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nikita Travkin <nikita@trvn.ru>, sboyd@kernel.org,
        mturquette@baylibre.com, linus.walleij@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, tdas@codeaurora.org,
        svarbanov@mm-sol.com, linux-gpio@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, agross@kernel.org,
        joonwoop@codeaurora.org
Subject: Re: (subset) [PATCH v2 0/4] Prepare general purpose clocks on msm8916
Date:   Sat,  2 Jul 2022 22:56:43 -0500
Message-Id: <165682055971.445910.1824989891242686339.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220612145955.385787-1-nikita@trvn.ru>
References: <20220612145955.385787-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 12 Jun 2022 19:59:51 +0500, Nikita Travkin wrote:
> Some devices make use of general purpose clocks as PWM outputs by
> controlling their duty cycle.
> 
> Notably, many devices (e.g. Samsung A3/A5, LG G Watch R and probably
> many others) use clock based PWM to control the haptic feedback,
> some other can control backlight or flash/torch LED brightness.
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: clk-rcg2: Fail Duty-Cycle configuration if MND divider is not enabled.
      commit: bdafb609c3bb848d710ad9cd4debd2ee9d6a4049
[2/4] clk: qcom: clk-rcg2: Make sure to not write d=0 to the NMD register
      commit: d0696770cef35a1fd16ea2167e2198c18aa6fbfe
[4/4] clk: qcom: gcc-msm8916: Add rates to the GP clocks
      commit: bf8bb8eaccf4e68d79743da631f61252753ca7cd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
