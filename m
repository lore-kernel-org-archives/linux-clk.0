Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D34C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjEEL1U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjEEL1T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:19 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C367EED
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:01 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 474183200907;
        Fri,  5 May 2023 07:25:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 05 May 2023 07:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285938; x=1683372338; bh=KmlNrpzHoElAQRzBqUSUD3C9LEn+qtKAG3F
        FPNwwU1k=; b=sscYqHlU08Svb8oA9ZzR93VEaJ2jamsSb7EwptDrmlxgmsiDzPU
        W67xX3+lEB47Booez3AmtzEGegRna5IANFU69GdpCuo3qbNOK+5KCSm7hl/cQUot
        75G2mP9tGbWokmAJr9wVGIe/qln4SaPsGvZpDqyqQY8aVdGAu0IfC8Sr+//6xOD2
        AvMCJTiuRArjwTmjoXR0WTAh5TBxdYLoNval64rnsUqQIUtQ7yNNKSC3Vu6SSAzi
        MUMWXBaS/+FrkqcAFvIDFO91GqwpKr0+dwxhS6wp1lRoXBo2tE9htHGRa9DP5kye
        dFn/HVQZul5lcKxW84onUO1+f+nWPJvvagQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285938; x=1683372338; bh=KmlNrpzHoElAQRzBqUSUD3C9LEn+qtKAG3F
        FPNwwU1k=; b=K9837E2lbpDXYH3uCp5Q4dVcADRWRIHbWc+TeIwV03/RRgeeCXL
        2CxqfUhJ3wgITt+90fbJGRHos1FuaF9Ksp9FbEws8iJxMQdtkKSF/D8hqO1q7MTM
        glxRa83PafeKmIP3y7FJJePRrsbBDk65TFlOu5GHBr41c4EEVRXzrwDvkgb64Iks
        So6HWiPv2F3+pw6DtyJZUMwhCVSkJRhg4qtgXY0gSmxd4esbx1cla9aDEwKOlusA
        6JfMgH4MEtnloVio2V6VXO53dJinJW5Mj52XZpWvsw3PWHA9oEXURsrvdgYoewmw
        dXSr2NzqRkt3P+dHq8Apqr5dSsswkoAGu6g==
X-ME-Sender: <xms:sudUZFpCqjXkLh_CE0NAl7sxGPylRtBFgo-nD5kG8cSezKXRCuteng>
    <xme:sudUZHo4CVDPYAGcWBlVgeOsMFs4h5QnUBsGETPpHiy9uRynfrSN3E3I2BJURvhSE
    W30DWcAIv1aoIN_fPE>
X-ME-Received: <xmr:sudUZCMAgzD5ybEKWKTFcPWyvg4npcekWn1mQCp0z-0n7juXTs-k9xZNKCeOtWs4_7aLi5SKRsNjMh3QHmipSxqPJ_CAup8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sudUZA7tDRnQIEeVzMSkTrAJmLgrogQjejtSeHKdL76lc3ac6kSDcA>
    <xmx:sudUZE5HFBcXQzAbK2Pm3Lv9IrxZUKYCS8Hl8xVmSbkGdYE0QFV3_Q>
    <xmx:sudUZIgMgex_5giZQ4pY-PztetAuHhPS27g5njtGTSOtU8CYd0nejA>
    <xmx:sudUZEGw9w4uFo1MM7hLWfDmKwMdoUdWpn1ab8o5yekPmAwTwUvifg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:38 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:03 +0200
Subject: [PATCH v4 01/68] clk: Export clk_hw_forward_rate_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-1-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EdAdQIBHVdRBX62p/4t9OofGeohozwi8Dx8GdAuKfXA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxe12hZyVHEckItlm/HsIQt7QRHnRy/3Ce+r2efpHFl0
 mk+5o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOJesXI8GfS31dlX619O79fOHtF+I
 lQ8vFJLl2bWV+aHOXWe9tn1sbw36XM+4inDrP6kaVHNn7c5nAx2eKewMpki3QLJ9Vp0TpbWQE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the
parent") introduced the public clk_hw_forward_rate_request() function,
but didn't export the symbol. Make sure it's the case.

Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the parent")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 27c30a533759..e495dd7a1eae 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1549,6 +1549,7 @@ void clk_hw_forward_rate_request(const struct clk_hw *hw,
 				  parent->core, req,
 				  parent_rate);
 }
+EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {

-- 
2.40.0

