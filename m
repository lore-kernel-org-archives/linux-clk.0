Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565201;
	b=14d0dVl3xcbJdC/cwaEUdLLTZsiShijm3fLgt/ZVdfXyp7opyarulsxjE3Cg6mtD6cB/
	 VqABR0o11l/LTVPNhIjEwPeeYWmTH+OyIQ1+jmY9CKKOGVDyYfj8XQ2dKOLuEv3BuduVn
	 CBAEC7y851UlHhWW1lo922ZhwKsYegiLEGiyznjuGLlhQulfooPMsGX/pIPmkQTsVHjQ4
	 HMmPLGhYp7VWJTcLRlbe2PJEhvrMnwFXc7YyyjGqzOgpNTbuPY+8nwBOwmpPVvzTOs1VI
	 QRmH3LRRkFslx7IzM6T9cCm+s2KEJgSOl4kmiDqKGs8FDd3DVOFx5bbHUn2Bv3LrcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
	b=L7Sr2CfRB4e/3bFnzPIb/TsrInuajpYUz1ofXUBfa1ukz+CWZowNMiGcFtqmhxE0eOBG
	 MnP33FpggNUBAbL1klNIQ0ry4sr6vNpD62QeePcvK3mJ3Z6cpgK1/CWcayEk/AOKsii4L
	 uM3VEA3ExP/Eu7ciW1KppH51+xaDwK0YRJeLEcE2Yz3Ipjju50cvwZczehsMizd0ydIe2
	 1W1HxciDQAAONN7XPZjVrM3jF0wOq00JUyKzB1XyHhPoEJ1kFiaZzhNIf3gUbknkM8wRo
	 mbshQb6x+E/WmUEKpoEAQUqluhVFTXNH12VnMEHlJcIOK/loQT1Au9E+b8iPvd9jYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="ZINEXKJ/";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4C606A690
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C4C606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZINEXKJ/
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2027754eec.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565200; x=1796170000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=ZINEXKJ/7u9zktdrlz6SNLUJveG3csKZZd0U7GFCzQrGmozhFUGvmul1SJyNyrAl07
         EvJo50x1fGHaxXQfDIYrKxj9oq2x25tZgUUTPN2kJ0b7PoMZ1x5B0fWx19hbll1FgAj/
         4sTlj1pth8dIRDrr70XK+wrEvuXJOKVDqnAjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565200; x=1796170000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=zIrm0q02bOhGJxarrEAh0j6DqTrh+YiQ5So8wdIMTpO3TPYF0hUCKdmMBjJSP01Re6
         tiPf3wGt34GBTWuDXeGMyt3Kc0TpY41KBWDKV8FednIipRdSUAyANA5jGWk0yQuvR3L2
         WjCVzQ0xa9/0OrD6dI5p28Kswu+jywTWz34V4SxA4kz1b39o327h3XGw0QEfk8VPSUfv
         nPOSzMs1YvOwk5vHcM+5KqCMjiqbra4tfRRwMCLgqkBmWUVT2KVfAMXHkBikB6FGEnz4
         lGbdsJW5HR1Kq8R2z2wuCyPLrrV7Of4HuQLgKVVtPwsP9pO4rRxdfctyYGbmDmX8BA+U
         OuOg==
X-Forwarded-Encrypted: i=1; AL+hErFx2rYVVeYCBkVE/FXNMT9n4Vlr1AusTYRLV62BbEBPyqaExAuZJ4RPdXSXsQ3CLA+3BDQQfgFwuXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z3zx7kdZkmB8QtkQE3h/oZvt2w8bEZgoVy7f0TULoDTaZDiSh
	+3KsF/jCZvvPkdr5EFXVeLbggFCIqsdG35ysbOHGAfUtuAoeYjOWovW01dqWpi6RuQ==
X-Gm-Gg: AZFdTZc6aJnEAhp+z34kP2xZA/bFJPAtX5tdckhRMqWqQHjMAK5nADrAfuwb0LRIqeI
	+QEbKlSpy3tcL+SX3rV8jk3MphinLEWlmCxfBpP2wVP9B+4zOAuBC4FFd0ozAmOPwvSA3+KDY9G
	Y1dFDHSGn621xFCRhLQ6Rg/Ego+hBxzVDsIFQOKG738k/mY4DooqLc9RPBd2hSWYaMQyNwA4OkD
	S5nqroFPEItbIhc38I8GU2l///cRNwZtzw5Cbc11fVR7Z3HQ+an4lZeleSddQQTzdkWHAYTbL1f
	YczPQcbw+B9OlZP2+7rLoIKyadoL1l8COuSfdCx190siHTZxskJ3m9bGS6/oWTIOmB1/sOO5733
	1rykeo2k4qeXj7GAhfufLFe4gPM0loNf7owMChfFobBcIyhyBWyUQKuYcCEnTmCCfx+qpQHGadY
	3XO4UAJhOtu6TI9bSiUSbFe5Cjk1yZVt6h7bqWmvm3ogghsOGOd+jt3sJIdDrzz29Uiz1Vp1NaU
	0lrU5P3HRCSRHqIHquZ092pF7qxv+qh2cOize5+Bpl9mflOR8x+hSdsChZJgbh6CzT/Kn90jSIX
	h6iUC3la2ESasU7N3VdJ/C+woFd/AnC5PUqDOME4Mv1+AThNR9l8tbXe85bDe4wcBF3y
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr5742665eec.40.1795565199973;
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm50070598eec.12.2026.11.24.16.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 7/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Tue, 24 Nov 2026 16:03:41 -0800
Message-ID: <20261124160343.v2.7.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

Changes in v2:
 * Move later in the series
 * Add Peter's Tested-by

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.1.831.g720f3f5937-goog

