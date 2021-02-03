Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16BEC433E6
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642F264F6A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbhBCLyn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbhBCLyn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 06:54:43 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00A6C061788
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 03:54:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l12so4139821wmq.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIR8kxlA4Jty9/otffAphB5/jPhHJK1wsDSo+IREMHg=;
        b=EnNbMPrtPs5H2UUx49Sg0I/uRydYGDdAHwFonstivpkERfuMVMx6bSclLV2BaYMeLW
         AXfvBdzZ8KvvBIuA742bgQAPQxv8RwVDfkGHGcMbnnKMDERHqo1VNmsyPcq+uSN3k3dw
         HQgDVo4QwDm6t2horfC8FUrxYc6olh7DiO7iQIuNMPba7UVpZpv8I89NCtmUifJfIEsE
         Z2onMLVtsQBg1JKJpPj6zCJjDK7l6SHYk298mkb5bHu4balMF5DeeKrpHYrJ1yaAEucV
         PkaAJ5gyEqft4I9ZsyOTk+SHJk/scn9QT7muA0vRNeAQf34sWB/1hId0gyRki21hH6XT
         BiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIR8kxlA4Jty9/otffAphB5/jPhHJK1wsDSo+IREMHg=;
        b=bUpS9/Csustal6etXjccA4I9sLW/8DHpd5V/0Qb13BpOltKd4MiPGBdAfzFple9ap1
         20ur876B+RMRSPAYQRpHPYTR9iYtzBIgwGQbEy8qQsyAIvXNA81YFDesXM0nl++rlLMm
         pIqOvjmjhgSpIHaX1J5gYm0emw+JXbmrAG8PKSUBaRdmjYNi0XANP+88Qc4uPc9QJvMb
         CbB2x5/faoXfN8mGNk0ny0LJj3Cg7ra46qaAKrmQyWAaRrc3v/gikB5afcWIl4FEzyGe
         DUL4CXyEfHugQQ7PHPQa1QFAT0A0y/l29n2Nr4fdw1UMQ7mijoKMcdPyYlO+5DhbX9UK
         fCNA==
X-Gm-Message-State: AOAM533uoMNfReNBbqGlgJmKie6su6tfK3+JmToW2c+xyUUvRvNf2+zN
        aVn9bRApT8I/Na18+CkoI+oPy/mNlLFylQ==
X-Google-Smtp-Source: ABdhPJzbdHUE/lkH5CariWVk3SbLNS+6oY4OoCIeUhTdL8TIk0I7aM9knVC2EmRo1KV8VM7cBJqKTA==
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr2545153wme.115.1612353241240;
        Wed, 03 Feb 2021 03:54:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:54:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH 1/4] dt-bindings: clock: Add missing SM8250 videoc clock indices
Date:   Wed,  3 Feb 2021 11:54:53 +0000
Message-Id: <20210203115456.1072975-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Two indexes need to be added to videocc-sm8250.h for venus to function
properly. Rather than adding the missing indexes when used we add them
separately here to keep checkpatch.pl happy.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 include/dt-bindings/clock/qcom,videocc-sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
index 2b2b3867af25..8d321ac3b1fa 100644
--- a/include/dt-bindings/clock/qcom,videocc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
@@ -16,6 +16,8 @@
 #define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	6
 #define VIDEO_CC_PLL0			7
 #define VIDEO_CC_PLL1			8
+#define VIDEO_CC_MVS0_DIV_CLK_SRC	9
+#define VIDEO_CC_MVS0_CLK		10
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_CVP_INTERFACE_BCR	0
-- 
2.29.2

