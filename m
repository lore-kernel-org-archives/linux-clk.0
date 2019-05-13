Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C8BC04AB4
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63AC02146F
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FTChcYwy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbfEMMbd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 08:31:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54454 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729871AbfEMMbc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:31:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id i3so7860470wml.4
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qDWoUB9bcp7o6UKFktF9ACZ04OzawQuwNyVSxDs2oGM=;
        b=FTChcYwy/64XxJA+Qdoi5SQTOLGXNUXjv+nlh1tRXwcJ5wHIr4YXrKpPSAYujuyCzp
         nijO6vpU+0BTOBu0M8rH69Fy/BcRNzMsb9+QsY4mgYef5o5Py4Er/BU6A4UPldUHIUwm
         3N1VBhSmqFk12ex6lkH7nZ7A1wkbMpbp1wKpzXPxwEDHpUroEI1zCpg1SeMKQmrJ7goz
         QVgAUjDQTPtot79cCw6omTqisZOw9lWoYiGfS0N3V6ax1/grApmnole0AFlAcoL9OJMk
         k1xLXdk/GNS3KbD325KPkAfuHONMfgCR0ZXh4mu7cIH8/tJI20Q5P7EPet0TDqsWy1Jv
         Dx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qDWoUB9bcp7o6UKFktF9ACZ04OzawQuwNyVSxDs2oGM=;
        b=Q6wW6ZYkd5yJq62ZMtteVIjI8CibMSDgn5q2gb1cIgWYmjSxVLPWjGkuDP8rwajgTP
         FeS3k5NN9gc4f90HxTqOzUDhRW/O6I4Hb7dGA+wJuD1FGF+VWq3diHvnNnJR8stCQHQK
         sPpbV19AeC8flcQjBe2DBxlHDqgjBKOFlnJ0P2djj4+1pcaV8ycVYcnHqcg01UuIhB4m
         qm2BObq9vnFyuXdCz4A7w7LoHSyTg0+7PUn+qePixctWuZB9fp/X9mIuiDp8yIQ+ktA0
         vQhyOQFDUiPDhd+hXr5kUzeYj3Xvbc7l1tPrkcEbTQg4ihcYLx+rY78xlAkVUu6zPizJ
         cxKg==
X-Gm-Message-State: APjAAAUesfblOZz6L/r2KauL2PT4QypWMQJI/f6tHv5YDgm99fHKWYmz
        o1m79xujjhO92DoTogIGZV66YA==
X-Google-Smtp-Source: APXvYqzS/G2YjzdOEaicaTu5qFCKLfkduSgGOTIkrGT+2VPcKPiv3XEJKguO/PiftHRHyxFE9Kutnw==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr16339134wmb.76.1557750690506;
        Mon, 13 May 2019 05:31:30 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:31:30 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] clk: meson: g12a: add controller register init
Date:   Mon, 13 May 2019 14:31:15 +0200
Message-Id: <20190513123115.18145-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MPLL common register initial setting

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ef1d2e4c8fd2..d5aceb79a91a 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2992,10 +2992,16 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vdec_hevcf,
 };
 
+static const struct reg_sequence g12a_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL0,	.def = 0x00000543 },
+};
+
 static const struct meson_eeclkc_data g12a_clkc_data = {
 	.regmap_clks = g12a_clk_regmaps,
 	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
-	.hw_onecell_data = &g12a_hw_onecell_data
+	.hw_onecell_data = &g12a_hw_onecell_data,
+	.init_regs = g12a_init_regs,
+	.init_count = ARRAY_SIZE(g12a_init_regs),
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.20.1

