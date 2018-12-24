Return-Path: <SRS0=MD/5=PB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A0DC64E79
	for <linux-clk@archiver.kernel.org>; Mon, 24 Dec 2018 19:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ED332184A
	for <linux-clk@archiver.kernel.org>; Mon, 24 Dec 2018 19:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="m13uDjHT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbeLXTIu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Dec 2018 14:08:50 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:45020 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbeLXTIu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Dec 2018 14:08:50 -0500
X-Greylist: delayed 485 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Dec 2018 14:08:49 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 2AB3E9FF
        for <linux-clk@vger.kernel.org>; Mon, 24 Dec 2018 19:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GtX37KGbogBc for <linux-clk@vger.kernel.org>;
        Mon, 24 Dec 2018 13:00:44 -0600 (CST)
Received: from mail-it1-f197.google.com (mail-it1-f197.google.com [209.85.166.197])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id EFE65798
        for <linux-clk@vger.kernel.org>; Mon, 24 Dec 2018 13:00:43 -0600 (CST)
Received: by mail-it1-f197.google.com with SMTP id o205so14117517itc.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Dec 2018 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HRlJkk/B03cDNB5P9fcyd7Sz9trQYzpYEkvCb+TAWDQ=;
        b=m13uDjHT9soBdyLr9yidUsoEgfcorq0PtBUYa3Nm4bGYmgMR1yJ2lazH57M9359WfL
         UxYCA8CLe7PeFRs2PFU3hWtzUZiLTRfnu4KlzF5hCfYSD7RuAca97HbcEXZHLG4Ulw+g
         1oPyieIGmiRvz6BlOoP+MLTNyF5XAXwlwvKi3F7KjGwbqR8+h6D+RNtbJbrbgouQYaj6
         /XaKnIjWn+74DwoTTeBJlquDTaSgLiYjgdZlBAL0w20TYljLa548104bYmpdlnqmkgNE
         Lqxutu0mlDKWpnraTmMoh5HbwePIgQb4zEcLhC5ZcISbC1BpYqEdQvil6g5FW5i/Lorw
         9rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HRlJkk/B03cDNB5P9fcyd7Sz9trQYzpYEkvCb+TAWDQ=;
        b=P6d5Pn1ry9+zx0wbbuVfxv+CG4xoUN1M8CmfUho/QY9SrHa7FWYfqZDziyAJKlpiuj
         3VRBJG6nPQ4z7o/15ncVX08J+Cl0u8dIJLvmcLiLIWEeE2HjWNMdsIcby2ovL8BqYEGi
         FSS8zt2ZS8Fi1g6X8iEIf11boy4W8uqqm7UyOElxZCrSz7XrJm+1XLUllNLt310KHm2Z
         ocxheiYb4MNYyj0qNBIx5DTRJmDP6ex4CAbD5TNTXXIc9Hz0ods9NTz5B+5WDLCsjQsA
         ZK7xN7wT/mw3EOcObiJDGWln0S+Pl+Apd6tI/BxakGOAZmhNS61b2d8O24Vd4EJkgtle
         mgAQ==
X-Gm-Message-State: AJcUuke6gnoITpT0dV8ZJ5kkpY7Gs9SbPO2lhPzxhPuNjfJWvU3irPfZ
        lGZURlOxLq8CVdLW7KfE2lsSI+DqpHBy5SL6dEa4TttPj1hnW3Dy912pGJWMhqQrNbL4EFU/UEa
        SHLoCPFR2ExpDyMYphk/qYp6W
X-Received: by 2002:a6b:3b4f:: with SMTP id i76mr10167026ioa.266.1545678043617;
        Mon, 24 Dec 2018 11:00:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN66j9dLJeQu9EplGRbsnB95dn7ke5Vj66+x/TkGFOiUWJ49uE2MEAptrO07rcKAnhweAY/C6w==
X-Received: by 2002:a6b:3b4f:: with SMTP id i76mr10167017ioa.266.1545678043399;
        Mon, 24 Dec 2018 11:00:43 -0800 (PST)
Received: from cs-u-syssec1.cs.umn.edu (cs-u-syssec1.cs.umn.edu. [134.84.121.78])
        by smtp.gmail.com with ESMTPSA id q14sm10000997itb.36.2018.12.24.11.00.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Dec 2018 11:00:42 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, Marek Vasut <marek.vasut@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Fix a missing check on regmap_bulk_read
Date:   Mon, 24 Dec 2018 13:00:32 -0600
Message-Id: <20181224190032.23167-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently, vc5_pll_recalc_rate() may produce incorrect output when
regmap_bulk_read() fails. The fix checks the return value of the
latter function and returns 0 in case of failure.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/clk/clk-versaclock5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ec..cd76a893c594 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -413,7 +413,8 @@ static unsigned long vc5_pll_recalc_rate(struct clk_hw *hw,
 	u32 div_int, div_frc;
 	u8 fb[5];
 
-	regmap_bulk_read(vc5->regmap, VC5_FEEDBACK_INT_DIV, fb, 5);
+	if (regmap_bulk_read(vc5->regmap, VC5_FEEDBACK_INT_DIV, fb, 5))
+		return 0;
 
 	div_int = (fb[0] << 4) | (fb[1] >> 4);
 	div_frc = (fb[2] << 16) | (fb[3] << 8) | fb[4];
-- 
2.17.1

