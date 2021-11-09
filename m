Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCD6C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E40761130
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhKINAb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 08:00:31 -0500
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:37598
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235536AbhKINAb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 08:00:31 -0500
Received: from localhost.localdomain (unknown [123.112.64.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 425163F211;
        Tue,  9 Nov 2021 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636462664;
        bh=FmNxNtNeGkL/ZE29OArENxmoY+56pDg4rnC2SAaP1hE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Pf1llJkIXPHunysJMvXL9wtEP9XIQfgOvnDVZs7fB71U91+Ypo53e1zm97MH6qn5o
         Nu3ZyOFTUzN2+UizQx82HUsASYK9Ux1oI0MvMH0A8UOH6yWeWVE/Jo1BPOi5Cz+72A
         ZDojXmFfzJ1jtuqSvpTXnibH/SS+/sspmgRsUvjI5rK37eZOXZU+yeBjM617CuqniR
         Y/NqeUiuxxmKFoqDKEtVkdl+84s6xq9a3OffCd2XwGsVIoYkKJRA2LMMBYfg2e/iCg
         x710LBx6QjMQJFz7DTztgKrmCNM9F24G79KfRNcsOufEAevONUfIpYz6+xJ+BpB6IT
         7VXpLKl+dVCsQ==
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-clk@vger.kernel.org, linux-imx@nxp.com, abel.vesa@nxp.com
Cc:     shawnguo@kernel.org, Anson.Huang@nxp.com, ping.bai@nxp.com,
        hui.wang@canonical.com
Subject: [PATCH 1/2] clk: imx8mp: Remove IPG_AUDIO_ROOT from imx8mp-clock.h
Date:   Tue,  9 Nov 2021 20:56:56 +0800
Message-Id: <20211109125657.63485-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the commit b24e288d5063 ("clk: imx: Remove the audio ipg clock
from imx8mp") removes the non-existing IPG_AUDIO_ROOT from the
clk-imx8mp.c, and this definition is not used by anywhere, let us
removed it in the imx8mp-clock.h as well.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/dt-bindings/clock/imx8mp-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 43927a1b9e94..235c7a00d379 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -117,7 +117,6 @@
 #define IMX8MP_CLK_AUDIO_AHB			108
 #define IMX8MP_CLK_MIPI_DSI_ESC_RX		109
 #define IMX8MP_CLK_IPG_ROOT			110
-#define IMX8MP_CLK_IPG_AUDIO_ROOT		111
 #define IMX8MP_CLK_DRAM_ALT			112
 #define IMX8MP_CLK_DRAM_APB			113
 #define IMX8MP_CLK_VPU_G1			114
-- 
2.25.1

