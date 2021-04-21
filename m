Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0329C433B4
	for <linux-clk@archiver.kernel.org>; Wed, 21 Apr 2021 16:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F8B06144C
	for <linux-clk@archiver.kernel.org>; Wed, 21 Apr 2021 16:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbhDUQkl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Apr 2021 12:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbhDUQkh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Apr 2021 12:40:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16ACC06138A;
        Wed, 21 Apr 2021 09:40:02 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 12so67579481lfq.13;
        Wed, 21 Apr 2021 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RT1Isl9XOqm5Gmt7X255y3ohiNcOW61XunZZjevIg0s=;
        b=M86ZX0Wouo3YpdaD622F4bu1TtsZ8QvrSai+tRwsZXoTm/oH7eESj7rHysoZLfhlSd
         Kjrs8CK6BvIQT4vnpr2GAWhgUxgt1Vu2vwQ6gkE3dzAoBoh1vJ1ko7w5j/3BWcaZ/uuA
         gvWpBMHyM/JtYMi4Ysqi1baJ0fntxncHxfcxTy/1QCJJ+sHGpabn4bWbWMMtYubNyrx2
         pRxMegp0XElPAdebgDMfybE5lTv2dn2blZPoE96LijdecfBOV19kxvMqklPpFnRPo0lH
         2MEtkPM1MAlsW0wdBC2dV7b+NRszoXclE31QbCVa7aINFv5z0miZ0c9UkaS+22PRBHF/
         43uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RT1Isl9XOqm5Gmt7X255y3ohiNcOW61XunZZjevIg0s=;
        b=JL+IvH6avwjkwNltuQQs0SnkTNukZWmW0nzwazFMs6G5Qx8+hiVsK1Jlz/E0LtvIFD
         PPXHxPD8f3PzrYsz1iOmf9MnVPmqRXhYbJqgf8yovqu3aRysrxsIOJ0DB9A8Ju5R/uW9
         tggu6UbcAW+F30+cjO8b1BOf8KmWJt3DvxIvVeiKXbrGFE9uiVzNtLsAlNHlcCYId9gD
         6F76eN7M64qmhTqNM68Rsfg2U91stY6qTvGo8eTbvkLeopRW+3duZXVxErwMNhFbWT1A
         syqendjXMS8h17IE8gtysGUtPrfFRXnF6qiidcOybvCx7iFA0xgeN0FahclqN6waOIC3
         OM5A==
X-Gm-Message-State: AOAM533lsvoQOPFJZcbuQ0AcQKDj/CLAEVr4VNWXZP3NOW+MowDX/WuZ
        mXnuCpVT/h16ajnMJoIaVVcDBgP3gnA=
X-Google-Smtp-Source: ABdhPJxr9X7joZCDUYOZC2yoWelxafpU4D/43Dhs8WXXUFRNqdr2hCzgB5uSqvPyQAdYJ9I/UR8BXA==
X-Received: by 2002:a05:6512:3e09:: with SMTP id i9mr6035349lfv.243.1619023201162;
        Wed, 21 Apr 2021 09:40:01 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id d6sm7174lfv.251.2021.04.21.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:40:00 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: clock: brcm,iproc-clocks: convert to the json-schema
Date:   Wed, 21 Apr 2021 18:39:48 +0200
Message-Id: <20210421163948.11229-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/clock/brcm,iproc-clocks.txt      | 313 --------------
 .../bindings/clock/brcm,iproc-clocks.yaml     | 397 ++++++++++++++++++
 2 files changed, 397 insertions(+), 313 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
deleted file mode 100644
index ab730ea0a560..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
+++ /dev/null
@@ -1,313 +0,0 @@
-Broadcom iProc Family Clocks
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The iProc clock controller manages clocks that are common to the iProc family.
-An SoC from the iProc family may have several PPLs, e.g., ARMPLL, GENPLL,
-LCPLL0, MIPIPLL, and etc., all derived from an onboard crystal. Each PLL
-comprises of several leaf clocks
-
-Required properties for a PLL and its leaf clocks:
-
-- compatible:
-    Should have a value of the form "brcm,<soc>-<pll>". For example, GENPLL on
-Cygnus has a compatible string of "brcm,cygnus-genpll"
-
-- #clock-cells:
-    Have a value of <1> since there are more than 1 leaf clock of a given PLL
-
-- reg:
-    Define the base and range of the I/O address space that contain the iProc
-clock control registers required for the PLL
-
-- clocks:
-    The input parent clock phandle for the PLL. For most iProc PLLs, this is an
-onboard crystal with a fixed rate
-
-- clock-output-names:
-    An ordered list of strings defining the names of the clocks
-
-Example:
-
-	osc: oscillator {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
-	};
-
-	genpll: genpll {
-		#clock-cells = <1>;
-		compatible = "brcm,cygnus-genpll";
-		reg = <0x0301d000 0x2c>, <0x0301c020 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "genpll", "axi21", "250mhz", "ihost_sys",
-				     "enet_sw", "audio_125", "can";
-	};
-
-Required properties for ASIU clocks:
-
-ASIU clocks are a special case. These clocks are derived directly from the
-reference clock of the onboard crystal
-
-- compatible:
-    Should have a value of the form "brcm,<soc>-asiu-clk". For example, ASIU
-clocks for Cygnus have a compatible string of "brcm,cygnus-asiu-clk"
-
-- #clock-cells:
-    Have a value of <1> since there are more than 1 ASIU clocks
-
-- reg:
-    Define the base and range of the I/O address space that contain the iProc
-clock control registers required for ASIU clocks
-
-- clocks:
-    The input parent clock phandle for the ASIU clock, i.e., the onboard
-crystal
-
-- clock-output-names:
-    An ordered list of strings defining the names of the ASIU clocks
-
-Example:
-
-	osc: oscillator {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
-	};
-
-	asiu_clks: asiu_clks {
-		#clock-cells = <1>;
-		compatible = "brcm,cygnus-asiu-clk";
-		reg = <0x0301d048 0xc>, <0x180aa024 0x4>;
-		clocks = <&osc>;
-		clock-output-names = "keypad", "adc/touch", "pwm";
-	};
-
-Cygnus
-------
-PLL and leaf clock compatible strings for Cygnus are:
-    "brcm,cygnus-armpll"
-    "brcm,cygnus-genpll"
-    "brcm,cygnus-lcpll0"
-    "brcm,cygnus-mipipll"
-    "brcm,cygnus-asiu-clk"
-    "brcm,cygnus-audiopll"
-
-The following table defines the set of PLL/clock index and ID for Cygnus.
-These clock IDs are defined in:
-    "include/dt-bindings/clock/bcm-cygnus.h"
-
-    Clock      Source (Parent)  Index   ID
-    ---        -----            -----   ---------
-    crystal    N/A              N/A     N/A
-
-    armpll     crystal          N/A     N/A
-
-    keypad     crystal (ASIU)   0       BCM_CYGNUS_ASIU_KEYPAD_CLK
-    adc/tsc    crystal (ASIU)   1       BCM_CYGNUS_ASIU_ADC_CLK
-    pwm        crystal (ASIU)   2       BCM_CYGNUS_ASIU_PWM_CLK
-
-    genpll     crystal          0       BCM_CYGNUS_GENPLL
-    axi21      genpll           1       BCM_CYGNUS_GENPLL_AXI21_CLK
-    250mhz     genpll           2       BCM_CYGNUS_GENPLL_250MHZ_CLK
-    ihost_sys  genpll           3       BCM_CYGNUS_GENPLL_IHOST_SYS_CLK
-    enet_sw    genpll           4       BCM_CYGNUS_GENPLL_ENET_SW_CLK
-    audio_125  genpll           5       BCM_CYGNUS_GENPLL_AUDIO_125_CLK
-    can        genpll           6       BCM_CYGNUS_GENPLL_CAN_CLK
-
-    lcpll0     crystal          0       BCM_CYGNUS_LCPLL0
-    pcie_phy   lcpll0           1       BCM_CYGNUS_LCPLL0_PCIE_PHY_REF_CLK
-    ddr_phy    lcpll0           2       BCM_CYGNUS_LCPLL0_DDR_PHY_CLK
-    sdio       lcpll0           3       BCM_CYGNUS_LCPLL0_SDIO_CLK
-    usb_phy    lcpll0           4       BCM_CYGNUS_LCPLL0_USB_PHY_REF_CLK
-    smart_card lcpll0           5       BCM_CYGNUS_LCPLL0_SMART_CARD_CLK
-    ch5_unused lcpll0           6       BCM_CYGNUS_LCPLL0_CH5_UNUSED
-
-    mipipll    crystal          0       BCM_CYGNUS_MIPIPLL
-    ch0_unused mipipll          1       BCM_CYGNUS_MIPIPLL_CH0_UNUSED
-    ch1_lcd    mipipll          2       BCM_CYGNUS_MIPIPLL_CH1_LCD
-    ch2_v3d    mipipll          3       BCM_CYGNUS_MIPIPLL_CH2_V3D
-    ch3_unused mipipll          4       BCM_CYGNUS_MIPIPLL_CH3_UNUSED
-    ch4_unused mipipll          5       BCM_CYGNUS_MIPIPLL_CH4_UNUSED
-    ch5_unused mipipll          6       BCM_CYGNUS_MIPIPLL_CH5_UNUSED
-
-    audiopll   crystal          0       BCM_CYGNUS_AUDIOPLL
-    ch0_audio  audiopll         1       BCM_CYGNUS_AUDIOPLL_CH0
-    ch1_audio  audiopll         2       BCM_CYGNUS_AUDIOPLL_CH1
-    ch2_audio  audiopll         3       BCM_CYGNUS_AUDIOPLL_CH2
-
-Hurricane 2
-------
-PLL and leaf clock compatible strings for Hurricane 2 are:
- "brcm,hr2-armpll"
-
-The following table defines the set of PLL/clock for Hurricane 2:
-
-    Clock	Source		Index	ID
-    ---		-----		-----	---------
-    crystal	N/A		N/A	N/A
-
-    armpll	crystal		N/A	N/A
-
-
-Northstar and Northstar Plus
-------
-PLL and leaf clock compatible strings for Northstar and Northstar Plus are:
- "brcm,nsp-armpll"
- "brcm,nsp-genpll"
- "brcm,nsp-lcpll0"
-
-The following table defines the set of PLL/clock index and ID for Northstar and
-Northstar Plus.  These clock IDs are defined in:
-    "include/dt-bindings/clock/bcm-nsp.h"
-
-    Clock	Source		Index	ID
-    ---		-----		-----	---------
-    crystal	N/A		N/A	N/A
-
-    armpll	crystal		N/A	N/A
-
-    genpll	crystal		0	BCM_NSP_GENPLL
-    phy		genpll		1	BCM_NSP_GENPLL_PHY_CLK
-    ethernetclk	genpll		2	BCM_NSP_GENPLL_ENET_SW_CLK
-    usbclk	genpll		3	BCM_NSP_GENPLL_USB_PHY_REF_CLK
-    iprocfast	genpll		4	BCM_NSP_GENPLL_IPROCFAST_CLK
-    sata1	genpll		5	BCM_NSP_GENPLL_SATA1_CLK
-    sata2	genpll		6	BCM_NSP_GENPLL_SATA2_CLK
-
-    lcpll0	crystal		0	BCM_NSP_LCPLL0
-    pcie_phy	lcpll0		1	BCM_NSP_LCPLL0_PCIE_PHY_REF_CLK
-    sdio	lcpll0		2	BCM_NSP_LCPLL0_SDIO_CLK
-    ddr_phy	lcpll0		3	BCM_NSP_LCPLL0_DDR_PHY_CLK
-
-Northstar 2
------------
-PLL and leaf clock compatible strings for Northstar 2 are:
-    "brcm,ns2-genpll-scr"
-    "brcm,ns2-genpll-sw"
-    "brcm,ns2-lcpll-ddr"
-    "brcm,ns2-lcpll-ports"
-
-The following table defines the set of PLL/clock index and ID for Northstar 2.
-These clock IDs are defined in:
-    "include/dt-bindings/clock/bcm-ns2.h"
-
-    Clock	Source		Index	ID
-    ---		-----		-----	---------
-    crystal	N/A		N/A	N/A
-
-    genpll_scr	crystal		0	BCM_NS2_GENPLL_SCR
-    scr		genpll_scr	1	BCM_NS2_GENPLL_SCR_SCR_CLK
-    fs		genpll_scr	2	BCM_NS2_GENPLL_SCR_FS_CLK
-    audio_ref	genpll_scr	3	BCM_NS2_GENPLL_SCR_AUDIO_CLK
-    ch3_unused	genpll_scr	4	BCM_NS2_GENPLL_SCR_CH3_UNUSED
-    ch4_unused	genpll_scr	5	BCM_NS2_GENPLL_SCR_CH4_UNUSED
-    ch5_unused	genpll_scr	6	BCM_NS2_GENPLL_SCR_CH5_UNUSED
-
-    genpll_sw	crystal		0	BCM_NS2_GENPLL_SW
-    rpe		genpll_sw	1	BCM_NS2_GENPLL_SW_RPE_CLK
-    250		genpll_sw	2	BCM_NS2_GENPLL_SW_250_CLK
-    nic		genpll_sw	3	BCM_NS2_GENPLL_SW_NIC_CLK
-    chimp	genpll_sw	4	BCM_NS2_GENPLL_SW_CHIMP_CLK
-    port	genpll_sw	5	BCM_NS2_GENPLL_SW_PORT_CLK
-    sdio	genpll_sw	6	BCM_NS2_GENPLL_SW_SDIO_CLK
-
-    lcpll_ddr	crystal		0	BCM_NS2_LCPLL_DDR
-    pcie_sata_usb lcpll_ddr	1	BCM_NS2_LCPLL_DDR_PCIE_SATA_USB_CLK
-    ddr		lcpll_ddr	2	BCM_NS2_LCPLL_DDR_DDR_CLK
-    ch2_unused	lcpll_ddr	3	BCM_NS2_LCPLL_DDR_CH2_UNUSED
-    ch3_unused	lcpll_ddr	4	BCM_NS2_LCPLL_DDR_CH3_UNUSED
-    ch4_unused	lcpll_ddr	5	BCM_NS2_LCPLL_DDR_CH4_UNUSED
-    ch5_unused	lcpll_ddr	6	BCM_NS2_LCPLL_DDR_CH5_UNUSED
-
-    lcpll_ports	crystal		0	BCM_NS2_LCPLL_PORTS
-    wan		lcpll_ports	1	BCM_NS2_LCPLL_PORTS_WAN_CLK
-    rgmii	lcpll_ports	2	BCM_NS2_LCPLL_PORTS_RGMII_CLK
-    ch2_unused	lcpll_ports	3	BCM_NS2_LCPLL_PORTS_CH2_UNUSED
-    ch3_unused	lcpll_ports	4	BCM_NS2_LCPLL_PORTS_CH3_UNUSED
-    ch4_unused	lcpll_ports	5	BCM_NS2_LCPLL_PORTS_CH4_UNUSED
-    ch5_unused	lcpll_ports	6	BCM_NS2_LCPLL_PORTS_CH5_UNUSED
-
-BCM63138
---------
-PLL and leaf clock compatible strings for BCM63138 are:
-    "brcm,bcm63138-armpll"
-
-Stingray
------------
-PLL and leaf clock compatible strings for Stingray are:
-    "brcm,sr-genpll0"
-    "brcm,sr-genpll1"
-    "brcm,sr-genpll2"
-    "brcm,sr-genpll3"
-    "brcm,sr-genpll4"
-    "brcm,sr-genpll5"
-    "brcm,sr-genpll6"
-
-    "brcm,sr-lcpll0"
-    "brcm,sr-lcpll1"
-    "brcm,sr-lcpll-pcie"
-
-
-The following table defines the set of PLL/clock index and ID for Stingray.
-These clock IDs are defined in:
-    "include/dt-bindings/clock/bcm-sr.h"
-
-    Clock		Source		Index	ID
-    ---			-----		-----	---------
-    crystal		N/A		N/A	N/A
-    crmu_ref25m		crystal		N/A	N/A
-
-    genpll0		crystal		0	BCM_SR_GENPLL0
-    clk_125m		genpll0		1	BCM_SR_GENPLL0_125M_CLK
-    clk_scr		genpll0		2	BCM_SR_GENPLL0_SCR_CLK
-    clk_250		genpll0		3	BCM_SR_GENPLL0_250M_CLK
-    clk_pcie_axi	genpll0		4	BCM_SR_GENPLL0_PCIE_AXI_CLK
-    clk_paxc_axi_x2	genpll0		5	BCM_SR_GENPLL0_PAXC_AXI_X2_CLK
-    clk_paxc_axi	genpll0		6	BCM_SR_GENPLL0_PAXC_AXI_CLK
-
-    genpll1		crystal		0	BCM_SR_GENPLL1
-    clk_pcie_tl		genpll1		1	BCM_SR_GENPLL1_PCIE_TL_CLK
-    clk_mhb_apb		genpll1		2	BCM_SR_GENPLL1_MHB_APB_CLK
-
-    genpll2		crystal		0	BCM_SR_GENPLL2
-    clk_nic		genpll2		1	BCM_SR_GENPLL2_NIC_CLK
-    clk_ts_500_ref	genpll2		2	BCM_SR_GENPLL2_TS_500_REF_CLK
-    clk_125_nitro	genpll2		3	BCM_SR_GENPLL2_125_NITRO_CLK
-    clk_chimp		genpll2		4	BCM_SR_GENPLL2_CHIMP_CLK
-    clk_nic_flash	genpll2		5	BCM_SR_GENPLL2_NIC_FLASH_CLK
-    clk_fs		genpll2		6	BCM_SR_GENPLL2_FS_CLK
-
-    genpll3		crystal		0	BCM_SR_GENPLL3
-    clk_hsls		genpll3		1	BCM_SR_GENPLL3_HSLS_CLK
-    clk_sdio		genpll3		2	BCM_SR_GENPLL3_SDIO_CLK
-
-    genpll4		crystal		0	BCM_SR_GENPLL4
-    clk_ccn		genpll4		1	BCM_SR_GENPLL4_CCN_CLK
-    clk_tpiu_pll	genpll4		2	BCM_SR_GENPLL4_TPIU_PLL_CLK
-    clk_noc		genpll4		3	BCM_SR_GENPLL4_NOC_CLK
-    clk_chclk_fs4	genpll4		4	BCM_SR_GENPLL4_CHCLK_FS4_CLK
-    clk_bridge_fscpu	genpll4		5	BCM_SR_GENPLL4_BRIDGE_FSCPU_CLK
-
-    genpll5		crystal		0	BCM_SR_GENPLL5
-    clk_fs4_hf		genpll5		1	BCM_SR_GENPLL5_FS4_HF_CLK
-    clk_crypto_ae	genpll5		2	BCM_SR_GENPLL5_CRYPTO_AE_CLK
-    clk_raid_ae		genpll5		3	BCM_SR_GENPLL5_RAID_AE_CLK
-
-    genpll6		crystal		0	BCM_SR_GENPLL6
-    clk_48_usb		genpll6		1	BCM_SR_GENPLL6_48_USB_CLK
-
-    lcpll0		crystal		0	BCM_SR_LCPLL0
-    clk_sata_refp 	lcpll0		1	BCM_SR_LCPLL0_SATA_REFP_CLK
-    clk_sata_refn	lcpll0		2	BCM_SR_LCPLL0_SATA_REFN_CLK
-    clk_sata_350	lcpll0		3	BCM_SR_LCPLL0_SATA_350_CLK
-    clk_sata_500	lcpll0		4	BCM_SR_LCPLL0_SATA_500_CLK
-
-    lcpll1		crystal		0	BCM_SR_LCPLL1
-    clk_wan		lcpll1		1	BCM_SR_LCPLL1_WAN_CLK
-    clk_usb_ref		lcpll1		2	BCM_SR_LCPLL1_USB_REF_CLK
-    clk_crmu_ts		lcpll1		3	BCM_SR_LCPLL1_CRMU_TS_CLK
-
-    lcpll_pcie		crystal		0	BCM_SR_LCPLL_PCIE
-    clk_pcie_phy_ref	lcpll1		1	BCM_SR_LCPLL_PCIE_PHY_REF_CLK
diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
new file mode 100644
index 000000000000..8aa504bb2958
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
@@ -0,0 +1,397 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom iProc Family Clocks
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+description: |
+  This binding uses the common clock binding:
+      Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+  The iProc clock controller manages clocks that are common to the iProc family.
+  An SoC from the iProc family may have several PPLs, e.g., ARMPLL, GENPLL,
+  LCPLL0, MIPIPLL, and etc., all derived from an onboard crystal. Each PLL
+  comprises of several leaf clocks
+
+  ASIU clocks are a special case. These clocks are derived directly from the
+  reference clock of the onboard crystal.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm63138-armpll
+      - brcm,cygnus-armpll
+      - brcm,cygnus-genpll
+      - brcm,cygnus-lcpll0
+      - brcm,cygnus-mipipll
+      - brcm,cygnus-asiu-clk
+      - brcm,cygnus-audiopll
+      - brcm,hr2-armpll
+      - brcm,nsp-armpll
+      - brcm,nsp-genpll
+      - brcm,nsp-lcpll0
+      - brcm,ns2-genpll-scr
+      - brcm,ns2-genpll-sw
+      - brcm,ns2-lcpll-ddr
+      - brcm,ns2-lcpll-ports
+      - brcm,sr-genpll0
+      - brcm,sr-genpll1
+      - brcm,sr-genpll2
+      - brcm,sr-genpll3
+      - brcm,sr-genpll4
+      - brcm,sr-genpll5
+      - brcm,sr-genpll6
+      - brcm,sr-lcpll0
+      - brcm,sr-lcpll1
+      - brcm,sr-lcpll-pcie
+
+  reg:
+    minItems: 1
+    maxItems: 3
+    items:
+      - description: base register
+      - description: power register
+      - description: ASIU or split status register
+
+  clocks:
+    description: The input parent clock phandle for the PLL / ASIU clock. For
+      most iProc PLLs, this is an onboard crystal with a fixed rate.
+    minItems: 1
+    maxItems: 45
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,cygnus-armpll
+              - brcm,cygnus-genpll
+              - brcm,cygnus-lcpll0
+              - brcm,cygnus-mipipll
+              - brcm,cygnus-asiu-clk
+              - brcm,cygnus-audiopll
+    then:
+      properties:
+        clocks:
+          description: |
+            The following table defines the set of PLL/clock index and ID for Cygnus.
+            These clock IDs are defined in:
+                "include/dt-bindings/clock/bcm-cygnus.h"
+
+            Clock      	Source (Parent)	Index	ID
+            -----	---------------	-----	--
+            crystal	N/A		N/A	N/A
+
+            armpll	crystal		N/A	N/A
+
+            keypad	crystal (ASIU)	0	BCM_CYGNUS_ASIU_KEYPAD_CLK
+            adc/tsc	crystal (ASIU)	1	BCM_CYGNUS_ASIU_ADC_CLK
+            pwm	crystal (ASIU)		2	BCM_CYGNUS_ASIU_PWM_CLK
+
+            genpll	crystal		0	BCM_CYGNUS_GENPLL
+            axi21	genpll		1	BCM_CYGNUS_GENPLL_AXI21_CLK
+            250mhz	genpll		2	BCM_CYGNUS_GENPLL_250MHZ_CLK
+            ihost_sys	genpll		3	BCM_CYGNUS_GENPLL_IHOST_SYS_CLK
+            enet_sw	genpll		4	BCM_CYGNUS_GENPLL_ENET_SW_CLK
+            audio_125	genpll		5	BCM_CYGNUS_GENPLL_AUDIO_125_CLK
+            can		genpll		6	BCM_CYGNUS_GENPLL_CAN_CLK
+
+            lcpll0	crystal		0	BCM_CYGNUS_LCPLL0
+            pcie_phy	lcpll0		1	BCM_CYGNUS_LCPLL0_PCIE_PHY_REF_CLK
+            ddr_phy	lcpll0		2	BCM_CYGNUS_LCPLL0_DDR_PHY_CLK
+            sdio	lcpll0		3	BCM_CYGNUS_LCPLL0_SDIO_CLK
+            usb_phy	lcpll0		4	BCM_CYGNUS_LCPLL0_USB_PHY_REF_CLK
+            smart_card	lcpll0		5	BCM_CYGNUS_LCPLL0_SMART_CARD_CLK
+            ch5_unused	lcpll0		6	BCM_CYGNUS_LCPLL0_CH5_UNUSED
+
+            mipipll	crystal		0	BCM_CYGNUS_MIPIPLL
+            ch0_unused	mipipll		1	BCM_CYGNUS_MIPIPLL_CH0_UNUSED
+            ch1_lcd	mipipll		2	BCM_CYGNUS_MIPIPLL_CH1_LCD
+            ch2_v3d	mipipll		3	BCM_CYGNUS_MIPIPLL_CH2_V3D
+            ch3_unused	mipipll		4	BCM_CYGNUS_MIPIPLL_CH3_UNUSED
+            ch4_unused	mipipll		5	BCM_CYGNUS_MIPIPLL_CH4_UNUSED
+            ch5_unused	mipipll		6	BCM_CYGNUS_MIPIPLL_CH5_UNUSED
+
+            audiopll	crystal		0	BCM_CYGNUS_AUDIOPLL
+            ch0_audio	audiopll	1	BCM_CYGNUS_AUDIOPLL_CH0
+            ch1_audio	audiopll	2	BCM_CYGNUS_AUDIOPLL_CH1
+            ch2_audio	audiopll	3	BCM_CYGNUS_AUDIOPLL_CH2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,hr2-armpll
+    then:
+      properties:
+        clocks:
+          description: |
+            The following table defines the set of PLL/clock for Hurricane 2:
+
+            Clock	Source		Index	ID
+            -----	------		-----	--
+            crystal	N/A		N/A	N/A
+
+            armpll	crystal		N/A	N/A
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,nsp-armpll
+              - brcm,nsp-genpll
+              - brcm,nsp-lcpll0
+    then:
+      properties:
+        clocks:
+          description: |
+            The following table defines the set of PLL/clock index and ID for Northstar and
+            Northstar Plus.  These clock IDs are defined in:
+                "include/dt-bindings/clock/bcm-nsp.h"
+
+            Clock	Source		Index	ID
+            -----	------		-----	--
+            crystal	N/A		N/A	N/A
+
+            armpll	crystal		N/A	N/A
+
+            genpll	crystal		0	BCM_NSP_GENPLL
+            phy		genpll		1	BCM_NSP_GENPLL_PHY_CLK
+            ethernetclk	genpll		2	BCM_NSP_GENPLL_ENET_SW_CLK
+            usbclk	genpll		3	BCM_NSP_GENPLL_USB_PHY_REF_CLK
+            iprocfast	genpll		4	BCM_NSP_GENPLL_IPROCFAST_CLK
+            sata1	genpll		5	BCM_NSP_GENPLL_SATA1_CLK
+            sata2	genpll		6	BCM_NSP_GENPLL_SATA2_CLK
+
+            lcpll0	crystal		0	BCM_NSP_LCPLL0
+            pcie_phy	lcpll0		1	BCM_NSP_LCPLL0_PCIE_PHY_REF_CLK
+            sdio	lcpll0		2	BCM_NSP_LCPLL0_SDIO_CLK
+            ddr_phy	lcpll0		3	BCM_NSP_LCPLL0_DDR_PHY_CLK
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,ns2-genpll-scr
+              - brcm,ns2-genpll-sw
+              - brcm,ns2-lcpll-ddr
+              - brcm,ns2-lcpll-ports
+    then:
+      properties:
+        clocks:
+          description: |
+            The following table defines the set of PLL/clock index and ID for Northstar 2.
+            These clock IDs are defined in:
+                "include/dt-bindings/clock/bcm-ns2.h"
+
+            Clock	Source		Index	ID
+            -----	------		-----	--
+            crystal	N/A		N/A	N/A
+
+            genpll_scr	crystal		0	BCM_NS2_GENPLL_SCR
+            scr		genpll_scr	1	BCM_NS2_GENPLL_SCR_SCR_CLK
+            fs		genpll_scr	2	BCM_NS2_GENPLL_SCR_FS_CLK
+            audio_ref	genpll_scr	3	BCM_NS2_GENPLL_SCR_AUDIO_CLK
+            ch3_unused	genpll_scr	4	BCM_NS2_GENPLL_SCR_CH3_UNUSED
+            ch4_unused	genpll_scr	5	BCM_NS2_GENPLL_SCR_CH4_UNUSED
+            ch5_unused	genpll_scr	6	BCM_NS2_GENPLL_SCR_CH5_UNUSED
+
+            genpll_sw	crystal		0	BCM_NS2_GENPLL_SW
+            rpe		genpll_sw	1	BCM_NS2_GENPLL_SW_RPE_CLK
+            250		genpll_sw	2	BCM_NS2_GENPLL_SW_250_CLK
+            nic		genpll_sw	3	BCM_NS2_GENPLL_SW_NIC_CLK
+            chimp	genpll_sw	4	BCM_NS2_GENPLL_SW_CHIMP_CLK
+            port	genpll_sw	5	BCM_NS2_GENPLL_SW_PORT_CLK
+            sdio	genpll_sw	6	BCM_NS2_GENPLL_SW_SDIO_CLK
+
+            lcpll_ddr	crystal		0	BCM_NS2_LCPLL_DDR
+            pcie_sata_usb lcpll_ddr	1	BCM_NS2_LCPLL_DDR_PCIE_SATA_USB_CLK
+            ddr		lcpll_ddr	2	BCM_NS2_LCPLL_DDR_DDR_CLK
+            ch2_unused	lcpll_ddr	3	BCM_NS2_LCPLL_DDR_CH2_UNUSED
+            ch3_unused	lcpll_ddr	4	BCM_NS2_LCPLL_DDR_CH3_UNUSED
+            ch4_unused	lcpll_ddr	5	BCM_NS2_LCPLL_DDR_CH4_UNUSED
+            ch5_unused	lcpll_ddr	6	BCM_NS2_LCPLL_DDR_CH5_UNUSED
+
+            lcpll_ports	crystal		0	BCM_NS2_LCPLL_PORTS
+            wan		lcpll_ports	1	BCM_NS2_LCPLL_PORTS_WAN_CLK
+            rgmii	lcpll_ports	2	BCM_NS2_LCPLL_PORTS_RGMII_CLK
+            ch2_unused	lcpll_ports	3	BCM_NS2_LCPLL_PORTS_CH2_UNUSED
+            ch3_unused	lcpll_ports	4	BCM_NS2_LCPLL_PORTS_CH3_UNUSED
+            ch4_unused	lcpll_ports	5	BCM_NS2_LCPLL_PORTS_CH4_UNUSED
+            ch5_unused	lcpll_ports	6	BCM_NS2_LCPLL_PORTS_CH5_UNUSED
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,sr-genpll0
+              - brcm,sr-genpll1
+              - brcm,sr-genpll2
+              - brcm,sr-genpll3
+              - brcm,sr-genpll4
+              - brcm,sr-genpll5
+              - brcm,sr-genpll6
+              - brcm,sr-lcpll0
+              - brcm,sr-lcpll1
+              - brcm,sr-lcpll-pcie
+    then:
+      properties:
+        clocks:
+          description: |
+            The following table defines the set of PLL/clock index and ID for Stingray.
+            These clock IDs are defined in:
+                "include/dt-bindings/clock/bcm-sr.h"
+
+            Clock		Source		Index	ID
+            -----		------		-----	--
+            crystal		N/A		N/A	N/A
+            crmu_ref25m		crystal		N/A	N/A
+
+            genpll0		crystal		0	BCM_SR_GENPLL0
+            clk_125m		genpll0		1	BCM_SR_GENPLL0_125M_CLK
+            clk_scr		genpll0		2	BCM_SR_GENPLL0_SCR_CLK
+            clk_250		genpll0		3	BCM_SR_GENPLL0_250M_CLK
+            clk_pcie_axi	genpll0		4	BCM_SR_GENPLL0_PCIE_AXI_CLK
+            clk_paxc_axi_x2	genpll0		5	BCM_SR_GENPLL0_PAXC_AXI_X2_CLK
+            clk_paxc_axi	genpll0		6	BCM_SR_GENPLL0_PAXC_AXI_CLK
+
+            genpll1		crystal		0	BCM_SR_GENPLL1
+            clk_pcie_tl		genpll1		1	BCM_SR_GENPLL1_PCIE_TL_CLK
+            clk_mhb_apb		genpll1		2	BCM_SR_GENPLL1_MHB_APB_CLK
+
+            genpll2		crystal		0	BCM_SR_GENPLL2
+            clk_nic		genpll2		1	BCM_SR_GENPLL2_NIC_CLK
+            clk_ts_500_ref	genpll2		2	BCM_SR_GENPLL2_TS_500_REF_CLK
+            clk_125_nitro	genpll2		3	BCM_SR_GENPLL2_125_NITRO_CLK
+            clk_chimp		genpll2		4	BCM_SR_GENPLL2_CHIMP_CLK
+            clk_nic_flash	genpll2		5	BCM_SR_GENPLL2_NIC_FLASH_CLK
+            clk_fs		genpll2		6	BCM_SR_GENPLL2_FS_CLK
+
+            genpll3		crystal		0	BCM_SR_GENPLL3
+            clk_hsls		genpll3		1	BCM_SR_GENPLL3_HSLS_CLK
+            clk_sdio		genpll3		2	BCM_SR_GENPLL3_SDIO_CLK
+
+            genpll4		crystal		0	BCM_SR_GENPLL4
+            clk_ccn		genpll4		1	BCM_SR_GENPLL4_CCN_CLK
+            clk_tpiu_pll	genpll4		2	BCM_SR_GENPLL4_TPIU_PLL_CLK
+            clk_noc		genpll4		3	BCM_SR_GENPLL4_NOC_CLK
+            clk_chclk_fs4	genpll4		4	BCM_SR_GENPLL4_CHCLK_FS4_CLK
+            clk_bridge_fscpu	genpll4		5	BCM_SR_GENPLL4_BRIDGE_FSCPU_CLK
+
+            genpll5		crystal		0	BCM_SR_GENPLL5
+            clk_fs4_hf		genpll5		1	BCM_SR_GENPLL5_FS4_HF_CLK
+            clk_crypto_ae	genpll5		2	BCM_SR_GENPLL5_CRYPTO_AE_CLK
+            clk_raid_ae		genpll5		3	BCM_SR_GENPLL5_RAID_AE_CLK
+
+            genpll6		crystal		0	BCM_SR_GENPLL6
+            clk_48_usb		genpll6		1	BCM_SR_GENPLL6_48_USB_CLK
+
+            lcpll0		crystal		0	BCM_SR_LCPLL0
+            clk_sata_refp 	lcpll0		1	BCM_SR_LCPLL0_SATA_REFP_CLK
+            clk_sata_refn	lcpll0		2	BCM_SR_LCPLL0_SATA_REFN_CLK
+            clk_sata_350	lcpll0		3	BCM_SR_LCPLL0_SATA_350_CLK
+            clk_sata_500	lcpll0		4	BCM_SR_LCPLL0_SATA_500_CLK
+
+            lcpll1		crystal		0	BCM_SR_LCPLL1
+            clk_wan		lcpll1		1	BCM_SR_LCPLL1_WAN_CLK
+            clk_usb_ref		lcpll1		2	BCM_SR_LCPLL1_USB_REF_CLK
+            clk_crmu_ts		lcpll1		3	BCM_SR_LCPLL1_CRMU_TS_CLK
+
+            lcpll_pcie		crystal		0	BCM_SR_LCPLL_PCIE
+            clk_pcie_phy_ref	lcpll1		1	BCM_SR_LCPLL_PCIE_PHY_REF_CLK
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,cygnus-genpll
+    then:
+      properties:
+        clock-output-names:
+          items:
+            - const: genpll
+            - const: axi21
+            - const: 250mhz
+            - const: ihost_sys
+            - const: enet_sw
+            - const: audio_125
+            - const: can
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,nsp-lcpll0
+    then:
+      properties:
+        clock-output-names:
+          items:
+            - const: lcpll0
+            - const: pcie_phy
+            - const: sdio
+            - const: ddr_phy
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,nsp-genpll
+    then:
+      properties:
+        clock-output-names:
+          items:
+            - const: genpll
+            - const: phy
+            - const: ethernetclk
+            - const: usbclk
+            - const: iprocfast
+            - const: sata1
+            - const: sata2
+
+required:
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    osc1: oscillator {
+        #clock-cells = <0>;
+        compatible = "fixed-clock";
+        clock-frequency = <25000000>;
+    };
+
+    genpll@301d000 {
+        #clock-cells = <1>;
+        compatible = "brcm,cygnus-genpll";
+        reg = <0x301d000 0x2c>, <0x301c020 0x4>;
+        clocks = <&os1c>;
+        clock-output-names = "genpll", "axi21", "250mhz", "ihost_sys",
+                     "enet_sw", "audio_125", "can";
+    };
+  - |
+    osc2: oscillator {
+        #clock-cells = <0>;
+        compatible = "fixed-clock";
+        clock-frequency = <25000000>;
+    };
+
+    asiu_clks@301d048 {
+        #clock-cells = <1>;
+        compatible = "brcm,cygnus-asiu-clk";
+        reg = <0x301d048 0xc>, <0x180aa024 0x4>;
+        clocks = <&osc2>;
+        clock-output-names = "keypad", "adc/touch", "pwm";
+    };
-- 
2.26.2

