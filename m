Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0103F313550
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949573; cv=none; b=scUeVS9KIOxasLZD5+jc0HrcAA9j2LpsrNXEfKuTJV1YKip7NFBCRxrECg62OWgmZSrJzY+wAFAP40irQnGgI6DwHS8FfOotd+vDje8lc5pJ4eh7oIkfG6MiZkIRttQnyDQaOgexxpep2M+A94Fp+4P5GpZtyGwcbA++3MYDMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949573; c=relaxed/simple;
	bh=itI/1VwTHA3V7ox5PXMT2Vrb2UKYmyIibaQ0egNmgMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+I0XUAm43YLIltQd4yzdjgeqixWaz9nU6j+JBUdK4hC2hWLRJlU9MwBbrQOkDDvwwn0r9U2qES0hRoFPAjl5EnTJSj3KCbbkFjzD7VBZBeXXEESkm/Y3sGIb/xqfDUFl7PIQrrI+6GbTwfEY3oiSNpHgQBzANbb1sQ9WJbA1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+YPHCOI; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+YPHCOI"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso596844a12.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949566; x=1785554366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=O+YPHCOIbJuFOzcCS7O5V8H+xJKv2+iZPFhuas6IX/WlkMufxN6QjbEGso8D/XSUB+
         BOZK+1DYuXeyMJjGD5iuXYolxXNquNwjDEV8LSRmyqcc5IRX/5g+Yz+HDYRqCHI21oyh
         00AWI7HtAkWG0J18SqSoHYKaXOyv7i9YLMq4eihuKbDMFTPzfSKAH2JoBu/8NHOuhvrv
         v5j4gfQHAzuqDmk2XBPMIvyB4RZzVRZi2tvEHc3E/FnfnbgVqVef9tDhU/U9LIoFP+uU
         5fqkambI/GzcgqoJupzsTP2reYNSPKe5XQrlgHeWTC3ZPbttOr8wQ5N9pXRurpbMLEaz
         kkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949566; x=1785554366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=G6drd0cn4PSQgjJVbLXJxvrxCBXm3BlfWU774TPOvwM9HQXpBv8jJ9GoWrYg2Oo5tF
         4ImItfAkuuvgiAt1a5vyLO8EN10N5UQ0/KxVlIkERZmsLZ+C6d/+67gJFWdPzHnIu+zW
         fuu73J8s8NYUHBB2ISVDPvuxG2mbsB5LzfPjTTUitfoU2mwJAPDZ+GlBehZu2sWrDApX
         zTF2zJ2rcqaiNGreikwrsSTXJ+jcGFdqeCU+PpP59VAqztO75q2sj07I0TH8kSPC6WIP
         pFQN7oEBQiJ+K1qqQ1olhX3P1gBQpV2Br+q8ki+mwYDHUywyGTXiBV2M+93gugR0E28+
         jA6A==
X-Forwarded-Encrypted: i=1; AHgh+RoU3YJ7viV4JYBfX5gQnfWOC+LkQcCchSQtJGNI7AgXXMJT1E+W+nDPQrPm2ekWOI7NBmikuQhgrVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hBH0Rb3gMcRmJSpOwnAi/WPZ1pQR8cmqGElpwdjB3/a1+tbX
	LhiAzAIUN0Nd9x6NRYOT2DvkPnj8Phb5Btiu4atoJBgC+jXLSGUx4Po4
X-Gm-Gg: AR+sD10nv3dkroolvt3Jivyt9BGkDpnXl5W2GiFxFayYOevxS3conrTsUjzGwVIzism
	SzBP+/T6fwZJ8WORZdziWzScuka2nmhwioZf9xKA77ciHMh278dDxuDxYpJrKEhlleBBxgGsNt9
	SjFOYmrMn/JH0PsglyJfHNnjOues13uwh2csWl8sUNAbE5jPiBUA5ZGP2386iqGaCuZQZq+GVLF
	HJLot6Vfvg0oP6M9vFRlrMbacG5kk9NMRug/9GjT7S7ofwPhM+y/bECx4WV0Y6WrcVRh79wSv56
	rc+04Y2YvYwGNaRORiuawP49bR2EVPFVIyFoKJYcIZ1BQBuGUIKFruCTZ/hG4VsLghmcTpeEQbN
	GZoMWsGnefBbRj9O5QFsU8frvm4v2eah/KfsWnRSCZR+KLdveqSMzEf4=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr648871b3a.13.1784949566154;
        Fri, 24 Jul 2026 20:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:24 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:47 -0400
Subject: [PATCH 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-15-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Pico-ITX brings the second DPU's output to an external DisplayPort
connector. Enable that DPU and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..6c31460990a7 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
+#include "k3-display.dtsi"
 #include "k3-pinctrl.dtsi"
 
 / {
@@ -221,3 +222,13 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_1_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..2f36eba20f1e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,17 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	dp1_1_cfg: dp1-1-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(24, 6)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0

