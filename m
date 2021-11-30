Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC6BC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 11:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237804AbhK3LSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:18:45 -0500
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:51172 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237774AbhK3LSp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 06:18:45 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3KQ61hv1z9w6RL
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 11:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id McYj9h0Q88hL for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 05:15:26 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3KQ56kLDz9w6RG
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 05:15:25 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3KQ56kLDz9w6RG
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3KQ56kLDz9w6RG
Received: by mail-pl1-f200.google.com with SMTP id s16-20020a170902ea1000b00142728c2ccaso8049577plg.23
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eyu825ZfzMp52FyCTeP84ZIiGupHVtUogaq83T982ZQ=;
        b=P0NDYAqzWJ0fD+/qqMovmu1URmRdBsaKorXujUebhN44V+w51n5IADQN8g/d7t9mEl
         NAEsSrJb3QsAS4QbWXGFI3JA0qfoDh0d6su/WUox9jdy9ajjQhea7x/aeCZ0BX66eNHP
         KiRU3x4ytFxSYaebYOh/FGY3/GczhkKvGTbLWdKQh6fNB/1UEH4Mu2B41de9QaCr5MQN
         n7LtAbSNBBXVelCZ7xlIxGGtVMJQjAMsZli82JoqqC63/Xb1Dka+x57b+W04x3gJN8d9
         AfC8oHQD86+9FUt6o0cubY8s2yUAGiAr1oAW9goCIFL1EwRTZGgPxmi4Ghl/s6MayeiS
         HZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eyu825ZfzMp52FyCTeP84ZIiGupHVtUogaq83T982ZQ=;
        b=LWROrhk8ipWfj4vxos/44z/I1r9q2cV+BXGvx4CJ8WAxvkL6Xcq734utIuH4ai4IV6
         VancHNOqtfjGEmqVq2cZ2yWyBclm0wGjacVijkqBxfVaLxTVx8p1YiLIWI8btuHDVrWD
         JY9g+WeEGrkWdo7xvK6EKgsUBVU6+V+8b71A3VGHDT73J2gYVMErquaGaRy51IvckXcT
         AXR/NZuZX4Sdg68moMPdt6eLAlOolS3vfTD4nuH8NEZPZ/YK9X9qDxhVsXeL7UqXUR3x
         ETEPWk/6Y/UrgxG7smKkVBC0s4ppHfD2JXVJXU0k7kWTA65ynnr2YhgsTyK3NWtkyO7U
         UuCg==
X-Gm-Message-State: AOAM530Mae+67NIYcFcTMXG+GxNw8wdUIcJXFWIEBarlrQr0LRMeGqnu
        gw/QiSamTPPVKL4viIELE5aTQjjwX+qAq2CruC825O9A6eeONw1I6ASpbR9yNXLSy+vYaLJdI+M
        lON0WUxLaAKmZFSlG4opGf19F
X-Received: by 2002:a17:90a:fd93:: with SMTP id cx19mr5157485pjb.190.1638270925219;
        Tue, 30 Nov 2021 03:15:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg0rzDMJGlLM5MaTeFJLvHiuhz4TJIbeAf5yDuP5dB/SifcuoLcRAP8F3+7EQymBao3YxZNQ==
X-Received: by 2002:a17:90a:fd93:: with SMTP id cx19mr5157459pjb.190.1638270925024;
        Tue, 30 Nov 2021 03:15:25 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id j7sm2258855pjf.41.2021.11.30.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:15:24 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: x86: Fix a wild pointer dereference in fch_clk_probe()
Date:   Tue, 30 Nov 2021 19:15:17 +0800
Message-Id: <20211130111518.112374-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In fch_clk_probe(), the return value of clk_hw_register_mux() is
assigned to hws[ST_CLK_MUX] and there is a dereference of it in
fch_clk_probe(), which could lead to a wild pointer dereference on
failure of clk_hw_register_mux().

Fix this bug by adding a check of hws[ST_CLK_MUX].

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_X86_AMD_PLATFORM_DEVICE=y show no new warnings, and
our static analyzer no longer warns about this code.

Fixes: 19fe87fd854a ("clk: x86: Support RV architecture")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/x86/clk-fch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/x86/clk-fch.c b/drivers/clk/x86/clk-fch.c
index 8f7c5142b0f0..1539ee59c04a 100644
--- a/drivers/clk/x86/clk-fch.c
+++ b/drivers/clk/x86/clk-fch.c
@@ -51,6 +51,8 @@ static int fch_clk_probe(struct platform_device *pdev)
 			clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
 			0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0,
 			NULL);
+		if (IS_ERR(hws[ST_CLK_MUX]))
+			return PTR_ERR(hws[ST_CLK_MUX]);
 
 		clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
 
-- 
2.25.1

