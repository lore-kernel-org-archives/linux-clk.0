Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFECAC43612
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 00:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB770208C1
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 00:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGzE8Xen"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbeLOAzZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 19:55:25 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33554 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbeLOAzZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 19:55:25 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so7073885wrr.0;
        Fri, 14 Dec 2018 16:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qEgzsXyxIPXLuA6cB6v8ynvGDOnw9XDvTahrMCNEvzA=;
        b=UGzE8Xen4S6YEXv4e1nWJzrn1fmn/y4EjFEGxAdEC5Lhg/gbmDifWmYAU1ugCyNfpm
         9sZU2yKVOS9W/S3nRVoebzSoLL4p5Baq/LCpKqUySUFm+xsFLj0ZeWN9+OAuO0mKoisB
         3PthobpX2kyhZ6iLbknhWeW8pjDofBQNboj8FhCv9nEjWAgRDK4GlabjDOmiOAscSRjM
         0VWWD0lkmatn89fLHjZpifSuLecJ/e+vakOScVmSsBjvIY2NqkpcZH+2DnUOruUPnDmH
         UdEGUvp7n2PWgDZEAqhtsYlOzuXh77GtqJKass3tvJd3sDoii+RMiDiv9d0gVWYaI9yF
         xBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qEgzsXyxIPXLuA6cB6v8ynvGDOnw9XDvTahrMCNEvzA=;
        b=T4LVWP+7Xuo5Y7ELbF+OG+OtoCqYTxBTNOvwZZevENkcajjbDAlLqy1x6GLcDsnqTk
         K5Kp/RAr2v6Bj7116GsLmwKtYOe51a7TqU8lYG3JmH583jhlUsSCyI5uYzeC3W/7pzgj
         LMKiZyOOwGu7+w3Mgsfvk8NpNm4U0JLHB4mgj/KnQczmB9tOUpBS5QxdsplJWMNCOPFk
         U6RPSW+hSzn2YIkvALMMx1238a0iBzrDrd0pUMhVKdbC/taLHRd/yRVkwSTM2RCBfrMq
         ZgHXZOEwE1PB+PUgJnjojhS8MgZI1DSXSnGr4y3Z34u2viTgFEjsFQ7FxGulF898utL4
         lHZQ==
X-Gm-Message-State: AA+aEWZY588Uw8eeAb1OaE3DDeSisz5tbKvwYPbUv26a5FPzqJpweMLl
        0H1f8diSUksUFWJo33QJVWpOb6aC
X-Google-Smtp-Source: AFSGD/VDTXxxm0A46KJpK83W/fpPyv5PSon2TUDGGICZPSDlWfGe2UANL5JCflEFfj9HNDtm6d91Hw==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr3950844wrm.328.1544835323322;
        Fri, 14 Dec 2018 16:55:23 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm11895607wrd.46.2018.12.14.16.55.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 16:55:22 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Date:   Sat, 15 Dec 2018 01:55:19 +0100
Message-Id: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In case the upstream clock are not set, which can happen in case the
VC5 has no valid upstream clock, the $src variable is used uninited
by regmap_update_bits(). Check for this condition and return -EINVAL
in such case.

Note that in case the VC5 has no valid upstream clock, the VC5 can
not operate correctly. That is a hardware property of the VC5. The
internal oscilator present in some VC5 models is also considered
upstream clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: This is an updated version of:
      https://patchwork.kernel.org/patch/10731699/
---
 drivers/clk/clk-versaclock5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 5b393e711e94..b10801506518 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 
 		if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
 			src = VC5_PRIM_SRC_SHDN_EN_XTAL;
-		if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
+		else if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
 			src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
+		else
+			return -EINVAL;
 	}
 
 	return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);
-- 
2.18.0

