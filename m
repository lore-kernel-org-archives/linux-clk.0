Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A99C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jan 2022 16:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243955AbiAXQxX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 11:53:23 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:46058 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243538AbiAXQxX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 11:53:23 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4JjGJf4Vhqz9w2xh
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 16:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Hmmj9o_15zUf for <linux-clk@vger.kernel.org>;
        Mon, 24 Jan 2022 10:53:22 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4JjGJf2QFLz9w2xl
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 10:53:22 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4JjGJf2QFLz9w2xl
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4JjGJf2QFLz9w2xl
Received: by mail-pj1-f72.google.com with SMTP id x11-20020a17090a6b4b00b001b404624896so221790pjl.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0r9YN/985pm4WkH31y2XQtTcsRb/jLUskflmcZEE60=;
        b=E1ZTwHHm4md7EPnhJrWAZnKtkRuIvTvHNvNkVySo+wHtBhYnW7ZZF8W6Ah1GUt7b39
         jnvi3g9fn4nC1VsO205ro8ysDFFVneX9kxJoCnJFWIZVOhdePR/Af8rwHrVToRibSO5V
         sac/TN8ZMHZApL/BhARYX18UB06hdNVQTJQ53EG/NVuBCHnrw149fxxbc20/O/PD8Hjr
         cYiK9DJAXEKiNA1a/QcCqI8khKpc23OP4iPmd4KDYAYmpea3Eaxq0NLVYEY+oZbHKdtv
         2wJ1z5Sk2ibDy7jeQI5cd7n+kT/D1VRvSVWA0wu+lU6ZWU1D4LYNdQVq/ccZ6XtovXzf
         HAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0r9YN/985pm4WkH31y2XQtTcsRb/jLUskflmcZEE60=;
        b=7TheRLusFWbdVY1v8LPqaHSad/m2WxDQAx0RkkmnoCXaLPqYKmivzSaby+rHiFLm7v
         Tg7u8l6I5Hr7ViCdh/jA1OVNqHROj2jhJ9uzNuxFqgIKunYrwZwiPChHqMci5xWHw3+X
         rLImOprHQcoggzYBbdNP7Bu92Ml1KbHv6I326dV4D7e796EGLSvY9ur1zLP3nXqMGJ5Y
         7zgiPtQfEX7i0IbsXOoSru9PHgALV6Dcc+aSCW6bjUZ9pQMoK6fp3uvP3ni44zDXs6kv
         VLiL5bwnZcknwqZyVojKWJhrzU3Yd1XclEA2LQjZSQ8K/KAe+acOZ6+ud9W2aFFFbGJV
         6t0Q==
X-Gm-Message-State: AOAM532bKubHikTITTOpfkMnw1dfQYiHy10Y0f80sYN+OEISwNqvBWWT
        mVTp+8JfPJ5uxCIrUFkJmunz9Dnk60/2pzzMwVRCVBmcHXg62d2rhBAzkR7GaBOQNJK5V/aiUkn
        Mn03jeGB4EAqi1AKZFKI848zN
X-Received: by 2002:a17:902:b781:b0:14b:68ed:cf6 with SMTP id e1-20020a170902b78100b0014b68ed0cf6mr1378349pls.79.1643043201379;
        Mon, 24 Jan 2022 08:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXQtfiZ+amQ2asd73T+i2bIr3+FBZPrbJB4iFhv68gEh7b5lXqj0cb8bTVnoR0SssKli+OzQ==
X-Received: by 2002:a17:902:b781:b0:14b:68ed:cf6 with SMTP id e1-20020a170902b78100b0014b68ed0cf6mr1378330pls.79.1643043201161;
        Mon, 24 Jan 2022 08:53:21 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id l191sm10787167pga.65.2022.01.24.08.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:53:20 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: socfpga: Fix a memory leak bug in socfpga_gate_init()
Date:   Tue, 25 Jan 2022 00:53:16 +0800
Message-Id: <20220124165316.55449-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In socfpga_gate_init(), when ops fails, socfpga_clk is not released or
passed out, which could lead to a memleak.

Fix this bug by adding a kfree of socfpga_clk on the failure path of ops.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: a30a67be7b6e ("clk: socfpga: Don't have get_parent for single parent ops")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/clk/socfpga/clk-gate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 53d6e3ec4309..0ca5e0000925 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -188,8 +188,10 @@ void __init socfpga_gate_init(struct device_node *node)
 		return;
 
 	ops = kmemdup(&gateclk_ops, sizeof(gateclk_ops), GFP_KERNEL);
-	if (WARN_ON(!ops))
+	if (WARN_ON(!ops)) {
+		kfree(socfpga_clk);
 		return;
+	}
 
 	rc = of_property_read_u32_array(node, "clk-gate", clk_gate, 2);
 	if (rc)
-- 
2.25.1

