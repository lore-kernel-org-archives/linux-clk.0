Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352988;
	b=E6fASx1x0fmeA+vBWDnNYs6a0RrsmCQVDpLoAfzIucU1ymK2pl9TwmnOkYx/vSE17dh/
	 1Cs18gu7jI618gucVEvilVk2S/1PGgDYF1jLevtWGWgPr0z+A2Gbw2LcBU/VQsXrHO9Rp
	 1sWt8+pCa1CcrCl7NTAfsx061Rx8cmgIF1y5Tns4Cu/mOaHyX5W6BVhYv263/YPWJCRaC
	 8mxelGpAoDvzxTgYV2N0N1J1MBJyhMKyAq7qdXjAJ0WZH9B8zhw1408tWXTRLIp8t9PzN
	 xK05RcrdDbTTSwpim7XOgDPi6/JfMr8Pz7IibvkaAQZFUy6z7PuopGgzw9J2xBEgM0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352988;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Vnk9vQuILzvHv3ut/dW7kMQknuYwVY9iKGBFPnyYtJU=;
	b=Hoglx9WG0s5gjM8IoLuYsr6RrL9uIlNz4Ohdw0s7TOXZ6PMNFwX2V0feYtbEY8WZGgug
	 rKbAOqFht+cdvPhu/8WwO87JBQRxYO7E56KPlhxtBD9jYYisSM5RSkIganU8ER39r36jm
	 gxHmR3IsMlz/mBuuNt/cQwTMrlNhbMu2K0kPq8eNULFZiDJN7FYZ1c5YI3/7GtlgaYcNr
	 DKQjbWHaNFijhVLG3gQUSdK4zZZk0+i4UG8oGSppSYR9EAKLndhzvZJglRRerrPG3WA7l
	 ROeJ9pk10VRB0p1zTt7zucpoGw6MxVAH38BD9PfeIfg84h+feGIAhS53AELty/f+mRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CC606A32A;
	Sun, 22 Nov 2026 13:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5AC1F000CA;
	Sun, 22 Nov 2026 13:09:46 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:09:25 +0100
Subject: [PATCH 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-qcom-kconfig-unify-v1-2-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MwoJAHsxq3kRu+1Ivzcy6fEn5ox6fFB8e3Etbqrh1tg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAumM4yzHCXxHopkd30z0RlIY3A0Wxcty8JD3z
 FacPCnipZ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLpjAAKCRDBN2bmhouD
 18A7D/9Rz8SUeAVhkOhehqtohiURT7oAU/FLSP7TJTPxFM+DrPOnedYdUsPUOjMVFFE9LRf8R9v
 YFeCQ4pTgl/Tijp8TQEVQmXBvAzOUa9QUiLc+U4WNWoByGOe0LEwVje7iOyAQhnQLg2ycUrjhzV
 ZnIdnAUqXuIqmQMYPguRYp8R7jT02LkUKTrRQOYae99wV+M3K9F9NWU+i2lWkgqhvaWY8Ro3QcD
 4/4h4u516mCtGi40nsObHA0miJGjZokDpzkfYvFNqbX1QyUz0CGrpDMQsVaTu9uG3ZE0przC9XI
 tZ+ikuDAJp3s52awGcwGgqeBGoYJ30KP8ubN60lOxlTgmPaRstomW0gnhi7nFbC3oxXqPeUhYsm
 2iCud+BsdX0coCC8FxErkuhbyBfznap/X2hDUGX7Lfkr+8mc+VwH9N4MP6GgGpxVsaKdIND/Rgz
 +s/le6AL3tAl1Nn6/zpOwES6ei3QdWCXfdEB7/uWrYGCncNg/Dj37hHcCkWhhPGLU29W7S/t5XA
 GxCRqtppmF8aCTGD16OBLS1gwdhnKcRu0IDGoCaoYKgOizeGS33gt5u8wJ2XgeP0O4EifUpixoZ
 nTDLFIj7RT8xvb8EwhBotmGJT1Z0ly/b0axjTnD0rv/ZgbxRI8/LYeJYon82P9xg5v5iX3+zTCJ
 K052Av1uvAZoKbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Critical drivers for MSM8939, MDM9615, SAR2130P and SDX65, like pin
controller and interconnect, are already enabled by default, so should
be the clock controller drivers as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 91e774dada4b..757f52910f94 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -807,6 +807,7 @@ config MSM_GCC_8917
 config MSM_GCC_8939
 	tristate "MSM8939 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8939 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -852,6 +853,7 @@ config MDM_GCC_9607
 config MDM_GCC_9615
 	tristate "MDM9615 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on mdm9615 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1189,6 +1191,7 @@ config SAR_GCC_2130P
 	tristate "SAR2130P Global Clock Controller"
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SAR2130P devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1198,6 +1201,7 @@ config SAR_GPUCC_2130P
 	tristate "SAR2130P Graphics clock controller"
 	select QCOM_GDSC
 	select SAR_GCC_2130P
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SAR2130P devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1480,6 +1484,7 @@ config SDX_GCC_65
 	tristate "SDX65 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX65 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0

