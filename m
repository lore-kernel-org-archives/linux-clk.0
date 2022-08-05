Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D2C00140
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 07:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240287AbiHEHt6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 03:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240250AbiHEHt5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 03:49:57 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC381018
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 00:49:54 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w10so2026692plq.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0h60Pr0GHO67tyGTXkVyvVhWgn0K99BvyzPjUeZGI0g=;
        b=wNx5d5B6fC7hgZ0JrG0Jj0+ASpM5IcMkIsIXVRss4ZS2st2cc1T8ohiD/3NszzfoxE
         8SScxkUvJ1QOInqNejvOgVwdav8rDckYqwESZ5GFf5YeAvLohlc47ZUTu8fZmcHCeNpo
         50GlnspXKqwZcpEkwZXSxDd1+sEZYYM/r/Ahkej5PHCk7o1/WyFQFgC3+gUDurRScWRZ
         Cg5a0m6kSH/nXrISuLMAJegLTWKjHJN33WRIi+LM/56XaidRWObFVRXtEBxTf5lAWPse
         bcb4JKmnjRZgWjJ98se3MEJ/1u8fej/yuco1sPNxR/PvQyHlfuFq3Yhx0rOsRq/Gwdkt
         1mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0h60Pr0GHO67tyGTXkVyvVhWgn0K99BvyzPjUeZGI0g=;
        b=lfxz3I6FMfyNeAEITyU9HbwBLkTICtQOeGjz1sEE0/C6igR1BzW1YKJknXQX5HtTab
         S5qaGlewp3J1ivH/ljF6CxdClz1B3Oxw8yLvr0QdDOgvrd2qDpfRhLeSsU6fmhpnKmq0
         YjWV6nG0PApi6n0aANBnCmg9LSjDbG/iEeaD/nKRNp45k3hrJv9kdkev1sRbdQClz4pB
         UWO7+8F5M8hwWhZP7G4cRxJ7SK+jTXW/kSjBjLrGevv3ZOYb7sdboDy0vTinNFAg7v1J
         oAD6CNUkGRwtZMxmjnlXTwsebHHdJuzPXrdqcFejPIFgcJP+xR+HUTes1ljmuhW7J/Ya
         g8Lg==
X-Gm-Message-State: ACgBeo3BUoHEt6G37dO5p5B0TJoXa8Ts7yyhvVkrRI1rghYFLgZgDZkm
        ubTbKbhuTZxGtBwanRePqlS4Zw==
X-Google-Smtp-Source: AA6agR6a3m/LZS0oVrZ4twvRV4bG+4/dadmQY1mQdWqPr7D3Syx1PIzAjqofz5Ti+2Ki1HnAi8GDoQ==
X-Received: by 2002:a17:903:1111:b0:16a:acf4:e951 with SMTP id n17-20020a170903111100b0016aacf4e951mr5556317plh.72.1659685794118;
        Fri, 05 Aug 2022 00:49:54 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:49:53 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/4] soc: qcom: rpmpd: Add corner power-domains states
Date:   Fri,  5 Aug 2022 15:49:33 +0800
Message-Id: <20220805074935.1158098-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805074935.1158098-1-jun.nie@linaro.org>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some SoCs use corner instead of level in rpm regulator, such as
MSM8916 and MSM8939. Add these power-domains states value so that
devices can vote them.

Note that there is a shift with 1 when converting the value from
regulator usage in Qualcomm Linux 3.18 to power domain usage here.
Because corner is not well hacked in regulator framework in 3.18.
For example, RPM_REGULATOR_CORNER_RETENTION is 2 in 3.18 while
RPM_SMD_CORNER_RETENTION is 1.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 6cce5b7aa940..f778dbbf083d 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -297,4 +297,12 @@
 #define RPM_SMD_LEVEL_TURBO_HIGH      448
 #define RPM_SMD_LEVEL_BINNING         512
 
+/* RPM SMD Power Domain performance levels in regulator corner method */
+#define RPM_SMD_CORNER_RETENTION	1
+#define RPM_SMD_CORNER_SVS_KRAIT	2
+#define RPM_SMD_CORNER_SVS_SOC		3
+#define RPM_SMD_CORNER_NORMAL		4
+#define RPM_SMD_CORNER_TURBO		5
+#define RPM_SMD_CORNER_SUPER_TURBO	6
+
 #endif
-- 
2.25.1

