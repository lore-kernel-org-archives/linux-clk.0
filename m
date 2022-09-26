Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5C1C6FA82
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 08:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbiIZIph (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbiIZIpZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 04:45:25 -0400
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A76B140B3
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 01:45:18 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 61A482B069A7;
        Mon, 26 Sep 2022 04:45:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 26 Sep 2022 04:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1664181912; x=1664189112; bh=T4c5eVxgK3
        BG8uSr94/t3a0B5fa3XyluaqBQA1l+ORI=; b=sfH10vQHLfc4+hg8w1JIuhzfwd
        rB09WPG91gXxM69eZkgVQ86J4avVECcYD475YoJKf1TK9dPAlxsv4riYRnxR952U
        hJUE4hscg/dE3sUNzBkS1NLdVMsClmjy+zEL8Oorili1TKSK6h43kMqQaGv4LdCi
        UvOdFf3csVmCcKMAJcf5D9LO0zKQovQ0CALz5qbivTgLksX5RJS7tOijIDVu9fK6
        Osi93J3arNr4RMVDjKgn2WTWgWtH/XxR153bpCYhSlQ1h0NhYZKLk9+o/Zh5+tUo
        rWFW6t4lH/aS4qrbQTHuIQl84YmQjxnY+4sMyoWnficoswnMT3DYyxCaz1kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1664181912; x=1664189112; bh=T4c5eVxgK3BG8
        uSr94/t3a0B5fa3XyluaqBQA1l+ORI=; b=g5VLQEqcBxrrScjzpYcbrMaAPQ93K
        cjzt/16sFUmcFzMSHc13vDUWEjQfZ3OOOeLuVvW4pU2R6YpjZe7ZMgfAK3uAl65i
        WmeqzagMrcZzV9Z25+hYQmydgKtFZ4Mmo7ehbCA6ZKhDfyzss8QMIGEln4xGUQWh
        LiotyycbvfCtQbjw7argpNf7OfIH6JqQTu3qqUfFePovBj6tMBgqboXE1BV35vZC
        +4QAQFeOcNrVtMOms/hJSsOj9Z+09C7BKLjZ8TLN7EG25An9MxF0xGPO7E+obOy5
        81AW6JVVu9LAcoIEUpuNOz5+zk+isM7ofAEDD73MwMXSxwVtDVTqUUAkA==
X-ME-Sender: <xms:mGYxY1dhWVBt6tpjxo7WkOmIWkp27KfnSyKqjb_qQpn20sFfm9lJNg>
    <xme:mGYxYzO4rPkN3T7xdbWivvo6xCZB4P7EDHbyyGuOBU9mUXRmKKsnnxsB4j_3VI5AW
    _kimrY1wQlypoTjGKk>
X-ME-Received: <xmr:mGYxY-iXbHxXAw613OIl56ifBVXQmYpGJ7cRSJvU4St6sRexiCARDZCSI0Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgffgteeihfeiudetleeuleetffdvffdugfevkeduueelgfetjeehjefffedt
    vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mGYxY--JegnX1irK2aZgpUuRgki-YW20eaotmE3iR4Bu_6Vm-fGLFQ>
    <xmx:mGYxYxs5scctSoQcRxsHlhEeGTSm45iSafAIpo3P9HzQD9wBBuI7Bw>
    <xmx:mGYxY9Eujs-Rid0oqD9lz8scFxERClfK5zoU7v9gOmCVLi1yEfYhdw>
    <xmx:mGYxY6MznFPKxvGT705Y1W4_oBdHO1VmvRlt8lZNxHhEPVzxoYVkFLe5jVM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 04:45:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH] clk: bcm2835: Make peripheral PLLC critical
Date:   Mon, 26 Sep 2022 10:45:09 +0200
Message-Id: <20220926084509.12233-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When testing for a series affecting the VEC, it was discovered that
turning off and on the VEC clock is crashing the system.

It turns out that, when disabling the VEC clock, it's the only child of
the PLLC-per clock which will also get disabled. The source of the crash
is PLLC-per being disabled.

It's likely that some other device might not take a clock reference that
it actually needs, but it's unclear which at this point. Let's make
PLLC-per critical so that we don't have that crash.

Reported-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 48a1eb9f2d55..19de0e83b65d 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1784,7 +1784,7 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.load_mask = CM_PLLC_LOADPER,
 		.hold_mask = CM_PLLC_HOLDPER,
 		.fixed_divider = 1,
-		.flags = CLK_SET_RATE_PARENT),
+		.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 
 	/*
 	 * PLLD is the display PLL, used to drive DSI display panels.
-- 
2.37.3

