Return-Path: <SRS0=t43R=Z2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5403BC43603
	for <linux-clk@archiver.kernel.org>; Wed,  4 Dec 2019 20:04:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C7EA2073B
	for <linux-clk@archiver.kernel.org>; Wed,  4 Dec 2019 20:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b7NmR+qF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbfLDUER (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Dec 2019 15:04:17 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42755 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbfLDUER (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Dec 2019 15:04:17 -0500
Received: by mail-pj1-f67.google.com with SMTP id o11so243796pjp.9
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2019 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELTAmH9zkiQxFiFkiHdPx6vGU7gbG/ie/I1ns5+Qwf0=;
        b=b7NmR+qF+vnxWm4yIdm9VpajCEJKepEQB55cnHNpOMHIokAoPr34EBknlvq7Rx4SIX
         HzzkF1H2mla69oKJZOjib3KdC1hLFVpPt6/JB3wIyoX+7CcRy7GXBX2cIo7YYAbL4QIm
         SkECYLq/nhBcSmvVpJtYpE5Y67vz0aRAWHz14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELTAmH9zkiQxFiFkiHdPx6vGU7gbG/ie/I1ns5+Qwf0=;
        b=c3V8Z0el6WVVri0KUdx7snfF1eCpfBnSzeVu3T8N3ILrKWQd6a/zb0YZsE6xwbdI9D
         gR4Wsg7ebhoWhhXv47+Np9NwDehcmspipRQ/KjF5BcwWIdZSDqlue9NdpjIditCXPjcT
         4LU4uoZ4F/8yv5EOqJfx/98Zau/u3W3Dt8UP4/BPw6g7cYh1hJ7rPcg1gUJgyXyFedak
         jMSNlAzxxbXwoTy506xVXnx415MBTlDp6ST+/m4qw7EBWOGFIUlqjfIEVEqmKEf1kaQZ
         Mw9GxPM+mJLxvHKIJeGrSLTAcemsDBFmPR8HyQTJaGA+g37/eeCOPG3qDVlvn2vdj7OC
         GgNQ==
X-Gm-Message-State: APjAAAWPaqscaw7pR8jLtf8SP+lNxAIVjr8TuPz1Tjy++9/I+UDU7qo1
        FofAmAu0dTGnFCJ750cAZHncig==
X-Google-Smtp-Source: APXvYqyvlVyp3wP4RGPm+o/Ndrxy5XeKmjPozpw3mhNrwwRc7fTWujDUcpkjGLkMlZTIn4J60g5EhA==
X-Received: by 2002:a17:90a:366e:: with SMTP id s101mr5231134pjb.18.1575489857123;
        Wed, 04 Dec 2019 12:04:17 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z23sm8423636pgj.43.2019.12.04.12.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 12:04:16 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] clk: qcom: gcc-sc7180: Fix setting flag for votable GDSCs
Date:   Wed,  4 Dec 2019 12:04:12 -0800
Message-Id: <20191204120341.1.I9971817e83ee890d1096c43c5a6ce6ced53d5bd3@changeid>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC)
driver for SC7180") sets the VOTABLE flag in .pwrsts, but it needs
to be set in .flags, fix this.

Fixes: 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/clk/qcom/gcc-sc7180.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 38424e63bcae2..7f59fb8da0337 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2186,7 +2186,8 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
 	.pd = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON | VOTABLE,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
@@ -2194,7 +2195,8 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
 	.pd = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON | VOTABLE,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc *gcc_sc7180_gdscs[] = {
-- 
2.24.0.393.g34dc348eaf-goog

