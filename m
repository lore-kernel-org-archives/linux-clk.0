Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF14C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 16:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359666AbiCYQN1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 12:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359737AbiCYQNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 12:13:24 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79EB8B6D4
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 09:11:49 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 613375C00AC;
        Fri, 25 Mar 2022 12:11:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Mar 2022 12:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=pi2Mj0DSKt1bGVPMqx8o0bED0TLqqiqKF1litn
        rdYCA=; b=aXbb0WEmssrtEERQ23i/9wPu8u+Srvz2CHZ7d1yzxub67rDaJ8tFH4
        Sa0BlUZWoNqmbsInvruUpcodK4qI1xbO31vhk4z/GH3lT1XxGBdHugl799OBbJlf
        fsfz4FMh4CwvMGJrtSB7nTXtmGvUKLuXDJhRE2LXLxP9Euri3dNhppoD2T2hJ4Ll
        Sawfa6aZ6I+qqwJni7GC+my2A6nfun9GAvtdetsneC/Y5xuNpFPzXEv1C/IoaKZn
        hVetq3aAlgmCazHY709DcEuQ3lMqXhrAQ+/rn7l2CIpAkXye108DYIfBn5YVlZeH
        MAvvFIQC1EoUvSZmp+Wqo0p3COcfz18Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pi2Mj0
        DSKt1bGVPMqx8o0bED0TLqqiqKF1litnrdYCA=; b=QpXdba8LTBiQd6eEQsDnpt
        ujnwTqODMsX5N05DJmwd/Kx9Du3iyudwU5o+nGGuaaX+FSLGPXKpsrO0VagIJiQ4
        WTFLC01FGsIKvAIZRkoouTh16sQJO6mFSTEDLtVAwP2d/p99aTTtB7PWv86wDH3Z
        HlmIdruAKyi24zxcF+tXXJw+KwYqXk6pR+vZeb+BFbeO+vqisDu8TyDSR/+Aqtl3
        qPv/Cunu0N3tsYzQ9gvslLvS/kbRsgFn56RaE+RnUTBz0tumpEPJM0or3S/bbV8j
        colMmXysg21rOv3V3UiB3Pu54aYlwuq1ZiMT42S7IjTKTFG903j6DvZlox+lIyMQ
        ==
X-ME-Sender: <xms:wuk9Ypr4BLACBmkR_W_n-Aly52BPToz6tYB6WFBS_nC9d_gXgO_Zog>
    <xme:wuk9YrpRZmsBiog3Dszv20C2lZNimTzoO9WzCFzsGpviMb9Db1fHmYys929VdnIal
    HOFXhsStBdb8kgDsjc>
X-ME-Received: <xmr:wuk9YmNA1kKGM5EORGpKYX-RZPC0tRsWe4tsBy-wTR26Ln8voRTxOMDlLaO_9VuCpx4CVE6eoA0h9rjCu64VajMp6pdMJikMBLDLOQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wuk9Yk7IOW0syJLXdfYW8KmLQjw4lCzF-ziwZTUv-wTA0cPff29BYw>
    <xmx:wuk9Yo4hvPOsFL5ysFZEslbCushmx5ngikLKTX306SDYmJlKBzxOpA>
    <xmx:wuk9Ysh5DmEk8w3cQ51LvLZ4GG0mT_zGxgv2BHmk0Zg9RUTQmdH27Q>
    <xmx:w-k9YmlQETgqpM0bZsGN-dSUh0Dm4WkTgQ5Hxme39OMpriA7ohT9og>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 12:11:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 0/3] clk: Some Clock Range Fixes
Date:   Fri, 25 Mar 2022 17:11:41 +0100
Message-Id: <20220325161144.1901695-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,=0D
=0D
This fixes one regression for Tegra30 reported by Dmitry, and another issue=
 I=0D
came across while looking at it.=0D
=0D
We're also adding a bunch of unit tests to cover those cases.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Removed duplicate documentation=0D
=0D
Maxime Ripard (3):=0D
  clk: Initialize orphan req_rate=0D
  clk: test: Test clk_set_rate_range on orphan mux=0D
  clk: Drop the rate range on clk_put=0D
=0D
 drivers/clk/clk.c      |  55 ++++++++---=0D
 drivers/clk/clk_test.c | 213 +++++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 254 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
