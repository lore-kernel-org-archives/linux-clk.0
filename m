Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400B6C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiDHJP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiDHJOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:01 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1705E1E8177
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:50 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7A15A5C0066;
        Fri,  8 Apr 2022 05:10:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 05:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=fIh2/tlDv5bZMkYKujgTLCP/4yqIPd
        sGwc8wBUovuEw=; b=v3WUiGJPtcqNPSGlX4WsZS/qsI79Kc76/7ILBgRQepoIWE
        quDnTc5ko3rsYi/oEB6uXZB8r8EZoMXX1J8JNPTDn+L1F8FUDIdfg39qzr98v+BI
        Z9SZB54KHTtc1vqZu+zdHDfPqpMiD7C8r/e+RfyWeqAzjRsb6RYnRAzjCQki1BBD
        EmyEMnyt4GXLTMhWbsWgBhcG2rcJKyqt6hSVXrIrlKIncTkrSckryo3RnR07A8Gh
        YotIljxZKexrbybRVjom+uP8vIAsh32ybhErE/G9li2RbI9dCToISxiG4Ole++zM
        fpCj5TheUXaVJ3grSjM6VvncDlkszghRXhqQUCJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fIh2/t
        lDv5bZMkYKujgTLCP/4yqIPdsGwc8wBUovuEw=; b=lCffPVkDNnPUhqW0H6cNG2
        m8jWBhMhxzXgRwtbPdrlRTPj1dEfAASU5DJvRbP1fHrySsHMfaloRITPp/vYy3Gz
        D/fVAYbiY7IveQdZA5Y2AS4idIqMFqJQZueLWze0lxoNO+/pECnDD6VgkKla66JB
        eb0zT+JyTOJqLHfdD+iDyrMU8PMoUxpUu7AGDgMnNHKaSONmz8BQIRUfsBmzHi3x
        VsXraJQpRWRF1PxzDtI4QWz9i+Ja6sI53bW3uCLBeQa49qwdGAHe182w1fCWlyZQ
        jHdl57iHauvJNyAb9mC2UY5hK2cgbfq3NKWZSfF0jm6AfB0/+BP3IHGHafMLSCCA
        ==
X-ME-Sender: <xms:GPxPYsSS5BfXbrdAFlVRP_CNvacwP90VQNOdgvCtmDJK_6qe8l56mQ>
    <xme:GPxPYpyx1BRf0ZkW4gGAyWbxaInZ73t3DWzEQXT4fkBXcCSaxuxsC3hgVv7uF38bI
    tu8Wz5kgGf30iEAyXU>
X-ME-Received: <xmr:GPxPYp0fUvEa-jiZwV63_dzty5JDeKe3kzthlyCqSwztiP8pB4IciKcVnSrSAuxAdIZYXozQ0F5wlh_HkWBDcwzLjbFDb_wYMJnpyQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeetueeludeikefgheethfefgfektdfgheefleetheffuddvleegffekvdfh
    vdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GPxPYgDw_Rd-EyDcwYX5CdzMrKwT-tNHnQYAJs0-T07gOX_jLoDnrQ>
    <xmx:GPxPYlj0AtnJsKEVnQPzsaPasQ9YMs1RBX41rwmWltqPtWjegliAWw>
    <xmx:GPxPYsq1zx8i15JFmI0bLrN4CzNsNlPvt3ANB3TkwWwSyiOeeN3khQ>
    <xmx:GfxPYsMQb_C-B8rAmNtRDiTQF79JTBriJwq6jknPwPeQmv8rToSjnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:48 -0400 (EDT)
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
Subject: [PATCH 03/22] clk: tests: Add reference to the orphan mux bug report
Date:   Fri,  8 Apr 2022 11:10:18 +0200
Message-Id: <20220408091037.2041955-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some more context might be useful for unit-tests covering a previously
reported bug, so let's add a link to the discussion for that bug.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 663b3dd388f7..e86212be74e2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -314,6 +314,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
+ *
+ * See:
+ * https://lore.kernel.org/linux-clk/7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com/
  */
 static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
-- 
2.35.1

