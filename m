Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ED7C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjEEL2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbjEEL2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:04 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F149A5E6
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:48 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 052913200A70;
        Fri,  5 May 2023 07:26:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286017; x=1683372417; bh=fHOG4G+jbvy8zRHukX20xbsE1/tv1vqzKXC
        ogmnq9LU=; b=JUaTZkrQH+EicUE8mIh6tlwiknAvwIc+KLUfXfrGJ/O9cZ09M04
        12WOSDRLvc3+AOxaE27N1hRfbkOAGOXcdozWQgOdBuUHSsqiV5zo8E5BTn56ngmo
        dM9Iu6SfTmUi3LKfNbO5THUI15jHS6VAMYnSFOJG7g9eW1F2syd/7oZ4fr/7ubdZ
        0y2tUmQDLfzCPS4Y9L/+4Ig3zVumQHVRQEt5O+/l69bJCAmw00TKyoDobgjrJhSn
        eBokfEPz+0EQNa0hk3AwSRn8T05xn2B5FGg3la9fDgBH4bGEz40OiG7Kj9bRoAps
        AMLN6ZsYC87J6HcvZ+LLGy1CXAzJSBatJgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286017; x=1683372417; bh=fHOG4G+jbvy8zRHukX20xbsE1/tv1vqzKXC
        ogmnq9LU=; b=TFHfal6VDGeBsIiojYffeKQ0T0bPiJP/OKWtwz/llJLTZ6dD8AO
        9SdwLd70uCtJOZJhl6oq7xDzbooyFfHIueXo+nFwsrMJhulq83z5E8IBo7dWxz3B
        ZEURV3xK6pWpgIKeE1sqpZwsh0bFHfd2t99pVreYPDjEtUzHb0FwTdcl74BNjVGF
        SqP2WAEn2Y7qqgyqQ9sKoQ/0HxT96T0W0cFvJxF5hWa62i4LUSVMbbLmTKWiclDT
        8/RK87nXwTxnG5i29kZ4oiB0yZ7Tk3m9TdUED7lb195bZNDUkPKtWaNhUwonJKdE
        HhnT6a3DIiwAgPpbxFRrCzZdxWimf+cu7Vw==
X-ME-Sender: <xms:AehUZIeD2yv-xxt9u_sKjzMvVU_IONolfKuggSkL8dFAR8ssj9ewHA>
    <xme:AehUZKNmDH-1RWzYxU-rqH9Kmke5SoB8iMQkV_woLjPpbxgwIf_seBIrHb1yM63M2
    fNbhUQo7RnfEHL1kyE>
X-ME-Received: <xmr:AehUZJh9IiyR0yiGbxsxVPXSn2Yomwlk4-QYAmP7GOXb99W7s8AU2dPJIKJoxorySQD_6YwB-6hyjoO2djsR0SZqyq6RO3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AehUZN91iaQDasZZh8syVqzD6plqR26cIm32rm5AiCclv4-jktcClA>
    <xmx:AehUZEtORdaOQbVeJUjetRiFTmlVORc5CZm5jBdAHBCx2KCm75Hcww>
    <xmx:AehUZEFU5DcvLvOl08BFueFyBMUFKZ38DNN4jrDMDzIQr8zB0vMXhw>
    <xmx:AehUZGL55wnovMrWMLZl7AYp03nJSGQd9syZjClZ8De2LtPDshh4sg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:57 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:27 +0200
Subject: [PATCH v4 25/68] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-25-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=txOLR5CD/Ee5Qs94cdaqi9AMwqcaHScbOv1JLy0vu3M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxebG3hs6Xvk3iOxr9n1jtb0o+vMb+j825n8+MmxFI31
 WwNXdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiWtGMDL0u2rZKAo1/P1TwtrqU2r
 9/udgu0FYuVHfaugm5mpccTzL8U+MqSl8us3GpQJ4Rt5HOwcO/35lK7nS8n+YeFultXr+dBQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Davinci DA8xxx cfgchip "clk48" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 11fcf6f63336..1bbcc8e43bc5 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -565,6 +565,7 @@ static u8 da8xx_usb1_clk48_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_usb1_clk48_ops = {
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.set_parent	= da8xx_usb1_clk48_set_parent,
 	.get_parent	= da8xx_usb1_clk48_get_parent,
 };

-- 
2.40.0

