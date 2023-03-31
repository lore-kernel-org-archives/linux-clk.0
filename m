Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1D0C77B60
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 22:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbjCaWAE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 18:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbjCaV7w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 17:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A2524419
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680299911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q+CnpU0/48fSQtYvxmbymRW1jKLUmorpaHw1MMzDa7k=;
        b=SpZtZuB6FZVZ08UDuVUZOKaKa4U5Sg6I36449QYbNKQRbcMJJ4Sys8HTqDYmLmzJgwZPZE
        /V7X0CO46FQaj8vlmoQhMDHAHYlo9PdQNLng5oHVQ9OqBe151wKkLsU8hpMrTlP8bquiuf
        3MjFqet83uXLJuGRD79FpT0KzBleUVg=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-niISJgWqMSCCiuu1mKdkAQ-1; Fri, 31 Mar 2023 17:58:29 -0400
X-MC-Unique: niISJgWqMSCCiuu1mKdkAQ-1
Received: by mail-oo1-f72.google.com with SMTP id w6-20020a4aa986000000b0053bb0591efaso6577484oom.21
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 14:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680299909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+CnpU0/48fSQtYvxmbymRW1jKLUmorpaHw1MMzDa7k=;
        b=u0NSmc6l+7sUPX75VUbFLTIyOAx0GHRiWxGGnkAhGZuA58JbmClPoawOaRaC4pMHga
         /VAVfZJpu/wmMJuBWxVVx+pQO7INqt6VSfSl5BIgqVvhRJ9Qd0vLk9tHfjGinoGr+ebN
         cTZToKNF3wJINfPXz2JQdwye8GQx8zVrIhhcvro15odW2i9KDddzWkq4XL6zw3NyQ7ct
         HdzknSe7w/DpzmXuA2Egsb9rsEBE4UjklMVWZ6p24F4cjT7ci2rJepBhniGum+hxEXmS
         SNEbb12GhKsyiISvn/uR2ViFH62NxhIcweCfpYMgXaiKJabjk6vUOXLRUKAX1sJ1s/UG
         7XJg==
X-Gm-Message-State: AO0yUKUzM+Ya6c0mcFR8JS/z6lTw3f85cYSzjsoTu9LYQlCZujHeByBJ
        7bD0G+O4nyxp2b3DRysBaXK4JvuR4biFxKXQIHVD5GLyZnGuKi17GittsOY7pQqgbaIguA0+pvi
        5+FNB2s3bzsyhmzMd0jav
X-Received: by 2002:a05:6808:8e5:b0:378:9c51:3ea2 with SMTP id d5-20020a05680808e500b003789c513ea2mr12195554oic.36.1680299909050;
        Fri, 31 Mar 2023 14:58:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set/tNJN7xl/+0xgmcgEKcIKPSAd2qaVAouJocdF0W82AdKRS+C+55nmCFb1ZijmhWP1e4rqAqA==
X-Received: by 2002:a05:6808:8e5:b0:378:9c51:3ea2 with SMTP id d5-20020a05680808e500b003789c513ea2mr12195551oic.36.1680299908769;
        Fri, 31 Mar 2023 14:58:28 -0700 (PDT)
Received: from halaney-x13s.attlocal.net (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id g11-20020a4a894b000000b0053bb2ae3a78sm1299277ooi.24.2023.03.31.14.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 14:58:28 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
Date:   Fri, 31 Mar 2023 16:58:04 -0500
Message-Id: <20230331215804.783439-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331215804.783439-1-ahalaney@redhat.com>
References: <20230331215804.783439-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable both the MACs found on the board.

ethernet0 and ethernet1 both ultimately go to a series of on board
switches which aren't managed by this processor.

ethernet0 is connected to a Marvell 88EA1512 phy via RGMII. That goes to
the series of switches via SGMII on the "media" side of the phy.
RGMII_SGMII mode is enabled via devicetree register descriptions.
The switch on the "media" side has auto-negotiation disabled, so
configuration from userspace similar to:

        ethtool -s eth0 autoneg off speed 1000 duplex full

is necessary to get traffic flowing on that interface.

ethernet1 is in a mac2mac/fixed-link configuration going to the same
series of switches directly via RGMII.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1 and v2:
    * None

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 181 ++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 40db5aa0803c..eb230265aa45 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -28,6 +28,65 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -151,6 +210,68 @@ vreg_l8g: ldo8 {
 	};
 };
 
+&ethernet0 {
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	max-speed = <1000>;
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-txid";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_default>;
+
+	status = "okay";
+
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		compatible = "snps,dwmac-mdio";
+
+		/* Marvell 88EA1512 */
+		rgmii_phy: phy@8 {
+			reg = <0x8>;
+
+			interrupt-parent = <&tlmm>;
+			interrupts-extended = <&tlmm 127 IRQ_TYPE_EDGE_FALLING>;
+
+			reset-gpios = <&pmm8540c_gpios 1 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+
+			device_type = "ethernet-phy";
+
+			/* Set to RGMII_SGMII mode and soft reset. Turn off auto-negotiation
+			 * from userspace to talk to the switch on the SGMII side of things
+			 */
+			marvell,reg-init =
+				/* Set MODE[2:0] to RGMII_SGMII */
+				<0x12 0x14 0xfff8 0x4>,
+				/* Soft reset required after changing MODE[2:0] */
+				<0x12 0x14 0x7fff 0x8000>;
+		};
+	};
+};
+
+&ethernet1 {
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	max-speed = <1000>;
+	phy-mode = "rgmii-txid";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet1_default>;
+
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_default>;
@@ -316,6 +437,66 @@ &xo_board_clk {
 /* PINCTRL */
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		mdc-pins {
+			pins = "gpio175";
+			function = "rgmii_0";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio176";
+			function = "rgmii_0";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio183", "gpio184", "gpio185", "gpio186", "gpio187", "gpio188";
+			function = "rgmii_0";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio177", "gpio178", "gpio179", "gpio180", "gpio181", "gpio182";
+			function = "rgmii_0";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	ethernet1_default: ethernet1-default-state {
+		mdc-pins {
+			pins = "gpio97";
+			function = "rgmii_1";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio98";
+			function = "rgmii_1";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110";
+			function = "rgmii_1";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104";
+			function = "rgmii_1";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	i2c0_default: i2c0-default-state {
 		/* To USB7002T-I/KDXVA0 USB hub (SIP1 only) */
 		pins = "gpio135", "gpio136";
-- 
2.39.2

