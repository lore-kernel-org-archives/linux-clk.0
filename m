Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C58EC38147
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 23:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjAQXtf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjAQXtV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 18:49:21 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73505A81C
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:27 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so79026871ejc.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhtQCvX/tSJys6S4hJnViiM+9HKQO1LNRZqOWTVY3ys=;
        b=Z/nRzHyyYai5h0kOA3n7z0u6uDaptTMvYCHvbIszz03m3bT77thMVojvGrK227u3t6
         EkHw7jfdL+8HlXAIIy6NLyJTkijTShj7jjl3zpZOTnnScoAfq1D0flpOZHkSeI1m1Tkr
         RXMQJbdqvLLJwYmu5pIy33h5AuFJIM3M9BevLfr85wTz9O39XI6H3GAIGol+wCZoO3pv
         wjDbW0v4ky5oXcy3rV5Ci3RJA5mJcxS0jmta1uimjexJzgkqcTh0USZ1CyzHAMe0yN6u
         peNBEZRFCY4IVvZty47Nf680cN4cRh5ep1e7qx7GbEWyPh3qib9cP9jLfLZitzsUGDk1
         i5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhtQCvX/tSJys6S4hJnViiM+9HKQO1LNRZqOWTVY3ys=;
        b=Lyz0FZN7AIJOkhCktNFueYgkfIOJ3BwR+55VNoSOHnh0OJy7ZGIaLU2d3z50WrSiwP
         VbDF8j+bhKAF75H46PSlQ2yHjXXzNvenBrN7DYe/C5MDiH3Z6pDu0Lyj2lS+H9OWQnZu
         1v2rIQPnP4gGtMhgGETuD2U0XCEDQefCLvGEpLkFLRLIYKyqxcMhVGLFsN9MRhlGmsrN
         YNLsaTTOOlSYpl5fA1e6Dqbq03JR1/+GPvQ6xS7tOanHJT6HtBfrig/4KW5qQHJ4gy5s
         VCsNgiwxaWLIGiMNqals06W4mWQpa/MKwg8ADSkxerIM1KbQwVkvEPAG/WwIu8v2e4DP
         X4gg==
X-Gm-Message-State: AFqh2kriEFPIXBJjEQJJWkSSu8L6YZlqtmmWTfazFB3yV0OpjQ5gHAE5
        rrd5/Ih7sU8MQwi18d9Ok+a+vw==
X-Google-Smtp-Source: AMrXdXsWCV+QyQsM/XeACm1myMGgjrnpAmFwb2gixdmqaOLIsdzjpBocVpSOC0zre3aqMCTW3S3daQ==
X-Received: by 2002:a17:906:5da8:b0:7b2:c227:126d with SMTP id n8-20020a1709065da800b007b2c227126dmr844649ejv.20.1673996306267;
        Tue, 17 Jan 2023 14:58:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:25 -0800 (PST)
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
Subject: [PATCH v2 0/7] clk: qcom: msm8996: add support for the CBF clock
Date:   Wed, 18 Jan 2023 00:58:17 +0200
Message-Id: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On MSM8996 two CPU clusters are interconnected using the Core Bus
Fabric (CBF). In order for the CPU clusters to function properly, it
should be clocked following the core's frequencies to provide adequate
bandwidth. On the other hand the CBF's clock rate can be used by other
drivers (e.g. by the pending SPDM driver to provide input on the CPU
performance).

Thus register CBF as a clock (required for CPU to boot) and add a tiny
interconnect layer on top of it to let cpufreq/opp scale the CBF clock.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/

- Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
- Changed clock driver to use parent_hws (Konrad)
- Fixed indentation in CBF clock driver (Konrad)
- Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
- Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
- Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
  RPM_SMD_BB_CLK1 clock

Dmitry Baryshkov (7):
  dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
    controller
  clk: qcom: add msm8996 Core Bus Framework (CBF) support
  clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
  clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
  arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
    RPM_SMD_XO_CLK_SRC
  arm64: dts: qcom: msm8996: add CBF device entry
  arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq

 .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  71 ++-
 drivers/clk/qcom/Makefile                     |   2 +-
 drivers/clk/qcom/clk-cbf-8996.c               | 456 ++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.c                |   2 +
 5 files changed, 576 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
 create mode 100644 drivers/clk/qcom/clk-cbf-8996.c

-- 
2.39.0

