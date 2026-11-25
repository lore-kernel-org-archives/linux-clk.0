Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638111;
	b=f0vkz5E60ZpPMnfn/+/G7mAFJsb+ypSkYNgR98srvJ+YClj0er3stRu8l8aJY0Dz57W/
	 6A417l6QvLlXLRvpz8G++EvZ/f6oz1XRSpRU8U2I2J0ejxHFTTPjgbTjTCuLEl4sSIKy1
	 DbEE+Rpw+qpLyrp6LhtDI4HV97qjHGfWamaBuJBRV0YGkkS86sUcxjYh1zpewqivSvdae
	 2IjjR7S0N/1kqJeYjFFoeeD+CLW18KZlNMxXYmfrw9xbWl7eODL/cj4W1hNOEi12dpdZY
	 AVXYwzLUyzVK4c63c8if/sYOEK3gfwlrNxuvGGgpmpaFOGw+kBJeLRccHubOVMLHqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
	b=ncSkQznFiOC4H6h3SeJXkB/I+zRw3fh81TkEyozYc6QLP5vWPxMyhbZCEyC/XX2w+u4n
	 M2M4ZIFECNAiRAaw+Yh94bhTqU0Bb8GVxZhi2XSmohoVOBA/V4juZAa5XDd38a0Sf9vHa
	 b/OzF3jYBxweFpBig1z8UHeEUmAFz3Y7emj9n6TXEA3+z/o9rLFnBj5ZI2kWEIBPFsRRf
	 afddMyZMA2JPgWDUdllZqi/szxkpha9bAgV2/uj0SkRiJAZjyqXkAe0L98uujD/AXqxHy
	 sOuj3g4HgAJBJDOpKWDluqdoFIGNchmtmfPDt3H/+zPDAe5TOE6RSeOWNLNNalJPXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="ThAuWt/q";
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF46606A687
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF46606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=ThAuWt/q
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adf4431ca0so1694169fac.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638110; x=1796242910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=ThAuWt/q3303JtmtGz5/JedklN/MTvEYgYp7PbmfHBsm/uUWPVrFZkzFEE5xCwSVUu
         8p8snvQokctzHJJdaz+nYbjgfQF8Z2EUi4sD5Shs/5PTRJy5X9n6HeJ+4UPE6XVhOIJA
         FysZ6Ik8nASn0+G/AX2uqPZXa9/jxdhvsjEcqhH5IY2XC0TTL6NFPuSFk9w14aJeeA+t
         EaXAQVLwlLiE8NuiAQR4tC8tKaLE6+LRecReFDvWOB2Ggp3NreDim0vpoVNNwMb06llO
         XQgNkfNxmTPLikkLTNsR0RTFnjhnthipY/jMlxpiV8EesX4h/Um8iLcpc3Gswu6yxwuM
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638110; x=1796242910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=WCkfNRoQZ2WOmXDADBnav1vjuymwcyvBs3f6xiT8iMTwgpOIdHIe6Y+1pDKUj/nn75
         dAqXaT0+rx4ZK5nrPhic9rYpWXBG4nYqxrccoOEitS6VaJsNlC4cDsbsE0ILJe6SiErD
         JaKly4SDmbhfH9d5YxJsvNJrrG5J6Bc/wtUByHIQXYdEC5MQRaJWevzKzsbUBBuWrv/H
         g7Qj7CNLzBSGaO6ivMf15Xn9myjXo8WLD3UHpa5RSHx66sWEWcca9D+XMLE9Q5mArpwM
         GcBHqvH2oClsjB1eG+dVWxPVZP1iGL+vmGvC9U0gpIfW6Rv+Si0byuAZV49+e7h6a2x6
         Mc+g==
X-Forwarded-Encrypted: i=1; AL+hErFMNLO6EBh1ySWqtw/z09wCzinv6NUzgxFZicb2anRsFoj0Is4qedArwh2uPjMiDC9cd9sqyMRW0HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fFDhZIRmym7SBYaSFQXejzdOW8Z/UPHqnOw79rFAodNlRmIEQ
	LySGiSeaIqeoB7NG5QygHhgFuoiKMttM1vjEFMVETIB5z4i+GVjJLkX4aej+MBqf5YU=
X-Gm-Gg: AZFdTZddPrD3Rk6EwV5pTwpmGFZSihwp654A7RemqYOXfJjViKm4eBNNUSz9FTb3u8g
	JarqUZ5q2AjXW1CukKNzz47GEWC1JEhx2MzhUyrhL74C8ofMvWRd+fSb7RQjzY0ry4H6UrXMHUx
	zsyVUurGsweXmgu5Rcn+RufFlcWgcQTBETnyl9XVGcRuW0tUePf2bEtIbMc4X9ArO2PYKTNimMs
	vSYJ1Gs34XG/CfdSWsOh9PYqIc58YjG/eP1GltaHevTN5CjfH5YDrEaTlgNavWumdKh7gQDHYLP
	An2XE6aBoOzkHV4emLVrkO4FSCL60wnEszhgUIHo64h6YQgAazI3NK6DqELjq0CXzGOwwQYjgU4
	FcBH2O3vKwByfd0oBqbGTduQVm4dx6EyY3Gnbu8HgwQ0iSGpVqFYfht9O/5JbrHajB7dA469/93
	NGbyU50QdPMZIbGw0u8YRbp0ymyUiUF6t8DJZzr1bX0nZzhwKJ9mWJ7gXrghuDDhZk9QbnfTKg4
	T99qq57nepDKWfpY9HppLHI40p+2vQ5fkSzmHIKTD17AeT/EvldOEEtDL31bOU2pfJer+MW+8F9
	5qpQaFAF9BjBP4GpVFTL0s760Kn04Jz7D/TNQYxhmuWCjvRmTM9dU0AVpA==
X-Received: by 2002:a05:6871:e3f0:b0:4a7:df5e:d6ee with SMTP id 586e51a60fabf-4bd07c9aa0fmr14107050fac.45.1795638110360;
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
Date: Wed, 25 Nov 2026 14:21:41 -0600
Message-ID: <20261125202141.1288493-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Add a node for the clock and reset controller found within the
Toshiba TC9564 SoC.  Also add a node representing the fixed
rate 25 MHz crystal that supplies the chip.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - This patch was previously not included in the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..b327f64885ef2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -890,6 +890,13 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9564_xo_board: clock-25000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "tc9564_xo_board";
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -969,6 +976,14 @@ pci-ep-bus@4 {
 					#size-cells = <1>;
 					/* Map 0x0-0x1fffff to BAR 4 */
 					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+
+					clock-controller@1004 {
+						compatible = "toshiba,tc9564-clock";
+						reg = <0x1004 0x10>;
+						clocks = <&tc9564_xo_board>;
+						#clock-cells = <1>;
+						#reset-cells = <1>;
+					};
 				};
 			};
 
-- 
2.53.0

