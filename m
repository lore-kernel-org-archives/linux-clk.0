Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797F7BB0A;
	Sun, 20 Oct 2024 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413158; cv=none; b=nPhEARJSYR8H18vwEnC7gt4vB+FveSdXxMbzjYkCG37T8Je8obtoonW2971WTDaiMHR8TYqxdYHvo/o9gz3K9zMK37WgbilTNvCkMThSBll+fmEdvG5Hm/0QFzzmp11fpB5blHPHeU5LzDSDn3V/aGDjRwQE4mQK4m6OlyD9nJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413158; c=relaxed/simple;
	bh=6GaFL/0waHV1EDEGFaRbExtZwhdfXGKAosnni+XtjYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhOVxpscyq8kabcJVZ8ns9bIhkisPLKdNgz6Kyduw3xMy/KqygElVd+cC05fDCVMPdXLY+aXto+9qJrVLVHRTQmI0S9RjpM6NiAmTXA/afg6pogleUyyzFUTih08iBDzW0REH7wgT/5gXa7QmC6ckCIfdar5U8b5KTUJtnQQ0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QW0cCsI+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eOfEgVDx; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QW0cCsI+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eOfEgVDx"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 1913D1380195;
	Sun, 20 Oct 2024 04:32:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 20 Oct 2024 04:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729413156; x=
	1729499556; bh=8QXVw6Z7+G67UnBf1aFM75MSoCxRUB1S0GY88oZNAaM=; b=Q
	W0cCsI+aQ0MaxlfWu9s0gG9KH3aKWGe5zxTbrcaRI9FnHjgjlyAxKLO1vDLfI18j
	gRqzI2cEA7rabMvO5KKUlOUk9cFFbsyZRqae8/oI6ivPyiHXG+olFCVWaqT7f5EV
	CXT75lBAKmDi4qKYQr/QATgdArn3RdGFIor1znVSmjOmZaQaN9iYR78Vk8YzU/th
	0rbtA7n+N+ksl86r9iQABUI8xn1XWmYGtrGZJ/8usoeeGeonW3LMV6Xwf76qFKeb
	1LN5vmx29ztCFjT2sT4hLnXeS6M4qs8MUhFlyE69KOBaDIYNhql35/qzfOCs5BdF
	VfctyIJr5LZFnwASmYnEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413156; x=
	1729499556; bh=8QXVw6Z7+G67UnBf1aFM75MSoCxRUB1S0GY88oZNAaM=; b=e
	OfEgVDxTePr08ZgumOynf0kdZqZ2Cc1LfDjXG9kBSnRkcZIxiA+WDlOL8MCwhNqk
	JEKCKNT/W8QPIVhV4Rl8seRegcbCBntmuK81HHqqxtOT6ix+zdsqsenYywk2r9uW
	LIAgdax1hbTqDMjKQHLOWCRYHAJUHgqCqZDmgi1C3fWAhMtrydGsjofy4e3tUsZN
	a/H1SDO/Hg65QJ8TG+O8RRJr1LUOmfNSjc5qQZcsjAIM0LOVuqSnFw6UjUkASNQL
	oscTxNVgKJnXhtyIDNbjJdKtdn53Gk6+mUqamRBWsRJNfSQfoWNYcB9fBpaL6Ivp
	+XvraBhTv5tj+OYuRjdPw==
X-ME-Sender: <xms:I8AUZ5kY9nW8Yud6W1jjLstNsGURA6iaBsLd2kn-qSrxamdwbqCf3Q>
    <xme:I8AUZ00L5PYQzwuDP2Drakzg0T1fleJJ7ajLyGAIh_Odu0Bubb12zIzd-jVMWKMsy
    rslg9bqrsSH-J9H9A>
X-ME-Received: <xmr:I8AUZ_pVnCnlxO-koJiJ7UB9YvBGQIOMNbBuGBCodKhzBEROb1rxtbo91wnSD132VFUEcc4IMBhfaWk0K2iXlQP2HhOreS1kG-0IFfoioMBgQY2K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghrohgr
    lhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhilh
    hiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:I8AUZ5mjKoATJdsfJqPyIlBFzu_Jef-LOGh80PKfKDfSmznMX9sp_w>
    <xmx:I8AUZ33icpzlFv_t9mfk2JGSFOMlgsAb9NG9oRQACgxVPBO9MUnkYQ>
    <xmx:I8AUZ4tZiYb_uqP2WKwCKu20htfJw4c4OFulgXttKDExs8Mcm1ZyoQ>
    <xmx:I8AUZ7WTrzcW79CVz1eM5728MxuNAIz3ccxTNXmxQP-OSiMq4d-h5w>
    <xmx:JMAUZ-0-UW_7X_hiJ3XynU9Hp4lkV3kELuH2dodOTpc-3mxcpixlzvxK>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:31 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 7/7] arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all supported boards
Date: Sun, 20 Oct 2024 21:30:57 +1300
Message-ID: <20241020083124.174724-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020083124.174724-1-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the H616 (and variants) audio codec is supported, enable it for
boards with a mainline DTS. The Tanix TX1, Transpeed 8K618-T and X-96
Mate have all been tested with the onboard 3.5mm audio jack and the
Orange Pi Zero 3 with a 3.5mm jack connected to the audio header.

The RG35XX (2024, -H, -Plus and -SP variants) are also tested working
but have a separate mux and GPIO-controlled (PI5) power amplifier to
support both a headphone jack and onboard speakers.

The headphone jack has a GPIO for jack detection, but this is not
currently supported by the driver, so audio is heard both via the
headphone jack and speakers when the speaker amp is powered (by the
CLDO1 regulator, defined as always-on until proper jack detection is
implemented).

Define the audio codec and routing for all supported H616 and variant
boards, and power and speaker amp enablement where present on boards and
known.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Tested-by: Philippe Simons <simons.philippe@gmail.com>
---
Changelog v1..v2:
- Add codec enablement all supported boards.
---
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts    |  5 +++++
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi    |  5 +++++
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts     |  5 +++++
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts   |  5 +++++
 .../dts/allwinner/sun50i-h618-transpeed-8k618-t.dts |  5 +++++
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 13 +++++++++++--
 6 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index bb2cde59bd033..bafd3e803106b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -65,6 +65,11 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index fc7315b944065..19c5cf75f3f7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -59,6 +59,11 @@ reg_usb1_vbus: regulator-usb1-vbus {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 26d25b5b59e0f..6dfe4eab91f6a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -33,6 +33,11 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index 6a4f0da972330..a0fe7a9afb77c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -54,6 +54,11 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index d6631bfe629fa..59ee2b253ea4b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -52,6 +52,11 @@ wifi_pwrseq: pwrseq {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 899ae3be5683c..89de86b442155 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -237,6 +237,12 @@ panel_in_rgb: endpoint {
 	};
 };
 
+&codec {
+	allwinner,audio-routing = "Line Out", "LINEOUT";
+	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc1>;
 };
@@ -352,7 +358,7 @@ reg_aldo3: aldo3 {
 			reg_aldo4: aldo4 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-name = "vcc-pg";
+				regulator-name = "avcc";
 			};
 
 			reg_bldo1: bldo1 {
@@ -375,7 +381,10 @@ reg_bldo4: bldo4 {
 			};
 
 			reg_cldo1: cldo1 {
-				/* 3.3v - audio codec - not yet implemented */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-spkr-amp";
 			};
 
 			reg_cldo2: cldo2 {
-- 
2.47.0

