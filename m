Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A65C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEEL1S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjEEL1R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:17 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDAF1AEDF
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:26:59 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 998AF320030E;
        Fri,  5 May 2023 07:26:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285963; x=1683372363; bh=aDeayAznREjp2nc5iy08WDZJ/h8BA3xR//L
        Y95IARCY=; b=lVcHR8WewpH/yR9jmIdoRBYQ38zBLNsD3tbilYQQjfUJTxjELef
        GcCD4ZanTSU85MzZlU6bIrU5Rarw8hk9vo5CQiFWwOSRSQFLj1WJ9A6FwA3+46yL
        oUKTqrYuvJOvHXhDCttzF3Zlkh3kRNQDoR5kekgmhkqaiQ7FlEZd+YqhdScSWAZC
        zqGDk2/WdeqUttosmaGLVfgUXuNACbARGEbwSMO0M/2/XcUdm/UdMK0PvovnWYHc
        rYo3u9cM32ia7QjNGrCZmqGUb4greLYfxtblMOcZ5oNkXiMgZxTZRvWQ/UwfKDn6
        NphW2+cpOSW91PQD0hp8b77wXsIyP5+Yk6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285963; x=1683372363; bh=aDeayAznREjp2nc5iy08WDZJ/h8BA3xR//L
        Y95IARCY=; b=O/XrTuxpnfss0HVd6aY3Xye6Xvlo9yK+Vkr+7KoKxSC3oAqaRB4
        445Qpu6/FFALGf7UhvfSy5NGuhEFDyeUnj9z5OMeTaLmcojzBCjmTAT5TjIFHGy4
        9gDCD8S8MG6bCMkCdc0xgJXospTcxbnXoBqn0P2JeDCvo8wUr58TpkJCn0Q7IrXV
        M+FQJZzy+sZuPLG7787bfTU6KjQyrJ0RpeOQ0YsqyIF8MDAv2C7V31JDsciVBWQn
        PhHWVijh27FiQY6T9m3wcYLoT/tbPpJaZesMj0oncr2XllmAST+YHVV0/TijXHBe
        dGCh3+0ay+HEj/mEcTmPFFOgtQK/IqNHPqg==
X-ME-Sender: <xms:y-dUZIEwUv6kDK_79txti1vNnhxRYJS2quTvOHlZOYor_yCXGBiQzQ>
    <xme:y-dUZBWpdP3uYgCo-Hg7fgN5MkKWbNhFfpVMT28BFVrPQEPx0UlJGr8sek0lpdbXF
    8ejJRReeCixBLyPTP4>
X-ME-Received: <xmr:y-dUZCI0UccsaFrfdPiiRcfXzTKHgc5EOeXvPfN4YI7NamZcMyiQqstTq6e0TfRSosqKORMOa307OtsksH7hFk4k0wQbZB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:y-dUZKEqpaK1ORrwd3imf52WbfiUoigHspPP09Edox8ODcpGSD3sDA>
    <xmx:y-dUZOWQT8saoZbBe9dBEBjUCkD-lSy1n5uwjoI9tW44wuNGpcix0w>
    <xmx:y-dUZNMLEbclKxOVKQXcqCnwdGazaohssR0EZE9Fv5ctC1IlAWdQfw>
    <xmx:y-dUZLj1I4nrxCEbUulf3iFs7aVpsVDpw1VyplHni8TCAvD5uQdRtw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:02 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:08 +0200
Subject: [PATCH v4 06/68] clk: nodrv: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-6-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TJ2VtIz18atstp2voJ9kvEWV17c/2UfF9HLl2Gj9L34=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxd1Rh+5+KggIC7yd73Qyi0GDX/7/m44dHCm4tY3S3sl
 1znwdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiTD4Mv1km9AWvELS+4JJ3tshh3t
 oZDsrsoQ/3LRV1LXx7K9G9exvD/+KUzsz1TxRuvK24f/SFyOVPwWJvE43UueXVnu4pO25hwAkA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The nodrv clock implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

Even though it's a mock clock and the missing function is harmless,
we'll start to require a determine_rate implementation when set_parent
is set, so let's fill it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5365595433c8..e4a1d5f9694c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4331,11 +4331,18 @@ static int clk_nodrv_set_parent(struct clk_hw *hw, u8 index)
 	return -ENXIO;
 }
 
+static int clk_nodrv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	return -ENXIO;
+}
+
 static const struct clk_ops clk_nodrv_ops = {
 	.enable		= clk_nodrv_prepare_enable,
 	.disable	= clk_nodrv_disable_unprepare,
 	.prepare	= clk_nodrv_prepare_enable,
 	.unprepare	= clk_nodrv_disable_unprepare,
+	.determine_rate	= clk_nodrv_determine_rate,
 	.set_rate	= clk_nodrv_set_rate,
 	.set_parent	= clk_nodrv_set_parent,
 };

-- 
2.40.0

