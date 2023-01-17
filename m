Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40AEC00A5A
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 23:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAQXtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjAQXtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 18:49:25 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4075B440
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:30 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so79027216ejc.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6O2bAVOs5/hhww8OaAu0tscdsqPgbVmDpydd53A4mw=;
        b=eSvNL0aaE9O/wHtBqn7HUQHzrFKfchchN7mMh3Pm1AqCdZ66XiZdgOSZZFkB4GxKFc
         kMBn6i4ghT3U3TZsX7gFq9WznIM67suAn4O51rdNiLzDHXQ2BqhM3AmpAODf8usl2VWT
         lfiRb8CKJujcBiJyOF35EWbE7cH4yF3SSvc112iZoVUnKGQ0t7PDEM94CWL4GFwH7mMQ
         cwGuVlcZRBWcPYsR9QmcWjIkBzPACCyE3AM3ov4MpRnNdzBPNUoCpjM81s1xdjYEIpoq
         sMhcdzxa3WYzoxoWsrpWVQjGBDzUETmsVbiezqO2LdUgm31bebA0sne06/GkYVLuIUIh
         Oh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6O2bAVOs5/hhww8OaAu0tscdsqPgbVmDpydd53A4mw=;
        b=GW8VJ2q24jN0YrcdDnGg/Y6stNipwFBSJTcxkIFIYrt+xtJ9xV0Ee5K4eWFin02rnw
         tvspTW9JbDX/MWOFF1otxjn3GlIWtAIfoD/se73QriSiaMuYdb9aMQt2n4kXAfdibCzK
         Sy/xZJtm6SXWVqqykhwVaKagSIlIvH5qRfCKVAlpQ7JtB7SNV8ryrum1ijDeyrM6h3cI
         b2PlmNB0UVV848irCVnb4qG1T/NGWpqyHuLlv908+4TYa/Uc6qwdIJGV1R79hpx16yo3
         dP4EbynWQwJLt08tiwh9pC6VBUyQJObFFEVyfCz0hmFrGH5OD1xMe+J/sy86mjux7a5h
         ZqZQ==
X-Gm-Message-State: AFqh2krTAUJ6+4k8hwpef7VTWfjJpzJFKM47PhBl2C0F1/TkQvY8/0mZ
        KgPtDv+DrULgtFdrKnYsYHU3Wg==
X-Google-Smtp-Source: AMrXdXuyObr22mqWwYgkn4ALEv+H2YdS5qmXHPQOwUd+Q9KV69rGDrelhdJ8JjNLY8fisBDXDSw17g==
X-Received: by 2002:a17:906:dfe9:b0:84d:378b:8820 with SMTP id lc9-20020a170906dfe900b0084d378b8820mr19019943ejc.18.1673996310512;
        Tue, 17 Jan 2023 14:58:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
Date:   Wed, 18 Jan 2023 00:58:21 +0200
Message-Id: <20230117225824.1552604-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Extend the list of RPM clocks provided on MSM8996 platform to also
include RPM_SMD_XO_CLK_SRC and RPM_SMD_XO_A_CLK_SRC.

Fixes: 7066fdd0d742 ("clk: qcom: clk-smd-rpm: add msm8996 rpmclks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8f6e274c6030..b503be8b3a93 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -810,6 +810,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 };
 
 static struct clk_smd_rpm *msm8996_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
-- 
2.39.0

