Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C96C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 10:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244096AbiCYLAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 07:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346224AbiCYLAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 07:00:06 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069764AE36
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 03:58:29 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 8A0385C0051;
        Fri, 25 Mar 2022 06:58:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 25 Mar 2022 06:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=8r7t2v8slyq37pMiLh7npibLuc0RE1WTRjMQYY
        t+jv0=; b=NItixDzqNbkYDiXRmOShGushnaNKUd2jkOzj3wUgWY46X5HNtzskUS
        IDHHuCGxPnVHZ5bEZC+u4dUUeZd+5Wjr/73NvAObS5w7/Qo8pStK4hV+dgc6s/Kv
        APhoiJOh+96nDesCIP6A1st9P5Q023yazH9qBZYFxes8ARSNP4NNXYjhFucVsPOj
        /vku7LhPpPOaZu4jtQPep9v3NvAAxsFWiqLWRFElE8KhZKx21s/CwWX+uzVWUyBI
        oI4gLfx04bqyjzXo8e6ie/t+WKcDoByA4aPBk5Vu6MwXnmkz56N+18BS6cYT91ZK
        NidlC1YBQKQB8GxoElxYaue9i/P18Lag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8r7t2v
        8slyq37pMiLh7npibLuc0RE1WTRjMQYYt+jv0=; b=WFEJxwL8wrcsgAlsMq7Qz2
        5TG2E/uPeaVAjvWPHxu2iJr3g4xB1yJftNODxvVxmpeWc+qBTjGT8S9+HZX5p/ez
        1eCiHyJN4TP8T4JtWLFdyrKaZxsxWFUnZqe7q8xyOOnMhf8O9b33fld/CfDZWvEc
        tIA34R9YF8isBulDYMiTlYOl+OJ8xdVyCPvPz1r7nCxTDwIS7nJIx09uyBxofqIX
        LDDO+ug1My7EoUB+MaZH7ytV4Wf9i06a+HHkeYxgHfS3Ix5oNJ+UhaV2wQCL8dPP
        1FlhE3fKC9tX2bmziwuuL5GYWASOxBHtxQ39r8MvxRfQYtU4jEsVpOgD7sePXyDQ
        ==
X-ME-Sender: <xms:UaA9YvlOH9yQ3LI3brsoROedXe9y6YkKSglNkpe5iMVzeiTYdZ-X3w>
    <xme:UaA9Yi1yyt1PCuJqkhJvzUuf8sp7APEODffvBQp7pySheAPXOvpKTLsb_XfQ1J0OH
    vXtF1s5cJK2L-2j8ac>
X-ME-Received: <xmr:UaA9Ylpjo5AH3ByvGb3vL5BCJmKRZCr973Zw2lycr-UrJ1QYkJTCkozeDb8hKXej1gpFgXNgtCW73XHQ3kDqwYQLUub8iC4g-hRrK7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UaA9YnmVr0g3vIc32iC8xPHCWhXjNs0XXPwoELBJMrXAS_4c-iHipQ>
    <xmx:UaA9Yt0e3agPdNfpyYLo9rxe-sN-aA6wWTNwBMxrQmz1lD_fazBrWQ>
    <xmx:UaA9YmtOgyqVvQn3kXlZK9Ain3jLeuiIirDBj5bDOAqO1YrF3VTxsQ>
    <xmx:UqA9Ymz2wLhOrgFOemNTHi6RUiHgxAdHR4F5YYXS2HgzYwO8nmk6iw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 06:58:25 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/3] clk: Some Clock Range Fixes
Date:   Fri, 25 Mar 2022 11:58:19 +0100
Message-Id: <20220325105822.1723827-1-maxime@cerno.tech>
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
Maxime Ripard (3):=0D
  clk: Initialize orphan req_rate=0D
  clk: test: Test clk_set_rate_range on orphan mux=0D
  clk: Drop the rate range on clk_put=0D
=0D
 drivers/clk/clk.c      |  47 +++++++--=0D
 drivers/clk/clk_test.c | 213 +++++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 254 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
