Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463E311C32
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495638; cv=none; b=YPfq+NocLyvjbc4qG6G3AaUhrbmMgFsZ0FnBJegr1dtFLxUcVGDFy4fOVH+CvBbYx9rpWnaHd+wIyMajvSPFuv1psSnwZKoeBPfD+LGyK0kVJG5ftuDsiSPeA1Gr/I6q2zE/ZH96n8IfL6FJ4gsA70TQYQR/XWRapScUkW/x7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495638; c=relaxed/simple;
	bh=uZZtbCVhOKhzC2tpXj5NKZbfR/sFeNe4FarJkD89skY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qm2I9nFiCq4dSuIWL07MybX+22RBSQvCELXan9l1HneR/ot3Nf2luj9ZYfIoLBWDJJkNY9WSRtGMSdbU5v4vvS2nke4zjkOkMLgcrIu/EYK4a6WClhNHgBABkWU98YSc2Qtx9r74Lvv+ISUO7J1JiHwrVFUmKcw+v+07/q1gxmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHOMQ3E4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHOMQ3E4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so6526685e9.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495632; x=1785100432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=HHOMQ3E4s/WUkEluNM15tPgrFhQP51cmgDqqvt9kY4aoF7clbLQCDrgkcQ7blMfbYH
         f/itB+tACSl5q/h+FN9fV5by8AIdZqLm236IHMZ/GFdL5IbqCJgOzQWnb1BEIQv9y1+B
         PcPukeLfhkcQSEdIVn4Q7DEgRCBcuL33gwT2fj09JjXC2Ju1kxnDe7Z70c4bipKYAvPc
         8MoyJ7rwjtDABDPyUCerWNWtI0kjo7jogTVUA9p82qKQB11e6q6mp3J6aQfdL3qQFMiU
         z5PNFcCdZB+fw/40DnBkzBIuJRbuDXMREguBpRuJnAFfaNFEymm0/6Q8zndZbFbca/DU
         ahCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495632; x=1785100432;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=Bkgkatl8ZZmNco//HVO6SpqloaIJht1kcJMQdbHdPBoPqAXosWu3o5HVMuf1ZXAks1
         krOqXpQBEss0ka9Y9zvwy52p2c0gThkZinORa1E3G4WgJECnaBla0kjbC38RkHmGRYDo
         rJonBxzJ1WIun8o3wbNhfR112OV9BVobEwUiichcAGh+2WwmdbDGd7YCh4Jm3lkbZL+d
         coXodwYOmlVHde3XQQ6BD5D7aPQyVcykc9hf0nLsppAZcVb3900T/MdSwuFndYFBu+BM
         aw6iYbiagYgX1TM1M3gt9D834FiT0HaLYlSWZlU4n9aTg1evnyL9rvrs/P4nGigGgcOb
         ihAg==
X-Forwarded-Encrypted: i=1; AHgh+RpyoqYZWYv3CYh+/hFC/xKNi84jzqQlaWboNPdfDkC0S10ds7uDhyeEF4sGgSmhJ9zvoNYswgXf0fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOevd/ES7O074j2X4uaUO2o1grT0ln9A4I4gS84PHNzSxkiYx
	vELC+BgnR8REgMiG6ZppW8cYHO5FDkjnKxtfjuTHBiDBYr1vWMgQp+5K
X-Gm-Gg: AfdE7cnBryGN0cQFHJaJPyOShitHiEHVZ6FovtvC2R3Iq/54pVdjgkH+yWpUOiJ3Ip6
	RMX34/EL/mUtckhzTaxXxYm3W421bFfMOaiNAfPSUHPM3lNQeb0DT5JXxiRHX6t2Ij/uBukk7TL
	6dp+CyGuvlOd9xW3gKtaGDhd5kICYS8K1BOiMB/NzW7Yf7+BhEo8J0AFAbKGiAQhZIprC89yCf4
	eDWArKpp7YDpdUIXgv5IaIoX10a32a2GEmdEiHCY84ma4GQUdOrSU6Zy3akB5CDVLp4DWMA69nf
	JbEjlfmsCbQdCcfCM2yz1LdKWlVLQBXzhjOf5Gz8HMwxzTBtClEZKfPwQewcu1vWBivIGWi+UWM
	zMQ17F48imIEBGlEoCzmsLMY+qzUvo//XMcXJdAZMDIk4UGDIPh6J6S5gV3kvymhESbwLsRStVV
	EJBPgSAAmgEnbsVFWdaBKTvFMk+jjJ63FI0gMA
X-Received: by 2002:a05:600d:8494:10b0:495:4056:2c6d with SMTP id 5b1f17b1804b1-4954a402f4fmr101550685e9.23.1784495631684;
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table
Date: Sun, 19 Jul 2026 23:13:19 +0200
Message-ID: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
instead of running at the boot clock.

All operating points use 920 mV: the BSP table specifies 900 mV for
every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
actual rail value and voltage transitions are no-ops.  The higher
speed-bin points of the BSP (648-792 MHz) are not included: they are
gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
only produced correctly with the cycle-masking divider model);
validated on hardware with the Mali cycle counter: 149/199/300/399/597
MHz measured under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5..0fd73a1bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -116,6 +145,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	operating-points-v2 = <&gpu_opp_table>;
 	status = "okay";
 };
 
-- 
2.47.3

