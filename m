Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76184C30654
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 18:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjGCSUc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 14:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbjGCSUX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 14:20:23 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA63E71
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 11:20:17 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso8846371fa.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408416; x=1691000416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMoCMtDKw+oilBFVn9iuBCIfJo4ov6JGgxWl+DyeDZI=;
        b=mkJkyf3cCt0nkb+4LfexC3d1AK/CC33YpQLi4RMAQ6jddtFVDVCNk19KxBVVO6ex41
         YvGg3As8fxUKT30C51+08/We/atAU6CPC1fL+X+Wr80NDrR1FzxgtlrQYz1BYZjiut5S
         eOXVX8pm7UaoKk0A7OSsOsDnTaeHOWqx1sgSAnJNFnXGewtViaMpNltNK2/Q0g+G7QqZ
         dqaZPr3QWDKwfUP15wFfX0qogXcNuXAs+aYCmMjaztul5N4wOszC/ksaLHFh76jYp4T6
         ErOSEmsFGQfjc3rDOb1zkalHqG28fXu/sY0oc0N3q3tQh4eMi4ERY6oqkLN/9WTq68dr
         MprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408416; x=1691000416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMoCMtDKw+oilBFVn9iuBCIfJo4ov6JGgxWl+DyeDZI=;
        b=lumGxEbMnubRc+A1ZJ9nQC2ZBlqHlNu5LUo4aLzVDrvN+oWBkaIVbkNCxhKdhPt48q
         ioPX3/16J+N5hwX6Lo9gqUyc2WQOgs0l0X/GYFATQO/lO4oHmyCOkpfzsChmMgCZd2HX
         VQt5Q5tFUsrDmbx2zVg6cra7CoO+CQ40coAc75GD4a8hG+K0rm9m3x852874hbxlcbca
         1bVJeOJb47dWxRV5Vhd82VjhZTNR6SeCwtCm8O3gA57Ped9uibyT/Qm14Ay66UC6Nv23
         Eqaq40VAc0xS73qNULZh2cWKxkNvfMqNnrwqDUk8TfMCW7UziR6r+BNYiyUCZgYsk+GD
         tLqg==
X-Gm-Message-State: ABy/qLZOpNg+y+Pr89py9vCpzUvMCjuK60ZqFqQ6rXe1y/EXJLnFJG2R
        dpjpQHPfTNe3QDAZC4BK8TPX8A==
X-Google-Smtp-Source: APBJJlEdMlWsbEJAgyrqjFSYTIHacyg2SS1m44Awa4ZwaUPhz9uDUB9S06BvI/4neG0YONpl93/T9Q==
X-Received: by 2002:a2e:80d5:0:b0:2b6:ec2d:a4b with SMTP id r21-20020a2e80d5000000b002b6ec2d0a4bmr2256165ljg.42.1688408416333;
        Mon, 03 Jul 2023 11:20:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s9-20020a2e9c09000000b002b6995f38a2sm4946224lji.100.2023.07.03.11.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:20:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 20:20:09 +0200
Subject: [PATCH v2 5/8] clk: qcom: gpucc-msm8998: Use the correct GPLL0 leg
 with old DTs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v2-5-6222fbc2916b@linaro.org>
References: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408407; l=933;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=of30u1SnABmz3I8AeyXXYsnJq/vKvFUI7MDU8kDdOEI=;
 b=e9UlQ0qbi7SeWjuaZi73FWEHwOV0ZkqBcHYh6CVRQzhQO0sDUsTh8aV0y0/KQriKJ31lc0ZYV
 pRgsGnb1AjrCnAOwk3EgQifWya7nK/l3i4qJkj3d6QG2UOwInovq6dY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

GPUCC has its own GPLL0 legs - one for 1-1 and one for div-2 output.
Add .name lookup to make sure older DTs consume the correct clock.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index f929e0f2333f..cc0b43354787 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -98,7 +98,7 @@ static const struct parent_map gpu_xo_gpll0_map[] = {
 
 static const struct clk_parent_data gpu_xo_gpll0[] = {
 	{ .hw = &gpucc_cxo_clk.clkr.hw },
-	{ .fw_name = "gpll0" },
+	{ .fw_name = "gpll0", .name = "gcc_gpu_gpll0_clk" },
 };
 
 static const struct parent_map gpu_xo_gpupll0_map[] = {

-- 
2.41.0

