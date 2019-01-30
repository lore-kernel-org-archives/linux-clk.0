Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C418BC282DA
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 11:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F878218AE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 11:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbfA3Llg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 06:41:36 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:46510 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726857AbfA3Llg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 06:41:36 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0UBd5f0014292;
        Wed, 30 Jan 2019 05:41:30 -0600
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2q8muvmyf7-1;
        Wed, 30 Jan 2019 05:41:29 -0600
Received: from EX17.ad.cirrus.com (ex17.ad.cirrus.com [172.20.9.81])
        by mail3.cirrus.com (Postfix) with ESMTP id 97095611C8BB;
        Wed, 30 Jan 2019 05:41:35 -0600 (CST)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Wed, 30 Jan 2019
 11:41:29 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x0UBfSEp009240; Wed,
 30 Jan 2019 11:41:28 GMT
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <lee.jones@linaro.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linus.walleij@linaro.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v7 2/6] clk: lochnagar: Add initial binding documentation
Date:   Wed, 30 Jan 2019 11:41:24 +0000
Message-ID: <20190130114128.21083-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1901300094
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

No changes since v6.

Thanks,
Charles

 .../devicetree/bindings/clock/cirrus,lochnagar.txt | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
new file mode 100644
index 0000000000000..b8d8ef3bdc5f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
@@ -0,0 +1,93 @@
+Cirrus Logic Lochnagar Audio Development Board
+
+Lochnagar is an evaluation and development board for Cirrus Logic
+Smart CODEC and Amp devices. It allows the connection of most Cirrus
+Logic devices on mini-cards, as well as allowing connection of
+various application processor systems to provide a full evaluation
+platform.  Audio system topology, clocking and power can all be
+controlled through the Lochnagar, allowing the device under test
+to be used in a variety of possible use cases.
+
+This binding document describes the binding for the clock portion of
+the driver.
+
+Also see these documents for generic binding information:
+  [1] Clock : ../clock/clock-bindings.txt
+
+And these for relevant defines:
+  [2] include/dt-bindings/clock/lochnagar.h
+
+This binding must be part of the Lochnagar MFD binding:
+  [3] ../mfd/cirrus,lochnagar.txt
+
+Required properties:
+
+  - compatible : One of the following strings:
+                 "cirrus,lochnagar1-clk"
+                 "cirrus,lochnagar2-clk"
+
+  - #clock-cells : Must be 1. The first cell indicates the clock
+    number, see [2] for available clocks and [1].
+
+Optional properties:
+
+  - clocks : Must contain an entry for each clock in clock-names.
+  - clock-names : May contain entries for each of the following
+    clocks:
+     - ln-cdc-clkout : Output clock from CODEC card.
+     - ln-dsp-clkout : Output clock from DSP card.
+     - ln-gf-mclk1,ln-gf-mclk2,ln-gf-mclk3,ln-gf-mclk4 : Optional
+       input audio clocks from host system.
+     - ln-psia1-mclk, ln-psia2-mclk : Optional input audio clocks from
+       external connector.
+     - ln-spdif-clkout : Optional input audio clock from SPDIF.
+     - ln-adat-mclk : Optional input audio clock from ADAT.
+     - ln-pmic-32k : On board fixed clock.
+     - ln-clk-12m : On board fixed clock.
+     - ln-clk-11m : On board fixed clock.
+     - ln-clk-24m : On board fixed clock.
+     - ln-clk-22m : On board fixed clock.
+     - ln-clk-8m : On board fixed clock.
+     - ln-usb-clk-24m : On board fixed clock.
+     - ln-usb-clk-12m : On board fixed clock.
+
+  - assigned-clocks : A list of Lochnagar clocks to be reparented, see
+    [2] for available clocks.
+  - assigned-clock-parents : Parents to be assigned to the clocks
+    listed in "assigned-clocks".
+
+Optional nodes:
+
+  - fixed-clock nodes may be registered for the following on board clocks:
+     - ln-pmic-32k : 32768 Hz
+     - ln-clk-12m : 12288000 Hz
+     - ln-clk-11m : 11298600 Hz
+     - ln-clk-24m : 24576000 Hz
+     - ln-clk-22m : 22579200 Hz
+     - ln-clk-8m : 8192000 Hz
+     - ln-usb-clk-24m : 24576000 Hz
+     - ln-usb-clk-12m : 12288000 Hz
+
+Example:
+
+lochnagar {
+	lochnagar-clk {
+		compatible = "cirrus,lochnagar2-clk";
+
+		#clock-cells = <1>;
+
+		clocks = <&clk-audio>, <&clk_pmic>;
+		clock-names = "ln-gf-mclk2", "ln-pmic-32k";
+
+		assigned-clocks = <&lochnagar-clk LOCHNAGAR_CDC_MCLK1>,
+				  <&lochnagar-clk LOCHNAGAR_CDC_MCLK2>;
+		assigned-clock-parents = <&clk-audio>,
+					 <&clk-pmic>;
+	};
+
+	clk-pmic: clk-pmic {
+		compatible = "fixed-clock";
+		clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
-- 
2.11.0

