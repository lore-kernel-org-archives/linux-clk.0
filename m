Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFAAC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 08:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBE502075C
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 08:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ROfsAq4E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfCSI0p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 04:26:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42120 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfCSI0p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 04:26:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so15863394wrr.9
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLzEElnP3dxyv8R6IH/C8LDRIdXF93RnCixM1ah2hMo=;
        b=ROfsAq4EycQSAWNhwT+bJP3yHo6sajvh/DOVf1X6KgoGiI9FciHoxYEc8Df3XiPt8S
         isAXnU6PNkc8HO1CnCg006HJ5iUkDYpup3J6p/mAUbDjenokGDTiv4VhxEVQAAIebk6Q
         aE1Fr4xSzuTBWBe795UPFcLrsV/bxyiRI8SwxxwIsJVZR7WLEbKjRlWpwNAnXOrjAb9f
         6+B3YAOwIAD12R5cg3Y239tijtDUv6iCa24wFPXsXOL/Cb7GDoNLB6QZYOEEyTrrcrpp
         iQ2MILTCPTjt6pxLId9hVTDaxKKizya9OtgAPFr0qMI0Egw+jwvLaPF/wipx58PnrCp/
         y3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLzEElnP3dxyv8R6IH/C8LDRIdXF93RnCixM1ah2hMo=;
        b=s1BC+It3G6zUvIKq0DNEhjcMc9nwzAYHg+FNJx9G4nNyuWW6EWXH8sujLr3/1ggzw9
         exbr6TDfo+B3KQQOBoOjh5Ry5h/HQvFJqFEKUkaJ3r9TeKxDWzvgQHo227w/u6hk8k9l
         QURS1Ybf4v/9i/xC+cr4d9Rchei9NRqF+jjkYwDl8NgQUXqVEsoWcYku2iJV1CmlCPmQ
         Okgq+X//0/E4X2Y8FLblGLbdK9jVezz7eqNaiYVcS3lH0dkhiDYo4OD1RajjbdJ9+8HS
         p2NrBPDp1Q3POrxXsMcWC+nLjl/npoXMLWY6SNDCBhS5ipIH5hZqDdtBhwjXJucrRB3Z
         MWqw==
X-Gm-Message-State: APjAAAVEVqOImoc7qZHFk6I7c/b3s+dxpo+0JtjoprTPazsLMzirSAYH
        gft5m7xG3hWlOPEnhvdQ2Mh0NQ==
X-Google-Smtp-Source: APXvYqy21IQIltfVclIGabKt/9gSbK6VRtrToMVt+v8yERTtliPMgJyxHa9zJTAcoNBGOm7UuHmRHA==
X-Received: by 2002:a05:6000:104b:: with SMTP id c11mr16704504wrx.9.1552984003549;
        Tue, 19 Mar 2019 01:26:43 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id 12sm3267104wme.25.2019.03.19.01.26.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 01:26:42 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: fix VPU clock muxes mask
Date:   Tue, 19 Mar 2019 09:26:11 +0100
Message-Id: <20190319082611.6215-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are 8 parents, use 0x7

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index cfb91df884cb..e52b0b53f398 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1391,7 +1391,7 @@ static const char * const g12a_vpu_parent_names[] = {
 static struct clk_regmap g12a_vpu_0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
-		.mask = 0x3,
+		.mask = 0x7,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1435,7 +1435,7 @@ static struct clk_regmap g12a_vpu_0 = {
 static struct clk_regmap g12a_vpu_1_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
-		.mask = 0x3,
+		.mask = 0x7,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.21.0

