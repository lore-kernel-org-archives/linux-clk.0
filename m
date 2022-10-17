Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496A8C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 16:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiJQQrS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 12:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJQQrR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 12:47:17 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1753AB26
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 09:47:16 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m15so16868412edb.13
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVq1slC8WyteXvk7RgIypCJejBcKboJNQiDOlth57NM=;
        b=WLhZOoL0+ZlT3dtpqnUUanAxr3S3mdBeaPUVrfBjeO6OTToxShZto4EIoSHhXL+A+o
         3X4OIFRZc6kNM/uFgD9++gNH2IR0kY0OzVjf5t2eSpPUgDgPswtp4G913D9XCgQFaT9j
         m03i19GeBSu59zjOA0uFAw0k/etEpSuDmanmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVq1slC8WyteXvk7RgIypCJejBcKboJNQiDOlth57NM=;
        b=gCPD6W2PlDXz/uYPBDOWpR3P6EzCCcjRIyEWu65ZzAAdc5k0lP7nDO+v6AE86UlvPe
         QCvmwEVGeZYEL6DzByaPdDHwW1LR8qMVoYVfdU7MhYev/O6T39ckxezzLiG/LKIPaNVG
         reL9QiGeaeDs9sP+d/33N4bgfoN4PUDt28X0mTw9/sWo2ePZbrpdOtFi/snJSuMKj2KC
         L+HPchPwEWyt/0TVHV1yMBPzc+Bqovl82dhnNi0APE/9ubxWHbtrCsTFRL+Vr0Pirudm
         jPxrUoyTSs7kHsQEhsns/jnoIdCovggtZ1PSYtWOH4oIKtIGKZzoNRT884+saYDHV6CF
         5hKw==
X-Gm-Message-State: ACrzQf101gLez12A0iVnR+lmmwYedeiIeHcxHExaV75NytFC4R89jQ/L
        Lxr89l+OjPfIkVSxvfq0+sn3iA==
X-Google-Smtp-Source: AMsMyM7JzS8qgO6HKr9k/3n5USEcYA/w3vjO4D99E/pC1lnADlVjuncf3w8SKHgf2bailRsMya+j4A==
X-Received: by 2002:a05:6402:2706:b0:45d:aaae:e74a with SMTP id y6-20020a056402270600b0045daaaee74amr3392104edd.72.1666025235279;
        Mon, 17 Oct 2022 09:47:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
        by smtp.gmail.com with ESMTPSA id va30-20020a17090711de00b0078d61c5db0asm6316887ejb.49.2022.10.17.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:47:14 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Amarula patchwork <linux-amarula@amarulasolutions.com>,
        michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] clk: ti: mux: don't free `parent_names' on kzalloc() failure
Date:   Mon, 17 Oct 2022 18:46:46 +0200
Message-Id: <20221017164646.4193618-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Although no operation is performed by kfree() on a NULL pointer, it's
however suboptimal and semantically wrong doing it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/ti/mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 46b45b3e8319..1f924db2ad98 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -182,7 +182,7 @@ static void of_mux_clk_setup(struct device_node *node)
 	}
 	parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
 	if (!parent_names)
-		goto cleanup;
+		return;
 
 	of_clk_parent_fill(node, parent_names, num_parents);
 
-- 
2.32.0

