Return-Path: <SRS0=tmg9=WA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97743C19759
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6943D2067D
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyTErawf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfHDQe6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Aug 2019 12:34:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42079 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQe5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Aug 2019 12:34:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so38425213pgb.9
        for <linux-clk@vger.kernel.org>; Sun, 04 Aug 2019 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RMNZF6KtAhN+Gy6BEZNu5CSdVLgGJb/v0I5vpK538AU=;
        b=lyTErawfTJoMJqfE8HkSCDA8rN+sB6eXWpSvvbRnPRj4XddswSwG4eKflR5VgJg9wE
         X5oYDehddYJjdMzDimNru2HH6v/2H/LJfFJEAihVoshqwClSNoCUT9u7XaFdhoEicsAK
         +iRyzP7KXmcHgNymdH23UH4fczWS0DnImq5SntepN4LL9SF5NP1jooO/GYoHNFyvltTN
         Elg76GRtO0ej16csnkWcqnW+ss68TE2JXz3k+yf+jF9wYhkpX5AP214GMb+tGAYvQ2Zz
         6osUFy5sgJKLp0jw218rjeyxq8Xq+j6xgf/AefiYfq/ISNGh3+pmR5GoN8+MlUgvAYtJ
         bLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RMNZF6KtAhN+Gy6BEZNu5CSdVLgGJb/v0I5vpK538AU=;
        b=VNdIZ/GGxBxRapt3MD1KRQIF+rpSw9YJGLymv2eU3QxALHxgfwT1+cgbWUMr5PLS8H
         RqRaRIVE97kmF3WE/pDrShVgJQivVGGDljs9nILTMli8V1MBGvAjFIVxTDYkYYnNhv/p
         gv3so5IlLwwSrOi51IlrlRULIKwElShSktcccLF6pLB7nTN4zxoRBJiw/CPygueOjz49
         cU02TyWNzdqs3NW3vqxT40+SwT22uHjW319LL3yMxtNpPNlgjzvDr+yQ4la0cUK+xfyQ
         1NrxwV1mkEWh4jurytKc7B0PCHpeYRO1ICePcbJdwZYVAb3eiY64MkSEaJ9+2z/8nvyE
         EkRA==
X-Gm-Message-State: APjAAAW4Coh8Hu/GLyGdb8qSvNz3eO1xDuWcLZC3g3ZUDCb9hE5EUjzV
        e4it9j1LuREgJ01kTpIuvhs=
X-Google-Smtp-Source: APXvYqwPoWuNw9I9Cs1c3kM0bkcz2Tck+syFhD3GywXmw+F40iMATsaw5FfLo6ot9vLlER45vbQhhw==
X-Received: by 2002:a63:c118:: with SMTP id w24mr131695706pgf.347.1564936497094;
        Sun, 04 Aug 2019 09:34:57 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id i124sm148519507pfe.61.2019.08.04.09.34.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:34:56 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] clk: versatile: Add of_node_put() in cm_osc_setup()
Date:   Sun,  4 Aug 2019 22:04:44 +0530
Message-Id: <20190804163445.6862-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In function cm_osc_setup, variable parent takes the value returned by
of_get_parent, which gets a node but does not put it. If parent is not
put before it goes out of scope, it may cause a memory leak.
Hence put parent before the function terminates.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/clk/versatile/clk-versatile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/versatile/clk-versatile.c b/drivers/clk/versatile/clk-versatile.c
index 90bb0b041b7a..fd54d5c0251c 100644
--- a/drivers/clk/versatile/clk-versatile.c
+++ b/drivers/clk/versatile/clk-versatile.c
@@ -70,6 +70,7 @@ static void __init cm_osc_setup(struct device_node *np,
 			return;
 		}
 		cm_base = of_iomap(parent, 0);
+		of_node_put(parent);
 		if (!cm_base) {
 			pr_err("could not remap core module base\n");
 			return;
-- 
2.19.1

