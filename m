Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD604C001E0
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjG0Fgr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbjG0FgY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:36:24 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA0B35A0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:40 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55ae2075990so317129a12.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436109; x=1691040909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8W9kuJkMcvh5EIR1rkxuFuZSM/bg9HqW6C8Akxa9PTk=;
        b=MAZHn9Fs1Wr+ausou3GNnGfYd0iaJfcvXuvDmVV4J2mG8A+3uOhRVMt8nm3s3Nt6vU
         bVximShHZdGu014nr4d6xPoEe+l+c8gB2SQAj2TfvLXuBqVMZrTUfXO3kVZn4ZOvoy37
         x0jk4RQWC5H2z93dSdPA5LD4AOdc153GcNjevwQAB5OGi4fcIF42ojaYCa+qV2x25ZHg
         eWXelqBUDlGXQovf3yuKS36D8pj3/kou+O/w3+EPKx7lqAmifruQhFuBlwW2jFYLuced
         y5y1ktmPRP3ehZnky6767tc4N6Zt/kA1YOOMkB/98vjvqtLovB+iXof5mSGqYcIpMBDk
         2mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436109; x=1691040909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8W9kuJkMcvh5EIR1rkxuFuZSM/bg9HqW6C8Akxa9PTk=;
        b=HrSTRoGhztqRzZ5QfgheCgEsWsarREsjzvVWPv9zYMgV1/8wfrEWsQqZvXoA2KCfIl
         wZiPEaF7XdkfDS7g8qBSMTmRsFzsGOyI2p2/IZ6B2KA20yOQzOBMxjTClba1Ms3Cvxax
         3FfbzDm7zADVf4gDAVAy6cW6JeBG2eKxp1vxi4exAZvOnC+eEN9+toEYnT+NZRXEH7aJ
         uSSm2Tzl+lG4GCyvfO7JEG75A/UZuYOygfPPkfFtWfvUJf28pQDF9x5rVT5pO76xKiLv
         4+fUCvcnl4oaT3pfAZH1gV+QPEb7x178Ksrzy/zmyY5PLzjPVrj8NmhlhFQrnkCigH4h
         5VTA==
X-Gm-Message-State: ABy/qLYIGTDEiGfPwy0sPqOmRy9pz1NM7eIgniRotXa/7YBSfNMEuNw5
        jBO1WyzIrJFRNxNT54kLU/XtUA==
X-Google-Smtp-Source: APBJJlFr7Ubx6veXreYCq9qaNTfA3hoIMxlxKrM+QpfvNqZ1MgIHvumx6BmFslYRsgIIJIQ7F8001A==
X-Received: by 2002:a05:6a20:7347:b0:133:6e6e:2b11 with SMTP id v7-20020a056a20734700b001336e6e2b11mr3207205pzc.2.1690436108919;
        Wed, 26 Jul 2023 22:35:08 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:08 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 22/42] clk: at91: at91sam9g45: fix checkpatch.pl check
Date:   Thu, 27 Jul 2023 08:31:36 +0300
Message-Id: <20230727053156.13587-23-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the following checkpatch.pl check:
drivers/clk/at91/at91sam9g45.c:235: CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9g45.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index 684ce0f79d3b..868897fad3f0 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -241,6 +241,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 err_free:
 	kfree(at91sam9g45_pmc);
 }
+
 /*
  * The TCB is used as the clocksource so its clock is needed early. This means
  * this can't be a platform driver.
-- 
2.39.2

