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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7CCC433FF
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E46752067D
	for <linux-clk@archiver.kernel.org>; Sun,  4 Aug 2019 16:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1+9x8LO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfHDQcD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Aug 2019 12:32:03 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46619 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQcD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Aug 2019 12:32:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id c2so35468952plz.13
        for <linux-clk@vger.kernel.org>; Sun, 04 Aug 2019 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qddEZCRmHcDEiwxlw41CD2dYNW6aCbxQhT34PmGX8+4=;
        b=c1+9x8LOPuYZWnMY/HMVqXzR0NWJiOyx+ZX8zoNkAw01NWjHdTmYmyfRTLZhl+8KeL
         WY2r4UhAONhgPxlExp6TeRi3iUQ0A8/AmVUfnxmk1yEWl1iIlctuVIGL3C9SKwleG6BC
         fBFSUeaPJTEcaBRhN5qlxRhmDCU4LWV+8/c/v8TPzZbcyfePEKbxUuc1DnndeKsbXgLq
         gHXDpkbrBUWkkoOgx4FJvcT8c6EUiGji+imBlJUwosmB5zFjbejCt/bc8ZM1yJ8Fu+xy
         Hu2oWZXgoQbPnK5ivoyGtDQ8tPznoIUkGVh/JfN0t+6mhGPtl0/grw+Ssn4XrCj3R4Yz
         Vsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qddEZCRmHcDEiwxlw41CD2dYNW6aCbxQhT34PmGX8+4=;
        b=GvtkgfzUCT954rmq1w68G9C+7bfN9Gnzx5jKCS9X5eRh5qoZCE2Ggjv/szEdK0jX2o
         TktPm3FqOgmdc7t6lUo0woJlITRIu9eE7kcI/iq0uhhOxkI3auyEoSTY00aifrHw5AR1
         wYgk0DRLNw9tUP/2B2fxoNXnuR88+gr3b0YtqSMPVKwR+idYbGQ9iy1RQonQAjAvAO/q
         xbtyUhSbss3PI04ie2gg2vZFXNNtRzdQniPO6F8Z/d05S7ofTXjTuzfEyObT4JhkTEW+
         4H2nBa1yRHSbAoM2HV+nI2BKOs2wRcK1jL83P8AW2bkSsbZt/ZobiZjZG2Wrs6y7YM+s
         BbMw==
X-Gm-Message-State: APjAAAXVXClW6P5nfGgw7RUtgDkZj1xxBL8caftPXdfLzqIDrxbZQ+aZ
        8AGTEU4cyzb3lTsZZb4X7xM=
X-Google-Smtp-Source: APXvYqyAenqD98HNbZWc8qom5QvVHOb2x7JS75maPyB+uZbU0FAoJ10CBBJpAdAPRVUIsxIhFsy0Cw==
X-Received: by 2002:a17:902:758d:: with SMTP id j13mr139332579pll.197.1564936322851;
        Sun, 04 Aug 2019 09:32:02 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id r1sm75194350pgv.70.2019.08.04.09.32.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:32:02 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] clk: st: clk-flexgen: Add of_node_put() in st_of_flexgen_setup()
Date:   Sun,  4 Aug 2019 22:01:51 +0530
Message-Id: <20190804163151.6511-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In function st_of_flexgen_setup, variable pnode takes the return value
of of_get_parent, which gets a node but does not put it. If pnode is not
put before the function returns, it may cause a memory leak. Hence put
pnode after its last occurrence.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/clk/st/clk-flexgen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index d18e49b4976f..4413b6e04a8e 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -326,6 +326,7 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 		return;
 
 	reg = of_iomap(pnode, 0);
+	of_node_put(pnode);
 	if (!reg)
 		return;
 
-- 
2.19.1

