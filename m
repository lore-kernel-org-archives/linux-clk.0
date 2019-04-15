Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FFCC10F12
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96D7920684
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 10:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+yvan/Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfDOKLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:11:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40452 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfDOKLG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Apr 2019 06:11:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id z24so19740855wmi.5;
        Mon, 15 Apr 2019 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Sj0AUTH1hVgf3wNwVxaR3FGot08SzGps4WY/S0Hmy/E=;
        b=V+yvan/Zm0HTn2scxhSs9EmCYDAt39Twv0oMrtdz/oOUUBDuKQbPtb7FemAjsHjS2P
         X996fb5pDqSUxCSQBxW9CrzN40m9/dOEcY9U/QK7kXH4B6Kx9XzVTgzRZpxf47T65hhu
         U0rM11acTkeBNEgr+u6oyjLo0+JZvaeVQ5RZLgbFQqBOiwT1CnIHU8ZB3CeLy6JrKLsC
         2pFMc6xo8d0tuRJYiGdMdbTsqpxZ30/XnGaf6c/P8UdejTFa+z0Brhum8FiKNp1760J5
         6KvCdxnSdyK5A/d5XeNa1WS5uRNZfFjkWJAsLpy7qcc4BXt4rxAzOVM2R6+fR4LjeARj
         wTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Sj0AUTH1hVgf3wNwVxaR3FGot08SzGps4WY/S0Hmy/E=;
        b=h67fph6xQEo60VbLLn2EmRl6vWkiYHzgxgteKpWfIR/IfH4VLlTc8M2WPlmGg64rUv
         +m5Xn+ouKkFh3FT0s4zbDEAoMIIFtIMUyhZMZEBW9DvztOlozB5WeoxtDI/3GnmtGPAN
         SailCGO1h8wNgem3kSX53CtJ3GqPYi75fAiA9/6wgdySJ8jcmUkF8SdgDKdvXcp4jKnL
         yeaD0eqlHSFPihf8WKUXpSNQtUWBFPsBQKjkqzSu5iomVBTVOF+rLvKVNky8QCLhyCvY
         7lu9/eT+EHYyledUobQfDcsWX6fpGLwBKBHn9gR4ziVszgD955T8M7R8mMmnZvJBY0Eh
         UeMQ==
X-Gm-Message-State: APjAAAUzLrOlUo6SipxqGgpG5g3L3rkve4d14uPgEIMGtIkrMPCu4KYe
        nM//Q3roRZTN0c6bVlw5Ywgg1AzRXRI=
X-Google-Smtp-Source: APXvYqw2zXF9I3SOjK4eDyXT/3JKr8GdVdxfKwB3FDSG/F11qD5sT964dRm277f+oBYa2U14U3zytw==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr22219969wme.62.1555323064237;
        Mon, 15 Apr 2019 03:11:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm11592214wrp.9.2019.04.15.03.11.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 03:11:03 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH RFT V2 7/8] clk: core: remove powerpc special handling
Date:   Mon, 15 Apr 2019 12:10:45 +0200
Message-Id: <20190415101046.5872-8-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the powerpc clocks are properly marked as big endian, we can
remove the special handling for PowerPC.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * no actual changes

 include/linux/clk-provider.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index f82cda41e1a8..479e616ce7f5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1001,20 +1001,6 @@ static inline int of_clk_detect_critical(struct device_node *np, int index,
  * for improved portability across platforms
  */
 
-#if IS_ENABLED(CONFIG_PPC)
-
-static inline u32 clk_readl(u32 __iomem *reg)
-{
-	return ioread32be(reg);
-}
-
-static inline void clk_writel(u32 val, u32 __iomem *reg)
-{
-	iowrite32be(val, reg);
-}
-
-#else	/* platform dependent I/O accessors */
-
 static inline u32 clk_readl(u32 __iomem *reg)
 {
 	return readl(reg);
@@ -1025,8 +1011,6 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 	writel(val, reg);
 }
 
-#endif	/* platform dependent I/O accessors */
-
 void clk_gate_restore_context(struct clk_hw *hw);
 
 #endif /* CONFIG_COMMON_CLK */
-- 
2.13.2

