Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23973CDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 08:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjJLIb2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 04:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbjJLIb1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 04:31:27 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D16B91;
        Thu, 12 Oct 2023 01:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697099485; x=1728635485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=annNMPKhKuxfgD9AX+6CdDKWsjBnFe8TKZvClcTuvys=;
  b=lsWZVj5XWEAc4Vdd65hlYMOehaplVEFvm6FM/F1dPc0E0XSnomvczAOA
   VP5xJ+iHanVSJbFKLBzCXi7CfEKldbPyjZHDoJj99lb2qFCtx5gmIoUBj
   GTNjIOHeuxBrs3xJYHkKMIXkZm0thkdpzuQj8Z68m4Yox9suPXy2J/2ft
   8H5kyipTW60PDfm3e/w3ShI9cU50lGECfCVwo7ItRGkMmscLKcpt7XyiP
   2bys09F1HgO0bl8IAHY5S0mo0w/yvYfdEs8r1/u9tx7OqxrBA2eTHC7jT
   IQOpRlWw0qQy7IwgKcCh5F0IPW+5y+hB1wbfiE2tUXo/LsOpVHqBAYj6F
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,218,1694728800"; 
   d="scan'208";a="33423940"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Oct 2023 10:31:23 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 508B7280082;
        Thu, 12 Oct 2023 10:31:23 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] imx8m: Add CCM interrupts
Date:   Thu, 12 Oct 2023 10:31:20 +0200
Message-Id: <20231012083123.2729494-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this is v2 of the series adding i.MX8M CCM interrupts to SoC-DT.
Patch 1 of v2 has already been applied in commit 6e6bb1639136f
("dt-bindings: clock: imx8m: Add missing interrupt property").

It's worth mentioning that these interrupts are mentioned in RM, but are
currently unused by the CCM driver.

Changes in v2:
* Rebased to next-20231012

Thanks,
Alexander

Alexander Stein (3):
  arm64: dts: imx8mp: Add CCM interrupts
  arm64: dts: imx8mn: Add CCM interrupts
  arm64: dts: imx8mm: Add CCM interrupts

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.34.1

