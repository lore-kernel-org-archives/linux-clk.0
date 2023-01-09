Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C36C61DB3
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjAIA3o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjAIA3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:40 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FE1BF7A
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:38 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id bn6so7328429ljb.13
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuUy5yyevuXzH7JuK2+w6B5BQU4+qQbNBPhTpPAW49E=;
        b=BUr+afNqyFUbblkeLwvb4Itn25XCp+Rgx8j9Y2DQWrX8NDUnDWAy51gsbP/fEiaIUq
         PNqI+baEwMpZO4598h406g8S7zTav+grYCxIpnaFdLlEzYN5Ht/CSPFdMmpCjTItQ6La
         PMN+vZCLde/h4fVjoJAABfCunuzBbkbM85arQK55FJH4gGqCRRpcueSLUZEC6Z6ewsM0
         71I6NdUeZER+dbLuCfON+zQt0KbRPg/xoA4hFkoTQsTMMHUrRFYRdKkjmN+J+PyaXq4S
         q//zPg/tyhcpfxDm2e3nfoy4gtGBVoFgZpCPSokRJujcML4nLC+wnwWhmH5H+8v4Iqlk
         58Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuUy5yyevuXzH7JuK2+w6B5BQU4+qQbNBPhTpPAW49E=;
        b=yteyc2nVfLqYtO27fFh4l8fSapZQe1QkdaO6s+SNopxfmjzRcpkngn/Z+qQpjBUs87
         D3IvrXJUOR0/6Z08zposFzIj+hdPeywrWh0wmK6NjNm6t1QJxwayJ8bdrEtrOfHnL7ED
         VNLcumz/G+G/rwq48uSph25/aZRVfIN5LeH4RP7UR1f630mlH8P7mVdKZ/iaOmxHnrou
         BttlyPFKtxKloivjLESp7I8hYGEkL3oQKN5+2SlZiL5tIO//ASdExMeHtalauS+2k+XK
         D31F1XZk5dAKq8ocpGlWyIT1Ynn5XTN2gbhBc36JyITDRiGPzn2ZGeHJVnzrS2MsOM6T
         7mmQ==
X-Gm-Message-State: AFqh2kpAYfbwmDUMBB9+e6D2Im88eGcaxPo/hY0a+DvjPFimEjlL5k2F
        m+ONDt7wxG4Lfz3bAG5CtAa+2V0v11y2j5/U
X-Google-Smtp-Source: AMrXdXuiUq/JXsdkD+m8b6Ksu/HV4ZAbT6VX0HTqZu6xxNED5SY6Zvh2bGgdjg0WOXstrAgJBp82SA==
X-Received: by 2002:a2e:a901:0:b0:278:ed26:6070 with SMTP id j1-20020a2ea901000000b00278ed266070mr20636412ljq.50.1673224177031;
        Sun, 08 Jan 2023 16:29:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 01/12] interconnect: qcom: sdx55: drop IP0 remnants
Date:   Mon,  9 Jan 2023 02:29:24 +0200
Message-Id: <20230109002935.244320-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop two defines leftover from the commit 2fb251c26560 ("interconnect:
qcom: sdx55: Drop IP0 interconnects"), which dropped handling of the IP0
resource in favour of handling it in the clk-rpmh driver.

Fixes: 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0 interconnects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sdx55.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sdx55.h b/drivers/interconnect/qcom/sdx55.h
index deff8afe0631..46cbabec8aa1 100644
--- a/drivers/interconnect/qcom/sdx55.h
+++ b/drivers/interconnect/qcom/sdx55.h
@@ -6,7 +6,7 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 #define __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 
-#define SDX55_MASTER_IPA_CORE			0
+/* 0 was used by MASTER_IPA_CORE, now represented as RPMh clock */
 #define SDX55_MASTER_LLCC			1
 #define SDX55_MASTER_TCU_0			2
 #define SDX55_MASTER_SNOC_GC_MEM_NOC		3
@@ -28,7 +28,7 @@
 #define SDX55_MASTER_QDSS_ETR			19
 #define SDX55_MASTER_SDCC_1			20
 #define SDX55_MASTER_USB3			21
-#define SDX55_SLAVE_IPA_CORE			22
+/* 22 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
 #define SDX55_SLAVE_EBI_CH0			23
 #define SDX55_SLAVE_LLCC			24
 #define SDX55_SLAVE_MEM_NOC_SNOC		25
-- 
2.39.0

