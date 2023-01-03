Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BB5C46467
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238021AbjACOzp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237970AbjACOz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87531144C
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i19so19162879ljg.8
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9n/FFhUTY9VD7tTjSdjhMRMlO1GqnH3WieAs1MCEsQ=;
        b=ufMMaaYEdTdj3/G5ygjyAvHR134uGb56il2lg3GlT6JnZ+ykpmWKePjsD3UFr36uWE
         z23BVQVun9YIVFc29Lkg9rhU545dGPkm7MlaSlUQgWxADP2NWfvke8cLbBwaA6gPpToZ
         pU7WhbsxNHNQjxznEuRh+YcTwt5DspS0KF9hz3eKionmBrEhSql0kO4l1OOV/FjhPHxo
         CgGZEM6Iyw6vnsa7jM6Y4tpcb+rOOVceo5je0svKFbFOPY5N5CLXtiQl4l0x7hq2Ul64
         Yf+jsSEkLhxlu2wRp4C5YENKuGQRjTI2H/ZiUGnNt4yY0bM5lOovhd2JimoqubMCWo0C
         OlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9n/FFhUTY9VD7tTjSdjhMRMlO1GqnH3WieAs1MCEsQ=;
        b=Eq3CKpvA9r5Ur8qcrNiE3Zo8aLJFVvgNcCzf2e6xsz0ql9j3whI3NKdQQZ4po57fL4
         FDecS+kiidfWiTeyEUWvU8R3jqEXBt4zHu0aCT5OwVRE9BKB7VQg3M2vfGpsR7v4UQds
         3CtDEpedxAEEbBDRgwY9+Fmo4H3XBpuZXmlMoyRxkPqJ+K4NnOm3LGTplZ3zFIBItoIZ
         FKVQ+2AzqgOo167bbEHP1+OfBHNpPaILLogplDScUaqB1aDnR5W9rvlSOg2Mmn2lrwR/
         o0hJmfGCrDUm9zlOH3zKOWawy7rPGTAo8qlBU5HoIkHMVXMoSKIY4Xv2zlHBDuDI3gt8
         K8EA==
X-Gm-Message-State: AFqh2kr8NROiaOcIJt70N1BLit+bCATEHHQGRoRr15Nsk/xhzRUzciPU
        +kv6qutYzMxxnh4ABYmY/D/x3MThz5rP+uAo
X-Google-Smtp-Source: AMrXdXvZMwb+V5saE9OZueVvbhUbEWB5uvQS0tbVsIlkytotOzcRCnYsm+LRQ8tYeuR9qJsxSvx2HQ==
X-Received: by 2002:a2e:b4b7:0:b0:27f:f1de:8f8b with SMTP id q23-20020a2eb4b7000000b0027ff1de8f8bmr1758655ljm.52.1672757724466;
        Tue, 03 Jan 2023 06:55:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 08/21] clk: qcom: gcc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:02 +0200
Message-Id: <20230103145515.1164020-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 2d3980251e78..6fa18d4377b9 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -1987,8 +1987,7 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
+			.parent_hws = (const struct clk_hw*[]) {
 				&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-- 
2.39.0

