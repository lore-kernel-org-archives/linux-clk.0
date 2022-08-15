Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6FFC00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbiHOPm3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbiHOPmN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:13 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E0164E6
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 184CD3200904;
        Mon, 15 Aug 2022 11:42:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578129; x=1660664529; bh=zb
        2dVZo2WpyG/1yQQi7ww5p21PRXXtVfeTsvD+y8ezc=; b=f7J64RhQCisNKQxpIo
        w9y1tI0uAqYknT3Ezm7cBzx1jGhSNYypl1nJQwBFcER0jnzPjO4cPnlycrm1UKZ+
        wQKj9bocgw4uuDgG9zvJwSMRa2MjkXbWHLEeywPFyTPtHFZ88O8K8XtPy8/Df8Uo
        5GVxOGYGNFU4LyWvpZ0MK1G83VXKKczlqPHSVkZhawmYIiq+PR3pCQlTn4Rx7+X8
        DOULW3HTJTAsC30OxunoTWXrdPO8gben48yl5X9XYrLZfBE1vMbhDKQmVHCUSvO9
        YgehRsG0SNNkk8w6qqsUEZ1PV7zf9uBVBHYhF9Wj4URBHgeqiuHW+GWxssl+HAGj
        XOxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578129; x=1660664529; bh=zb2dVZo2WpyG/
        1yQQi7ww5p21PRXXtVfeTsvD+y8ezc=; b=xL9WuNUyUslkma6obyFJzdZw2oyXk
        iVlK4Eull0diST3l6f7pVHYNNdtPPKo4EV0ugDHrOViBESGGjeUX7a4jY4m6eJU9
        kyhV30IcukSZray7aIovmKP7UZGitBX4EhjRhxV4LG/jprqSnW0uRubG4+wTmW/c
        nHgeszL/rQw5klyUt0JToNc5/RSwQXj812ZB7RK7mipjsbG5hpfzX9c/hcSpmIHQ
        YQ+4TVHQMH6BWgAfIOe4puGeOYYcGv5PksH5wS73vlIeFDiEuCoVqRjP/Dz263uT
        qjrn5Sj5Dvl65vLo0VQrnygn6akQbI7SPOMZR7zZDy6lpPH6/2hre//7A==
X-ME-Sender: <xms:UWn6Yq6dWXDwb5JpdLCV4qW3qASFDQHJNxsprbAi1Nkcx6SYaOt18g>
    <xme:UWn6Yj6TMOJgD4p44bRZ3whzpWmxY00bI2q6rf6sBYX4hFLsf8Sg1hnQVPwarHyz_
    _RuDUiAyGUu3Jj8MA8>
X-ME-Received: <xmr:UWn6Ype9gGumYX6wMBxRIrMbJFkkPa6GfWLmhZCfdtV6011bYpnpTM3VurUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UWn6YnLPPW5w4RW7XO4txYHQaYO-FxVVWQGwD1ZTVpPlCQjDTQdrUQ>
    <xmx:UWn6YuKDDc69r5r0DkbhQNT1tOlDb2OEXAMxtiSr_VeHZGIvDfQCzA>
    <xmx:UWn6YozPfPFOkvMmxjBImrtGeR5PobOeZiP8h_HAQ3uxf8OdUptDfA>
    <xmx:UWn6YrDSRH-tBFCPf6Hs31KAxH2ypXq2qOGNDUClcGE6XK5xB1rwxA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 04/25] clk: Mention that .recalc_rate can return 0 on error
Date:   Mon, 15 Aug 2022 17:41:26 +0200
Message-Id: <20220815154147.1631441-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Multiple platforms (amlogic, imx8) return 0 when the clock rate cannot
be determined properly by the recalc_rate hook. Mention in the
documentation that the framework is ok with that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/linux/clk-provider.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1615010aa0ec..9a14cfa0d201 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -118,8 +118,9 @@ struct clk_duty {
  *
  * @recalc_rate	Recalculate the rate of this clock, by querying hardware. The
  *		parent rate is an input parameter.  It is up to the caller to
- *		ensure that the prepare_mutex is held across this call.
- *		Returns the calculated rate.  Optional, but recommended - if
+ *		ensure that the prepare_mutex is held across this call. If the
+ *		driver cannot figure out a rate for this clock, it must return
+ *		0. Returns the calculated rate. Optional, but recommended - if
  *		this op is not set then clock rate will be initialized to 0.
  *
  * @round_rate:	Given a target rate as input, returns the closest rate actually
-- 
2.37.1

