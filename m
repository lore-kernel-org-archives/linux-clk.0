Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A25CC4360F
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B71E218A5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JFlOjZCu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbfC2Pdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:33:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40443 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729629AbfC2Pdg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 11:33:36 -0400
Received: by mail-wr1-f65.google.com with SMTP id h4so3106873wre.7
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPit8v+Q7DtocOZEXU4jiFZqiXXyIE54mF68t3axNAg=;
        b=JFlOjZCuBF4USFLbmGUtrAoPYawoUOO5wzWamoY/Tyuudb+4Gu2K4bS484QHyG0il3
         GOq9ccl7t08dBEtKgSNnmy554RdlGvJs9vcKT20n7kZq2+WSD4fjeic11WWGQudS2z+9
         L5jhk/mBV3ZShqtJnnDPv+b8OcPLQ0G9GXNXSffdzMc+AWP3KjrQkJlnFormY9M74haX
         ijyHZ5Pab+pbsIfSSR7/1q0WElWoAPw4ob70hS2m3xPFQkSZb8bIkbgrUXPnicKQE0ss
         gmT/YLwB7QlBtEe9HfXfZF1mv7UUt+4FjMoYv7KcugC+hW6TEZ/VDjtU/WSlEdnPIm1E
         8FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPit8v+Q7DtocOZEXU4jiFZqiXXyIE54mF68t3axNAg=;
        b=Zi9La9byDfpVFFQKFe0g8GD7JUidZ9yEudkOmqFujNAFqxbNc/iIv8YBeK2qD7lap2
         CfZzoU8luTPeQCuywpPubcgnt84kexRaQWC135T/XScwOO2XoAT19PCfp2qIB0GTk7G1
         EQ+dnM/yBKUcHL3SDvz4gcT0hjiTWCEk5zXxu4bPkwgUvnrRNXAgl+mtumDmmzfsJJuU
         ZpvGis4oigswVeAjSg6cOwAzSOWGXV54cjj3Ru8t2WSlSVIWpLwcI8gL7dUZOmxTwV6+
         QEx/aXmXovj/hKL1K8eMOqkO+we2mDYRTkLpMUakf+/B6KUXjFUX/ItCQO1GwsBEgcOP
         nYrA==
X-Gm-Message-State: APjAAAUktrY3CQRK0kfHj6BhuLv/44iqCG41p7Qwj7zVNgpKvW7qeYxZ
        0TvwRn0Qj36TnoEkHCEj+LxqZg==
X-Google-Smtp-Source: APXvYqwGgnk+y67GmSfAmgzYWFvp/+mQnKnCZOHwrdAllmxhqeMRmGvfJSQ3hwjYPPM9OpM+pidCzA==
X-Received: by 2002:adf:db10:: with SMTP id s16mr23886951wri.181.1553873614583;
        Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
Date:   Fri, 29 Mar 2019 16:33:23 +0100
Message-Id: <20190329153325.23869-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329153325.23869-1-jbrunet@baylibre.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The bit 'SSEN' available on some MPLL DSS outputs is not related to the
fractional part of the divider but to the function called
'Spread Spectrum'.

This function might be used to solve EM issues by adding a jitter on
clock signal. This widens the signal spectrum and weakens the peaks in it.

While spread spectrum might be useful for some application, it is
problematic for others, such as audio.

This patch introduce a new flag to the MPLL driver to enable (or not) the
spread spectrum function.

Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 9 ++++++---
 drivers/clk/meson/clk-mpll.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 64d31c8ba3d0..2d39a8bc367c 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -141,9 +141,12 @@ static void mpll_init(struct clk_hw *hw)
 	/* Enable the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm_en, 1);
 
-	/* Set additional fractional part enable if required */
-	if (MESON_PARM_APPLICABLE(&mpll->ssen))
-		meson_parm_write(clk->map, &mpll->ssen, 1);
+	/* Set spread spectrum if possible */
+	if (MESON_PARM_APPLICABLE(&mpll->ssen)) {
+		unsigned int ss =
+			mpll->flags & CLK_MESON_MPLL_SPREAD_SPECTRUM ? 1 : 0;
+		meson_parm_write(clk->map, &mpll->ssen, ss);
+	}
 
 	/* Set the magic misc bit if required */
 	if (MESON_PARM_APPLICABLE(&mpll->misc))
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index 2925fb939fdd..a991d568c43a 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -25,6 +25,7 @@ struct meson_clk_mpll_data {
 };
 
 #define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
+#define CLK_MESON_MPLL_SPREAD_SPECTRUM	BIT(1)
 
 extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
-- 
2.20.1

