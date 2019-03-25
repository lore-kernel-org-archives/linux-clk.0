Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF250C10F03
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95D4D2087C
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CZbkl2dQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbfCYQgV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:36:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCYQgV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 12:36:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BAC3325BF15;
        Tue, 26 Mar 2019 03:36:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553531771; bh=40aXj6/gt4xoni++7qBcCs23s4Ow0DogxkOQvF6oujY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZbkl2dQyUaMvdVt22tOByqEVMj5A0051fSzhmiI8eu0p7CIlLphJ01L3xxJvP/6h
         /6Kcxmgavfzsw+VE6uuOilgdIP8VGqtPQuH6nxNbvV/1woY6g3oH9ALuGvz2vxdwHl
         kv8Mc2gr1zeDNLvb16ugBpnHZRFX/2QCskssS59U=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DF306940857; Mon, 25 Mar 2019 17:36:08 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v6 4/7] math64: New DIV64_U64_ROUND_CLOSEST helper
Date:   Mon, 25 Mar 2019 17:35:53 +0100
Message-Id: <20190325163556.22025-5-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190325163556.22025-1-horms+renesas@verge.net.au>
References: <20190325163556.22025-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Provide DIV64_U64_ROUND_CLOSEST helper which performs division rounded to
the closest integer using an unsigned 64bit dividend and divisor.

This will be used in a follow-up patch to allow calculation of clock
divisors with high frequency parents in the R-Car Gen3 CPG MSSR driver
where overflow occurs if either the dividend or divisor is 32bit.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6
- Updated changelog as per suggestions from
  Sergei Shtylyov and Geert Uytterhoeven
- Added Reviewed-by tag from Geert Uytterhoeven

v5
- New separate patch to add DIV64_U64_ROUND_CLOSEST
---
 include/linux/math64.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index bb2c84afb80c..65bef21cdddb 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -284,4 +284,17 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
 #define DIV64_U64_ROUND_UP(ll, d)	\
 	({ u64 _tmp = (d); div64_u64((ll) + _tmp - 1, _tmp); })
 
+/**
+ * DIV64_U64_ROUND_CLOSEST - unsigned 64bit divide with 64bit divisor rounded to nearest integer
+ * @dividend: unsigned 64bit dividend
+ * @divisor: unsigned 64bit divisor
+ *
+ * Divide unsigned 64bit dividend by unsigned 64bit divisor
+ * and round to closest integer.
+ *
+ * Return: dividend / divisor rounded to nearest integer
+ */
+#define DIV64_U64_ROUND_CLOSEST(dividend, divisor)	\
+	({ u64 _tmp = (divisor); div64_u64((dividend) + _tmp / 2, _tmp); })
+
 #endif /* _LINUX_MATH64_H */
-- 
2.11.0

