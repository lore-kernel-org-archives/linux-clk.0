Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987D0C04E87
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 06:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D97520863
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 06:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwGzEp38"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfEUGPu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 02:15:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40303 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfEUGPt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 02:15:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id d30so8017131pgm.7
        for <linux-clk@vger.kernel.org>; Mon, 20 May 2019 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7zIoh9PTrB07jZj7iAACd9ksENTR45V1gQMx0juES3c=;
        b=SwGzEp384/HvkIrTU8NYuqCksWK+ZeUMUQuZiITmijbwFe7qqqKdN4VhfTLQeSOeyL
         bW9hlEc85ItEntQa+5uXTpXbI/BnrgelNJnjl1Arx+Hqy6/FRJFiWGhV3T9x+eGYCzB2
         d/DXkLuGjXOgJPa8f2oQ+SkVaB60cEycHgyWojYLccCBhPa+F1pfeq1TrBXcZZ1ezQZW
         7IYZzNbDzCShsNQYoKfqIbawvrvhW1bpeipWOHlQ+xtaiOwuWFm4+OFVgKfZ37Z7i6Nb
         y0JEXkduPLgCT1pj5RIkDjAVBGjSo5N+mXKjFxk7PJ15G0tft56fMjMmj4C9wkgbByMG
         cQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7zIoh9PTrB07jZj7iAACd9ksENTR45V1gQMx0juES3c=;
        b=SqMti/tc+NvgTFKkCyYxKofr8MtydSH/JmLCovlEDJZRe3w63Gj4YAkPudCa+zuhMm
         +uw+bosH9cw84OAzqwvfpSsZvgaz10+4BqOW9XWkU1jMmhZDIAU1Uh9XisUUZZZzU1xA
         g74m17DtIAXt1QGfGLRz5jPMVEC6nNsHhdcdELZBGKHoT0W59TwqXVMcO9FiNmHfgV0J
         TAz9Wc4KdRA2J4YZfKl/xLmwX5DCvGS/aKuNrC7Y4ltnGE/EX2lcLGR+vRTDIhsuq41M
         ARoMJjqVJ7BTdearL66gv/be5I3oshtwhatbXQLSPgD21QXk38Gknbl/ZubcYJPr+s8/
         is/Q==
X-Gm-Message-State: APjAAAUDZxFK//2ll+tOmTmj0ADrB7G6ygqgN507ZIpu0r36prq9YBPP
        aI+15Ea4MZfm/tjzYQtuD2V/OA==
X-Google-Smtp-Source: APXvYqxa0mLPXch4vjgP+lssTETSPwC4ZzEuv0fXXeIOOPMZ5RMwQDzBbs15Sr/D7bTeyHkMfjomsg==
X-Received: by 2002:a62:1a0f:: with SMTP id a15mr65093150pfa.111.1558419349191;
        Mon, 20 May 2019 23:15:49 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k9sm23064259pfa.180.2019.05.20.23.15.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 23:15:48 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/2] clk: sprd: Switch from of_iomap() to devm_ioremap_resource()
Date:   Tue, 21 May 2019 14:09:51 +0800
Message-Id: <20190521060952.2949-2-zhang.chunyan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521060952.2949-1-zhang.chunyan@linaro.org>
References: <20190521060952.2949-1-zhang.chunyan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_ioremap_resources() automatically requests resources and devm_ wrappers
do better error handling and unmapping of the I/O region when needed,
that would make drivers more clean and simple.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 drivers/clk/sprd/common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index e038b0447206..a5bdca1de5d0 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -42,6 +42,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
 	struct regmap *regmap;
+	struct resource *res;
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
 		regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
@@ -50,10 +51,14 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			return PTR_ERR(regmap);
 		}
 	} else {
-		base = of_iomap(node, 0);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
 		regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &sprdclk_regmap_config);
-		if (IS_ERR_OR_NULL(regmap)) {
+		if (IS_ERR(regmap)) {
 			pr_err("failed to init regmap\n");
 			return PTR_ERR(regmap);
 		}
-- 
2.17.1

