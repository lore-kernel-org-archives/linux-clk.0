Return-Path: <SRS0=ESC1=YT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C36CA9EB9
	for <linux-clk@archiver.kernel.org>; Sat, 26 Oct 2019 11:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC2C0222CD
	for <linux-clk@archiver.kernel.org>; Sat, 26 Oct 2019 11:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhhwxzA5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfJZLDM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Oct 2019 07:03:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46268 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfJZLDM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Oct 2019 07:03:12 -0400
Received: by mail-pl1-f194.google.com with SMTP id q21so2767007plr.13
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2019 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aiDt5t52KW99BwDzbhRa8ElOQ9bHTmHQCFgO82CwQAI=;
        b=lhhwxzA5ON8HMXgKQss/I3lq4Lc9V27b5/H3BBvPFcELrZtb9qy4H3N6UI7eSKeKIX
         In/UEkuOV3hpfrNWLFyNp1dTCo2a1KLy3NAEh5eET6QONjeWZ6mqK6HtmbjjL8hb7tsZ
         VZ2asUuZ3WiSVH2bww4e4jeLuRQoTcfm8LQjOuqiVEu5HahWqpBD0dCtcESGAR1VnWc3
         1cXt1ZkJIub2PohLo4isUuMjqrd/6W9U3+TyOBE1qCdU1RwgDd0hiIMQut+wd5swaukY
         Wz++RWEtd1yp9IswZYewA75Zk+XMCYBrNIgMkFHqHP+nKFUz105SHBu7/pCYQW9HdFrZ
         Xcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aiDt5t52KW99BwDzbhRa8ElOQ9bHTmHQCFgO82CwQAI=;
        b=KAEPHilZg1iO+/KPrgyQ6StHnhprv6rgOOkOQ1+YvBa5SCoJdaBuGq4Fw8UKaGV4Qt
         psdVOKr9uZf076b7ELq+99fa6fDYDNGFLGRFIpa9b1QF/R+piipN6szVRa2FrZ/pIACJ
         yp8SYVGm0YwZxVk1wcn4CfHZjEB5HtBb0Qx2FUAAG9cI58CG6AoitXa96JixaOc2GppO
         BXJJBLcgBTn1TJiq9H65FFpKsygkM35raPCxn8msujeTuhbYWAkYoNWhZGDH8LOP+fIP
         BPbyq6WwY3lBgFGrpntH2pRoTiFWuxhT/W/FAlANeajJuufz7m/ON5EAIhlOiZl5xfQP
         Juig==
X-Gm-Message-State: APjAAAX92h0FFDSYkD1Gi5az791c653cQaTOHKiEys2yXMjy6PAALrob
        SZ9oaRBSIeuXdWSI0fE+ye6c
X-Google-Smtp-Source: APXvYqy5lOHxmtjAkzaD//NL3VDOOFhb8OaOdL7tWFq+3BWdvYScN+oCkwKKPDOjYGufCzIb45jAuw==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr8848737plp.52.1572087791195;
        Sat, 26 Oct 2019 04:03:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6214:69c4:49ad:ba3c:6f9:2d8a])
        by smtp.gmail.com with ESMTPSA id x129sm5543379pfx.14.2019.10.26.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 04:03:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 1/7] clk: Zero init clk_init_data in helpers
Date:   Sat, 26 Oct 2019 16:32:47 +0530
Message-Id: <20191026110253.18426-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
References: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_init_data struct needs to be initialized to zero for the new
parent_map implementation to work correctly. Otherwise, the member which
is available first will get processed.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c  | 2 +-
 drivers/clk/clk-divider.c    | 2 +-
 drivers/clk/clk-fixed-rate.c | 2 +-
 drivers/clk/clk-gate.c       | 2 +-
 drivers/clk/clk-mux.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 4f13a681ddfc..28aaf4a3b28a 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -207,7 +207,7 @@ struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
 			unsigned long flags)
 {
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_composite *composite;
 	struct clk_ops *clk_composite_ops;
 	int ret;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 3f9ff78c4a2a..098b2b01f0af 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -471,7 +471,7 @@ static struct clk_hw *_register_divider(struct device *dev, const char *name,
 {
 	struct clk_divider *div;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index a7e4aef7a376..2c4486c09040 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -58,7 +58,7 @@ struct clk_hw *clk_hw_register_fixed_rate_with_accuracy(struct device *dev,
 {
 	struct clk_fixed_rate *fixed;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	/* allocate fixed-rate clock */
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 1b99fc962745..670053c58c1a 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -141,7 +141,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
 {
 	struct clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 66e91f740508..570b6e5b603b 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -153,7 +153,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 {
 	struct clk_mux *mux;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	u8 width = 0;
 	int ret;
 
-- 
2.17.1

