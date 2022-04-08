Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEEAC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233085AbiDHJQn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbiDHJOj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:39 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8284F123BEB
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:24 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E8F245C0150;
        Fri,  8 Apr 2022 05:11:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 08 Apr 2022 05:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=9iYDuNB99/HaGZR1SRYkT3qUJY9jWW
        yvFJTbIBKS5yk=; b=G9Dh9KG8DXfdmUsrNNmWnDgjo1Wa/OVntfgIydw18fYoey
        OXQYDHwcfhsxjb+NX8T3EXly9oCIpMzyNB8Bg0A1ElbhkwKRMi8kXkqEHV5ovko0
        laAg5/A5jzUZxkngKlgFnuWwL0544xFX85wDOOs9p3/8+uWSprpWkUr2GSFwMk0T
        yp8vWshJhrpEj1+AFfRGbkmJzw3g866k5jsTcEPRXtF93o235dd5t7wZeZofaV+9
        eTL0KyPIlsQ1AU7vZikABnAJR/Y+A3j4h8Lwkg/wgeFPKXxOQ4aWlOn7Y7f6HEAk
        h2rpnsCJe7HenKCe9hQOIRqiuEW3EHXu2H3y+V+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9iYDuN
        B99/HaGZR1SRYkT3qUJY9jWWyvFJTbIBKS5yk=; b=OZHIw1CwylhOYmV0Uu+0eT
        uLUBWhSyCgQUpBBwz15EM6gNVqCzuFalnk2f8zpxxdOk6zJYvbTPtHS5yIHw98Gu
        xGxkWJIh+N7s4tTrueng7R5CWPLUa6d+cUalwvPGZp5qYHqhfYeIPZSibWWpr6q+
        ctJDrjfV21NDI+yBfazfLcJC+VshhxJHby2W4Yz64Nq4vNXgte9OhUvusRRX19Ky
        K5iG43yqMxsIMMJAv8zoGaRPfySh60Kc/Iy62IHcZvy5Ufuc8xfRWLB9x7mlLskf
        1VxdDPJ720hUC8wFB5t++wrKeGudc0fVpkPBsleO04CxFXGX3EMJOyF4NbXledbw
        ==
X-ME-Sender: <xms:O_xPYsfKAHUVgZ9XKTMz5CLHD-j_VsE3jsBg2pJqX09bUawj5gg0Nw>
    <xme:O_xPYuM871BUOd5sIpqA6k5NaWWxrfsIevrWi9hMjYF2FLvbvb1AV3cigzoJfl4jx
    VCNrccCzdFIg6gGsEM>
X-ME-Received: <xmr:O_xPYtg2NVngdqrfzBhvS1S8cFWisb6Xw5Jt3kXfpEUjIO2Ct6LBpxuYdWd6_hDnms4ePn8VPdprmVgqoVA-0aMGC5mzYX7k9JxUtQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:O_xPYh_W8e7PgSbmIKjJXPa43aab4o8WpzXXScdcji2N3tpg60uOpA>
    <xmx:O_xPYovJL4ZfvBCIDbPY2xZemBeYZrVfIuB4PhGTZkJGhDSpG8araA>
    <xmx:O_xPYoFOdujmWbqtfpExceb1H4XFNckIh7Edum2AUp9pUhyJayWrfQ>
    <xmx:O_xPYqK8NFI0_IpO_SG0Fw_ATuERJV5_e0Dq17xfpiphmLRAzSWjBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:23 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 22/22] clk: Prevent a clock without a rate to register
Date:   Fri,  8 Apr 2022 11:10:37 +0200
Message-Id: <20220408091037.2041955-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A rate of 0 for a clock is considered an error, as evidenced by the
documentation of clk_get_rate() and the code of clk_get_rate() and
clk_core_get_rate_nolock().

The main source of that error is if the clock is supposed to have a
parent but is orphan at the moment of the call. This is likely to be
transient and solved later in the life of the system as more clocks are
registered.

The corollary is thus that if a clock is not an orphan, has a parent that
has a rate (so is not an orphan itself either) but returns a rate of 0,
something is wrong in the driver. Let's return an error in such a case.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8bbb6adeeead..e8c55678da85 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
 		rate = 0;
 	core->rate = core->req_rate = rate;
 
+	/*
+	 * If we're not an orphan clock and our parent has a rate, then
+	 * if our rate is 0, something is badly broken in recalc_rate.
+	 */
+	if (!core->orphan && (parent && parent->rate) && !core->rate) {
+		ret = -EINVAL;
+		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
+		goto out;
+	}
+
 	/*
 	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
 	 * don't get accidentally disabled when walking the orphan tree and
-- 
2.35.1

