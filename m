Return-Path: <SRS0=BUIm=QD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054ADC282C0
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jan 2019 05:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB41721473
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jan 2019 05:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="Xr+jZuhX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbfA0FUV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jan 2019 00:20:21 -0500
Received: from mx2.ucr.edu ([138.23.62.3]:15406 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbfA0FUV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jan 2019 00:20:21 -0500
X-Greylist: delayed 589 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Jan 2019 00:20:20 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1548566420; x=1580102420;
  h=from:to:cc:subject:date:message-id;
  bh=/KqbmcKVen34Q5JOyYcFb+/FPRQaSMEFS+uDTyuJnZM=;
  b=Xr+jZuhXYWLPWjI6vjpe4BZiIujbwcfsoUFDiYl5JqSfMFJpJaW8ZK0X
   fNPp9OhxDInWlw2PO7WRPhSKKsDH3/5f0zTOc6BniEILm5sbpMl/wGzb7
   6gArGxGoCwp3C/ZmSnZyItdcRptQoHERkplD3kE/lz+bpdZ5SiLC1SwmC
   iWPSXuaDVPIiID0q/BdSJS9LaqJSk1mPSZEqzmmNWLoav3kc19W1xWxMj
   4smtwoeHeekPNRnl1U4ePqSIozXXvEdfDCsZs/cF2buRTpSmIMD5Qllbf
   53c5324kwb287QmMq8e2jXsMTOp6vecopxYrJWjmqsnpO826gkcQMkYp7
   w==;
IronPort-PHdr: =?us-ascii?q?9a23=3AZdFwTx0x30kHBuAEsmDT+DRfVm0co7zxezQtwd8Z?=
 =?us-ascii?q?se0RLPad9pjvdHbS+e9qxAeQG9mDu7Qc06L/iOPJYSQ4+5GPsXQPItRndiQuro?=
 =?us-ascii?q?EopTEmG9OPEkbhLfTnPGQQFcVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZv?=
 =?us-ascii?q?JuTyB4Xek9m72/q99pHPYAhEniaxba9vJxiqsAvdsdUbj5F/Iagr0BvJpXVIe+?=
 =?us-ascii?q?VSxWx2IF+Yggjx6MSt8pN96ipco/0u+dJOXqX8ZKQ4UKdXDC86PGAv5c3krgfM?=
 =?us-ascii?q?QA2S7XYBSGoWkx5IAw/Y7BHmW5r6ryX3uvZh1CScIMb7Vq4/Vyi84Kh3SR/okC?=
 =?us-ascii?q?YHOCA/8GHLkcx7kaZXrAu8qxBj34LYZYeYNP9/fqPGZtMaRGxBXslMXCJfG423?=
 =?us-ascii?q?coUPD+sfMuZcsob2ul8CoBWiCQWpAu7k1z1GiWLs3aAi0+ovDxzI0gIjEdwJq3?=
 =?us-ascii?q?nYsMn5Ob0OXe2v0KXE0TPOZO5W1zfn74jIdwgsrvONXbNxccrR1E4vHB7Cg1SQ?=
 =?us-ascii?q?qI3lPyma1uURv2SH4edtTv+vhHI9qw1rvDeg29osh5DPi4kIyV7E7T10zJgpKd?=
 =?us-ascii?q?C8UkJ2Yt6pHIFOuy2HOIZ6WN4uTmVqtSoi17ELuJq2cDIUxJkpxxPTceKLfomS?=
 =?us-ascii?q?7h/hW+ucJypzimh/d7KlnRmy9FCtyuj7VsapzllHtjFFktzQtnAV0BzT99SHRu?=
 =?us-ascii?q?N9/ki/3TaP0Bje6uReLkA1karXMoYhwrotmpYKv0TPAyv7lUfsgK+ZcUUk/eeo?=
 =?us-ascii?q?6+D5bbn8upCcMIp0hhn/MqQohMO/Hfw1PhYSU2Wf4+ix173u8VfnTLlXgfA6iL?=
 =?us-ascii?q?TVvZTYKMgDo662GQ5V0oIt6xalCDem1cwVnHkGLVJFYh2HjpTlN03ALf3jEPew?=
 =?us-ascii?q?n06snC11yP/bI73tGo/NIWTbkLf9YbZ97FZRyA4yzdBZ+pJVBagNL+73Wk/yr9?=
 =?us-ascii?q?HYEBA5PBKuw+r9C9VyyJkeWWSRDa+dKq/StkWI5u18a8eWY4pAiTfvK+Uir6r/?=
 =?us-ascii?q?n38wmAdFJoG01oFRZXylSKc1a36FaGbh149SWVwBuRAzGam10FA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BkAgAAPU1cgMXWVdFjHAEBAQQBAQcEA?=
 =?us-ascii?q?QGBZYQGD4x6ixRPAQEBBoIxiExthVeCcocFAQoBASyEQIMMIkoBAwEBAgEDARM?=
 =?us-ascii?q?BAQkNCQgnMYI6KYJfNlKBFQEFATVbgkcBgXQNnU88jBcziFABB4FLCQEIh26EQ?=
 =?us-ascii?q?YEPgQeBEYJdiFOCQwKBLAEBAY9tkSoBBgIBgWOBQo59JIMxhnOIBwEtmngCBAI?=
 =?us-ascii?q?EBQIFDyGDM00lgWwKgUSCUY4sHjOBB4tXAQ?=
X-IPAS-Result: =?us-ascii?q?A2BkAgAAPU1cgMXWVdFjHAEBAQQBAQcEAQGBZYQGD4x6ixR?=
 =?us-ascii?q?PAQEBBoIxiExthVeCcocFAQoBASyEQIMMIkoBAwEBAgEDARMBAQkNCQgnMYI6K?=
 =?us-ascii?q?YJfNlKBFQEFATVbgkcBgXQNnU88jBcziFABB4FLCQEIh26EQYEPgQeBEYJdiFO?=
 =?us-ascii?q?CQwKBLAEBAY9tkSoBBgIBgWOBQo59JIMxhnOIBwEtmngCBAIEBQIFDyGDM00lg?=
 =?us-ascii?q?WwKgUSCUY4sHjOBB4tXAQ?=
X-IronPort-AV: E=Sophos;i="5.56,528,1539673200"; 
   d="scan'208";a="1054231839"
Received: from mail-pl1-f197.google.com ([209.85.214.197])
  by smtp2.ucr.edu with ESMTP/TLS/AES128-GCM-SHA256; 26 Jan 2019 21:10:27 -0800
Received: by mail-pl1-f197.google.com with SMTP id 4so9420949plc.5
        for <linux-clk@vger.kernel.org>; Sat, 26 Jan 2019 21:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wauu6KYLbGTtY8Ta9/ThAgOWsZRHbAT3Gm7KGlRzDSw=;
        b=bZrKx6KXmyD2pu2aeHUZKkLI2PhRMzQABGdvNYkjYx5ugx6Un4KHZzvfEUAf/hjFml
         mPpC701YBH/kLZQcovH882Co612NlMpNN7mTMhoco/yuF1HaWkaq6Qaqh1GbVa7wkmOw
         iaF+9St330dexDE0xLjI5dauDAzfCJ9CnxwTafrXCKn6+bV3bSlbiO2nA76Xu/53jBeR
         X5IYng3ksI4yZoVYxHg6YS8oC7SnfkAwU8Iiy112S7Q0UnSAXJ3zxlbbm+xIXICyQwq2
         0bSslw5lgOSNtKz1Hgt3o+20f4uU6Py+WiOv6VRD2C2/wyHoIOPA/k+K1LjP7AzDSguj
         S42g==
X-Gm-Message-State: AJcUukcf+kXmyiPWY3muU7yfx842fwUSMdng/PKxGTEXnpHkHNNaXY2R
        KpNMNvEQIOo3GcW8Fs3igVd/WWtWhdBWL0mpOUPNjOU0dBnolrQcqJIHyXbgZEH/I1i7IGHbJXu
        od8Vyc5+s64Ok5E1gss/sow==
X-Received: by 2002:a17:902:850c:: with SMTP id bj12mr16882480plb.46.1548565826703;
        Sat, 26 Jan 2019 21:10:26 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4dKbvNFSx1d1HieEDycemd1AM2ehrWLXL7OBvnQT5AFZzdgEXdUSA5frObuY4mdQzStbaWcA==
X-Received: by 2002:a17:902:850c:: with SMTP id bj12mr16882459plb.46.1548565826315;
        Sat, 26 Jan 2019 21:10:26 -0800 (PST)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id y5sm50574978pge.49.2019.01.26.21.10.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Jan 2019 21:10:25 -0800 (PST)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: gemini: Variable "val" in function gemini_clk_probe() could be uninitialized
Date:   Sat, 26 Jan 2019 21:10:12 -0800
Message-Id: <20190127051012.5928-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In function gemini_clk_probe(), local variable "val" could
be uninitialized if function regmap_read() returns -EINVAL.
However, it will be used as index in the later context, which
could potentially be unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/clk/clk-gemini.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index 5e66e6c0205e..07e1b551d1d9 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -314,7 +314,10 @@ static int gemini_clk_probe(struct platform_device *pdev)
 	gemini_clk_data->hws[GEMINI_CLK_RTC] = hw;
 
 	/* CPU clock derived as a fixed ratio from the AHB clock */
-	regmap_read(map, GEMINI_GLOBAL_STATUS, &val);
+	ret = regmap_read(map, GEMINI_GLOBAL_STATUS, &val);
+	if (ret)
+		return ret;
+
 	val >>= CPU_AHB_RATIO_SHIFT;
 	val &= CPU_AHB_RATIO_MASK;
 	hw = clk_hw_register_fixed_factor(NULL, "cpu", "ahb", 0,
@@ -323,7 +326,10 @@ static int gemini_clk_probe(struct platform_device *pdev)
 	gemini_clk_data->hws[GEMINI_CLK_CPU] = hw;
 
 	/* Security clock is 1:1 or 0.75 of APB */
-	regmap_read(map, GEMINI_GLOBAL_CLOCK_CONTROL, &val);
+	ret = regmap_read(map, GEMINI_GLOBAL_CLOCK_CONTROL, &val);
+	if (ret)
+		return ret;
+
 	if (val & SECURITY_CLK_SEL) {
 		mult = 1;
 		div = 1;
-- 
2.17.1

