Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606A4CA788;
	Tue, 15 Sep 2026 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499908; cv=none; b=Nl6VY2de6pULfClSN0ga2hgVv/vze03CSWE0cPpiDToCs+lDWQwYW/Ie+rYRd6V+jb1YcMoWBzclNZivHpnJ97stVA7DnUht3tIkaNDfoppbdSdxlZx5M6WUxQ/p59IqK1liSFEtBIW7Fm2k0bLcoFizPueyX0IBAA0kU1DM7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499908; c=relaxed/simple;
	bh=JK5m4pW1+sCkVojoSyipDZmxgRKUWFfRntqP+7tb0ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c9XQVtHAzbEu/OrRGlxwGIdhaeAtKPJACTSZxm/ibRLw0D5RA7+YRBY/BbW4Ll+AESWZpDuap5UWMTGu3qBUziLzQTBvwRfo0hSskK3z1ryWWKu30o3dmFjfaULnHU0G1OoUForwKWICI28UbZ2iJEwjsZJs8uBx115VVRokiYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFS7JXx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFS7JXx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9DC1F000FF;
	Tue, 15 Sep 2026 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499905;
	bh=Ao2vSGs+6z4QvssrDILixS6sn9B+O5yo1BCALyXlfZU=;
	h=From:Date:Subject:To:Cc;
	b=YFS7JXx632QpafyM8MDD9SJXOPU8+TmXyusCdD3V05RoV7Xgp0du4xjFmxv/OzVVj
	 pZOSy078t4DoeRXzJQ15DfKFSEazqt2NxjVq0z0kZUGqFRnijM6iXQd0NG6nIhPQfH
	 GjtnW9JI2q9c0UKPevtCLH0ZjfKqo3op1n8XCNRq6RQ1DW3YjibVsXBmW5RNRkxEoe
	 3+gVoF7k5AEahR9zoYjw7azSLtWgTiAJePOiA79L2VF0Ce/bzlA/8Hxkz4T2hgJW2Y
	 ah0aLse/x8BE8JSGiGFzwkcecbQiDMo/BwZ96HVq91UA1JhT582xVo7SC5jbpCbgxc
	 fMuQ4tkqguJVQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 15 Sep 2026 21:18:15 +0200
Subject: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of
 GCC_USB4_n_SYS_CLK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrBuIP1H0KkUkjtM6thrJqAji3
 Y3t8lu8d4CQZxKoogM8bSzspoD4EQH2dnqT4i4YEp3kuoyNWtzMqHo7Otvg99Os0mbKmCLtdF7
 YDFMI6ezpxftv+6z/lrUdCJf7Bed5ATW1+XZ4AAAA
X-Change-ID: 20260915-topic-hamoa_clk_usb4-5573d067a4c3
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789499901; l=1610;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JhXb0ez3pDMQN+L2xh5tLhCLzoc2s7h0BUgH1Jn330Y=;
 b=vyP9KBWSjxBplNYru53VQyBV7Dn7L9w9Jtpir2ztvBRomBl1tN6jXsqvYAmPMVP1fumWcZW5R
 92HeDUgBJNOBXLJQ8liMgYB0X+6EYWDTaTkoEPntGLBaPCYdK85T1D9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

These clocks are PHY-sourced and their halt bits seem not to update
reliably. Ignore it to prevent spurious warnings.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..754d1e03c2fa 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6049,7 +6049,7 @@ static struct clk_branch gcc_usb4_0_sb_if_clk = {
 
 static struct clk_branch gcc_usb4_0_sys_clk = {
 	.halt_reg = 0x9f054,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f054,
 		.enable_mask = BIT(0),
@@ -6266,7 +6266,7 @@ static struct clk_branch gcc_usb4_1_sb_if_clk = {
 
 static struct clk_branch gcc_usb4_1_sys_clk = {
 	.halt_reg = 0x2b054,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b054,
 		.enable_mask = BIT(0),
@@ -6483,7 +6483,7 @@ static struct clk_branch gcc_usb4_2_sb_if_clk = {
 
 static struct clk_branch gcc_usb4_2_sys_clk = {
 	.halt_reg = 0x11054,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x11054,
 		.enable_mask = BIT(0),

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-topic-hamoa_clk_usb4-5573d067a4c3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

