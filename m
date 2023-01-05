Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121BC3DA7D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjAENlj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjAENlg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:36 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42B5336
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:35 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g13so55047282lfv.7
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfbl4V9HTnOZUDmQLBRO+dO5pUjugSWLRCL32fMSRic=;
        b=td+hv+S+hYL7dOGXr6zGJreRbZREGRZA022QIsuRna0dNPkh7YwU/XZI/flwnnNeKa
         is9Nx9AS1EhesbvE6bhhwE1bj8Dy7U255cBxEXnvwS51mtxKWSOuksIo0TlZR2YZjwZ6
         JRKHqTQpDk17tcbR2R5rs12aX+ME8SMAwi5WHqZ6Yz91NytJ8H8f4qpiTILWbePs+Lbn
         kQxWv7dzYOftQOJCj2eYAYet61rY0d0tPiiJfohmPFajCidCyhveEVmHWKXKgLiGdkBo
         FAOJsrvkN4JJVBQY0rE/MFlGrlU9y0TmtXhV6rpSxOME+0x3wtJUOoIu8+678JQTFJOh
         5UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfbl4V9HTnOZUDmQLBRO+dO5pUjugSWLRCL32fMSRic=;
        b=LrG4dbWdjgehaI+c78SsyWFeHJ7Lk+XBzu7G/hb00eR0bqaZ7wfppj01bf1oMU224q
         i57Gjat88sOzrodQC3UrCj/Z9J0iLWZNq5TwUuYHst0L9e5nzRGElvxQgeAlZlUSPD1T
         op2m5+CozbMwPAvY30/ZU04wT8qbLns55U5IsPITwWdDZrP7ClkAQ2Dxx0Nw7LWLb8bb
         18wluY61V4WoY25nRPa4KDT2Rs/kDw5576UWIOu3PZwoPCkha3umOx6t37LYgIzt8gKh
         rGMKJCbb2hLzwoDtauoH3+nk8WgYZ7rq1HV++PX5heWBLXqB+IY+yIKuOnAfAz9IW/GN
         zLUw==
X-Gm-Message-State: AFqh2krbBTxDENTTKHF8qFw4nine9h6m4OudMOQovkxjqM4xos9uJkpX
        twaokVA5d0h+Rk2Xlkmppa/bvA==
X-Google-Smtp-Source: AMrXdXvfJsaMgyaZ9WsxqqqTwcx9agMXetrqA8wA9FAsubVEmYQDQHZytvdUjhTNKzJaL5tzVdePjQ==
X-Received: by 2002:a05:6512:3b2a:b0:4b5:5efb:7d26 with SMTP id f42-20020a0565123b2a00b004b55efb7d26mr17876201lfv.37.1672926094295;
        Thu, 05 Jan 2023 05:41:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:33 -0800 (PST)
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
Subject: [PATCH v2 00/12] clock: qcom: apq8084: convert to parent_data/_hws
Date:   Thu,  5 Jan 2023 15:41:21 +0200
Message-Id: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework apq8084 gcc and mmcc drivers to use parent_data and parent_hws
instead of parent_names.

Changes since RFC:
- Fixed clock/clock-names's maxItems in qcom,mmcc.yaml
- Expanded qcom,gcc-apq8084 example to include an example of UFS symbol
  clock bindings

Dmitry Baryshkov (12):
  dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
  dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
  clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-apq8084: move PLL clocks up
  clk: qcom: gcc-apq8084: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-apq8084: move clock parent tables down
  clk: qcom: mmcc-apq8084: remove spdm clocks
  clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device

 .../bindings/clock/qcom,gcc-apq8084.yaml      |   48 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   44 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi           |   18 +
 drivers/clk/qcom/gcc-apq8084.c                | 1024 +++++++-------
 drivers/clk/qcom/mmcc-apq8084.c               | 1189 +++++++----------
 include/dt-bindings/clock/qcom,gcc-apq8084.h  |    1 +
 6 files changed, 1102 insertions(+), 1222 deletions(-)

-- 
2.39.0

