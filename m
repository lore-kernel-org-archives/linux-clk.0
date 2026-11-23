Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458884;
	b=vZkKFk8zI+MKSCdA840Z9FtpHQmxPGWO7FwQqERhDF/zpEebVL3wRT+1nzLUiujIFpIF
	 9U6rIVcHNy8TdaLTXmseQ/zYzssquuWm0pijf32itzcL52yL2GxbGJGudweFobM4WrBuy
	 T4WmZOdPwOUyJo5e8XZ9nFkwzUz/2y2j4xFhlcTpsTse61jO0CypJVP2VThnFXC02myqg
	 87PstRqLwdrErG/i76RRqtPHEi9bgD1eo/4VBVhzrxTiQU15F8RV8E4+/SoBtXuQe7tb+
	 53Oymm+5Ooc3u0h3k9oIjrPOhPiZsaAY9U51dwMebdise4L+DbCGHw5ljG94+kXWW+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458884;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=avO49xzGYsTf/0WFd8dj5vzFwGfbLtBYr+4giTOhdME=;
	b=z5tsNQts2b7UQZ901GQ0fs4CV0hyS7VWK08C5V9R6ofrsrN5z9ek+2RW7900G1tMhwvW
	 HJL/+dIJ6xODxkBNNe/ey8q429GEOceOufE292xkofoTE8Z9rWqCKMjCvWSBHE1HbTWdD
	 v7KUOu3bQ87NfM6fQyTL1nUjEa+r9wT3hj6Wi5Q4blRhUwbNuO2xrzFfN8HRygeJOON82
	 VoOqqAcPf/Lo1IKcLyIkANnTBoySBzK0h+OPN9Uc+fhA4+3QPW0Xp2+lvJrSJhv8z4WOG
	 H9LqAoR8hIOWOdvq0pxUI/sn5tDdhmrokVVY7qFIGCrXNSSRUrXcXetxW7KZVf8oUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDunMsD1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F4606A321;
	Mon, 23 Nov 2026 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDunMsD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE2B1F000CF;
	Mon, 23 Nov 2026 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458884;
	bh=avO49xzGYsTf/0WFd8dj5vzFwGfbLtBYr+4giTOhdME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZDunMsD19LeLPCLNxvRhBSyQ54ifrpeJ6zlZ57bFSwJ1c2K6q/UfxHDNxt+QuSuCp
	 IgfMAdGZ6ZDVCkpKpXjT5IJpuKxs4/bE1cDw1Z/yDnYfuGKO3gYF5OCdY9f6qiP8W5
	 6gcvdeGbEtJwb/LM9Wf+Q+eFG30UzZnMZN0Xlthjrdshwmv3e8IUTsupCKHD/r5JTZ
	 c02T2uk70+zTFTemRPk8hU0xQbVd+nDy2kWlEtGUARZmk2tE8RJ618DeWofRP+pxqg
	 VOoW6lo7ejmiUehJ/8i0ZINzH5MJapLOkOhtCh712I7kUvcWBlt67upGNsrla+Rggq
	 urs5ieXkkGQig==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 23 Nov 2026 19:34:31 +0100
Subject: [PATCH 1/4] dt-bindings: clock: qcom,glymur-gcc: Add missing USB4
 resets
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
Message-Id: <20261123-topic-usb4_clks-v1-1-531ab5635c03@oss.qualcomm.com>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
In-Reply-To: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458875; l=2295;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=xM9BqJq7BE0+K753woh00hdOhHYylbFYbIwnFcoRy4g=;
 b=u9qW5WpAtT9gu+AJtHIdc0JtMvVvrutaVHPGqR0kcFi+4pVFWLfpPO/VhSFKR7v98VSLjXOXE
 nVJT45IEJyxB3iPXdjFztDlFqJXsUkigGd2/1HilC9CHCaaVh5XhZUE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some of the USB4 resets were not initially described.
Add indices for them to allow extending the driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-gcc.h | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
index 6907653c7992..79ab3e353423 100644
--- a/include/dt-bindings/clock/qcom,glymur-gcc.h
+++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
@@ -575,5 +575,41 @@
 #define GCC_VIDEO_AXI1_CLK_ARES					90
 #define GCC_VIDEO_BCR						91
 #define GCC_VIDEO_AXI0C_CLK_ARES				92
+#define GCC_USB4_0_MISC_USB4_SYS_BCR			93
+#define GCC_USB4_0_MISC_RX_CLK_0_BCR			94
+#define GCC_USB4_0_MISC_RX_CLK_1_BCR			95
+#define GCC_USB4_0_MISC_USB_PIPE_BCR			96
+#define GCC_USB4_0_MISC_PCIE_PIPE_BCR			97
+#define GCC_USB4_0_MISC_TMU_BCR				98
+#define GCC_USB4_0_MISC_SB_IF_BCR			99
+#define GCC_USB4_0_MISC_HIA_MSTR_BCR			100
+#define GCC_USB4_0_MISC_AHB_BCR				101
+#define GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR		102
+#define GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR		103
+#define GCC_USB4_0_MISC_HRR_BCR				104
+#define GCC_USB4_1_MISC_USB4_SYS_BCR			105
+#define GCC_USB4_1_MISC_RX_CLK_0_BCR			106
+#define GCC_USB4_1_MISC_RX_CLK_1_BCR			107
+#define GCC_USB4_1_MISC_USB_PIPE_BCR			108
+#define GCC_USB4_1_MISC_PCIE_PIPE_BCR			109
+#define GCC_USB4_1_MISC_TMU_BCR				110
+#define GCC_USB4_1_MISC_SB_IF_BCR			111
+#define GCC_USB4_1_MISC_HIA_MSTR_BCR			112
+#define GCC_USB4_1_MISC_AHB_BCR				113
+#define GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR		114
+#define GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR		115
+#define GCC_USB4_1_MISC_HRR_BCR				116
+#define GCC_USB4_2_MISC_USB4_SYS_BCR			117
+#define GCC_USB4_2_MISC_RX_CLK_0_BCR			118
+#define GCC_USB4_2_MISC_RX_CLK_1_BCR			119
+#define GCC_USB4_2_MISC_USB_PIPE_BCR			120
+#define GCC_USB4_2_MISC_PCIE_PIPE_BCR			121
+#define GCC_USB4_2_MISC_TMU_BCR				122
+#define GCC_USB4_2_MISC_SB_IF_BCR			123
+#define GCC_USB4_2_MISC_HIA_MSTR_BCR			124
+#define GCC_USB4_2_MISC_AHB_BCR				125
+#define GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR		126
+#define GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR		127
+#define GCC_USB4_2_MISC_HRR_BCR				128
 
 #endif

-- 
2.56.1

