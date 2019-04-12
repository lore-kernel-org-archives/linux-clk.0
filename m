Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C909C10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D31FE21872
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I32dt88p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfDLKCo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:02:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38462 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfDLKCZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 06:02:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id k11so11169271wro.5
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9Zs17V+7Q5Y7LncnLItMZNJBDJdxDInYfDwePk9CLOc=;
        b=I32dt88pUCKmVfIQ4jJMEa9xBqnSBOBOeNqfWUDRJa/j6GZUkxFyZvD3pBnYWuTMzX
         nubpzsMSx/QKv9dakvSn4GqzLt8lamlpxDKvxLm/Me/4mZme7+u49mai3Imm+201EvhI
         y7tJ1Cg0A8k3+JZ2LCpYOBWyw5YbS0pue17Bc+JP2LJtIs2VcIRcIHEhHBTvDygJVM6d
         w0Vo5bKZ1qtCVGYK9L1hoVbQzn+8L/V2klZ/3XjsrkLwR3B1TtwXO2/syt5uRD+BRqFX
         WPDqB1Y8gTo+fwW0Fc3BLruvJXuDuhcRjkoKrNGhRLVSEV0l6tvEDDnzIqCd8IfPJkjC
         PnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9Zs17V+7Q5Y7LncnLItMZNJBDJdxDInYfDwePk9CLOc=;
        b=rqObM7/0/wahgC+lGqOL71vkqfqOHc0YWi1frzC+f+DVdzcVzo4wOAPgIUOOkVFM4C
         pOBIkYnzuoBnh2I+PLLZuUn6uH1X7m/fFrwoG30R2MBsLuW5Uh4OpexyP0XrOVANv7EW
         G9ifauBV2Dqcay5y5Cg0n99+27UoYQIXcivHKrdSZ70nl1cpBXKbQwZWm9r8f6yYS2rt
         r8Oap3/B8TxUd1XvtIZv6yh0k/6hL3AubTJ0vuA2krQpcXq/JYewg/zHo8om7iWdOFJf
         1Qnu1YGZGfrX8UpFEsksV1i+GDZkILU+imyMB5KnsCQpndxrjXHyy1akdA1cjHzJ7AMx
         WTaA==
X-Gm-Message-State: APjAAAXeBjz/WdVv3RaNcf08TKsku8fYXWf9AwooSuMUGUDvk08/r23g
        ZYknYFsW0hQ2PQSlAs7PMHNS7w==
X-Google-Smtp-Source: APXvYqyg3+xxim/zUet/g4yD/5T6+z7+B+1j6pkHJ3bnUx1OXbz9NTSoaPB+PYUcyQjlE8SJpG4YCQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr35745079wrj.134.1555063344334;
        Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t14sm5961031wmi.16.2019.04.12.03.02.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 03:02:23 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
Date:   Fri, 12 Apr 2019 12:02:20 +0200
Message-Id: <20190412100221.26740-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 82c9e0c020b2..cfda463091b7 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -136,5 +136,6 @@
 #define CLKID_VDEC_1				204
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
+#define CLKID_TS				212
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1

