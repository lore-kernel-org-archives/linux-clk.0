Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352984;
	b=3qAdY32R0QrxwbNcwqbLOvSKo9A4IXAoON3AJgqzZIueEjOwWYu3LWvMxWtdLVD8LRjU
	 cSNoEoU9sbMvXN1ZgkvfVz8QHavr3Yim/AFy8RJ8FsI0L+3flGH35DqTPh/rvKqjtIA/U
	 BWQCgUzkkxKEduGPo2jjV6TJBhUTCk0kF8pSZhP4VhHOZMM/DJJbPlhL6qNxIIcYbGz/6
	 jQEi3PT7Vzs/yvF91jdW1avpSYTtba/4msTyGjAaucTXKyKvJOCZA16gQD+lLdsliU7bU
	 M+OFNKXWoAW2CCK4RuKnytN2/bxkpOL01+GW9pZj8RU/7y78u13HkDok+/Gulu8hn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352984;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+WN/FqLxCr2wBGyAQFjCFzQM1TfJwbAtOl3xxoBz5v0=;
	b=nXqkupmFrAT7n3YJyHWgxatbTy6Um92TZWwNKvK5Ap0uf9/KH8ByB5kkw5Nig84XF5ng
	 O3ZeoeA4+sO1CY0WP+brpEu2QGHLBhxDKd99iG6gbyE1lQ7cA7nIDS2nZKnWxpxYwm65j
	 rl72OHRw5xYHhTkOBOl+u6zzdAURs41fbUt7yD34Qbbu6El6d2/rmdB9i1XO7fdpsLcpm
	 WOOTYyzOPLqDYrluf9eiZmP6drZyjMhZh3hK9RBLL0ivgr7loOpSDtkFBCfP8i55VETWE
	 XQvXuskvXXQVR8iEp4vExpqthBGO/TouTsXMefzxOlEbr9c8IkHKtYFamBIqQG8c/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AD4606A32A;
	Sun, 22 Nov 2026 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AA91F000C0;
	Sun, 22 Nov 2026 13:09:42 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:09:24 +0100
Subject: [PATCH 1/4] clk: qcom: Enable MSM8917 GCC by default
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
Message-Id: <20261122-qcom-kconfig-unify-v1-1-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/szrd5Fdeq85J1nYEkeOsKHRMQyZv/sUT7bgNkpCdeU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAumLuyLkLVSB0xUfibyKswNGSB8VM+uF9xfff
 CphN/nKpQSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLpiwAKCRDBN2bmhouD
 1w/tD/0SagbNo/iaHyYGRSO93OwR98qo+hE1x5C1puT/r7ljPkhUodKlCZrO4sNkbsMtCypXSMY
 p4c+8VfdNOUpPpz35XsXrNAjOi8e9Wo5iBc3zyRqnIPv80xjb3RyYseB8jL5cK7dd6ky3x7Dj58
 MNqU6Xlm0rT4qJsD2XuPoxNtZuhWY2wPHNlLYK4dwkNQm+jJ5dffaHJNZ2GUiPbCaVg64opCe23
 z6Om/9FGNU5N686CkJmB2dVbsRiNlOKzQfYpHL+evQPZcdfJ9qZB5S181788nuAeguB6IIpycCF
 9AKVvVnWddhvhtbGc9OcAeMm/gpN59cmqrz9eYVmJgZlYCVVYascT4R8LeV48UinVQHX8WCXaHU
 zc8yokYvGQA/qBebOAD4BYCoFLv0rU+LNK0KYN9W+0XLve3uW4e86ZqH4GEPWz/QWysypkV/IpW
 BvRGlRC3n2akiJgaIIZQlIeii4qtnA0no+fsblfUqvIwkx9RLNxuszWpEugmujSp9toJTXKMXTq
 LNbvJiNFbYu0eDsHx+dmWJVHB9QGSTUqBDBkQl+NBB4xbS7i0OnU6NIx2vYsXDPtom3YYgXkXgh
 f+2W+EfEYHvLHqfYkPxNnKl0nYhDNPz+19wnPKhwrkLL98fkHrydjxvFA2D4soXofqWQHJaXYQH
 BVWlVfRjMDKVSHA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MSM8917 is an in-tree supported SoC, so its critical clock controller
driver should be enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b1849..91e774dada4b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -797,6 +797,7 @@ config MSM_GCC_8917
 	tristate "MSM89(17/37/40)/QM215/SDM439 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8917, msm8937,
 	  msm8940, qm215 and sdm439 devices.

-- 
2.53.0

