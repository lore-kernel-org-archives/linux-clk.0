Return-Path: <SRS0=UbEh=ZN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275ABC432C0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Nov 2019 10:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC137205C9
	for <linux-clk@archiver.kernel.org>; Thu, 21 Nov 2019 10:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnUrxl18"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfKUKHp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Nov 2019 05:07:45 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38723 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfKUKHp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Nov 2019 05:07:45 -0500
Received: by mail-lf1-f66.google.com with SMTP id q28so2133859lfa.5
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2019 02:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cDsTRS6zAE7mRYoicKkPTdOWwjEcLdzSV0njcc4xwSA=;
        b=wnUrxl18bkklegb9/2wwReT5GAqSYiEQSglVeA8/lpyKtLjS7rC7ngj5TrNOB5q1W4
         aCx7w0MFygG2A5DNkWSByxubjG/1OCQ4RPZ2RENqU6MV8DdYJy9uRT1cuNd+pbL5MIwO
         v/1Dt5i0a8FakDUvioV32OmKeatNT8pcArcSf2HpPu+hln+L4V08e2EhmgX8bfUAcvT/
         BNOLtKUHE+W4JgXDsibdkGNDBd69SC5XnDmEZmb2d/eHRaKm1oKecYrB8hMpZFqpMO4x
         SXWRbWVokydjJ+lJmVSfBvWGCSyRo9Y/Lo0tjlRCaUyqZeDm68IkjR/bFutyp2xUfPKi
         t43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cDsTRS6zAE7mRYoicKkPTdOWwjEcLdzSV0njcc4xwSA=;
        b=oyXoeP5Yvh4H4F6gkYZX26FOMye2Hym8NXOc4TJ6ik553VR4NCDRLD5fdDLtqQM7dQ
         ErH/+Rx/EBDVyQmfnquVDsSp5Yzn/IqPNtQOQ4MMTCovmM/bvj8ketSUjAIwV4HRye9o
         CqaW8u/lAhlYDmNUsdmkRxoWmf7eSaHywUE9l55Hw1ovB82UKghpVa4SGWjyIIOqVE2B
         PJ4fEmG3+7XaSrta6z6uEXGfxMKsLDJTyxFNyhHcAtD+iwoTvmmooDSpqsSgq0gUaJ5L
         2n1ip1DV9t/4LUd8lX5QivokuyCwNL7+PWpqmDpqHCg192MX4VWMnu5ItzWUUGMPMqUO
         hmPw==
X-Gm-Message-State: APjAAAVwjs5fVhgsqWWWMNvPs6wviRaDmqh9m5QhBlmYPR3FXLm6uklb
        WOT/ssTDLkXuoeHYmXHJ28IP6K2wzeg=
X-Google-Smtp-Source: APXvYqwGonSHXjt019NHquqzPPpPWCd8HKL9m23a4F74Gtz/dhyWAlovk7ir10u/uaufk0pwjhcrJg==
X-Received: by 2002:ac2:46c9:: with SMTP id p9mr6287822lfo.166.1574330863403;
        Thu, 21 Nov 2019 02:07:43 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id y6sm959204ljn.40.2019.11.21.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:07:42 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] MAINTAINERS: Update section for Ux500 clock drivers
Date:   Thu, 21 Nov 2019 11:07:26 +0100
Message-Id: <20191121100726.17725-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's no longer any need host a tree solely to serve changes for the
Ux500 clock driver, thus drop this from the corresponding section and use
the common clk tree instead.

Moreover, let's also add the generic linux-clk mailing list and rename the
section header.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b51c83..753a84cfd753 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2490,10 +2490,10 @@ F:	drivers/reset/reset-uniphier.c
 F:	drivers/tty/serial/8250/8250_uniphier.c
 N:	uniphier
 
-ARM/Ux500 CLOCK FRAMEWORK SUPPORT
+Ux500 CLOCK DRIVERS
 M:	Ulf Hansson <ulf.hansson@linaro.org>
+L:	linux-clk@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-T:	git git://git.linaro.org/people/ulfh/clk.git
 S:	Maintained
 F:	drivers/clk/ux500/
 
-- 
2.17.1

