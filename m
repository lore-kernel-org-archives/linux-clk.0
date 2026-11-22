Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352992;
	b=PkXJhMcDA7enGU5nlVQJihFhO6Z1TW9VtMSwKjJIdCt+r4xZN6enGLfmGaHWLzYR/lG1
	 IxE63ADjeGCVTOu+fbjuEQZaFyrK59vRnSs9eiKZaOGoWdK3fFvG4ZPaeqYyv4xGVdZfA
	 JDgROqmi4GvWsdNr63ehRfAz5P8qQbc7lQ5KRgTaddpMygXv99P8PvSlilY4B9P4/R7sI
	 fNUM11l7jwrVneTp7P9HIuanTpch9W4cXyHMMJIOtKB3REcKe+3qoqvQF21sYp97Q+SlX
	 +D6EOcNGe4zPVN8t4ANVkREv4FxqQ1kaak4U9j/zByzxFdV1H8cvwogHZlYuk8ubbaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352992;
	h=Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q2g7v99AfPez2bNaWYwX9leBvXnfhrV9/muFJfRB/2E=;
	b=KCSf7bU9nnOUlw4hRw1EsluLnfbuRZ3xmyxsYcYUnFAu6vEAQf4ZAnk5CtkgTSg0za4m
	 he7E0Zk82JoBSa0fKg/47te1FA56nfVHFYJ7KHBVeaieKyjbRlC2aO/+ujRqhaQ+HroP7
	 SWE/md37JLKUcIbXJfw1+t8pmKaO4MHLt4Oct9ZV8B8/jc7R/4GgSaveHNQAAw4QCwg8h
	 ehxAYQ9PHc/lgEV9Y1fUEt3k6HfVhtMEIclxlVU4Z2+SREKFdrHVmd+cHjHxfRhG+ylRN
	 062InTLVs5+t61gLnjmsC7Ey1YshIZCDj0aeskic0DFbBmNWisNlOe75JzUvCq5ehpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC6606A320;
	Sun, 22 Nov 2026 13:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B096C1F000C0;
	Sun, 22 Nov 2026 13:09:50 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 14:09:26 +0100
Subject: [PATCH 3/4] clk: qcom: Drop redundant ARM and ARM64 dependency on
 IPQ_GCC_5018
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
Message-Id: <20261122-qcom-kconfig-unify-v1-3-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=740;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oVNwpS5L9vZXZKx3UIsH0zv4b3oLQzDJTsWa2WTdcjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAumNs3DIdr8MXrxrGgq+EY+Jh9lpl0YtEPQkA
 qyrfPMGeYyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLpjQAKCRDBN2bmhouD
 190xD/4tmm9QgiPFZub7EaJVFEiznn/e08peKCsQhqI/7Q/C2z8EvdD8OfkEP2VtSquuljp5co2
 tk20RKGzszC7oInf8KMITmAEEqVcX5DyiwJZ91o+ApfqcTUuqmaT3uKQwLJI8xep5mM/JKS05R2
 F/MPblZPhVMAWNTU4cJzqFLv530YuAKERcJHvWTP4z74Clbz50/cWm10ptOge65mgx6lB2EH9gA
 nyZTxUl2TFMbqZwCBPGIdKnt6fLMOb98fmYVkma30mxrquIrlztlLEY/kBx8OXnQhTcsG5EbwUQ
 C5gT7g3fUjKHKOsEm1M4hTAbk8zFlJokNdpKaroIESKa8LtSuC2WRw8UoLggFmgQFh3Ny5gPwR4
 TvCL1eMRqP2FN0HYSFugKuRB85nMlrHGNxegT+YdSAkXpSSG8B3bCYqqQd4CAXWf9H7rAnyv1lF
 gkRsbJA0LdSDbAGzImHDckIhVcwfS65vRzdBgteDEiOG15ZRtyuMZR7wbkFOMmYq3qI84ryHIPy
 DVEZnYbC1Y0khvZLtBo9at3JLui1CiyBGW24leuzWh3Q2K/7bugRbJ7nTv1OeIgDo5gM8Z5ac97
 //4IZhrUaovK3Q+Oa9z5j7ZAzqpROmAlNcbmtlTypI4maAnL17e0tsLrUR/bbWEMoJjxrc5UZt7
 UsJhqKVEmq3ccxg==
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

