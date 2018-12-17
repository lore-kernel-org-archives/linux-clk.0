Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1161EC43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1C9E20675
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="QetYrpog"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732254AbeLQJrD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 04:47:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53070 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732239AbeLQJrC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 04:47:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id m1so11646204wml.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Dec 2018 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7zUfQ5k1UaGNLQZWqXUVxUrsnDmZIr72/O/z7L/p8XE=;
        b=QetYrpogRHsbPuvIb1lnhOHGRCb5X9owoV/AIv0hvqBsfvxhCRXjPEGrdGgYn5v1Mc
         HDpWdDIMxrVXmwqNDPiKsFQTZ2a3O7LCK+kRPiAVQeN0rDu653kusvLwkrVNLaTx+X0T
         qCry9q5eEfUmIK4pOEKIOKe3nD8pUN+sIxWUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7zUfQ5k1UaGNLQZWqXUVxUrsnDmZIr72/O/z7L/p8XE=;
        b=LNAFq+HhaItuAgR1NfAve338asrxk2Y34Zv7//3KgA6WGoIIgPdKxyqhE+X2wmAnaV
         sRf0g/G/YvKlU9em6YHqIc7RWcrh71rFvqF+VCzN1MeLDjccN25s3gCreSJMw7gYFV0R
         coTCQAaKimiMx+khxIVWljK6588LFvqooxJfQNn9imeDQElDotWviZvNy4SZp07hlGcq
         BkGCJL4+RsHY2xHtqQTMiZI0xrxCmikjqAGv5VAX/YNC3A+xsIZY6xuDz3Bs2DaflHdf
         OBsPvT3gmgTWWRWnq7Zv6itqjqS1Ioj+OCMocePg2ayz7ESSqX0qyAcJShPjpvSyH58J
         bPRw==
X-Gm-Message-State: AA+aEWaw0VFcFJmeUZ+b02irj7Sbio6ocCASO5sVDrZ/ZZ2pLt77ob5Q
        rCk8VKXJm0HQOwrK92ecqjzYiA==
X-Google-Smtp-Source: AFSGD/W7AfI98CnyZ0p8vcdpfYDXkTB7x6OrV/CwFqF8fuIpp5WZTRDIcwA7oulJja30ZZ/F4hIh8w==
X-Received: by 2002:a1c:2884:: with SMTP id o126mr11386163wmo.17.1545040020936;
        Mon, 17 Dec 2018 01:47:00 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id h12sm28878113wma.48.2018.12.17.01.46.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 01:47:00 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 13/13] arm64: defconfig: Enable HFPLL
Date:   Mon, 17 Dec 2018 10:46:30 +0100
Message-Id: <1545039990-19984-14-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The high frequency pll is required on compatible Qualcomm SoCs to
support the CPU frequency scaling feature.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c2b1f6..da390aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -615,6 +615,7 @@ CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SDM_GCC_845=y
+CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.7.4

