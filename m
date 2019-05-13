Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C4AC04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81111208C2
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wd86UOuD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbfEMMpm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 08:45:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46911 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbfEMMpm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:45:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id r7so14476121wrr.13
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S2pz0rN5YxgIZ9+xKpj04TZfJLwVeh5ljwZlweZ4hEU=;
        b=Wd86UOuDbF0LRCUA0cQW2+b/NtT84O02/WElU5v/n9SOjE7s3v5qeLFeA6JBNikdwO
         oVlq4JKQjsGC0mwAYDc5cx1C8ZGfJw4yCxWkuF92n95LjcSPnAiD5ftTx1dgnCKl4ZhO
         90EmirHh3vBH3gF23ScGRur/G9mC5IZ6Nx+iq5tuHlfMa8D66pYsYIKr2oIR1JXywamf
         AZXGEB960rbq+9+aozNWZ+Ob7yVb5WszjUWteEiX1r3LWOtd61vnB8vDTspL0eGoN8zG
         mHbF+suSjWN92YWGB8d6F6MP3zhD3HfE//bGQ0FFED8F6tW0B+w1X0PF62uwO+HrChtj
         vyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S2pz0rN5YxgIZ9+xKpj04TZfJLwVeh5ljwZlweZ4hEU=;
        b=iuwJM5Q/CHRmzNCerTV6bimaQhkWwG49QWmpMCBSB3jgRjVfBKwJq197AdJc4hKs+z
         rCgUZeL2bUc7OJcw+dJJUewO5hQ+yPMmNtpCmItf3D4YaqNSY1p+4hk0hizhGPuCkQAC
         LSrnNFsQ35AjjWyHNjZixsMyaJSQkE2BdbkSsmnOXzT1zcsgQBHJs5lR3Tepwdec5vf5
         CJ2vgFXjWo3WRSMn2TkBAew5Alw9W3/XEmlNBxwpXKZzKf4EWGgZbYHd5WAHK7+dB/B0
         sMUGmzeuSct5ndYyWuhav1buUgjYr/ggNdEWxOpzhCn09feBetbuyKd7ht3lsew4z/yJ
         8ayw==
X-Gm-Message-State: APjAAAV80Bv+XL9k8jyBCvLLbLxbI7yQ00q0c+1ubCPJyec4lC6QhRoZ
        DKdE2lk13we91TxsbX9CVOxobw==
X-Google-Smtp-Source: APXvYqzdX4sus63iRBi+SDvq625L49jIdL3h6QcF7yHl4UQ6kOi8/umoeVTXOejZ1WjKuIabxQdcYw==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr18189595wrq.158.1557751540348;
        Mon, 13 May 2019 05:45:40 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id m13sm11576677wrs.87.2019.05.13.05.45.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:45:39 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson: g12a: fix gp0 and hifi ranges
Date:   Mon, 13 May 2019 14:45:31 +0200
Message-Id: <20190513124531.20334-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried.

Even with 60, it sometimes takes a long time for the PLL to eventually
lock. The documentation says that the minimum rate of these PLLs DCO
should be 3GHz, a factor of 125. Let's use that to be on the safe side.

With factor range changed, the PLL seems to lock quickly (enough) so far.
It is still unclear if the range was the only reason for the delay.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 206fafd299ea..d11606d5ddbd 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -463,7 +463,7 @@ static struct clk_regmap g12a_cpu_clk_trace = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 125,
 	.max = 255,
 };
 
-- 
2.20.1

