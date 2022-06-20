Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D14C43334
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 01:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbiFTBGr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 21:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiFTBGq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 21:06:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE034B7E4
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 18:06:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a13so4998356lfr.10
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 18:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1X6XioIFHIGc0TtSEX6Dx3KO+/cL3K9i4MVkunJFy4=;
        b=DyXGCMJbP7c0vygmEbAY8WRyg5LC3BsJwQ0yUsgNd7R7rPWrnIYVsPUYQmWsqdfEXP
         h8/4yGchzDIv3u34VdI5rpPJZl1IHNNtDITHQxBvG36EBx3+sYw5qp5HM17o52+VoL8p
         /vgF05PQmDBwt6Xqnj7bPiqIQ76FVhDWmRH2CKc3LgoTR9EihiHlzXDwtazhpfgDbQq6
         /SIkPoqt94nLCw998pok7+jQk74R6pEPK5yNJEvJ6SElfTiij9ss9aRyibvxGQkxJr6b
         NXa7HEdKxzQpO5+oy4L8zI0tSpSSo4vBLxwsgIYmYr5tmcX3nkBc0NncOTFdAG5wzVOl
         i2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1X6XioIFHIGc0TtSEX6Dx3KO+/cL3K9i4MVkunJFy4=;
        b=Ho4ozNQtGa2u95v4ocPSWWDA/6nDyTOJrwVIjKt1RM6aLG7Z/sI4THeYSZ8ysxhv20
         y2lnsVkUqKSAbibh9TEgSmrl25t/NT1tBWs3Er7Mghkx4A5+BmyFrTiKt/OumF0Kl4vD
         icK7OvKXK/dB7jdBmDbDVX+Bfa0poS2OWrhMtZYVmLE7s7BtoPqqPLeam12IbZ5cRA8H
         BV8diOJl3j4SvRbGvkwhfe5zUVCCn3QsaX5G/4L1zLwkEPGVFgjlAsCBI9B9JyEpc7h1
         7ENWDyb0dgx5b4oa8ohn7YsaXi6t91b6LjuhizP/sHRKeINZaX01M7YE/Hq+9LoWJPLy
         vq7w==
X-Gm-Message-State: AJIora9SA6RzSeawsz4ac4Z7u9UCeI2fB4++jD5PXVMaZGr7w9hq2vrW
        eVJEmGa7k1m5iNmUkYjTCOZmwg==
X-Google-Smtp-Source: AGRyM1vrimmMqrGWgTjIp7tmlXbBPHZGqQVyCPChg9hk70SjCo3/qUklLGVFvXsfjKpyUU7nld211g==
X-Received: by 2002:a05:6512:2627:b0:47f:750f:f93c with SMTP id bt39-20020a056512262700b0047f750ff93cmr209123lfb.409.1655687204036;
        Sun, 19 Jun 2022 18:06:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f27-20020a19dc5b000000b0047255d211c2sm1543891lfj.241.2022.06.19.18.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 18:06:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
Date:   Mon, 20 Jun 2022 04:06:43 +0300
Message-Id: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change a53-pll driver to use clk_parent_data rather than always looking
up the xo clock in the system clock list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 329d2c5356d8..f9c5e296dba2 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -127,7 +127,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (!init.name)
 		return -ENOMEM;
 
-	init.parent_names = (const char *[]){ "xo" };
+	init.parent_data = &(const struct clk_parent_data){
+		.fw_name = "xo", .name = "xo_board",
+	};
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
 	pll->clkr.hw.init = &init;
-- 
2.35.1

