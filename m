Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458888;
	b=Vlq2DOC5ogpBl7OQnfdkvYdkdQTmN2Ijr1R+MMkwth9uL4rTROBb8a+0TxMwDIDRMRoY
	 OC+G5b+HalFOwGgngBYyUmGJxZYZY1oaIPj+bo7CiWpFQp7IKqnZ0OExJU4bOYR5YbyzQ
	 nQil4Y1R4JgvrYgsBo3aoljwK5mZqcYaYsm41iW3uFL+KOqzoBvZ1TR5yjk7fNcEBZCcR
	 Bnb0ju5oz//oDixU5gJ4GMww5QYb0MlQyisatGgI0y+W5CbgK3cZxsi9lZEFDHVNrXYgb
	 UqXl0hz1GrdwKhfD773Y2KOH/PKy1GkALRx6SMK0TueqGfeEgucZH/ooJgiy51WB37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458888;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gPvR/SydOXELSen+DZKOokMch7WuhXuCoz6EDtyY2P4=;
	b=Ux7mQaRvK/zdCyf39/agRbBejjwC0QPngR4yu5vJOX47vbMvW9UqiHl8kDC1Q9IJpjcO
	 5ovvAyN9yzDCWCLLU9UkC3Is1q+L8yu0uTmvsVjtG73d/HgAfwyHlJiOiRZZMEypfZxtU
	 n2tk4HTT8oM6Se7D8ku47dtkRsD+TW3pxlNLex9W6bN9KZpt1HJNYGxue/i/I9nxAlrfW
	 +ymV7wuAQw72ehFwuWE3ZSU7OzOcE1KAEkMVk6ETO1Oaljv88o6J5XVuWF+PIFeDpR/qJ
	 w/rMeW4RRzSDg5c7IJeqp47z9ywXQwcbNP0eb4feaQj2mOWBt57rxpNWFh/BuUsKAfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8j1Jgrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE7606A31A;
	Mon, 23 Nov 2026 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8j1Jgrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B832B1F000D2;
	Mon, 23 Nov 2026 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458888;
	bh=gPvR/SydOXELSen+DZKOokMch7WuhXuCoz6EDtyY2P4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M8j1JgrhTV6qwYI4rX5M25Mj3Gf/37Qi1vZILEiB3ebPU+L8DHnfTsjiA6SukGvjJ
	 6WryZRD+nytjQV/4yz0OyMf6Z9hrY1yDzcL1Ue6Wn7+ilT++5Xm0B7dMxAN6zDIhbV
	 5NU3ZB6mqJbVpdmqJGmktIV+XAxuUxYQJc8ahKt6ONXT1TCLh33iYtVtKvEoCDHis6
	 mvXXf9NzJgX6bzs6cVBdI6rJvTfKB1Z82K92hkfP62LGo1FVOWTe/6Zq0c/VnHp+Rc
	 svmme6F7e+NYjV105vhvIsNPHBrv4Wh9RWvMPMhceknsrIOaINrF/YC9rvIQ7los2E
	 JoL15ec2wd0Mw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 23 Nov 2026 19:34:32 +0100
Subject: [PATCH 2/4] clk: qcom: gcc-glymur: Add missing USB4 resets
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
Message-Id: <20261123-topic-usb4_clks-v1-2-531ab5635c03@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458875; l=3214;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=SVDinAvXHfIJXUvc/22sXe3+0oOFryRS8/eUHWTnFUg=;
 b=1g5Hq3jcPKh+eidbB3djS8x6pkDIz6+Mh0NBaj+F4FGOYwe3DgvqctuJpdivJQ5VvvNBK50nF
 VsZo3iqpwuWBDbpxpdlZxifyjqylrrjjD4TvmP2G+LXIYiRzYSAdYQW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

A number of the USB4-related resets were left undescribed. Plumb them
in.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index d8d33eff419e..031ed806a38e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8432,6 +8432,42 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
 	[GCC_USB4_0_DP0_PHY_PRIM_BCR] = { 0xdb010 },
 	[GCC_USB4_1_BCR] = { 0x2d004 },
 	[GCC_USB4_2_BCR] = { 0xe0004 },
+	[GCC_USB4_0_MISC_USB4_SYS_BCR] = { .reg = 0x600c0, .bit = 0 },
+	[GCC_USB4_0_MISC_RX_CLK_0_BCR] = { .reg = 0x600c0, .bit = 1 },
+	[GCC_USB4_0_MISC_RX_CLK_1_BCR] = { .reg = 0x600c0, .bit = 2 },
+	[GCC_USB4_0_MISC_USB_PIPE_BCR] = { .reg = 0x600c0, .bit = 3 },
+	[GCC_USB4_0_MISC_PCIE_PIPE_BCR] = { .reg = 0x600c0, .bit = 4 },
+	[GCC_USB4_0_MISC_TMU_BCR] = { .reg = 0x600c0, .bit = 5 },
+	[GCC_USB4_0_MISC_SB_IF_BCR] = { .reg = 0x600c0, .bit = 6 },
+	[GCC_USB4_0_MISC_HIA_MSTR_BCR] = { .reg = 0x600c0, .bit = 7 },
+	[GCC_USB4_0_MISC_AHB_BCR] = { .reg = 0x600c0, .bit = 8 },
+	[GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0x600c0, .bit = 9 },
+	[GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0x600c0, .bit = 10 },
+	[GCC_USB4_0_MISC_HRR_BCR] = { .reg = 0x600c0, .bit = 11 },
+	[GCC_USB4_1_MISC_USB4_SYS_BCR] = { .reg = 0x600ac, .bit = 0 },
+	[GCC_USB4_1_MISC_RX_CLK_0_BCR] = { .reg = 0x600ac, .bit = 1 },
+	[GCC_USB4_1_MISC_RX_CLK_1_BCR] = { .reg = 0x600ac, .bit = 2 },
+	[GCC_USB4_1_MISC_USB_PIPE_BCR] = { .reg = 0x600ac, .bit = 3 },
+	[GCC_USB4_1_MISC_PCIE_PIPE_BCR] = { .reg = 0x600ac, .bit = 4 },
+	[GCC_USB4_1_MISC_TMU_BCR] = { .reg = 0x600ac, .bit = 5 },
+	[GCC_USB4_1_MISC_SB_IF_BCR] = { .reg = 0x600ac, .bit = 6 },
+	[GCC_USB4_1_MISC_HIA_MSTR_BCR] = { .reg = 0x600ac, .bit = 7 },
+	[GCC_USB4_1_MISC_AHB_BCR] = { .reg = 0x600ac, .bit = 8 },
+	[GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0x600ac, .bit = 9 },
+	[GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0x600ac, .bit = 10 },
+	[GCC_USB4_1_MISC_HRR_BCR] = { .reg = 0x600ac, .bit = 11 },
+	[GCC_USB4_2_MISC_USB4_SYS_BCR] = { .reg = 0x600c4, .bit = 0 },
+	[GCC_USB4_2_MISC_RX_CLK_0_BCR] = { .reg = 0x600c4, .bit = 1 },
+	[GCC_USB4_2_MISC_RX_CLK_1_BCR] = { .reg = 0x600c4, .bit = 2 },
+	[GCC_USB4_2_MISC_USB_PIPE_BCR] = { .reg = 0x600c4, .bit = 3 },
+	[GCC_USB4_2_MISC_PCIE_PIPE_BCR] = { .reg = 0x600c4, .bit = 4 },
+	[GCC_USB4_2_MISC_TMU_BCR] = { .reg = 0x600c4, .bit = 5 },
+	[GCC_USB4_2_MISC_SB_IF_BCR] = { .reg = 0x600c4, .bit = 6 },
+	[GCC_USB4_2_MISC_HIA_MSTR_BCR] = { .reg = 0x600c4, .bit = 7 },
+	[GCC_USB4_2_MISC_AHB_BCR] = { .reg = 0x600c4, .bit = 8 },
+	[GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0x600c4, .bit = 9 },
+	[GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0x600c4, .bit = 10 },
+	[GCC_USB4_2_MISC_HRR_BCR] = { .reg = 0x600c4, .bit = 11 },
 	[GCC_USB_0_PHY_BCR] = { 0xdb020 },
 	[GCC_USB_1_PHY_BCR] = { 0x2c020 },
 	[GCC_USB_2_PHY_BCR] = { 0xbe020 },

-- 
2.56.1

