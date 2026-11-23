Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419507;
	b=z+8rH076pZmqo2ia7vypXICBzNdTxx1b9e9PgSj70C0ZU2oFj2kr9xZrc781bmNKPTKp
	 OauPIpLInR7a+dHBtMyqudC5Ah3Se5SnvQF8KKg7kklfJKLaxFU+eaWNRhJYCXrpD7j8Z
	 TI0i7R99OC5tFMuUnGjQVsoLeQNyKkZIFPgdUGy6mOk+gjUebA1u4aLXmJAmfgz5RrIq8
	 it8VB6OicG/8nqZNI1E/lutyjt6qD5bWLiwG+4uasnx9mQIQHtEUlxcw5eohhUZG89dJj
	 h3s1EuQQ+Q4/rQLZ7qD+2tV2QaxfHHI1wv/Lg4JRzZXTNcUpeMGRPTy3tHILgyEiSrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419507;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+WN/FqLxCr2wBGyAQFjCFzQM1TfJwbAtOl3xxoBz5v0=;
	b=ozl5WOH8VCRJmSHXUkL5pnfwwgQ+QLCOYja08Ogt/XeZ9miBrrX+ZGWdRq27+CppuNsH
	 4kBI11i5B5Lqc+DNnbQdIH79JvSdoQnHCup44GPNazqm3qAsz0WMF5VC5JmXA9bGc228k
	 zOPn7s3Z8abp/VyNQ4anhcIZknpKQr82jV/Z2BTqKbaVnZH4LZueS7YfwrBEXwrrUN853
	 eL8EHOGHjXzyYYQWw70AFpKDSPDHaTWgnT93rMSOJzwhzLZeuWXpSRCRlwRI5Cn3yQPz5
	 8OhoVPsqdgQVQIOqHR5YPjyhRrPPJmU4ttKxwRjo35ElIxzu8THV04L2FsjBhmuI1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429E606A33B;
	Mon, 23 Nov 2026 07:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E64B1F000C4;
	Mon, 23 Nov 2026 07:38:26 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 08:38:11 +0100
Subject: [PATCH v2 1/4] clk: qcom: Enable MSM8917 GCC by default
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
Message-Id: <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/szrd5Fdeq85J1nYEkeOsKHRMQyZv/sUT7bgNkpCdeU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+1ogWAQIYGJBLrAUear0UuwSdRBiOHJi7BTm
 72SIOptpOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPtaAAKCRDBN2bmhouD
 18ifD/4ydBJIJlE0kACm+3w9albQA19P1sezYFN9FbYXheogniiBl61r6ybPpv/xmnGr2y9LEQg
 jTtXCk/PybLIj1vEw6LobwDSuEFwFRX7vOTZxnyzrZn9onP/mMEDr6HnrIreLz2LOFc9C8gWV2J
 SVaGv9LHoVNrfXP44OwIrbsc9FwYy6e+DQYjtsT8jjScKoXVIGji7f04daDLwhF+8b7qCV8UFtR
 QAQDgHH0Ss88xn0Y038lkDjnEr+gPN+vwjBoTsycUbA3rSuEEuC1PyvpgOjv5d3y5HEBJa76Ksi
 6KJGAVFpbcfsdHD9dyP0ryYA8ZBDHx4SCSpjjz6KnIpZlA9dGV7N+sVNBaPafufOEJMYKyIVVVX
 UeYy9iqcysOamKz0g/lTaYwxkb96MetgMtarAMzh9EmhBUAWInBPVX4chb2N309zCG+AOOnxoVR
 JjQeDHTFRJHdJJSqqw3Nvnr9Ln6M1iAmCaLCVHKptacy6K4PFPKusJmuFbJTGRXcR2VvcUGFiGY
 x/7qIhg6GYpsRld6sdpb4evCyFcgZjnlKPeqCXB4PMmb7fU3YPT72DahEFM/Qj/l8xPPRVKF8Au
 od5B0F8HdmF/UGHrfJT+v+x3hX+zMFZAgEcUSWs/Kno5mxkBftKPff+e5+AeB8chHTtLl2Tah8e
 8RJx5mo3Al5gGUA==
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

