Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB42CC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 21:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F30F2087F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 21:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfADVsa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jan 2019 16:48:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34674 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfADVsa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jan 2019 16:48:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id j2so37899388wrw.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jan 2019 13:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/1Hh0jF1hTuqrBZCecS8pHoCn1hWl7rEgSaDoyhQqvc=;
        b=ggbHKqEgmqODByaKrK+vf5VJQQJX7toQ8UWbM8rASJleiuqzY09pON/sWSHTQqrdb0
         cC3849SiLIte5gfZeIDIUTTIpxCAlOjJZ36f2ovzdNyeuK9O8VjALH8brgyigI0YcNJ6
         CQy4Q7YEJhP/1jbl0os12J2+9sts5BZCy4zEsj16Aus/BXY5kJA0guQqbokIYkZyhgXm
         r80xLH2CokRF+nzB/O0INAtvprUkYx0rKe9AC0+VezX10DtLX45YE1bhq5HtaNVKNICs
         bgNfOkpIrld0i7LRdxFqj6ynKg4FP2AAaAGzuqoIiotmruxQzGeD/kFua01dM4WWS8OJ
         Gnlw==
X-Gm-Message-State: AJcUukfGSYK3oQvVP+vKnA/qB1lUKvJxA+Ddip7rJTNevhBBATVKmTy0
        O7C9KRx1aWNJqU/jQqF5Nl4sQjVbAedCbQ==
X-Google-Smtp-Source: ALg8bN5dTsUlMrLtCB0POEt696Ert8SldbNXuTGK5qom7Q5X0qdA5le4pwzMxI/VGr0OBopuNbdCpQ==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr43499504wrt.209.1546638508491;
        Fri, 04 Jan 2019 13:48:28 -0800 (PST)
Received: from mcroce-redhat.redhat.com (host177-2-dynamic.16-87-r.retail.telecomitalia.it. [87.16.2.177])
        by smtp.gmail.com with ESMTPSA id a6sm1485365wmh.10.2019.01.04.13.48.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 13:48:27 -0800 (PST)
From:   Matteo Croce <mcroce@redhat.com>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: samsung: fix typo
Date:   Fri,  4 Jan 2019 22:48:26 +0100
Message-Id: <20190104214826.29519-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix spelling mistake: "lenght" -> "length"

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 drivers/clk/samsung/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index c3f309d7100d..9cfaca5fbcdb 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -26,7 +26,7 @@ struct samsung_clk_provider {
 	void __iomem *reg_base;
 	struct device *dev;
 	spinlock_t lock;
-	/* clk_data must be the last entry due to variable lenght 'hws' array */
+	/* clk_data must be the last entry due to variable length 'hws' array */
 	struct clk_hw_onecell_data clk_data;
 };
 
-- 
2.20.1

