Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DD6C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57A1B2183F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loX2vGZN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388762AbfDRLM1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39715 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbfDRLM0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id j9so2476841wrn.6;
        Thu, 18 Apr 2019 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CAbZ+B2Pzaew/uxTUQeDlxYznykRwsRk9BK/GJ+9CDQ=;
        b=loX2vGZN6vibeeQ7n9V6YuPhstSvX3tKKZX4RjVFaMo2Ku/65hfoQztilLTk2lDNbI
         WuDyCKuUyzze2ZvjiLZU2taa644c+JZFQIxKrHSjPiyfPWCk8NiBzr+1F2D1AVSxzeEl
         IthDHbKNj6KZT2dByQh088trw15H8k5Ese5F4nO2B2gWj+mjX+sL+rLBdQoGRdV19yRm
         RhEKYC0a3ieHR5ORIhCD9uBs+hDUJs/ta4J0Yjt8xZsbZCtzZln8D7S7nsoJ4rtRJevT
         BbL6hnhZTXSU+batyvtaUspx0TtKhShkwRl4bQl5lYdIy5ylElunRHFLor1foeeIyF+U
         zHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CAbZ+B2Pzaew/uxTUQeDlxYznykRwsRk9BK/GJ+9CDQ=;
        b=KxvhEFUxXzy4sdaavEKCwOkUx2X8a0wYLtSCpaZY2QiuSFri8a+ZonllQam1Oz5N8j
         JgT/W8rc0Hg8uRu0bi0nMPF+3GZeQEpG8lFCNyu/cSWibj1xv14VOYk/4MP6Lb119zuz
         sIpN5/QhdfP7G7ws4/g35z/QWg1OlS/9JdMOjdiDd72UgN9vZ9ksrzHgQdQ+7Egeejeb
         VgtRnv2eFjt55X5f5oogngADEcfjyolTApS5o5GGjG0VY7RKoW8GAJbxDhmbgXa1HmfA
         Jv1oTVvP0qxdkACE7aOr4lof5spvi4Xzv2Fqh3NEutaSjrE5uKuH/+CqqqKwthkDFVLg
         v6Xg==
X-Gm-Message-State: APjAAAVCkwubLWCpKBK1Oxbx6aXW3J3v94OCQvRw8wwPKlI1QtwvCqAZ
        XfH8nv5Q/1WBMh0jfWZqZjpRDy8uSzQ=
X-Google-Smtp-Source: APXvYqzsBnyWaFRQQofw/q/jVVAit0cci7zyLWs75NRW7NfZ6sxZCdX620fTKMUfrtw+uuDHkkxuAQ==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr60641120wrn.193.1555585944841;
        Thu, 18 Apr 2019 04:12:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:24 -0700 (PDT)
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
Subject: [PATCH RFT V3 7/8] clk: core: remove powerpc special handling
Date:   Thu, 18 Apr 2019 13:12:10 +0200
Message-Id: <20190418111211.10474-8-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the powerpc clocks are properly marked as big endian, we can
remove the special handling for PowerPC.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * no actual changes
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

