Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E003EC7EE2A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 16:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjEQQlE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 12:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjEQQkx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 12:40:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D6459D3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:51 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f22908a082so1227980e87.1
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341650; x=1686933650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGFT+wjphG28hwnPjTkUYcKbXPZiE3HV0SuQwI1BQuo=;
        b=tiYtdPRSS5OEaeC6FPpC77eMRKHKuH8xMPa+TlI8AI77Znq/T31xAIXm/aPQ572PEs
         XsUqU73sE/cK2rnT0+OCc1xbbYB/z6+aaQhX6LOCsDozNXO+t2WdZGHS2lSZ3aIZBjTo
         taCNQNv9X/lHqf3KyO47Ffi4psBt9z7KK0cL1ZWqtyyzdY95H8wkttyJCu4s47SVWQvn
         QwA0kt1kGqG8aHEI9silkPmIeCG7CE/j6A/DrLhs1mDfifXc84LJQI08UtShloGx3S4j
         6mNTYu9Ti4qul6624iAPtrp/f4Yg0DrtbSd8u96UG8VFzl1A2618SgTzGH8hFjjsP6al
         5mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341650; x=1686933650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGFT+wjphG28hwnPjTkUYcKbXPZiE3HV0SuQwI1BQuo=;
        b=FjldDQXnm1UIZ8U9J7rkW3jdpWAX/n1fsyV/UuXWh7VySui3WALRYhdPMCgo7y/DoL
         6NGEoPgYj6+gGEhzbYWbFuh5qTaxFFpyeF2htThueb89oy0h3O/djmeRDK8H8bYlj2DE
         UyvdrIB6JYjDuBcJUTb/CW+aHN/KnN12jCdtcNPDlXllIG4eFoF7dtO3cux/Ni1XkBka
         czAnPu5rpl2Xm9jbatN8aOhrf4HW/EqKURjmD1kleiB7SgMOuWQ6gFq0FoUlkz5Hc8Yv
         13ustY4YyeQEoAl+XZsk0f6efadgvOcFbjaX2H/bxuPDUXN5xWznzd939NUEizxH2Dte
         UPJA==
X-Gm-Message-State: AC+VfDylO+y4WMEpynQ6rcOtcswtoqBjs6Nafet/NIAYpAClbFz4qVGn
        y9qQfZIaSRWnCd9I6Faya0ZpXw==
X-Google-Smtp-Source: ACHHUZ7AnvhYliNKkvo1wXuA6iTJAjlwQDBn+N59qe0ubrnV2L6uSxGKtLeIama5Frq1U5dGduIzeg==
X-Received: by 2002:a2e:8e86:0:b0:2ad:9751:8d79 with SMTP id z6-20020a2e8e86000000b002ad97518d79mr9234043ljk.31.1684341649893;
        Wed, 17 May 2023 09:40:49 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id 9-20020a05651c040900b002a8c271de33sm1919259lja.67.2023.05.17.09.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:40:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 18:40:39 +0200
Subject: [PATCH 2/4] clk: qcom: rcg2: Make hw_clk_ctrl toggleable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-waipio-gpucc-v1-2-4f40e282af1d@linaro.org>
References: <20230517-topic-waipio-gpucc-v1-0-4f40e282af1d@linaro.org>
In-Reply-To: <20230517-topic-waipio-gpucc-v1-0-4f40e282af1d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684341644; l=1689;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fnX8Gs7THnPKyxc7XYOaJzSXtKdHLn/shBY+gLa1OAc=;
 b=dc7FDYnfPDVDqiSyXx2sBVWzWIEGK2mW+pKm3QRUvO8ubVk5bfUJ7nDe0HxUNk6RCH6W5Kwgo
 5HC3owtkZg7Dw/0EFcRcNNhwp7/Ei6prAIfkiumFuISDWhw/Cw+Mazg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Certain SoCs use the HW_CLK_CTRL feature on some of the clocks they
host. This allows the clocks to be turned on automatically when a
downstream branch tries to change rate or config.

Make it togglable so that we can utilize this.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  | 2 ++
 drivers/clk/qcom/clk-rcg2.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 01581f4d2c39..e6d84c8c7989 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -141,6 +141,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @clkr: regmap clock handle
  * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
  * @parked_cfg: cached value of the CFG register for parked RCGs
+ * @hw_clk_ctrl: whether to enable hardware clock control
  */
 struct clk_rcg2 {
 	u32			cmd_rcgr;
@@ -152,6 +153,7 @@ struct clk_rcg2 {
 	struct clk_regmap	clkr;
 	u8			cfg_off;
 	u32			parked_cfg;
+	bool			hw_clk_ctrl;
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 76551534f10d..e22baf3a7112 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -325,6 +325,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
+	if (rcg->hw_clk_ctrl)
+		cfg |= CFG_HW_CLK_CTRL_MASK;
 
 	*_cfg &= ~mask;
 	*_cfg |= cfg;

-- 
2.40.1

