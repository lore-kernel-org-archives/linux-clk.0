Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF9AC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 01:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E466115B
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 01:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhDHBr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhDHBr6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 21:47:58 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41DEC061761
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 18:47:47 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o16so322141ljp.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 18:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYEj4/W26dJIBide2+y3vFIE6MjoFe/WKhSCE+JU0u8=;
        b=G3Hp2ok6Dr/N4Idvq2Fz5eYq7wZ6277EC2WeTiFEVnO90SKS6Qr1Cz6pMyeJz80WmX
         w3iCrpulpccS9I8A0CJonUMKaDlJgRuLleDoRhUaURCKSX3UOR0QZhX457hF+HlDhBTg
         acCTxudpvMNuSFPjgA7Pg4FHlQVdhmbss/FnLatEF5Cg1ZO3dAhBkA7RroOwvconj73s
         WRRCMB7dIbESIAsYiGounkjaf8qJU7dfS5zjG+B5J4YfaTwZR31tnUfk7VJxoSJ2+zKV
         x/DvAGhSejoKwSECeKcSOMM3RX8RiQH2l39qo9mzwooCSHa7D+wPCqqJpB87TnekrYbp
         0RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYEj4/W26dJIBide2+y3vFIE6MjoFe/WKhSCE+JU0u8=;
        b=rtemhAAtsckcw/nw6ZAKJFly/jxGnkJewGHmHmGxI3LKXKIua3+eSVO3QfBVF79XzI
         +ReXqrNWRdl1ci7mcACgguqqt9zNLQTlm8GYUBhefTdt7Hv1eL61JDBBhKuTVXJdX4Y2
         c1UWcX6H/Li3+XkWd9Rqye0nXYbeuvfHNPM3jnYeVt3AoXC3Fb+kLy1bQi+clj2n8Mlh
         S60XFWVG3zogiqm1C6IaOhCFQq4qwoujwPIWxaSl+lKAw2dtd2svbRrR4TQZsXJtD9UI
         /8soKkNviR9fra38DxkKxHcCLAROZopDpl8HWP5tbPrvVx5CYSOxV5W6KyuA6LZ3JHqB
         mnZg==
X-Gm-Message-State: AOAM533PiianM1CbboBkRKDOsoZs9u+H6HqIv5+yVa6NVcSjfW9SSPhx
        QHirE9KRfZbN3q2uhxWC6Zb4AQ==
X-Google-Smtp-Source: ABdhPJxYFVUEHHotsDBZ48PIKNj249pfFYvdCpKQejQz5mHLhJaldnfjTU40OMGNWyC9Zt53rT7g2w==
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr4005775ljj.213.1617846466045;
        Wed, 07 Apr 2021 18:47:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w24sm2686705ljh.19.2021.04.07.18.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 18:47:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: convert gcc-sdm845 to use parent_data
Date:   Thu,  8 Apr 2021 04:47:34 +0300
Message-Id: <20210408014737.955979-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert sdm845 global clock controller driver to use parent_data and
parent_hws.

Changes since v2:
 - Stop making pcie clocks as optional in qcom,gcc-sdm845.yaml. Make
   them required.
 - Rephrase dt-bindings commit message to directly specify the reason
   for splitting the bindings.

Changes since v1:
 - Use ARRAY_SIZE() for num_parents and parent_hws instead of
   parent_data where applicable as suggested by Marijn Suijten.


The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-gcc-sdm845

for you to fetch changes up to 57d95e6bd1eb92ca61587768fc621571a86cc211:

  arm64: dts: qcom: sdm845: add required clocks on the gcc (2021-04-08 04:40:26 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      dt-bindings: clock: separate SDM845 GCC clock bindings
      clk: qcom: convert SDM845 Global Clock Controller to parent_data
      clk: qcom: gcc-sdm845: get rid of the test clock
      arm64: dts: qcom: sdm845: add required clocks on the gcc

 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |  82 +++
 .../devicetree/bindings/clock/qcom,gcc.yaml        |   2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 +
 drivers/clk/qcom/gcc-sdm845.c                      | 650 ++++++++++-----------
 4 files changed, 417 insertions(+), 329 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
