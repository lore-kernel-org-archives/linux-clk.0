Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D1BC54EF0
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237937AbjACOzw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbjACOzb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:31 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A6BF5E
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:30 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z26so45969180lfu.8
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBFBa94LOYtAKTpqF+8YTvj5eVuXjTfFgPq2gtBk+vY=;
        b=XYTmZm+PHwqW5z+HjG22ssWjnCav6RgXY7u6MdYUnBRgSDa1q7ypb4zQ/UKfc2NSji
         YAJdkaVqcwv4ftWBpqxv0bayr5uGmHlByyJ9CADWfsgSbsrSIpzvsuDbO0tA69AoBMQB
         RpEYUfOZsXg/7Nr4PefjMAO99rqBO/izXgU7m3cN9R1V5UCxA6IdCxqYstv8m/qO4XiT
         HDVoyKES0ix865h4XhsfRXF+3QiRMWgG8GSYVwA1ntp63dTV5aQsT8RYxP7PEx4wbeFk
         5qK+JtTjFDL8mdmJIO9+rO7XwnFYhZ8JxQCDqpX8wf7G3yDZXrNC1fROu8PT4NE9g32a
         H6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBFBa94LOYtAKTpqF+8YTvj5eVuXjTfFgPq2gtBk+vY=;
        b=vbAWkQh6lWls7l+cVFV0GGBb1WDCB1edBkJyRZsdtDsa2R/jgRyg/Mee4mr5qG5eee
         oapaWL3ZK5mOhth+mT8f1/N/GBKILK1B5Ja5rNM1RMSGPVcWON0T1ajbXU1zFZIiLdIE
         b13WSLtgWiyJx0P0+p4llN1FFUtddPjoeWpPr9fBNhQodZ/lD+15hARDDB3xy4MNW44A
         b1i9aAhIOnKbuOAOGTdNoO7NRWrEGqbCvQEPk9qGbl8Hbi2Td4E1AOAqto0umEI72vXs
         PHvfbZfEZTaFaR8rTi2cqjpHtzbgxGAz1nVYZBI3N50G0M6n/j02Ng9Fbeb5ogoOx2p2
         i/CA==
X-Gm-Message-State: AFqh2kqSxC+jQiM+MlvCNjril1PYeSH41cYnxjEbF/rgP49S4kiNT7+3
        C2genZoYy8sla3U2YOEIM3WEqw==
X-Google-Smtp-Source: AMrXdXtqiZgPQreufD78ygd+6HpgUBbSO+ZongiSosHDBojzjh0/jzbLbazjz2lq1N4iMf8fOVgIhA==
X-Received: by 2002:a05:6512:3d08:b0:4b5:9b84:2366 with SMTP id d8-20020a0565123d0800b004b59b842366mr14336165lfv.58.1672757728601;
        Tue, 03 Jan 2023 06:55:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 12/21] clk: qcom: gcc-sm8250: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:06 +0200
Message-Id: <20230103145515.1164020-13-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8250.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index a0ba37656b07..b6cf4bc88d4d 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -2998,9 +2998,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-			&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3048,9 +3047,8 @@ static struct clk_branch gcc_usb30_sec_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-			&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

