Return-Path: <SRS0=0uWh=57=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C43C2BB55
	for <linux-clk@archiver.kernel.org>; Wed, 15 Apr 2020 11:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 998352168B
	for <linux-clk@archiver.kernel.org>; Wed, 15 Apr 2020 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586951239;
	bh=S6wAKXdXmDJgv7u1+X6ARKowSlSQupWIYsmGHU1DPC0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=tUhuvVopXkS4dg+dMl8KrxUJUuBXZ7EdRl4rY+ZHzkPFNIne82oew/6rEPDmrCFHa
	 QZMvVuklJufBmZsUNbE70UY9QUc/20zUf5LfcOeMs84AxPuthlhVuEO3+6neq/nNDJ
	 Qv+WKrNUe+UFJ2zUkICYszQnK+WSPvrUU+lWyCS0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897618AbgDOLrR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Apr 2020 07:47:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409346AbgDOLrN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Apr 2020 07:47:13 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8BFA2168B;
        Wed, 15 Apr 2020 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586951233;
        bh=S6wAKXdXmDJgv7u1+X6ARKowSlSQupWIYsmGHU1DPC0=;
        h=From:To:Cc:Subject:Date:From;
        b=KaA0SrNIyIrrEe09tFojBDHmLp1CttB2rUVTjvY9RlXEFu+yFQrBdqAvU9PDhryJJ
         0cvbk3/hQjDlP3n00WcaUD4bH+yuNQXWmX2OL77fRPKXMXpI1wuM5xu9S9a+cIGcuv
         eBZOUu6szAJ+dXiAxIthtxyZvBzxwm3ReAuWCEWo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 01/30] clk: at91: usb: continue if clk_hw_round_rate() return zero
Date:   Wed, 15 Apr 2020 07:46:42 -0400
Message-Id: <20200415114711.15381-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

[ Upstream commit b0ecf1c6c6e82da4847900fad0272abfd014666d ]

clk_hw_round_rate() may call round rate function of its parents. In case
of SAM9X60 two of USB parrents are PLLA and UPLL. These clocks are
controlled by clk-sam9x60-pll.c driver. The round rate function for this
driver is sam9x60_pll_round_rate() which call in turn
sam9x60_pll_get_best_div_mul(). In case the requested rate is not in the
proper range (rate < characteristics->output[0].min &&
rate > characteristics->output[0].max) the sam9x60_pll_round_rate() will
return a negative number to its caller (called by
clk_core_round_rate_nolock()). clk_hw_round_rate() will return zero in
case a negative number is returned by clk_core_round_rate_nolock(). With
this, the USB clock will continue its rate computation even caller of
clk_hw_round_rate() returned an error. With this, the USB clock on SAM9X60
may not chose the best parent. I detected this after a suspend/resume
cycle on SAM9X60.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Link: https://lkml.kernel.org/r/1579261009-4573-2-git-send-email-claudiu.beznea@microchip.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/at91/clk-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 791770a563fcc..6fac6383d024e 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -78,6 +78,9 @@ static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 			tmp_parent_rate = req->rate * div;
 			tmp_parent_rate = clk_hw_round_rate(parent,
 							   tmp_parent_rate);
+			if (!tmp_parent_rate)
+				continue;
+
 			tmp_rate = DIV_ROUND_CLOSEST(tmp_parent_rate, div);
 			if (tmp_rate < req->rate)
 				tmp_diff = req->rate - tmp_rate;
-- 
2.20.1

