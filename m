Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79639C001DF
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbjHCMEb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 08:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbjHCMEY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 08:04:24 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0948930C0
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 05:04:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso9080625e9.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064252; x=1691669052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=HhocskrBuut8UMGbN2zpizi81AGgUT5UcmPUNWmiVf+x6mB2aErHF5avSFCwXgT5nw
         vIxxHVqw/HsurSBSoRXLdrjDEhaZFe+GjRpToJWedf3z45OCzOD3R27J0bGOAWCIjwdE
         PRNzcCu7KPp1ODgSHH+iKTebH0I06/J3Vb0AeyC35yEE8ABfjI3mKur5Jfy+JW370HyE
         ooci8Y6y0rDMaKoNqg6lJhhxClLwOwmCdngE0Q1DFcUJ0vrcsIulpQSUptw/1vyPLfam
         9+jabZyD5Y1v8owhq14ulzObYHzu/rZL0kZF1KYrKwaHQim+dgkMIGx4y8saU+P+onOc
         8wMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064252; x=1691669052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=APaVKAgE4AL+jpeATuzVn9XdmVXL7QFsRWQSYIayAnxA9wkiEzpKfs0xUKNiNR8AeA
         A9cEBGI3GnnmSa9FiM5Gzv6wwM3dMVUW9JrbABszYdI2PydGA/wzlTLj3/ohWUZcRQQH
         MuaI3haGYw5u6Z6nlLNqxhX+AcvURxVS3eVQMaFzWxHYc6TNza36quYtFW0PEY4ZKBgC
         gOhzs7U3GYn3DvXyFj7ZEr9EbCAXBzUko1y6yQSDO13RS7v/+7B3mjrfiU7ADJdulcSb
         vEiqBCkzw+IycOl2BBFwSShjP6h/uK0OdRu6TPlh8avLJcB+o61feI9n7+QXZ/npa3ia
         GejA==
X-Gm-Message-State: ABy/qLZrnU4xv7atPlq/obNIgY4Jj/26hKs2q478kBg5eguSk6lkDgqS
        MU2Ry4eYttF9lumlgEB66PSDWA==
X-Google-Smtp-Source: APBJJlE2DaR1OO9xxMRbcYvVTC/RP16uymmHtkZRS5Eqj9aQAjDjrJFtE5gdHW4mVTdM2BX9NUUzqQ==
X-Received: by 2002:a7b:c855:0:b0:3fc:616:b0db with SMTP id c21-20020a7bc855000000b003fc0616b0dbmr7016724wml.9.1691064252137;
        Thu, 03 Aug 2023 05:04:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:11 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 14:04:00 +0200
Subject: [PATCH v7 6/9] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-6-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5exqNgHF6VknwIjvTwW9wrbq9wLYNVvWyJgNvHb
 F8v+dFOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsQAKCRB33NvayMhJ0c62D/
 0dEunR97YBM96Sbzvr2pvGHCTOi2mfzuo8k5vyHAnV3JZW+FFCYTJc/T3N9pu70MoJUH6lv0AVBToj
 D/UPuNG4DzcUbUl5W252/YSwXm5uacw6CMqEWo4M6kAYowdHlWDuwNlRjfNiNEbAKmbdXEuqkI0p+w
 7VJZEuxomshZWxfyiod+IGxjMj9iXqeOxi0T7IGf88RG8zptzH5Cc/9etlq5UHkXwc+EKvFR/BAn5t
 vgdDb6TlZ+mUZ4rOIpYbCUUpy4NehHM+7iu38jV9vKu4nZYVEM/sN2T355SlR1bCNVZip8/CrUsPfF
 cvfL66btWQujPT+rTM59NOLkVygrkH/SO1tpi5zLW+eJ0Y9Y7CAIG32GEDgOD/G9VzppludrAEq1af
 NP82WEqaJIxhU7by0fzf/rNi5PYfBk97vy9r8oc9LDhHzZfMb/Jamqq6n7h2YKUym80H3K0iALOmXD
 XRGc/dH/p7EqmkmAYcSy1xT2If//ryDcE8UMlPt7RqnoKJYP/GpRaYi5CfE6qsbRGL8hdzard+GfNS
 ZJM1/tP4LoUks98OE8kIlWvd8NwXcTcLeoA0yWpBlc4hmrL5IF2NorjSvIwkoJM+KIpTTKk+1dOjnF
 hJqexo//beMGYfpuzLpKq6bNWXfrHB4F62T3GcU8ii6sqQxT7QJjQsylDupw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..e2d890e72940 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1662,9 +1662,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2151,6 +2170,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2188,6 +2216,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: mipi-dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit", "px";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1

