Return-Path: <SRS0=Sw4L=2H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10517C43603
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 04:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA5CE206A5
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 04:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="VFltoxNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfLQEly (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Dec 2019 23:41:54 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39068 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQEly (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 23:41:54 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so6827677pfx.6
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 20:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Nk/W+5arQWBs6ZTiLBLgKOQUzXBaBv6sspqmS0EGHAM=;
        b=VFltoxNYivcht4mRSWRTABNUZvebN0skY+qag2OouKIz4KqoGdQmi4ks7UY7ToejLS
         PmM3/SsG0KYROTJchUegQ3ZKsLyrq5lALVi2+chGheV8prVT/7HfsHzIbUdUDgz7kTNP
         zjniJjRLCzchA/KZiT0RuPe7ihTp+/PUsHsWRD1bU+TPYDYSCwEyH0g1yct1GMqi9RhG
         UUJ4UwXZA2d+P+qF2Ri1CIuw6DbNBK8lO5Nl7nueHYBUIEskketwZPFuWS4B6vjw4Mr3
         xPHjde8l+pjtEqQ+rWrE2InDsMB/QEkTr46EBkZ3I0slwcAj8Se9E/UPwWViFjCTYgph
         blEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nk/W+5arQWBs6ZTiLBLgKOQUzXBaBv6sspqmS0EGHAM=;
        b=I/4f0ttkT7oz1ipytS0pyFYuaE5DsqkHR9xz42W87yEzbtqD9w3CoykTfC0qAB+Gt3
         FeyFqleL1ASxyz9/g3Sj8be/R2gWyoysV7aEIGnEHYGcI1LPB/U6pCk1R18tIz2cxc3S
         UPL2/jqp0FFK/lbs1pSE4WLh+vh+hoqLX7f3Yg2nvPfrMIVc3Mn3eBJvpre3JUyWbIPm
         496M/KEPh2i59J2NNHLk6zuEMbexNJ3cD/4p00cd1ST2v9fsOCYm2fDIYphS7Pfb4ciK
         W+9K9BpCpiY4IjtjOFqDGw4dHOULf8mZGgFtdXT3FmOWHpT3pb6oZfdTeMYxIyzDnyZL
         HWJA==
X-Gm-Message-State: APjAAAUxSuiYuEnnH7PR+uZQ2gQxD6yZnpE1q1tmdJcAfnlkgdASyAH+
        7eKloY8YkCKxHoeRwPTDGAmeDA==
X-Google-Smtp-Source: APXvYqy+E/6fERbL4RyzNs3+QqabIKLKD87ynTY+Mde2PSKfFtuH0kuleB413ORzLD8oVL9ma/uqWQ==
X-Received: by 2002:aa7:9d0d:: with SMTP id k13mr21099578pfp.254.1576557713533;
        Mon, 16 Dec 2019 20:41:53 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id q12sm24307946pfh.158.2019.12.16.20.41.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2019 20:41:52 -0800 (PST)
From:   Olof Johansson <olof@lixom.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>
Subject: [PATCH] clk: declare clk_core_reparent_orphans() inline
Date:   Mon, 16 Dec 2019 20:41:46 -0800
Message-Id: <20191217044146.127200-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A recent addition exposed a helper that is only used for
CONFIG_OF. Instead of figuring out best place to have it in the order
of various functions, just declare it as explicitly inline, and the
compiler will happily handle it without warning.

(Also fixup of a single stray empty line while I was looking at the code)

Fixes: 66d9506440bb ("clk: walk orphan list on clock provider registration")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae2795b30e060..dc1e6481f6b33 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3277,7 +3277,7 @@ static void clk_core_reparent_orphans_nolock(void)
 	}
 }
 
-static void clk_core_reparent_orphans(void)
+static void __maybe_unused clk_core_reparent_orphans(void)
 {
 	clk_prepare_lock();
 	clk_core_reparent_orphans_nolock();
@@ -3442,7 +3442,6 @@ static int __clk_core_init(struct clk_core *core)
 
 	clk_core_reparent_orphans_nolock();
 
-
 	kref_init(&core->ref);
 out:
 	clk_pm_runtime_put(core);
-- 
2.11.0

