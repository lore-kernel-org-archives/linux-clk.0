Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5373C07E95
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 14:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8976861376
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 14:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhGJOEV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jul 2021 10:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhGJOEV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jul 2021 10:04:21 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C82FC0613E8
        for <linux-clk@vger.kernel.org>; Sat, 10 Jul 2021 07:01:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e20so13374187ljn.8
        for <linux-clk@vger.kernel.org>; Sat, 10 Jul 2021 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyNbyI7pzC6UK7axF6cRmMmWcnYS9nhsCm52zT1gz64=;
        b=P4oBlLXkXqLAa858geb+PpQ/9ZqmAzrF+deTIyCsjW7Vuc3xYM0nZ2qUPpApEIsDsl
         OFxvcNANv5TI9mRzCIRV9kBf63pwb5z1srdjZ+AAo+SibCtU/wPRLrZ0d9atPLfSG4Jt
         vgn2vBVH7UceAlowQokTeSlKDeJJh5rLvgg16o65W0navu25Jvhw/zbyAPNYxCCBQuhJ
         n0PkbeuBr0MPg3YVY9/NKGUZo/HY6DzLYUqrOAUPqLL3vwIg5csRS9zWHZKDOAqGmnBf
         qxJcz74GcO5W8WnJlt50+v4dUGQ6xtxLU+dMgGYPJqclJwRKM01Qm86EebdayzZf9VFe
         2PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyNbyI7pzC6UK7axF6cRmMmWcnYS9nhsCm52zT1gz64=;
        b=KXDZmOf2Oi3XDb5cn8pUymnTGd2JEH3P9hVAPdOqdbfbyGVUrJkphIpXlsBq7AWDqW
         x8jb8Mv0GOt1T6CQxXKVLXzrYq8q2QWlNKac6Z62NW2vEihNoFq1mepTSyXDRa7TjtAS
         y9Rde//QSJNfTJPt/EHwbEjydtTHxqNveOheHVE6F+ZQ7vE248qzxPNFM8tRrpC93zV3
         IsZ4zH5Q8FBUil4S22pSc5Fn/50k687Pq29lFZxi8WtDvzHL44E6CjGxN1jcSbvytD+S
         wsP6p32SPppfrQf92bBO2o9IIWfBmYAc0f2tKBJwJUuJGzmaa0s2rN0W56qVP30GdnyL
         w6AQ==
X-Gm-Message-State: AOAM531AIkDZWARdlBHiJvyfzh+Szh7tqratP+JsuZz25PQ7CUCw+srd
        A6Gilm02JvIsCn3/dNUy4wE2hQ==
X-Google-Smtp-Source: ABdhPJzTzZmQTIReZvAjyWoI2EGDK7EGsjL2VbQoQqw8689TBqZtfWxJSkpRygTPwLkRDnjhLorE5Q==
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr3115089ljj.251.1625925694264;
        Sat, 10 Jul 2021 07:01:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o17sm716111lfr.253.2021.07.10.07.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 07:01:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/2] clk: qcom: move pm_clk handling to common code
Date:   Sat, 10 Jul 2021 17:01:28 +0300
Message-Id: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Several Qualcomm clock controller drivers use pm_clk functionality.
Instead of having common code in all the drivers, move the pm_clk
handling to the qcom_cc_map/qcom_cc_probe.

Note, this was compile tested only.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      clk: qcom: use common code for qcom_cc_probe_by_index
      clk: qcom: move pm_clk functionality into common code

 drivers/clk/qcom/camcc-sc7180.c       |  44 ++---------
 drivers/clk/qcom/common.c             | 134 ++++++++++++++++++++++++++++------
 drivers/clk/qcom/common.h             |   6 ++
 drivers/clk/qcom/lpasscorecc-sc7180.c |  56 +++-----------
 drivers/clk/qcom/mss-sc7180.c         |  40 ++--------
 drivers/clk/qcom/q6sstop-qcs404.c     |  36 ++-------
 drivers/clk/qcom/turingcc-qcs404.c    |  34 ++-------
 7 files changed, 152 insertions(+), 198 deletions(-)


