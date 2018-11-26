Return-Path: <SRS0=+J6A=OF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3F7C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 378DA20862
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ILPxnrMG";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="bTLtLwoB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378DA20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbeK0EPW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Nov 2018 23:15:22 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57298 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbeK0EPW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Nov 2018 23:15:22 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3ED6560AD8; Mon, 26 Nov 2018 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252837;
        bh=sNHrz636DwiLAa2C7ZPYCdzFQeRm1zRm3s/CeEwbKrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ILPxnrMGeYIxK8HLGUNUCWQtjMqaS4BJoyHNyCru3y0ThjOhyxz+E/g1ZdZImnsDp
         MSk1QO70bhlTNNQmcmrRAwgcgU2WPX1qQxn/nO7QXgkIV1VSLWeWKf1e1hPeqRc+v+
         ALxAZsYTgBOQCsJIc3nYv7sCSJl3cL6232unEVTw=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB82360722;
        Mon, 26 Nov 2018 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252836;
        bh=sNHrz636DwiLAa2C7ZPYCdzFQeRm1zRm3s/CeEwbKrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bTLtLwoBTwTqb1u2+It6vO0amAHrsp8223wDqffJHKm3r+JS3BY1ebIPkkw/eZ/eK
         Cpt5R2wU6kVE4s+GnxdQS6eARF6bwBleeZcikliB8kHq2m/lWx9ON+ygo3y56B7sFB
         btrY+QmHKhd99zCQZJZc4BFo5YRcPe2E3MqdxuHo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB82360722
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gdsc: Don't override existing gdsc pd functions
Date:   Mon, 26 Nov 2018 10:20:31 -0700
Message-Id: <20181126172032.11567-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181126172032.11567-1-jcrouse@codeaurora.org>
References: <20181126172032.11567-1-jcrouse@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In extreme cases an individual gdsc may wish to override the
power domain enable or disable callback functions for their own
purposes. Only set the generic gdsc callback if the function pointers
are not already set.

Acked-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a077133c7ce3..dd63aa36b092 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -350,8 +350,10 @@ static int gdsc_init(struct gdsc *sc)
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

