Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47922C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06B7C20661
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1ITjS2B4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06B7C20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbeLDQdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:33:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33155 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbeLDQdK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:33:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id r24so9806987wmh.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 08:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgAzEtpGsO+HFQ/Buekn8Ha3Cd1FoBRGH4LoS8NM1wE=;
        b=1ITjS2B4EyIC02Al8PsRc9abw7lzLm49CgnIlrZQhWbnakDUHWdLsuTN10Hmf230fi
         j4FKN8ZiAEa83mmmu4vNPqHdgoiPF8KevrL6ZOdRJ87D/OkVEpKXP1tzhqpR7jTgk0Mg
         1OJ+eat84ThwPyk/T/2agl9ybQascsEQtuqRQ/s2rGk7QrsQBzJMso8TEQlZcBu/ycW3
         WDNymrnnF/0swH4MC0eB/3d9PGrpXLZoDh9TQXvALXjfQaj+11pzdlv2+qBeroXeEBgG
         c74RmLxVXUmdY6dJTe+NAMkfjFXuyOxblxFGOikyOKzlT1vj3fDtrDty3ujQUBnBjf7F
         C4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgAzEtpGsO+HFQ/Buekn8Ha3Cd1FoBRGH4LoS8NM1wE=;
        b=TIZyIgVpwmJUGnw4YHa8OGNDFacgn9pcgRDZJC4QJHaEuHhLBa//gVAx/y0LIz4mld
         01SkUbIC+VD7mThuBtxqkc6dm2vO79ySYVF5Xh80hiPANiNrrLWT3l1BR/ZCLzXW4rgh
         y6os8fR8l5CJYZAZtJAMbt11HAsOX+4IetwuzcK6Uvd1QqjzZ2QKzCd87WeSp0cSy+Fp
         5CC8HNzYpYPDrLsWZg8egTOgr+0X2VILoAjU/THKvboRUX32DPCBYJRlKZ8Sn/3UE1FV
         pDQZ8pl1Mhd5IOxUjyeJ7Nquw7O+pQtf5lqyqIyc0mJdaM28NV3FQvJIkVuFqs6+DR1w
         9koQ==
X-Gm-Message-State: AA+aEWZpbQHbvqoxH+oQSSXnCWDCjGwX8Q6Fs6Vxy0FUqmYCA/LzAl3a
        K+iTR3JA+il1P/91+mptGsofYg==
X-Google-Smtp-Source: AFSGD/WgmHcx3GbUoWEl+zTwJABfrH9foc0qEg9uB9zCloHfq5lAwMtwJ1rOnsl2ExXCAAZnMm+WyQ==
X-Received: by 2002:a1c:91d1:: with SMTP id t200mr12838974wmd.111.1543941188117;
        Tue, 04 Dec 2018 08:33:08 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id r3sm16119021wrs.78.2018.12.04.08.33.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 08:33:07 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] Revert "clk: fix __clk_init_parent() for single parent clocks"
Date:   Tue,  4 Dec 2018 17:32:57 +0100
Message-Id: <20181204163257.32085-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit 2430a94d1e719b7b4af2a65b781a4c036eb22e64.

From the original commit message:
  It turned out a problem because there are some single-parent clocks
  that implement .get_parent() callback and return non-zero index.
  The SOCFPGA clock is the case; the commit broke the SOCFPGA boards.

It is wrong for a clock to return an index >= num_parents. CCF checks
for this condition in clk_core_get_parent_by_index(). This function sets
the parent to NULL if index is incoherent, which seems like the only
sane choice.

commit 2430a94d1e71 ("clk: fix __clk_init_parent() for single parent clocks")
appears to be a work around installed in the core framework for a problem
that is platform specific, and should probably be fixed in the platform code.

Further more, it introduces a problem in a corner case of the mux clock.
Take mux with multiple parents, but only one is known, the rest being
undocumented. The register reset has one of unknown parent set.

Before commit 2430a94d1e71 ("clk: fix __clk_init_parent() for single parent clocks"):
 * get_parent() is called, register is read and give an unknown index.
   -> the mux is orphaned.
 * a call to set_rate() will reparent the mux to the only known parent.

With commit 2430a94d1e71 ("clk: fix __clk_init_parent() for single parent clocks"):
 * the register is never read.
 * parent is wrongly assumed to be the only known one.
   As a consequence, all the calculation deriving from the mux will be
   wrong
 * Since we believe the only know parent to be set, set_parent() won't
   ever be called and the register won't be set with the correct value.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index af011974d4ec..1b33ef3c37f4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2246,7 +2246,7 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 {
 	u8 index = 0;
 
-	if (core->num_parents > 1 && core->ops->get_parent)
+	if (core->ops->get_parent)
 		index = core->ops->get_parent(core->hw);
 
 	return clk_core_get_parent_by_index(core, index);
-- 
2.19.1

