Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E91C04AAF
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 06:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCB4020863
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 06:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWBEaPbO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEUGPx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 02:15:53 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33222 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbfEUGPx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 02:15:53 -0400
Received: by mail-pl1-f194.google.com with SMTP id y3so7930176plp.0
        for <linux-clk@vger.kernel.org>; Mon, 20 May 2019 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4R0Z1avkl5DcwArAEdYF5RKsOqx23+ElfNwQfhlhU8U=;
        b=rWBEaPbOv0Ze4QP+zKqhgDJLjfQzgBZRlveZ5KKv6jzAPxoKfCAc9mSKLdMx/9jL3v
         nFmY67X/QCW8SlSFYYtgtr2TOtMrAz6nEGWK5x5dVRjLFh50dq7JDUw3s7bj6SzJ/E8I
         Himrhy2bu8WjqyccmLGj1r/JBcUBmkSVcN5j03XkSzrLQHubwWAiU/iwEml7Aezz4Rfq
         iZrUP6ztMtgo70T0vL607ynlVJImepQp5080ijDfWbjzF7kV/qvfOP6gDITJnzPftl63
         g1SpLgLn40kDNPNGJq5iNOEPcyabqIhbNJdrg+RJCt1/gxr4Zr+zuxsJQoz/T8vnXL2R
         LJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4R0Z1avkl5DcwArAEdYF5RKsOqx23+ElfNwQfhlhU8U=;
        b=pcxkNfWR+4m3eV4EneH+TAfAAJsBu7hPQeSvPl93HKkXlkfC2FVWqx7cY1OIpipQk9
         2l8YCmod6bZo9YdcUBYHpDB1oemKPxoSDCKsFerWfmPAd3at0+ke9mBZKWPVfF244xwM
         bm0WWNjm7m1yBnIOtgM2oKHfimNeBcQOiF+5QagvyCW3W1W+4HSGmBBYP+bU5HFQNwA8
         TA4PClDGBaut7pLP5wHv1Ugq3xxxFP79g8GQR6rkGKDnQs50YuV8elcGZKpedr8dfO/1
         /X8RDZCcCkJGsPdR/2O7hQ0WdH/KuhPsaEIKyr9JGujWuz0PwovsU96vZF/HwJRn1Sr6
         +KaA==
X-Gm-Message-State: APjAAAVKjv2lYpindGxC+4ZZYj91DJQBd4MUyIuSADdrrQrz1nq8ALFQ
        BjS+jeIDjxKtfDxNOGbf+8vp6w==
X-Google-Smtp-Source: APXvYqwBHHtyco4N8WF7epFmyuDSFE9c1OUeIL1j1jNgX30UzSph1JCCf5VP/WOjybTewBj76jSwkA==
X-Received: by 2002:a17:902:1cb:: with SMTP id b69mr54576811plb.158.1558419352754;
        Mon, 20 May 2019 23:15:52 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k9sm23064259pfa.180.2019.05.20.23.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 23:15:52 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/2] clk: sprd: Add check for return value of sprd_clk_regmap_init()
Date:   Tue, 21 May 2019 14:09:52 +0800
Message-Id: <20190521060952.2949-3-zhang.chunyan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521060952.2949-1-zhang.chunyan@linaro.org>
References: <20190521060952.2949-1-zhang.chunyan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

sprd_clk_regmap_init() doesn't always return success, adding check
for its return value should make the code more strong.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 drivers/clk/sprd/sc9860-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/sc9860-clk.c b/drivers/clk/sprd/sc9860-clk.c
index 9980ab55271b..1ed45b4f2fe8 100644
--- a/drivers/clk/sprd/sc9860-clk.c
+++ b/drivers/clk/sprd/sc9860-clk.c
@@ -2031,7 +2031,9 @@ static int sc9860_clk_probe(struct platform_device *pdev)
 	}
 
 	desc = match->data;
-	sprd_clk_regmap_init(pdev, desc);
+	ret = sprd_clk_regmap_init(pdev, desc);
+	if (ret)
+		return ret;
 
 	return sprd_clk_probe(&pdev->dev, desc->hw_clks);
 }
-- 
2.17.1

