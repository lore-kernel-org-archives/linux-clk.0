Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974FB3EC6BE
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143810; cv=none; b=YOB8Xt8UOuiECoysxjbdUSQQoePIenTgz6FYoW72mu5hWCMgP6abbJUG/PJsTLGoi8ud+OhBqZkzVMlLuN105KHAzLBdgC83O9Tvetv98zn3ag+v3Skjuze56nQ0io4teNCeYgTr4MjR/ivj3pOqtWLnXCdx1cNfBPQoFiHqJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143810; c=relaxed/simple;
	bh=9Pf42jTYd4BOZWSzwEb2fi7Fbo1AsB7wRyp4TwTJs3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8jx1XLIIrr2tEFbxZ8p3IfiLGot7QQf3UOFTthMuglBkd8Rhk9/BdmqgAMALIEtcSx3NCG/0u8YSmjG8wWPaHZ5v1xKu8BnKIdElANGKjLmn+EIqqp07zPPtZM6rce6XY9OCqUMdJ2tPs4oluPRGYZuxaXqAMsM6EfEY8avmlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M5biXNmu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M5biXNmu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1471932a12.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143809; x=1785748609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=M5biXNmu2s++HrtzjMCm9mvwZtBU8t9NVRDDcJio9vSsltp87wBU3oB8y9icut2hra
         uuskVKoXUUI9YaCPNn3B8TvKPoUIRTJ30NMiMm0uiep+58Q+CklzvN/vhb9kExVYxY+q
         7l6Dn0OenS4AYEAJeiLeM/OwxoRkBMvxicq94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143809; x=1785748609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=tAbIJN888MGtHaE/mHQGWwKqtLhf8JNYFJfPwKbhYuj8GINEzd7BdvdDB2WVFCmOtF
         DoR65o1vBlip3fU7w2pg0JNrs08aQ4bVRoCzi5xd0tcHFmM85YYoEleLFMYCQHUELhF2
         inQ/4vRNtr/Iv3uo8omxRSLyBV1sfy+ae15eC7QrbEZo0FpAaflimvpyyafoNczYrlg6
         nlAFmSpFYu+go+L5puyy8r1t0qFVEitPVvdg9ewmrTOBrnCkPg65FbXad/jve6emAWgh
         OAktAFmrg1UyYWeLz99k8H0PFW8WufvgjhpUYFVBiqsCBL0QHrU43qYuLbwuMXWnuHjt
         pB5g==
X-Forwarded-Encrypted: i=1; AHgh+RomOI4jB4FPKqhR752pZ34YGqffUEgIELwUnwHPAuwbP6WkhLZjRJTaNTBGsD/IVtJE3N34CYDnmsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0r7I2CCG3t0Y1ETbb0WyAim3Odks+FwBLYQYmpo2OdNr7khC8
	62czKcska57QYx42kg0D5xsUF0KMUeZD/fQMWJJ/wdrP+k01S7HvhxEdb52Iwo/x7Q==
X-Gm-Gg: AR+sD13/EM8TadmKxIGIj54/fz0Ir9gPAmXpwa0GOZolix1cWvEYD24KWEo76ppsvs+
	1AeLSeJkbjo0jjAEaHuaVSSHI7VRrXYGiigGMKU4SqA0y+0islK67J7HEjqq0e3L8r/nZGWXiX2
	2H3VGz1DPJQTkwyMeoYvq8zOOxlaV6rD79O/v9odtxKsri25ug6VhhdEz1u7Hp+LH6Bd6TaSJzw
	+dK7FfWsBCzOqA1ciKjDoNkq8tJVQ5/ci1qMp9qo0d+UG236ilEBdF2MoQhjJGoZo6/tKZwBJO/
	4I6K8F5+IN5wBcoCOXjlLT443UWaWSARhVcaWWWxgR8nbqJNQvnpozJvZoHpU0RJCcbDO0muxX0
	I1k9gl49ju6ogd8yoElXtSpbQDVSEaW27ZaLGgtJq2HXWToVyvm6sJYVe0ieipDNabx8ptd9f7y
	o7Z72dFO8/nS6iZA4Zo5t36o8WLsbsajiuN4E8p1u/t7k0MNT5cSFF8Cp+y6c1w80TDAuQ
X-Received: by 2002:a05:6a21:6f8b:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3c67dd65e16mr7098317637.27.1785143808982;
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Mon, 27 Jul 2026 17:15:54 +0800
Message-ID: <20260727091555.1023910-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.229.g6434b31f56-goog

