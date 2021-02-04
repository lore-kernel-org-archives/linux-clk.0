Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E572AC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B72A264DE7
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbhBDPCo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 10:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236993AbhBDPBV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:01:21 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE8FC061793
        for <linux-clk@vger.kernel.org>; Thu,  4 Feb 2021 07:00:05 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id u14so3241963wmq.4
        for <linux-clk@vger.kernel.org>; Thu, 04 Feb 2021 07:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOD9f0gdjmn8Bp720OnZx0t4o9aQAXse7DYeMemoOIg=;
        b=RqOnObk1mmdJc+ozxtz8CO9t/kfB/tloYfdyL52nvxE6xEBc21P0jQECX3MPj3NrHH
         yiWz9Rh4FB3JZOkBo64KFDSSU1ljdNXFYbyo0Ys78PIPSAEA8WggIy6CS8ZL7COPmnMs
         WrfarjSd/LJ0DRJ43LS7AdXkbjao+im/BUfk691WvRMLP/AuZKNPPaPTy9JY5222zEvS
         /r4WTCotf0SpLkddYUNA6dnJPCOLaHD30l+4Pe8HS8kt5MydNYb22KrqP49ciNprbI9A
         4QZmwrZp1rMcoXYaqUZVzGGDNLsudVdXlNRlUdFWriQEwifWEmfN0xDmYjr+j+G1Z8/L
         XE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOD9f0gdjmn8Bp720OnZx0t4o9aQAXse7DYeMemoOIg=;
        b=PYjpjWQ1Pza5BBigZpcuMqPDRxR1dPpQ5JCZ05sN62pjSfw6sEmnURFnwZ3b23AJL3
         Gw2TxW5Qo93AtCH5laCr5Pu+uPsWjqOsDCPFyXEOykGLOHM/9clkEj3pa4C8BJEL2Dl9
         YGmmb70tARQsYLoghi3Eb9frim3w8NYNcS9nF88iFEBqzgeYu+zpVkbRynnuH6FS0u/d
         siaMiL5v/RSrshtxe+QQuh3KkzBS2DaxthimQq8FZBLyhQd84vuA6Ql7VWwjuIXmqxuX
         cKIf//l0ay8bs/v0ArTiaZevLg9Q/t+rAfw2PKN5frt0IYV64HmFfTjqIwwT/bLauu6z
         89Sg==
X-Gm-Message-State: AOAM532zrdnpJ7E02OxhWBFpN6pe3qWKnAJwke9sEtFp3T0O7+ocSwy5
        rRz0TS+XpJ7qVbWanuBu6+1IKNy4q5yXwQ==
X-Google-Smtp-Source: ABdhPJx3veY876rfS8eVAZpWOeqBB1C1rnjWgV1ykEVNJDXZxFL7GBePC8wB5sn4MM5C+cI3mYjmoQ==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr7763320wmq.93.1612450803447;
        Thu, 04 Feb 2021 07:00:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 0/4] Fixup clocks for venus on sm8250
Date:   Thu,  4 Feb 2021 15:01:16 +0000
Message-Id: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

V2:
- Adds tested-by/reviewed-by as indicated - Dmitry
- Fixes commit log copy/paste typo in patch #3 - Dmitry

V1:
- Adds some missing indices to the videocc index
- Adds videocc clock tree hirearchy for msv0
- Adds a regulator to power the videocc consistent with downstream

Once done we can move on to enabling these clocks in the DTS and switch on
the venus.

Bryan O'Donoghue (4):
  dt-bindings: clock: Add missing SM8250 videoc clock indices
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
  clk: qcom: videocc: Add gdsc mmcx-reg supply hook

 drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
 2 files changed, 41 insertions(+)

-- 
2.29.2

