Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35823C3DA7D
	for <linux-clk@archiver.kernel.org>; Sat, 31 Dec 2022 10:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiLaKQL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Dec 2022 05:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiLaKQK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Dec 2022 05:16:10 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363F725E0
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:16:08 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id u9so56422925ejo.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOc++n2L0f0xB181spyzmZCpRYCJrprxU4ITd13vOYU=;
        b=eK8cwF/Xo1bv3PINIPzPRg9rOaKL88IMXEDXE6nk0CKD0VUUA0aB6vktI5TIRYhPb6
         BYHECPGN6fN2Laz0qqvbvIJdXVNCS0eyW+oBdE8mv90gHdwfFvWDnTwDJTBQMpKgwsL/
         HjNk0MCxTtdwkv1VVIli82hhrVn4wFnvp1rww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOc++n2L0f0xB181spyzmZCpRYCJrprxU4ITd13vOYU=;
        b=MGdbksT9WCtFFw/zB7aw0X6Z/F0xss3rKzPXBZsD2bloH4XlTc+BapZYQJwyiKZRUG
         gvdo16pL6S2sK2cJJMYrOo82iAkq9GyHdacRLUhWjQtfm6mK8cwFMzdfJvKbB58x85Ig
         QmF8LJYve0ZJvNK8bahugZnOeOf7b1o+rizPMvpjJyyV+MJvs9zv/thCzzXVUnXCiGsm
         YyfRfY4BVDJsDoadEBtYT5EooZoXIDPBZEAeZjUxJ4aIF9arYtX5qiB7bd3oT++A/ybW
         8jhSyAQHDYFUhw6c9gMLdUPKVf/PqDw2fCadWgkbdIrAa7FMiGRDI2KMGDL0Z3MhexPg
         ZnSg==
X-Gm-Message-State: AFqh2krqJfBp2iJZ5oIVjtC01Mm+tu7p1AUj+jepywCe4HwCdI6u+zr4
        HhrWGNtllS0jRdo6nP9Pe0BUHg==
X-Google-Smtp-Source: AMrXdXt+rZ6gnV4CsTejkX2xI4LZavUJfHDnt96jyqSLs3EjK9MPG3XSXalASVqnwIXPrhW0IyAtYw==
X-Received: by 2002:a17:906:6b18:b0:7d3:8159:f35d with SMTP id q24-20020a1709066b1800b007d38159f35dmr28301367ejr.9.1672481766757;
        Sat, 31 Dec 2022 02:16:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906354800b007ad2da5668csm10560240eja.112.2022.12.31.02.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 02:16:06 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: visconti: remove unused visconti_pll_provider::regmap
Date:   Sat, 31 Dec 2022 11:16:01 +0100
Message-Id: <20221231101601.4540-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Field regmap of struct visconti_pll_provider is never used. Remove it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/visconti/pll.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.h b/drivers/clk/visconti/pll.h
index 16dae35ab370..01d07f1bf01b 100644
--- a/drivers/clk/visconti/pll.h
+++ b/drivers/clk/visconti/pll.h
@@ -15,7 +15,6 @@
 
 struct visconti_pll_provider {
 	void __iomem *reg_base;
-	struct regmap *regmap;
 	struct clk_hw_onecell_data clk_data;
 	struct device_node *node;
 };
-- 
2.32.0

