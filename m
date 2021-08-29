Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EF5C43214
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 20:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C47ED60F55
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 20:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhH2UtW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 16:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234927AbhH2UtV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 16:49:21 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46033C061756
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 13:48:26 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 53D6E1FABE;
        Sun, 29 Aug 2021 22:48:24 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] sdm660 clock-controller cleanup
Date:   Sun, 29 Aug 2021 22:48:18 +0200
Message-Id: <20210829204822.289829-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Following earlier cleanup in gcc to replace parent_names with
parent_data to use pointers to internal clk_hws, this patchset removes
more dependencies on global clock names through clk_parent_data's .name
field, and uses ARRAY_SIZE to determine the number of parent clocks in
the parent_data arrays instead of hardcoding it.

Marijn Suijten (4):
  clk: qcom: gcc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: gpucc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: mmcc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: gpucc-sdm660: Remove fallback to global clock names

 drivers/clk/qcom/gcc-sdm660.c   | 80 ++++++++++++++++-----------------
 drivers/clk/qcom/gpucc-sdm660.c | 15 +++----
 drivers/clk/qcom/mmcc-sdm660.c  | 72 ++++++++++++++---------------
 3 files changed, 83 insertions(+), 84 deletions(-)

-- 
2.33.0

