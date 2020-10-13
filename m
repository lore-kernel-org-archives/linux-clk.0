Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0748FC43457
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 17:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA28125322
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 17:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="KzCoY5Ki"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbgJMRME (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 13:12:04 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:48450 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728786AbgJMRME (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 13:12:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602609123; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8TGdWSrQ5fv1fYrNwF7QstbVpfG75tMelkMDFGJ2MA4=; b=KzCoY5KiL3nh4rkrvqfjfOPJ6FV7t7ne2chmAjRuRTRt09XaMA7R6d7rfAUv2Boixj6G5REJ
 6hOVtS/zdTVnJOufrXx1du3c5Y6Iw3ludhM3UNf5BWMmWxpUU7hUDjQtDV5B/xl5eUeM3Ei5
 7IWKikeHmMADo9cQzc0Nk/eadWs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f85dfe3d63768e57b30dc76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 17:12:03
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA081C43382; Tue, 13 Oct 2020 17:12:02 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB6E1C433CB;
        Tue, 13 Oct 2020 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB6E1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/3] Add Camera clock controller driver for SC7180
Date:   Tue, 13 Oct 2020 22:41:47 +0530
Message-Id: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[v2]
 * Update PLL set rate function : clk_alpha_pll_agera_set_rate
 * Remove mb()

[v1]
 * Add support for Agera PLL which is used in the camera clock controller.

 * Add driver support for camera clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

Taniya Das (3):
  clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
  dt-bindings: clock: Add YAML schemas for the QCOM Camera clock
    bindings.
  clk: qcom: camcc: Add camera clock controller driver for SC7180

 .../bindings/clock/qcom,sc7180-camcc.yaml          |   73 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sc7180.c                    | 1737 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   80 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 include/dt-bindings/clock/qcom,camcc-sc7180.h      |  121 ++
 7 files changed, 2025 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

