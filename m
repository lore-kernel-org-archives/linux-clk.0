Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703C9C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D290217D4
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 10:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z3sf5GKx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbfDKKLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 06:11:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34566 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfDKKLg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 06:11:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id r186so1580274wmf.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nTwodp6z8HTVF3WLduDXBgplOr8t5kebWwxmrLzwFs=;
        b=z3sf5GKxcaXjnnizIA8gkhgYfaEjmadznrVU6yriIYGj9vKDIvxBfRDISAdDWel9UR
         qVtBW0cpy4BG3DfGx9qikqp9dSIFSI+heizZtRDDSqu4HTPpNf4EoITrZ+v3+5c9ze0w
         LG9N7tPb4AwDkR3XhJvkVrnEPIqBos+26hRrWdnawFvuyGJEICIE9WhfnS76+PgWZbpd
         xUz6Fq+SVLCSv3n6+Be4pUhzLcNLvj3/IQew5q4npYmicR9NJ2edYsollQ8aql0IRWuO
         KnydIFKqYkEeGRwO0pNmLz2cDaseFvGhqNnxsBAKF3S9sUV+kVSQmrzCQ/VnPUJTr8jR
         DQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nTwodp6z8HTVF3WLduDXBgplOr8t5kebWwxmrLzwFs=;
        b=WvNfmm2NF2tdj/5eHz1alYrOyZhAW+EqaTWBhUPdgdw/dLiiaLxXwdy95ztVMj4iPb
         1aA4IQPHEdVJW8lMh+nfxUWnUxcF5K8uLt/686vW8yLyTR32op7XN7k1WL2M/uxSbi8E
         ObNyLnWLgey8kVyL+xGb9JmxJIlZOQmrooMDAO+xzWi0fcgllwxEOmo9sRijbL2N3nlI
         6lNNdjg1bM2PfD7NB2ZCa6Q942Yq5ceOuyyMOWcD/2wr6PShUK7AzUJwT9Y9mncLHxJ3
         GXUHfBJUoZa2Lt02QLVvlM6ljQNcvxsgI161OpQy5HX2yZCBkWpkjYgi5A5IOnK2XkKb
         7w0A==
X-Gm-Message-State: APjAAAUF7/BC6bVPFUMDPiMgMWE2JzXLGHfVHzPuw7HoJ0lqrwr+6KuC
        LGWkeZME/aU6Q9GTbxFsIhNIrJov6exPqA==
X-Google-Smtp-Source: APXvYqyLMFOpEuSIXecxCV0uIkRP+oFuuDh/FySPAORzv449J10e6f4VKHxdTwh3tRyy+HlaSJgwdg==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr6188846wma.71.1554977494850;
        Thu, 11 Apr 2019 03:11:34 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c20sm70235347wre.28.2019.04.11.03.11.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 03:11:34 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     stable@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH stable 5.0] Revert "clk: meson: clean-up clock registration"
Date:   Thu, 11 Apr 2019 12:11:32 +0200
Message-Id: <20190411101132.5513-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.

This patch was not initially a fix and is dependent on other
changes which are not fixes eithers.

With this change, multiple Amlogic based boards fails to boot,
as reported by kernelci.

Cc: stable@vger.kernel.org # 5.0.7
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 258c8d259ea1..f965845917e3 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,20 +65,15 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap */
-	for (clkid = 0; clkid < data->num_clks; clkid++)
+	/*
+	 * Populate regmap and register all clks
+	 */
+	for (clkid = 0; clkid < data->num_clks; clkid++) {
 		data->clks[clkid]->map = regmap;
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
-		if (!data->hw_data->hws[clkid])
-			continue;
-
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.21.0

