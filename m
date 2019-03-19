Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3BCC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97EF820828
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iuHjRqUi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfCSKZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:25:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35134 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfCSKZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:25:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id f8so1186745wmh.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TS6Bp01RXQyr4esHMRNtGtX76C+MJvKbjF1w90UiXHM=;
        b=iuHjRqUi4txOrBxs9g8C8PUywbvPNoE8UQ47omFdSQ3W7vudOSbzMcPRmsVByL4RjJ
         iYsw8pvBFU7OIw3QH9RWUUhm0ZakQtNPH3+9Ig8Di+ZKuDOY4S0Mq6fzV2Ch+ZmTBXDC
         EiiP2kvg1K1ecqh/0EPFp9lUh8xK21rLdIPmtVJ1kQc5X+qjYHoYkq07AUlZIulrW6ir
         8EgL+AIMg50gc249O1Tj3nRe7wIM+olm2zIuyzbxiMcyGP3E+F/XqmXD1IuqMkVzI/8B
         DSKGc6qmzp0VKX5gyNOg793JESy0jftS0gcI91HmldBhkrHTnNt56CH4Y332aUvVZT/d
         PaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TS6Bp01RXQyr4esHMRNtGtX76C+MJvKbjF1w90UiXHM=;
        b=W4H0eDjPgZpEdaMy8Il+3XV/7IJ43AfHqRGmtBuy8Mz1toPejVz9zxE0FbTR0LKsSe
         qbW9xdu4fMJLaguUk1CeEioeMjaAo8qLJfog4n/OWoqRULrRi6aXBIGEyxibtBslOr7Q
         NG3HjxenkmxQs5QkObmx3/a0ZyY/rDWOO9W8AWBSg7fy3Ax6mma+FtIM/HtpdHKJ2/dN
         0L9e3Gp7Fq6Wh3ikC7Vne+EZNTyeQwzPu5Y9ZkrCVVbtEzYfJlHtY9oNNL5qJ7pNx+dr
         HPm7XOzSc9CDZORZ3e0jV0QpM8BNuCYQ6GyvhG3d0pizoFPQ9B+LNbb/TxZn3MGMUeW7
         Zt2Q==
X-Gm-Message-State: APjAAAVeyZEPhtNMflMtqpj6QRR29ovxsHl2N7QmmEOHx1yIaCiB0ylH
        nfcoeCvNTcFvvg60a7l3sNO3+ifaBRM=
X-Google-Smtp-Source: APXvYqz1Ou7IK8JpmlA48b08hJAT3bnakQ3M/055FDx2qPgjUDECsFAioyPfjYnc/wXOIdqVllaIUw==
X-Received: by 2002:a1c:1a53:: with SMTP id a80mr2928569wma.15.1552991151213;
        Tue, 19 Mar 2019 03:25:51 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id v6sm2640680wme.24.2019.03.19.03.25.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 03:25:50 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-gxbb: round the vdec dividers to closest
Date:   Tue, 19 Mar 2019 11:25:37 +0100
Message-Id: <20190319102537.2043-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We want the video decoder clocks to always round to closest. While the
muxes are already using CLK_MUX_ROUND_CLOSEST, the corresponding
CLK_DIVIDER_ROUND_CLOSEST was forgotten for the dividers.

Fix this by adding the flag to the two vdec dividers.

Fixes: a565242eb9fc ("clk: meson: gxbb: add the video decoder clocks")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 04df2e208ed6..29ffb4fde714 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2216,6 +2216,7 @@ static struct clk_regmap gxbb_vdec_1_div = {
 		.offset = HHI_VDEC_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_div",
@@ -2261,6 +2262,7 @@ static struct clk_regmap gxbb_vdec_hevc_div = {
 		.offset = HHI_VDEC2_CLK_CNTL,
 		.shift = 16,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_div",
-- 
2.21.0

