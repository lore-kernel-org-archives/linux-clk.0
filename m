Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458892;
	b=HXHA4VYfnyqRk2cNt54Lh2S60v+X20+PrFVyNnM88QrA2ZuX2LYH+Ont9IrWH3mA6Boj
	 +ll9OSEQsyesGRjFnHX/PGme+qlJnJEotpai7Fr+6JoOI37xpkW+4Y7kaBRi+LCl9zMHy
	 Ks8DBSDO6e6uOlVvIxaSE0JgFxA0916C7bVyX/VzjXK4uvJWq80FZBCYSFpEZibnpRSQ8
	 3fHqKu1+S0bAN9IKlm2qi7KJf37gIpX59qkHOmBs8VFqFLFXVil9Y85o2Vn9en7CSKpJz
	 CoM3GRYImZ/3DToXnwdp43YsLW7U0S7q9ifTe8tHefRz1zC+u1N01Dik7Y7OCKh4njQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458892;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kj7Z15qESWUXHOl1Oy2gjnhqrg3YPTl8MJAln3iD65w=;
	b=BKYhGUEulgJoTvORZOC8nMOH1pXjfxRbHevxkv43Iz7lnIXXGo1EG5+719vBqYbhp0J/
	 Ftm8OQv9k6Rifqv2FSGjdsl7rOno6K0Gki3adqRxaRT8K2FaJig2eS0tHujzgvRKr9crv
	 fpRnfBJ1fpLFaHZV/AistgTkAD/yOtQWMxv7Kx+hwSyYGlHaIFS9BO1kTINgBjbxUtjjw
	 RCVk9lBZMciBWeSohVqUcNxSUjOSPi0qir7NZ1Y0zi3ov8ZEJdDlGEpXBgDwy26xX1OdY
	 YsgxiphUc+sv69GGZZ1Oj46shbkQuP6wIxha+ZeoQKxKp4XdSZLwcVR/m+9Mp2XHyXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KE0zF2Kj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61AC606A321;
	Mon, 23 Nov 2026 18:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KE0zF2Kj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90B21F000D4;
	Mon, 23 Nov 2026 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458892;
	bh=kj7Z15qESWUXHOl1Oy2gjnhqrg3YPTl8MJAln3iD65w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KE0zF2Kj0URXXFUJ7tTL00nQtapXiD8iMDN4Bt/KQTgWKj0Eak0EZ9dOIK8X0BhUN
	 1wjRWDXIsbmeiw+bcw3a1VOrJ4QJ8k7HJZl+DxhaKX+XxzzNaHv4eAqi4qPGP47d2y
	 LbHVjzftdf0ywHKHR/vMxwV5lT6clgT61dbWLB6EBnXgH9L7npTJfLalqF4kYOHomt
	 3Mf7nVWNLF1xo6uv9opBQve1jj5Wse4bkj/DA7Kqxx1KKgZfziq3OqAqG8suDOGJYg
	 feRNeZ7lLTgEgXcHHzC9UhiiNFGXLTK0Vs8KKb31e5yxhLMn5LTvBJznD2ADojPG1U
	 huIVPP1slA/Mw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 23 Nov 2026 19:34:33 +0100
Subject: [PATCH 3/4] clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC
 clocks
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
Message-Id: <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458875; l=1175;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ETKHVFqozU0LobcO197D8HLUTVtvf/E8HwrL6LGRyB8=;
 b=o4Q+KzYxhtQ4bCnrAjz06EM9ti92qgH5PvED70TLrjVBGovqVqtZtO8+YTxguSrYo9qRJwFbL
 WlgFoCMY59AAkiBs9OETcTwj8zLr5e4UUYkH9da4OmjwaxgT38Uyxt3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On Glymur and Mahua, the USB4 uC's RAM contents may not be retained
correctly by default. Set the corresponding signals to force it.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 031ed806a38e..96d1c07348bc 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8542,6 +8542,10 @@ static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_periph_on(regmap, gcc_pcie_5_pipe_clk, true);
 	qcom_branch_set_force_mem_core(regmap, gcc_pcie_6_pipe_clk, true);
 	qcom_branch_set_force_periph_on(regmap, gcc_pcie_6_pipe_clk, true);
+
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_0_sys_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_1_uc_hrr_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_2_sys_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_glymur_driver_data = {

-- 
2.56.1

