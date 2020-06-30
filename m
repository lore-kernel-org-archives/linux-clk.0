Return-Path: <SRS0=h94J=AL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A918C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jun 2020 04:33:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25E3120C56
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jun 2020 04:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WlbOS/rx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgF3EdL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Jun 2020 00:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgF3EdL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Jun 2020 00:33:11 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCD2C061755
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 21:33:10 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id gp8so14417702pjb.9
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=BfxhdyAtqRfaskkZwcQe9jhhrIlwrtNYUAU6BoBKsU0=;
        b=WlbOS/rxcV/nfmL42gU+2uW5605vPpCXptWNJaFjQi66NImbnUdE6YUsetFLBNuK/Q
         e0IrRdvdbc0ascmCOGvBQVu8qaN9dcV03MGj478OkMAON0upmpBr4NNymtMqgprgB6qJ
         V/XgCdqQyV/4MoLD6zs7xCrSqcKAJu21Vvq451gB+OHOMv4J0/jjF/3GzHjgSxextSrw
         FfB8Fq47pm/JhiUmx5By8xgA2xIFK+FTaUFU4l+pE01+jOU/pVRq1/VrYj0XEu2ltNaQ
         Pe0a575vblABxCv93pMWXadn7FFRDkZtJiq3vqbvTo4Pt+7oF4jpwQWhCUgTAxR7DWfv
         XJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=BfxhdyAtqRfaskkZwcQe9jhhrIlwrtNYUAU6BoBKsU0=;
        b=YwiyR/Z3QKlxhTbvkJYmmivw1xkuhIXSF3scpdRy0hNaltnK/rgi3sA5cf097rsCXq
         BPrJ/3mMACBZ5QhgF2xD3cwj6fvYkF2UlT76T53457/hCWG2qCi5oF/ZBrEySDkFAKPQ
         bDaloe6PvzRmYqF1k3PrHqX3B17OGzDiuo3hZCE2fx+kPFtZlXcpofftvVVlyUedoAwe
         O2PxvkKdbdaVLiLY96tKdiRm3dThhWoL8x0khPbMQoe6WiGwd0aY5p/WpVT+rgDixgtT
         FbX9Gj5+bVrIBY/k2kxGZO1AMCScgBJUNZvnAdXIclKUzqVVpzjKjw2YKjaew9Yqifjj
         fw0A==
X-Gm-Message-State: AOAM532pD1lR6qnWVAKgF6CsNcZ2J91sWFkQ4YaZhN0L7YkzWZLFmasX
        gVwEsJ+CFIG0yUdk3gmy2jFb6/043K6LjA==
X-Google-Smtp-Source: ABdhPJzjDYrzCee7PJbQXNWpdVP3KKDk5o0jdZbS8zAHzV1bEo0J1F0IKWlOtMQhuDNnPi+Qz1VkgwhZGFZGsQ==
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr20697187pje.230.1593491590176;
 Mon, 29 Jun 2020 21:33:10 -0700 (PDT)
Date:   Mon, 29 Jun 2020 21:32:14 -0700
Message-Id: <20200630043214.1080961-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] clk: Specify IOMEM dependency for HSDK pll driver
From:   David Gow <davidgow@google.com>
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The HSDK pll driver uses the devm_ioremap_resource function, but does
not specify a dependency on IOMEM in Kconfig. This causes a build
failure on architectures without IOMEM, for example, UML (notably with
make allyesconfig).

Fix this by making CONFIG_CLK_HSDK depend on CONFIG_IOMEM.

Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 69934c0c3dd8..326f91b2dda9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -50,6 +50,7 @@ source "drivers/clk/versatile/Kconfig"
 config CLK_HSDK
 	bool "PLL Driver for HSDK platform"
 	depends on OF || COMPILE_TEST
+	depends on IOMEM
 	help
 	  This driver supports the HSDK core, system, ddr, tunnel and hdmi PLLs
 	  control.
-- 
2.27.0.212.ge8ba1cc988-goog

