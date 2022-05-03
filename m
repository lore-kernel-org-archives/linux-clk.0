Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBD6C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 13:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbiECNId (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 09:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235810AbiECNIa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 09:08:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16ECE245AD
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 06:04:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id l7so33353512ejn.2
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2iTBHUMgc9O6iYAm1ylwqmDXmtMF3u0H907cZiaL8w=;
        b=oIB3oc83K0ugG58GKCh/6ddbBZURbRvELGborvc6uNGqfRZMLjbNpDzHATG2P5i826
         FZKbJ1nh5MMtgMeyzxQvifX0PkujtwYbuhuy5lWD134H49bVd8AuTqt/75ooJqQCiVPe
         8FlTmkKSTJlk5zrHwX42e1YVW53TU6FHTCV9ii3bK/IvF52QrbBUDEVfQRWW+DybshPE
         OzKfwWXMc+vUkSeyv6w6roVCA9SeXBBjjcG+STU00gCydZqC4OBFJP4yO0pLzJXwv9xa
         pz7glrIf5QsQhpnJuMqY8h3+Xi7atAmbLNTysxqNXq7535VS/84XqKicweoKgcvmCLgk
         3Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2iTBHUMgc9O6iYAm1ylwqmDXmtMF3u0H907cZiaL8w=;
        b=HKzLY/tf/zME7z0Ra+nOGngIRdhrSpztW4r3re2LhiO3oKNHhAC7iyT7K85Jt5m+GW
         +uBaU6LgJOFle8Z9uOodnq59BkN5vXeF+lS3kDy+DmJWrypQfyrwKWH40xgWZ3+5m5Hd
         byPzSLkIAGAWu+lZrbZqWtLC7iS0bw0/osepAjejpmHcZl9+fJBN0ZsRHB2tlaJkUdF+
         pDNIv8COGHbS1XuVMAkb8bQZeGiIqC+XvDWKj5ElFgChvL6wRA0bIMYAJjjv0q9zMvrA
         ZGcAOs9pSTA3kx8St1k7krR/GAJpJuy20pt/cPJ4jO308XWNn7wD6j6QAPyPfqkCZwNM
         Bgyw==
X-Gm-Message-State: AOAM532+ToPcdhD5Jgefmf3QFkzhRq5JDjg1Jm/7xXZHTfPdmhQKz69I
        V0dJuJgHAxx9x2omEVVYzdAkTw==
X-Google-Smtp-Source: ABdhPJwIs3QGucGXjAD9VvJLS6B2BZNRUo4mZaTrRs2HyRVDxzkR7qqfViM9H0Kr5/4yVQv1elJPXA==
X-Received: by 2002:a17:907:3e92:b0:6f4:7ab4:20a5 with SMTP id hs18-20020a1709073e9200b006f47ab420a5mr4691262ejc.620.1651583096353;
        Tue, 03 May 2022 06:04:56 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7cccd000000b0042617ba639asm7868782edt.36.2022.05.03.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:04:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/8] clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable
Date:   Tue,  3 May 2022 15:04:43 +0200
Message-Id: <20220503130448.520470-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503130448.520470-1-robert.foss@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The state of the shared RCGs found in the SM8250 dispcc can't reliably
be queried and hence doesn't implement the is_enabled() callback.

Mark the shared RCGs as CLK_ASSUME_ENABLED_WHEN_UNUSED, to ensure that
clk_disable_unused() will issue a disable and park the RCGs before it
turns off the parent PLLs - which will lock up these RCGs in any system
with continuous splash enabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index db9379634fb2..22d9cbabecab 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -214,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -546,7 +546,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.34.1

