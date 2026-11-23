Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419512;
	b=0690LgYqGhMokU+D1NUsFe3gYTsl5etGWYTXPy3aPAtCrDmooZ+MJk1OM2mFDlr06LUG
	 wah7rM6f5ELgRmBvO1bbfrtrwAnmOcDpCQZlkubbbVD3qwsqnl01nEuiKHg0BdMG+Be0h
	 Im5uQb1TEHTIMBhIkIbFNKxq6E9G7ZSSggJ2qKSfGN0gOGW6SiG/clWn8G2kgxXWRuLmJ
	 Bfom9YpJ6gBnrpz79k/B5WZ4HvepAX3TY+CfOvOsL/TA/q/Nej0CwCP9ZT0ZBuNLKdcBS
	 3AHN4Oao5vHl5ddD4sHmF+cLCztQthY/uA/k2Qpp5eM8UescIOzKj95PwrnSiHrWr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419512;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Vnk9vQuILzvHv3ut/dW7kMQknuYwVY9iKGBFPnyYtJU=;
	b=qDVS78SpyJlkJZLh3gLgQLb2CTxmrFHnahczHint52BT/iGOc49fsY0GrwBAJTy0pLh/
	 o1dVFk9qUM9+ynp1N2Jd9+PIQ6zH4UKyYUtZ/LVk4MTHmJrK3RIkDdOrezuwdi5L1T4Cc
	 cPVYZ/qqI0g5c04+gZs9ywQoajQuGHwX9Gir88rcKb1fk1+F1i3rD4Qm1zlnsvDMYCWrJ
	 RA5+7mGeNxzwGx8tgxCXlDpD4kxSLmwKoKJMzG8LFb83vl1BYQGCssPiAzsgSukCXeNEm
	 8YaoRliABsZQgPP8ut7j2MnzPo4RnSn8gzPEc5+nzct5C7o/D4WFV4+/V+WGkIU441w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F085606A331;
	Mon, 23 Nov 2026 07:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5B51F000E1;
	Mon, 23 Nov 2026 07:38:30 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:38:12 +0100
Subject: [PATCH v2 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
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
Message-Id: <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MwoJAHsxq3kRu+1Ivzcy6fEn5ox6fFB8e3Etbqrh1tg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+1pB1BQ5l8r76cIP9ixxfJnf5G4pXJG2OfK4
 z9uS1YMJKmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPtaQAKCRDBN2bmhouD
 14x1D/sHI4s/bkRHKbBrF/3CeRWZZdfX4QQDh2A9di9FcQMcFbG7wjvza7dkByATJaZjlQws5QJ
 duMCDANBUKyUyGHNLvrhEYps9lXzwX3XNBkxO4Llyf8JVMfaTRXBwGM6PnjoG34QiFTiljSpq5T
 OP+zyzvzSvm24PY4dTfZpjjVW39bas2WLUwD1iP6zNYg6MOeNnKdQ7q4FWN49uWKVqOFAju9hiJ
 9LXVXKT/bZ4zReAcleiPxHee97oV1IXGsvB7VAcXHldmSJ0d7kQDIS9MvhYmSSXmKo1zdUUSEMp
 wJc7JzkROeSoFP144HXrrjKEaz1PY+lZM0dgmow1aluRY3IIp/gggSLL2mKBjogsFl7ejoHr2TV
 36xmURyDpytTEGJLXtTtWRcIQTDZzJAiF9Tk2Oa8Mi0319ZEDvvngS/jTzTzve+3IyphtDFQsan
 WnQqy2q4stGudH4x8uE12T+j77JeXlnoilZCpuFhKKavbCBfspTs7wKLzYDt/OTtZC+pmk2Zp1P
 I9snK63/D9g9khIyG2VSCYK+XlT8q0/TUmftsnrGrFxVj74ad2+PSOzJQaDMNsonJ6UJTswpoMO
 V4e85KuRncgnJKjT7h0FCzwK1QYPWgDf85tf8289AiTR3cTaW0i4tzZMf+CG39m40LGiLGm0zxs
 uoyseSgBdWnUahA==
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

