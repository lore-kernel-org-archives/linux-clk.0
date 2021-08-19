Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CBEC4338F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 23:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16FD660E78
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 23:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhHSX3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Aug 2021 19:29:41 -0400
Received: from gateway36.websitewelcome.com ([192.185.200.11]:18483 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233964AbhHSX3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Aug 2021 19:29:40 -0400
X-Greylist: delayed 1382 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Aug 2021 19:29:40 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 6BD77400CB0D7
        for <linux-clk@vger.kernel.org>; Thu, 19 Aug 2021 18:04:09 -0500 (CDT)
Received: from box5480.bluehost.com ([162.241.217.117])
        by cmsmtp with SMTP
        id Gr4zmSffU7sOiGr4zmw2eE; Thu, 19 Aug 2021 18:04:09 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=tuxengineering.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NNbydXSSX4ypnrvpua/vHB/lbNdALovBlrRTDEQRR3M=; b=jpIRF/sF8GSr+xsFNwgRjGYir0
        izQDXtJ/OUkmlr1ngykH3v4lbK2PgyNyqKyxRQz78T+zuHa8FiEN8L0zXaPxKXYFHeEZwyVE5oNXW
        XCayWTDxNQUQXmmyPm1kGeeLy5ilmhpiXIlur463Zdp7AC0ciU/4qGy84uYbTzZovFSRoIshtqqpG
        P0w9fLRsPW0l56uBYG4im27LDXv5rJOcv78p/5sXo7sqYqnTxJ3uB5/Kpi9rYtyeYYDjiQALlBdUx
        PJ6TFp4+bKwW7fPzdTwApXs/Q5/uge2juU+L/xxiRYHzDqr9cDYnK03quz6NUTZlh12vTC9FYoqdh
        oMOLe4eA==;
Received: from cpe-172-112-25-64.socal.res.rr.com ([172.112.25.64]:54114 helo=[192.168.1.92])
        by box5480.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pat@tuxengineering.com>)
        id 1mGr4z-001KjG-4H; Thu, 19 Aug 2021 17:04:09 -0600
To:     linux-clk@vger.kernel.org
Cc:     Mike Looijmans <mike.looijmans@topic.nl>,
        Michael Turquette <mturquette@baylibre.com>
From:   Pat Carr <pat@tuxengineering.com>
Autocrypt: addr=pat@tuxengineering.com; keydata=
 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
Subject: [PATCH] clk: clk-si5341: Fix output_clk_recalc_rate if RDIV_FORCE2 is
 set
Message-ID: <9c7f1fcb-1934-2f4a-90b7-bbb108f8c6e0@tuxengineering.com>
Date:   Thu, 19 Aug 2021 16:04:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5480.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tuxengineering.com
X-BWhitelist: no
X-Source-IP: 172.112.25.64
X-Source-L: No
X-Exim-ID: 1mGr4z-001KjG-4H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cpe-172-112-25-64.socal.res.rr.com ([192.168.1.92]) [172.112.25.64]:54114
X-Source-Auth: pat@tuxengineering.com
X-Email-Count: 1
X-Source-Cap: cGF0b2NhcnI7cGF0b2NhcnI7Ym94NTQ4MC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Mike Looijmans et al,

  The attached patch fixes the output clocks in the case when R divider
is zero, but the flag SI5341_OUT_CFG_RDIV_FORCE2 is set. The flag in
this case should take precedence and return parent_rate / 2. Otherwise,
the return value would incorrectly be zero affecting the downstream
output clock rates. This table shows this failing case before the patch:

                         enable  prepare protect                    ...
  clock                   count    count   count   rate        accuracy
-----------------------------------------------------------------------
vcxo_clk                      0        0       0   124999999          0
ref48M                        1        1       0    48000000          0
   clock-generator            0        0       0    13200000          0
      clock-generator.N3      0        0       0           0          0
      clock-generator.N2      0        0       0           0          0
      clock-generator.N1      0        0       0           0          0
      clock-generator.N0      0        0       0   200000000          0
         clock-generator.N3   0        0       0           0          0
         clock-generator.N2   0        0       0           0 ?        0
         clock-generator.N1   0        0       0           0 ?        0
         clock-generator.N0   0        0       0           0 ?        0

  The '?' marks show the zeroed out output clock rates in case the
output divider should've been set to divide-by-2. After the patch, the
output clock rates are shown below:
<...>
         clock-generator.N3   0        0       0           0          0
         clock-generator.N2   0        0       0   100000000          0
         clock-generator.N1   0        0       0   100000000          0
         clock-generator.N0   0        0       0   100000000          0

Regards,
-Pat Carr




From f60f24c9ee88442b888723bae2584863c90dc5cf Mon Sep 17 00:00:00 2001
From: Pat Carr <pat@tuxengineering.com>
Date: Thu, 19 Aug 2021 14:30:21 -0700
Subject: [PATCH] clk: clk-si5341: Fix output_clk_recalc_rate if
RDIV_FORCE2 is
 set

The si5341_output_clk_recalc_rate function returns 0 too early based solely
on the value of r_divider, without checking if SI5341_OUT_CFG_RDIV_FORCE2
is set. If set, the returned value is simply the parent rate divided by 2,
regardless of the value in SI5341_OUT_R_REG.

Signed-off-by: Pat Carr <pat@tuxengineering.com>
---
 drivers/clk/clk-si5341.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 57ae183982d8..bf29a2c9bf87 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -798,6 +798,14 @@ static unsigned long
si5341_output_clk_recalc_rate(struct clk_hw *hw,
 	u32 r_divider;
 	u8 r[3];

+	err = regmap_read(output->data->regmap,
+			SI5341_OUT_CONFIG(output), &val);
+	if (err < 0)
+		return err;
+
+	if (val & SI5341_OUT_CFG_RDIV_FORCE2)
+		return parent_rate / 2;
+
 	err = regmap_bulk_read(output->data->regmap,
 			SI5341_OUT_R_REG(output), r, 3);
 	if (err < 0)
@@ -814,14 +822,6 @@ static unsigned long
si5341_output_clk_recalc_rate(struct clk_hw *hw,
 	r_divider += 1;
 	r_divider <<= 1;

-	err = regmap_read(output->data->regmap,
-			SI5341_OUT_CONFIG(output), &val);
-	if (err < 0)
-		return err;
-
-	if (val & SI5341_OUT_CFG_RDIV_FORCE2)
-		r_divider = 2;
-
 	return parent_rate / r_divider;
 }

-- 
2.25.4

