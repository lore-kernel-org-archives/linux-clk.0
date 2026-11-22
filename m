Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352996;
	b=yE8PZXGpGLNgoUWPIsYsEOd5Hd91T52u8W1L8pQluGRpDTn1vJWeMfGnDyE76cLYJNZx
	 4D4YpT1Hh3xDsjQJWB0qmC3PMezrnkU+rOAetDdpTNCEqDLupvI/PvXymsRK5CVJ9mwPt
	 tk1Ve/UqJsMkGw+JpITsS0hW/YqLvZN2IUSinqRnvzZJ9AfEvHUkC61bXHCKNnmKxtMN8
	 6sRrVJbQGqOVJ0HXUyxWdNMuXviuiZY80kqCyggEEbTQV/KZhuHAdB131a0os7XK4J5tg
	 u/EHaaUE/6kXBu8AH0ovQr/C+JNDRUuQ3Fy4EEyy2hPB8L74dIud5/Tlycrawx2BPgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352996;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3WVF+BnP4qzBtplSjxWQk5yg0E3IzzpiQgd0jJSCJv4=;
	b=N2OSNHdinFZVxbQ3PqRgPGpsQWUhTip2GwZRuRCmTVqOMBn1RlUYDcoXMkcA9mIuC4tn
	 SjDZiQlxkKgFfCgLXEGTSfBH7BJsv8wCCSTF84KvRmmLOqNFPw3u6x61vDmybDrq1V3rf
	 qmpthXa2GOBzd1+IKN5fEN+iMhLDAyKbVkMAkKqnc7ZdmdACEhJtEhFPrnZMntPlVZl9c
	 LRprIZx1hD9xpvkgX/mZDXQrX79e9YJVlXMcJE5trKo4CXuZ8Qf0qycvhDy+MrFi+deDk
	 yqx5tR4WlK6mlp8fHzdP+riRTE741CSOULQ9RwTdPqovmTk9uiTY1DWjxIrzhtlAGew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99665606A320;
	Sun, 22 Nov 2026 13:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392D01F000C4;
	Sun, 22 Nov 2026 13:09:55 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:09:27 +0100
Subject: [PATCH 4/4] clk: qcom: Consistently handle MSM8996 and SAR2130P
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
Message-Id: <20261122-qcom-kconfig-unify-v1-4-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UqTBRQnStcoI0v+JVHtdOGcMZaZw/+a8HsHnNzs0PjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAumO7ZlqKTnxkPNcp+K5G484vumX1zDz1OesH
 rXokcN3WpCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLpjgAKCRDBN2bmhouD
 13TaD/oDSSxIY+Krh9aOdhoxXUVoV9DDNOq+nm+hZQeRHDaYvVVT6cye+tOWk6UOHEA1GkIpY/n
 Ebip7hTcnGwcGMjs/j48wsqSROtGpY+wn6QLxEFpbeHqJBs35jRMaUub1dP9jkQQwGvyrZnF6v1
 93IpoFh8mbeT2xBMvwn2auYNufYXi03QGUkK8wJGSjBAR/Dv5BXMWvjAzpG8ZXkHGj0W5qBqcW+
 DwGDKSixALkEidO5IZ9xveZssqUAtjo89+fTXHc1vKy1ixniLaC9g5JfnqQ5wiqKOAqgCkdk9Oh
 9oLLPPiO/QrWQz4G8PlJFfs8Nf8jW5YdGewHRngnvOfL3FdmmpxikRDUGeKLev54rDyGL6TFS5u
 orpwYgO5eiKoGAKxNyI6/bZ//+Dc+/yFFFBGu6N6lwVVOyWEyo5RwEmVvu7NrxBXJZE2/mdMH6t
 aMU8S3PhMB0ZPpnWpgcJ+svI44ikt4/wJIihUTexzl/2Ce2crTe+eI2vEbL9ZgzZjsWLgMdGYFy
 WDiDQDX6QSxkPEjNkj2QbGz/q/vWKBUHrRGyE4NqsNxREa0/wO+JKHho8NIrNuqPW1JXe7Uurbu
 uz122tOIw2B4ARZtdU4GEedqkfEA9w4DYfnYJ8R8aLDgYitDJGAeDLvibyoRNAKGcetkCUbBUgs
 a9PnIeDAx/4oN4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Restrict Qualcomm SoC clock controller drivers to ARM or ARM64 in a
consistent way with other critical drivers (pin controllers,
interconnects):

1. SAR2130P SoC has only ARM64 DTS user and other drivers are
   already restricted to ARM64 only.

2. Other drivers for MSM8996 are allowed for ARM 32-bit builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6ddfa451ad55..a05a3a853871 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -463,8 +463,7 @@ config QCOM_CLK_APCC_MSM8996
 	tristate "MSM8996 CPU Clock Controller"
 	select QCOM_KRYO_L2_ACCESSORS
 	select INTERCONNECT_CLK if INTERCONNECT
-	depends on ARM64
-	default ARCH_QCOM
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
@@ -1188,6 +1187,7 @@ config SA_GPUCC_8775P
 
 config SAR_GCC_2130P
 	tristate "SAR2130P Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	default ARCH_QCOM

-- 
2.53.0

