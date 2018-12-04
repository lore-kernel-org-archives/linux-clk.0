Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42D8C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B01C20851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eV0vFeu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B01C20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbeLDJ0d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:33 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4042 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeLDJ0d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:33 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648480000>; Tue, 04 Dec 2018 01:26:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Dec 2018 01:26:30 -0800
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:30 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:30 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648440002>; Tue, 04 Dec 2018 01:26:30 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM regulator
Date:   Tue, 4 Dec 2018 17:25:30 +0800
Message-ID: <20181204092548.3038-2-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915593; bh=tJnc+qAFHVRJa54L5yE057fC3CXa15Vw8eOrB3IE/70=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=eV0vFeu+TMsgfnsvP9cwRRu6LPbfFF11pHcAOmgI95zB4Xw7PJWjX1AOwP9Lf33Dg
         42RAUoOQben7XGhrCSgS6ZeKYwm4gl0sMQteVq6iQePH1sxhLHPG5MHV4SVQuPjt/s
         90/LBNGtFu5e0qOWKMd1JmXC8jbC4FE9UMljXELKJsG4s3fH1pR+aZbj93KCRV1DJd
         t7XK7bAdQ1MyGH1Zrd7ee7NA/Tzd5LNv0Tya1JRIptpKUWT7qoz53MiUL20uJ+/e5o
         crPnd7Z+RCCs34wejaKAj8oOxtY30LChUBFp2F+Yi4Ux9jflAa5r1x8ZI3mlOGgIpi
         /ZuZEh/Bicxhg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Add new properties to configure the DFLL PWM regulator support. Also
add an example and make the I2C clock only required when I2C support is
used.

Cc: devicetree@vger.kernel.org
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.t=
xt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index dff236f524a7..8c97600d2bad 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage=
 controlled
 oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
 control module that will automatically adjust the VDD_CPU voltage by
 communicating with an off-chip PMIC either via an I2C bus or via PWM signa=
ls.
-Currently only the I2C mode is supported by these bindings.
=20
 Required properties:
 - compatible : should be "nvidia,tegra124-dfll"
@@ -45,10 +44,28 @@ Required properties for the control loop parameters:
 Optional properties for the control loop parameters:
 - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in th=
e TRM.
=20
+Optional properties for mode selection:
+- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
+
 Required properties for I2C mode:
 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
=20
-Example:
+Required properties for PWM mode:
+- nvidia,pwm-period: period of PWM square wave in microseconds.
+- nvidia,init-uv: Regulator voltage in micro volts when PWM control is dis=
abled.
+- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM contro=
l is
+			  enabled and PWM output is low.
+- nvidia,align-step-uv: Voltage increase in micro volts corresponding to a
+			1/33th increase in duty cycle. Eg the voltage for 2/33th
+			duty cycle would be:
+			nvidia,align-offset-uv + nvidia,align-step-uv * 2.
+- pinctrl-0: I/O pad configuration when PWM control is enabled.
+- pinctrl-1: I/O pad configuration when PWM control is disabled.
+- pinctrl-names: must include the following entries:
+  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
+  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
+
+Example for I2C:
=20
 clock@70110000 {
         compatible =3D "nvidia,tegra124-dfll";
@@ -76,3 +93,55 @@ clock@70110000 {
=20
         nvidia,i2c-fs-rate =3D <400000>;
 };
+
+Example for PWM:
+
+clock@70110000 {
+	compatible =3D "nvidia,tegra124-dfll";
+	reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
+	      <0 0x70110000 0 0x100>, /* I2C output control */
+	      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
+	      <0 0x70110200 0 0x100>; /* Look-up table RAM */
+	interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+	clocks =3D <&tegra_car TEGRA210_CLK_DFLL_SOC>,
+	         <&tegra_car TEGRA210_CLK_DFLL_REF>,
+		 <&tegra_car TEGRA124_CLK_I2C5>;;
+	clock-names =3D "soc", "ref", "i2c";
+	resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
+	reset-names =3D "dvco";
+	#clock-cells =3D <0>;
+	clock-output-names =3D "dfllCPU_out";
+	nvidia,pwm-to-pmic;
+	nvidia,init-uv =3D <1000000>;
+	nvidia,align-step-uv =3D <19200>; /* 19.2mV */
+	nvidia,align-offset-uv =3D <708000>; /* 708mV */
+	nvidia,sample-rate =3D <25000>;
+	nvidia,droop-ctrl =3D <0x00000f00>;
+	nvidia,force-mode =3D <1>;
+	nvidia,cf =3D <6>;
+	nvidia,ci =3D <0>;
+	nvidia,cg =3D <2>;
+	nvidia,pwm-period =3D <2500>; /* 2.5us */
+	pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";
+	pinctrl-0 =3D <&dvfs_pwm_active_state>;
+	pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
+};
+
+/* pinmux nodes added for completeness. Binding doc can be found in:
+ * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+ */
+
+pinmux: pinmux@700008d4 {
+	dvfs_pwm_active_state: dvfs_pwm_active {
+		dvfs_pwm_pbb1 {
+			nvidia,pins =3D "dvfs_pwm_pbb1";
+			nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
+		};
+	};
+	dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+		dvfs_pwm_pbb1 {
+			nvidia,pins =3D "dvfs_pwm_pbb1";
+			nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
+		};
+	};
+};
--=20
2.19.2

