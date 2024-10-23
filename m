Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99A14B942;
	Wed, 23 Oct 2024 08:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670407; cv=none; b=f6DXFlBTeCjqP0lhmJlfwV4SJoaa8xvh0tIwEux9h0BA1AX/C5TcMwdS1OhJfo7khMiv+6Qb/Pf2ndUTRksUCFk+8hrhnPC03CbNhOLStnH77i/ZTwfyl7BA4EDE05BiJhOSo8VvLSUrjMx6xkQR8LgPlzkX6iQtgqg43NB4tyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670407; c=relaxed/simple;
	bh=6GaFL/0waHV1EDEGFaRbExtZwhdfXGKAosnni+XtjYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjF62hZVMdSlVwL+xb1r65+1usb0+ItZZsVvWAb7cruuiSvjGuP1GsOnegZl8k4b/V/UEPCy4JPP79JlYx6CqRtYP2GyoIrv2yL1G6DTruFqol5JL+0fu7tZJ2FqQdinzK216TIuLJe4q9caZgC8RmB4chh0LUqJUvmHvyNAEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=bBJFZsjh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jdTaobCi; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="bBJFZsjh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jdTaobCi"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A24C13804F2;
	Wed, 23 Oct 2024 04:00:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 23 Oct 2024 04:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1729670405; x=
	1729756805; bh=8QXVw6Z7+G67UnBf1aFM75MSoCxRUB1S0GY88oZNAaM=; b=b
	BJFZsjh+vk09gud9e3aFsT72wAPq9FpTnEjtwI/gHwus1fq+hm/y5yT+MAgWntJ5
	xbBN1chTvbRfgGQHdDJBQK10FDeE4rza/r4ZZuPrfX0FMaZupTY/4zcMlA75KTBp
	iuZE+9aJ3gBFwlGUEfOO8tvJeXZj1AXKSmpcnNBdb1+CcZZRqdw4OdZrm/ma89+r
	ns8r+FfeuIkS1M5OGIwMAueGHoYkr9i7EBtZOUJFGyd1HRhaQTATO4lypwREbSDR
	iGwe8gJ7PGUgpnsmd5RRHFegRAAJW1/MJYRApJZ1d9coqyVPqjQC74qhm/UrD9aj
	zyUvDVW/zigqqWjGIyjhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670405; x=
	1729756805; bh=8QXVw6Z7+G67UnBf1aFM75MSoCxRUB1S0GY88oZNAaM=; b=j
	dTaobCinfIGIxBi7kKCqA8792T8+nuHNoD0y7HNYD8eFZen1ekrRB20fuTbC+IZk
	pfGrgLZQKmzhyP9nUVgJdPEyb3WPCnkTVCufedEpeCqy+S006l1BnuYXQneIhZTx
	ZW6Ac+a5aMO7qVs9alo207hWQf4biJd8BLl36FzycXDzRACN2+tCguC63Nj0LPpx
	qzynUxwn7kAUCLIUy9U0pbHySptsndKjdQPXJpHik1zL9cAGCuhYbFq0GrBUvHF0
	srs+9USlEFLhDsrFP3F7g7TUs2VkpsWZU8R1ONf2bdOAX+aX7M4my9YJxQ+Cx355
	q57EFv9P/7t7tvaklMcpg==
X-ME-Sender: <xms:Ba0YZ0zMTA66g5lpi36OMADZ5xpa7qaSstx2UpQyX763uPSCv_x9wg>
    <xme:Ba0YZ4RgRZxcu3IzAPWVO5cBUVsFs2MSHSX8qmqhLjOlkKXx-rKudU9bsRwAS8yHU
    y0K-E8gBgfQPHha7w>
X-ME-Received: <xmr:Ba0YZ2UIUUfs7k3l2X-JqBZGbwPUmkWtfAPp-b6UtGGc5Dq6sHNLCuJqUI9eq6_Vao8DpuSZEzTn6yh9MeJXlk_2sW7m3EXJQXW3J0RRnwo-W8ch>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Ba0YZyi9CsOO6Z4ZuqJSt9624-jcarpBPc4PnswN4dzszI42U_2thw>
    <xmx:Ba0YZ2A-qP67GNn2ZcqFW8EAtfsPmXt9vWpZfTEHdfehIFoiIxrDXA>
    <xmx:Ba0YZzJrE9f8rny9Mlp8p5ZCUl_qdwIsg948raJ1r1tgnCzJzdQXQA>
    <xmx:Ba0YZ9AhSaaFK2uz8430TyL2yA52s6E-N5z8UHBf7OSqcY2MCsogWQ>
    <xmx:Ba0YZ8TXfNCjRjjeU-iBCNtsXSj86jPBbf1KAmpcpR_quc1Mp7mxiwpE>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 04:00:00 -0400 (EDT)
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
Subject: [PATCH v3 7/7] arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all supported boards
Date: Wed, 23 Oct 2024 20:57:03 +1300
Message-ID: <20241023075917.186835-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
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

