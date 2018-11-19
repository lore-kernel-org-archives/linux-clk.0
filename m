Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D28C43610
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 653102086A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jW7rKHwt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="mHyfvIu7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653102086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732148AbeKTKNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 05:13:22 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55138 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbeKTKNW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 05:13:22 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8C7D260F39; Mon, 19 Nov 2018 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671234;
        bh=wdqBCYihQ6Q6FwhJQZHjTJyK6hJPxkoDalFBTcPQ5TQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jW7rKHwtb1sqR10Cw/xAkgVDfewC6UCjA3iGSI7yNFBrLatyU8KU72kdUY5Eygq+X
         Jpa/FhkzCv3wc50SSh/T/3jhr7Z3XnpyG9AaeAD6soU2J1injMjN3jE9WV9dV0Fw83
         Iz6eF3z+fD3ZU/oSY741rTS1IZFSGukXXbXfDJ1Y=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C46D160BDE;
        Mon, 19 Nov 2018 23:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671233;
        bh=wdqBCYihQ6Q6FwhJQZHjTJyK6hJPxkoDalFBTcPQ5TQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mHyfvIu7WTxtJ9ATU2ZX7dHhuhVNwgBMjJx699zJ0SjWdkBxDzP2UGXNANigaZvA7
         fPKvV25lftpWWWDB8JptapAVgP0Q2hPBTSMFO623/0xFTD8xnLOMk+orwcrrOkfCTE
         FVYjZFPtdTzFv02+EkChNpObVM4aZnNtS4W3GYm8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C46D160BDE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] clk: qcom: gdsc: Don't override existing gdsc pd functions
Date:   Mon, 19 Nov 2018 16:47:04 -0700
Message-Id: <20181119234706.5821-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181119234706.5821-1-jcrouse@codeaurora.org>
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In very extreme cases an individual gdsc may wish to override the
power domain enable or disable callback functions for their own
purposes. Only set the generic gdsc callback if the function pointers
are not already set.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index b6adca1f3918..7b55368b9a9c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -394,8 +394,10 @@ static int gdsc_init(struct gdsc *sc)
 	else
 		gdsc_clear_mem_on(sc);
 
-	sc->pd.power_off = gdsc_disable;
-	sc->pd.power_on = gdsc_enable;
+	if (!sc->pd.power_off)
+		sc->pd.power_off = gdsc_disable;
+	if (!sc->pd.power_on)
+		sc->pd.power_on = gdsc_enable;
 	pm_genpd_init(&sc->pd, NULL, !on);
 
 	return 0;
-- 
2.18.0

