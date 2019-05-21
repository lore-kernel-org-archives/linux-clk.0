Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC96CC04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 15:01:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B34B721841
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 15:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dBhRX0gX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbfEUPBk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 11:01:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35961 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbfEUPBj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 11:01:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id s17so19029924wru.3
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hya6Oxcm01Zg9a8B2aUxovEoEemSR2xPIYhlXd2pWtI=;
        b=dBhRX0gXkRK36yhJmJO4jLCKNM+dhSO4r2g9ikQxmWnfmxRYoiQtKvh9ZbxkouX2gl
         +cx5mgkB2z2xQN6uLO58FuFN144F7NSwgNEDQUFXZtOAq1+m4ZKCRWuid+5L7KYsE2gf
         m+69+L163qwh7+ASSreFa6vR2pQ9RSwuCMNwjaXibFleucsR1CUVcjN3UlJC7S141rN0
         TpK9VEzSQfhy1GHT5w05aYURLxpZNEqr3gwkBRykRVlZOQXWtjEF/v8MLR4gNnSWJS2u
         jPTJgvreHMn5Y9LI3Ie1nhF2GVJIQdoF/5W+LzEmlEIWLuwEApUiB2sKrcesRUa4wjDU
         kJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hya6Oxcm01Zg9a8B2aUxovEoEemSR2xPIYhlXd2pWtI=;
        b=CLTF752RRFb2VHp9bHnaCiAhkskkPJuFV6Qd/qulxyjCF4pqN3Rp4u7xICJZztz0LR
         zQQtTxTjoiplbFtH/G0O8QhipPz0XRhcYI3YomopV95rBavTeNXeEu4C02kx8tV+jSEH
         DtV69AQbeKb1e+L4jdgeRSeC1XMC/X026IyumNftE4q9KO51+ZyHcbiogAscaCH2lNQr
         9uv9n+5wWkB9CUmkQHtUcxRaGyhWhvaMfgDG0mModsjmIgPuOwergksYrSSHepr3sjlp
         ESg+X9w6MS6oaFQOGwapNJ3QWEeTVhBl8RtU+Nb6Pw9k3gfvEircUR8H84JGWsnhFsbF
         g7jA==
X-Gm-Message-State: APjAAAWx8StSsrmkEXvhUEVXTEPrJzfpo4+whdmzIAcQPbP+G1Ax66+B
        A2mbXKWgE4Qqt85cWANcLBBhuQ==
X-Google-Smtp-Source: APXvYqwXgQlgZURhNNRL21mnF9cPN0R/YHRg8kmGR1/Zp2hUWtmqvfEbm6g5T64mtoUraVddL9g3OA==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr13436681wrm.166.1558450897467;
        Tue, 21 May 2019 08:01:37 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b194sm3407505wmb.23.2019.05.21.08.01.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 21 May 2019 08:01:36 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: meson: g12a: mark fclk_div3 as critical
Date:   Tue, 21 May 2019 17:01:30 +0200
Message-Id: <20190521150130.31684-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521150130.31684-1-narmstrong@baylibre.com>
References: <20190521150130.31684-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

Let's mark this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 81cb38ac3c85..575e58752aff 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1244,6 +1244,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0

