Return-Path: <SRS0=Wk/U=7Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E591C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 11:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E5DA20678
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 11:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYzChbZB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgFCLTc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jun 2020 07:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFCLTc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 07:19:32 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370ACC08C5C0;
        Wed,  3 Jun 2020 04:19:32 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k8so1417375edq.4;
        Wed, 03 Jun 2020 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o2uPaD3DaBTvoN8perYfocS0bdlUAa3vTgRxhwGGkqM=;
        b=FYzChbZB9G6BAdFXTZ+H8XjWx2zlRrvSXVAkJaUPvll85klqAsUXUsKIhkL6KvACnT
         dcVW+7SCJYjzZPTC3KzMXo6yCNCY/a0Lme9rGX9kqPbeuxGVfZTbSY1alc6jXD3RhOcj
         /FuZ3sBksqOXmQu4MFErFyrFtcuJIzdD8I/qsod8Ow4iAZTqUb7cYD1CxNwE/6gz2KYn
         twIv3Zz7Vz1lepl+embPDOES/J1HU9MKNjwSCaJ6qLhXHQ2X5w1IHAIRXiXFiCp5bRKy
         rBvnECdmB6dmS+h0Nun96thKyXnp78SLYNzaiz2xc3M72vYYn5TSLWXEyaDThqlXD2t1
         J4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o2uPaD3DaBTvoN8perYfocS0bdlUAa3vTgRxhwGGkqM=;
        b=A8D+QXEjITGfy4BAZhzIwuVjClb++399CRkbQ4s8R0OylQVZ99g8zFZ6rRDqLgLoB6
         jwouTbMNvxJ/Im7Ddt3wdp9LNkw+WqRVz4ITQhgk6WF3HKwrpWz/NjfpY0G66G7XV7YD
         tkOZtFrlFpouiBRXqwDlXSOgnDc9iIB0uP7p7jlItP3cbsq+X+fK65CoOakndn/KXhmg
         QqwMWm9OYdHqYe+W9c9EX+/A0ErjMAuEWFtI6GXQIOeNauow6TiQf+x77EgaTyxSWmAL
         KWIe0HmCJo+US959QJCuXng31yUl2vTxXHHi3Zve+uMcsiGyzJ+pwF1jNyfAvKwX27Rv
         SyaQ==
X-Gm-Message-State: AOAM532yfhAIfeYIZDGyH1mAPp3s3b+1gGZz6YShf3K9PhEw5u71UXlw
        pc5kVFsry1tLPNvmhyYpShM=
X-Google-Smtp-Source: ABdhPJyVEBiDaPQyVyZa4WKjPWorbb54ELZAK2OOj1IRhIBg6Jy6/nbJ9yVY5Q9sNFrP5goeJmp4SQ==
X-Received: by 2002:a50:fd19:: with SMTP id i25mr29171063eds.248.1591183170962;
        Wed, 03 Jun 2020 04:19:30 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id s18sm1044789edi.45.2020.06.03.04.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:19:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Date:   Wed,  3 Jun 2020 13:19:23 +0200
Message-Id: <20200603111923.3545261-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200603111923.3545261-1-thierry.reding@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
added checks to avoid enabling PLLs that have already been enabled by
the bootloader. However, the PLL_E configuration inherited from the
bootloader isn't necessarily the one that is needed for the kernel.

This can cause SATA to fail like this:

    [    5.310270] phy phy-sata.6: phy poweron failed --> -110
    [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
    [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110

Fix this by always programming the PLL_E. This ensures that any mis-
configuration by the bootloader will be overwritten by the kernel.

Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
Reported-by: LABBE Corentin <clabbe@baylibre.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 583d2ac61e9e..b2d39a66f0fa 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1601,9 +1601,6 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	unsigned long flags = 0;
 	unsigned long input_rate;
 
-	if (clk_pll_is_enabled(hw))
-		return 0;
-
 	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
-- 
2.24.1

