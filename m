Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68040C2BB41
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbiHPLxM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbiHPLwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:54 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A95D5724
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:29 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9437C3200657;
        Tue, 16 Aug 2022 07:27:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649245; x=1660735645; bh=KC
        2kRBMKlZTS+P0FFMYYilN2O+LYi9UzyMErHe/hOkI=; b=W2iVfroJXnKIhDR4Ln
        dNfcUZ2wu6PuDtgyMrsQFr6s3mg5UL73iYKFSR7bd9a+Bof5+fmdYyVmFYFBT+kq
        LOkiNOeg13w/mnmIsTiiXLqNyoGnqor+w1cyoVqT6qerze7KDj5+SIxyER+5hpx2
        aK0KhBdGIuJlCn7IEPDxCFGqriVcDNaaXcmJPYFErP7Q97AljftE5l5tH7DZpl65
        sP+fwTqR7b36Mpal/d9kKg0GRjcyS+oQYbwgf9jfkPXLjNVVHJxBxPqS5GfYYNwf
        +3yAcAr/FUbyp9MVFAUjPUs05HjCEQ/lBXJWMBQoFG645FtsJGZ0FHOKxubaqE2L
        XaiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649245; x=1660735645; bh=KC2kRBMKlZTS+
        P0FFMYYilN2O+LYi9UzyMErHe/hOkI=; b=h0Um8RIpOZocpkZB+7haj1Zituf8A
        CUjp1gcRa5jRTXgGqecu28Lwmt5kXXcdMhKdvyycMrCLnIIvuvxaWBYS0ymNkWMY
        10ak4ZSnMZsxZvBbnXRV2qbkCsnOODitMvQON0cmX8Q5fa5wkBgEhjG5NwJa827T
        qNmcdLbyVLcE7CjEpegdiAJQFGjg0CX/7UQZE4Uu/FDX41UqVOG4BlLiic9qWoDZ
        KOtQDHxtHJqDG4fzTCdMYWr5iTuCiKs6lMJyRdFnQmckpBpL895gX+oRjdc+/ZkL
        v1A8E0cF2R4Rvl9kICXFJJ7ku/r5k+2uDuy030hpYIezaAs5DDWLV2NJg==
X-ME-Sender: <xms:HH_7YmOkyYw2-RfEzEpCuLx_xmT2dJZ1PBGYHL7ju8Bf6Meeaf-j-g>
    <xme:HH_7Yk8Mxsh3EiCP4ZObdo_Wy6S6Jmauys8mTmRKjcYeH_IenDHePP4rObHHxyy88
    mZr5UjCB_5T13vdSi4>
X-ME-Received: <xmr:HH_7YtSPlj2n0UBMeU9EFPMCW-ay8N-XEFyn-fWp17KPrqkDN4yby4igXms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HH_7YmshpzJ2XegKOx6_NgNp6b65urDUE_ySm4E2TpV2DucWZDkwIQ>
    <xmx:HH_7YucgF44wQ9drta0V6gqj7xvq3T6yCjSFrmdYLDk8I6a7lgj3dg>
    <xmx:HH_7Yq0oQ29VifRpbjfQGifsFjJqKbmp3nUiMOlw7dTM8nSDn25BuA>
    <xmx:HX_7YvW6M1sNSBIAqYrrNH51hyjgbMUUZkt57ky5M6y4eRlbRXPF8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:24 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 24/25] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Tue, 16 Aug 2022 13:25:29 +0200
Message-Id: <20220816112530.1837489-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gfx3d clock is hand-crafting its own clk_rate_request in
clk_gfx3d_determine_rate to pass to the parent of that clock.

However, since the clk_rate_request is zero'd at creation, it will have
a max_rate of 0 which will break any code depending on the clock
boundaries.

That includes the recent commit 948fb0969eae ("clk: Always clamp the
rounded rate") which will clamp the rate given to clk_round_rate() to
the current clock boundaries.

For the gfx3d clock, it means that since both the min_rate and max_rate
fields are set at zero, clk_round_rate() now always return 0.

Let's initialize the min_rate and max_rate fields properly for that
clock.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 28019edd2a50..ee536b457952 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -908,6 +908,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
+	clk_hw_get_rate_range(req->best_parent_hw,
+			      &parent_req.min_rate, &parent_req.max_rate);
+
+	if (req->min_rate > parent_req.min_rate)
+		parent_req.min_rate = req->min_rate;
+
+	if (req->max_rate < parent_req.max_rate)
+		parent_req.max_rate = req->max_rate;
+
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;
-- 
2.37.1

