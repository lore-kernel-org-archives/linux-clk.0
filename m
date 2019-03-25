Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E58C10F03
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4518320863
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ql/x+8w0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730657AbfCYLMY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 07:12:24 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42727 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbfCYLMO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 07:12:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id g3so6120378wrx.9
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lAGWjMAs38DEOf/pdjEPeHnYiewe/7N+ZGB7ijz15Bo=;
        b=ql/x+8w0gvnjiOmBFCOu+1IvlNLQrImu2eLZMJAVSkLr+jZwuMb9B181TuREU+XAE7
         AxWFjEkwgWAtQz8ra2n8+XBQUjum6z8lqsIkhKPmHwi1T/6VtQWZs2Ou5gB/WiPlXqp7
         WjqxS3r7Km2Rg0CeuCwrSSsRtMJt80f4kssIE4in9qlkvCWBH/FRXYlGIAorh1uOZbhD
         jvNLGG3NEJv+asBYQrBn5AAvwc1ohR449SBgeSO3FuNCmubw0+2ajLv45dF9/0NqaHAu
         8orkzxE6+8FxHDbRqYLun476oiFoNcwtEJoP5VVRQ1duMwJSLqFiaRbNV6lka/ptUdjk
         WJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAGWjMAs38DEOf/pdjEPeHnYiewe/7N+ZGB7ijz15Bo=;
        b=lb0jsOvJgQKLhLngGzgykqeA8+1FwOYkeyaWK7U1PlpejzUo76UhG+bgY4PZsQZxbS
         MbjLZ/K/HpUiffD/JrNRSFzi75QrZsHZJII479LXbvke7QN6JAheUlGirB41ql8PLLH0
         CQzL8KFSvjE5aGm2m6e1kac5lGIm7ERHbMPnf0AxkFd1gDOlNe/uhio4AVCt1Idzx8lL
         rD49IuFITfmtTsCCkYdPzbQNobZBN5U864WHLAdzk/RliTYZJaWGVwm2ANGd//diiH1y
         XnxUFVoCs1Hj+uVDs0iSZm/8Eoqpf78Pc0B4n42l2wR6Z+67TFnZwfPeUj31GeOXuBwI
         yJ7w==
X-Gm-Message-State: APjAAAWaua1B08xi1hr33i3kwkduJJESeBhY4LCBDGsNdMi3zhCkUfWB
        AASlG7WBDFAeCPyR3WCtFCUiFg==
X-Google-Smtp-Source: APXvYqw/+i+ZkuaKLPTf9yiwTZxD3nYX18DOHDoDAnF8ffCGsjZFKs7JKpqeEN6Fg3pqiwin2yIPwQ==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr14687126wru.33.1553512333489;
        Mon, 25 Mar 2019 04:12:13 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id n188sm15134301wme.13.2019.03.25.04.12.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 04:12:12 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] clk: meson: g12a: add controller register init
Date:   Mon, 25 Mar 2019 12:12:00 +0100
Message-Id: <20190325111200.15940-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
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
index 6a01f8fd8114..493db74270ac 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2361,10 +2361,16 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_mpll_50m,
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

