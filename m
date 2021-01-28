Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703B7C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 03:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B23F64DD0
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 03:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhA1DNq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jan 2021 22:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhA1DNo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2021 22:13:44 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507B9C061573
        for <linux-clk@vger.kernel.org>; Wed, 27 Jan 2021 19:13:04 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id a12so4032810qkh.10
        for <linux-clk@vger.kernel.org>; Wed, 27 Jan 2021 19:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GvfmY9+J8BI8q8lqjcjJ20lNCU5Fi9/O4DGa/DjnZh4=;
        b=JTvjWJIc+6uWx0gOKhrii63qL78UAYA3Z6oZ21lY37kZNrLEQPU5xe8cTsmlssR3sH
         U8vSX7dREDrUP+C8AoLKlZxq39QHLj9nWXd02LMXLQ4dqbezyVlMPpODKW1WAu+rneQa
         NNbvt3e2MIFhXXFyoTLD1fKwBPGdHtDCw2rE7Ef9PRhEds46u1dnVFwwsKtZuBjEEJSX
         qsqdF0Qohgg2E+pBOTPDdWyu7coDcujuvtlo+A10lVXv2iqezJjEYCEOAgqVSCBfRy9O
         ufyBRVvTDOz8VyP0/uH+b3ll8c0alk/WOkOjv4ruhOeTuMKmtgbinFXAy4tHvCoQlmhd
         XQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GvfmY9+J8BI8q8lqjcjJ20lNCU5Fi9/O4DGa/DjnZh4=;
        b=al/a+5Zbqwk5tBenJr4KZHtKj4KNB0UgfcnJ4wp2LNRrDpI8M64nr36jAcV4VSvIaV
         +7+loRC1drGkK7daZb4WEVNww9m2RquwqBoEoA0U4M6OOpNzTUxt8LbPkYqwc+sKhR9w
         pvRafget9P3ZS/cwmKuTJtEqqvDH5J4ddjNm71OUhBaXOnw5C92dzjcCYiCzvjD7gAKz
         AF9EYiyXM6VMQQ98UjDz625Gavl+hxoD3wBEBu0HHCkA/9bOgFsmSHmjq3hB4614ZVDU
         9k/SlETOJRdUYdwHD9QFjxnaqFLReIUAsvudGUD6+2BPfIEGHxX3wVxj3jDtYBdKVfT8
         nwUg==
X-Gm-Message-State: AOAM53375s+XmabaWntKj50jKZNn5VJuuQllP19cotFcmQo9Eb4dr2hL
        AFxaYRhGJRGyh9EB/ExlIq8=
X-Google-Smtp-Source: ABdhPJzn9FNPNfuAyKhIxTkxc210RDW/bJctCi2A5jKIyFSeAGaSCIDkogwAY41/pnia/swR6DKNkA==
X-Received: by 2002:a37:2c42:: with SMTP id s63mr13982951qkh.87.1611803583521;
        Wed, 27 Jan 2021 19:13:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:919:c52:e75f:e3d0:6528])
        by smtp.gmail.com with ESMTPSA id x49sm2697624qth.95.2021.01.27.19.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 19:13:02 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     sboyd@kernel.org, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: imx: imx31: Remove the unused uart_clks[]
Date:   Thu, 28 Jan 2021 00:12:48 -0300
Message-Id: <20210128031248.27244-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since commit 30c1951790df ("clk: imx: imx31: Remove mx31_clocks_init()")
uart_clks[] is no longer used, so remove it to avoid the following
build warning:

drivers/clk/imx/clk-imx31.c:54:28: warning: unused variable 'uart_clks' [-Wunused-const-variable]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx31.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 7b13fb57d842..c44e18c6f63f 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -51,16 +51,6 @@ enum mx31_clks {
 static struct clk *clk[clk_max];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[ipg],
-	&clk[uart1_gate],
-	&clk[uart2_gate],
-	&clk[uart3_gate],
-	&clk[uart4_gate],
-	&clk[uart5_gate],
-	NULL
-};
-
 static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 {
 	clk[dummy] = imx_clk_fixed("dummy", 0);
-- 
2.25.1

