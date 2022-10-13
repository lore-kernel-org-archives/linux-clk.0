Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F832C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJMNTB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiJMNS5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:18:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAEF4E18A;
        Thu, 13 Oct 2022 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667129; x=1697203129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hy4RTQp6FBT2qM7enTnKF2hQg8bH2wkse5/kreZcno8=;
  b=fJk8U9306rDzCczxk/Y5PDorAd8FKkTitH8r2qvLwpQrFj6jzaItKJxa
   Qq5icWZQ0gKbjhEBl9jHDm29uUl6O5hr61P5Wl7PaygMuLypj/79wmCOc
   AQcKbKvZRuXxS5V/gPwBmpgFTrtOhZtRNxdDHOFq97eAAUSAxWUkAjpUi
   i7+wqSSXKfrUnFOmEbTH088dnjMlgShcMoKmPmCKRBQeIhUtny/5t08xP
   DnE6lASknp8S7kSQ87Mz5N61rZsEnedfXLUPz1eqqiWljc/WZGoir54Ai
   rJXx8V9xTrAya6dfSt/yd09QYcLKBP4v7uXPiNfrEqciWTzaChDdvjFLR
   A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736834"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:18:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:18:46 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:18:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667126; x=1697203126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hy4RTQp6FBT2qM7enTnKF2hQg8bH2wkse5/kreZcno8=;
  b=Eufre5KRO0OK/kJPQIBQZPdEqC7ZaG8P7Z5E5d+RbVPM9nB6lhn2IFi0
   6kLwkSF9huTy8ADkOE5BafxArfs26mkSX6YTFiPfVPoKlAeYtscnEP32U
   JFjitp4ycE2LPT1eHupmTg5amM0P8AFP+oWrTOS0iLH1MayI0fK4QuxhF
   Aa6q/+5Lo9CWnDtq3RIJJQL9jEE5R5yK8H9I/GrhzGjVyVOjxm5feMiha
   1IMOQe2JBM3jvHgJTWlIwv0J8IQ2cLu88gyHeka9fQyj/Cul2vnyP1MT0
   f7tV3r8qgMxOls+nyp+k0G4iibMHLLpkk2dt4gsxRqw333AKsAzvJnElw
   w==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736833"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:18:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DF9D8280056;
        Thu, 13 Oct 2022 15:18:45 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] i.MX6Q IPP DI support
Date:   Thu, 13 Oct 2022 15:18:34 +0200
Message-Id: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this series add support for IPP_DI[01] clock input.
1st patch is just preparation to handle anaclk1/anaclk2 similar to osc &
friends.
2nd & 3rd patch adds the clock to bindings and device tree.
4th patch adds the clock to the clk tree and also adds support for IPU
clock source.
5th patch adds the pinctrl defines for imx6q (only). I was only able to test
this on pad DA14 on imx6q, but not on imx6dl.

Putting all together it is possible to use those IPP DI0/1 clocks as input
for IPU pixel clock.

Best regards,
Alexander

Alexander Stein (5):
  ARM: dts: imx6qdl: add clocks to clock controller node
  dt-bindings: clock: Add ipp_di0 and ipp_di1 clocks to i.MX6Q bindings
  ARM: dts: imx6qdl: add missing ipp_di clocks to clock controller node
  clk: imx6q: Add ipp-di0 and ipp-di1 clocks
  ARM: dts: imx6q: add ipp_di0 and ipp_di1 pad configuration

 .../bindings/clock/imx6q-clock.yaml           |  4 ++
 arch/arm/boot/dts/imx6dl-pinfunc.h            |  3 ++
 arch/arm/boot/dts/imx6q-pinfunc.h             |  3 ++
 arch/arm/boot/dts/imx6qdl.dtsi                | 38 +++++++++++++++++--
 drivers/clk/imx/clk-imx6q.c                   | 20 ++++++----
 include/dt-bindings/clock/imx6qdl-clock.h     |  4 +-
 6 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.25.1

