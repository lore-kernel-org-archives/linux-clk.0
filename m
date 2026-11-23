Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419520;
	b=Dc9xvlYOSujpPo3mggxsz4NVPqNNFJBoGTorxPznVNJvGj65WZBhY3Hr/yxrCineNIHk
	 x0sacCsMNP5it/7AJakU93s8LD0o/5BXUhfAojjEtYsjdiCfKIvLATO7JB5qxs80uoxSO
	 lRbPHduUv39w4p1Bp8Tl/HZDEOtILWBCkcuntbRfhp3+oq3EIjFpkShpeBoDKRzxk3NQR
	 CfOHKsSK0afYFRi4dVFRR5bN8omynR4DLdmcQbIa1McQaqUaUDoZ467TXo2KxmJiK5097
	 QvFhySeTfe3+sDnHVpJqtdwFz+UlOP/T4V9pY1WOplltc6nVpeAoukgTTVpLips7Qmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419520;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S709EPmVdlLbufQHIVLlQmTzzyFOWDm+lbAILIM8xAc=;
	b=2WPcget7DVMHrKgpAzDwti4nzZ3pa2d7AsanfuRvMy3RQRST5X6YqZgOeQY+KEX/lAsC
	 mCdAw4eNX7MW9Q68ABTTUhQpxVGqfV458s4lZInwbH3iQe7TnYNtpXS5rAeSMqrrKjZmr
	 /98YhaEAUvPLpuQafRnGojPzeI217UD9aiIQtB/a7TaANcmOxqTdb/TKEB4btUvgJa7aC
	 Sd+IMc+XTcr8ihZSpiWRbGVfs3oRODpjFgSn7TbATvZpLKiSxTgxqeX6XBtiiVV8SuxyB
	 V4eZO0mvyb2t5fQppP76Qalu/eOqGuxbNpuDhAcA4DMb0XMSStCYFZXb0v4/t6KZ6bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE4606A33A;
	Mon, 23 Nov 2026 07:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22561F000CF;
	Mon, 23 Nov 2026 07:38:38 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:38:14 +0100
Subject: [PATCH v2 4/4] clk: qcom: Consistently handle MSM8996 and SAR2130P
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
Message-Id: <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u4n3ZVFvLwi0dVqlyrLjSilREUmVzsvx4RLcH+G3oBU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+1rMUyS528JGFAtsu+2StCwrHhZkWzw66hb/
 RFwMFtSipOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPtawAKCRDBN2bmhouD
 1/40D/9j7BrVfoP4fZJ3opECjKHlXqjYr5MnwRp9UFJdi5s1FGvJfu9GVnGu9FamL2F8f3xySYZ
 UwSO+c671VwTjTuIqtNunfPiEEbGpE8DVHwesn7ya5bDuvZhyQ6US7ZlRVFFHiWK1Gl4Sl9/Kx4
 eE77OUWfchXtv6bnddnzWabh88FIibPqCVVj17UZV10Yp5Gq/BqrcfelFxRZ7Svj30GJMUWA4es
 DepNPwTq6Mg2YHkyGbYcZ2kGE4+YkEDj5+kaQyqY0zZlcUTea6erN6fMoOy+3+ZxGciwrONbwvp
 RGzVw7uOfKGSMFKSy630d3XBp7ovFgrJD7/EjxczJWRys+gUYks1EDcbGBYEE982F9Ev88sZ6Dh
 85xrLFzpCxtPtHbkOE2BiRb8YqH9qeqEBmZ3FOGY7GxsuVWbUWJsd04cHzs9kkrBKigfCyLIyUU
 iwizO10cehIx0RczRWev9fGFSsBZd0Iwq6G38DIpatUkD0MtRUATa5jHQPmoPpXgS8eXRzlT20H
 2vDna7NYJZUgK+UOGiFEpggtqXH26/ViX8PLC8B2RTPiGX3L+adf50vB9qdzR7Lp8VvNKxJw4JK
 TFj4gXJBpgPHTdn0h7DDGv5Sdf2mG7MtCp2DGR+r0L7M/qLvrfKbTbdsfuwb9N877WROY5bd6ei
 XomE3NjVePPEs9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Restrict Qualcomm SoC clock controller drivers to ARM64 in a consistent
way with other critical drivers (pin controllers,
interconnects):

1. SAR2130P SoC has only ARM64 DTS user and other drivers are
   already restricted to ARM64 only.

2. MSM8996 APCC driver selects QCOM_KRYO_L2_ACCESSORS, which is
   available only for ARM64, thus reasonably this platform won't be ever
   used on ARM 32-bit builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6ddfa451ad55..05aa3b468812 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -927,8 +927,9 @@ config MSM_GCC_8994
 
 config MSM_GCC_8996
 	tristate "MSM8996 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
-	default ARCH_QCOM if ARM64
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8996 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -936,9 +937,10 @@ config MSM_GCC_8996
 
 config MSM_MMCC_8996
 	tristate "MSM8996 Multimedia Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select MSM_GCC_8996
 	select QCOM_GDSC
-	default m if ARCH_QCOM && ARM64
+	default m if ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1188,6 +1190,7 @@ config SA_GPUCC_8775P
 
 config SAR_GCC_2130P
 	tristate "SAR2130P Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	default ARCH_QCOM
@@ -1198,6 +1201,7 @@ config SAR_GCC_2130P
 
 config SAR_GPUCC_2130P
 	tristate "SAR2130P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SAR_GCC_2130P
 	default m if ARCH_QCOM

-- 
2.53.0

