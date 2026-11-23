Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419515;
	b=5bzVG5DcaDj0aB8RQPCY+/MnjNikUReXZjSB9Gf3inVOc/eyEFpA4ayF0yujpeejV7V+
	 2XkVRQyaghcHbFb7P4jI9RVd1JrZ7f8tnf2eYwvP0JTt5u4tq6tGL7zojx4/dtkdZIGZV
	 k0AlZo/F8c4Q7Qqpb0SC67EM86f1EHeYBLf62HS8UnG9RmRLI4KhNn7SmL0WFIBQvNMS3
	 6dcxRjTfhyuagNQb25e+GiztoNpBv5hwa3DIeaZqBIeW0umJmToSVQ+1Bd13Cr+q/vWxk
	 eiYso++pRzMWvdesdLvSYMN9QtghJwMuiTUlgkg9XVy+uzjwL85nVKv+8R96K4inLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419515;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q2g7v99AfPez2bNaWYwX9leBvXnfhrV9/muFJfRB/2E=;
	b=AnoXdaadovXjDD5TOok7ahANiQU8A8KWnCXK8soVfk5lksbr5LafnCVAlkuM0yvhmxOD
	 gCGKMBb9FO5rOIpoCNylSAj+WVndS+GWHJb8HYUCJ1tKM7z3s+4/2UroydYYvrTQgmqqv
	 41AtLvH6xK4FTxxT/z4nkEkpYm93dJ2Kk6T9Rrt5RmH5XDppLfp2IoF3GMge9aQMdoK5D
	 frVg2izcfhM45dvYpWl5rb9yN5k93EZi8KlCJmpPFFRjTBtqXyiaZ70zfQzB4e5QPBPEe
	 lMySbwZkQlqNUIAtqYBDVfPbquqE0t/gwomG3PE1RA2fCTf3lMptVUOwut8pXhl6hHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C6606A330;
	Mon, 23 Nov 2026 07:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7791F000D3;
	Mon, 23 Nov 2026 07:38:34 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:38:13 +0100
Subject: [PATCH v2 3/4] clk: qcom: Drop redundant ARM and ARM64 dependency
 on IPQ_GCC_5018
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
Message-Id: <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=740;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oVNwpS5L9vZXZKx3UIsH0zv4b3oLQzDJTsWa2WTdcjo=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGsD7Wqg9zRmH/3OVBPeVmWszGhP8Ijrpdj4M/mFCEhyNcI1S
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJrA+1qAAoJEME3ZuaGi4PX92YP/R3R
 d6/K5GA9fS/CHO0M9R0Lq426WGVzdI+g0Xfx/YDR2Cmpd+s6bz0/Pxe7gG0udsSP0AUDwyuaoRW
 gjY/DqsSeIP8Flm08Vwq6nKM3WsYbepnjVVhNLA8sAF3tO+F+bFrUyfjA1tNo+ISsG5M6ApidqC
 UPsanOUFJGwJBprHiRCHl1Ulw5vmO2sO4bsOGAO7hF0MokwA0eILeJlZFj4cLS3xOLw2ogarecj
 wz4mU87f+XBTUfYMJI1TLw3m42OvKjMj+oqrYYIumMBenHjJ/CpD6X9Cg+w6wn3LszQDXAz8Q1D
 V1o8Brjb9pvml/Q90zCBX+nU9t9cKiWRuokqFhIH+PosDx3XU/+k8GChVxznULoS/hhBsCyUqBA
 BjhaTrqC4DqBGx4z5CDgKWAJ/wE2ZB4s1ADbPk59ZIPAmt5PVq7jV14qv6HlOeqHs5QPMDwAa7f
 PiQTQxrIEtqWVyG4jN3EkT++/uKWTVstTn2PxbhiIq3w3VECQdCdNM+yYtI1dyEHr+xh0l1YGLS
 U9gGl9Psq4T4QroZXC0YF2FLBkjhcsjbM5VR2fSfe+U4e3vKQaPbMGTif93nnvPWLhhu32Iri4J
 rjWIQSYrkwwuM90zqEmRwD82PcOg0ox+Ka0CITYiAjK8l34X55peEt6lBIGyNhviIqKWTFtLpCl
 UF1Bu
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

All Qualcomm clock controller CONFIG entries depend on ARCH_QCOM which
is ARM and ARM64 platform, thus additional depends for IPQ5018 is
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 757f52910f94..6ddfa451ad55 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -643,7 +643,6 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM || ARM64 || COMPILE_TEST
 	default ARCH_QCOM && ARM64
 	help
 	  Support for global clock controller on ipq5018 devices.

-- 
2.53.0

