Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74002FDC28;
	Thu, 10 Sep 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034415; cv=none; b=IZIMBKpa52RygWlyyS338cc0pvdy4JQBPN9KJxCd+uHZQpmtpIRIj3J1sREEULz5E79NkdTwgN7IFRzs4O0Mnvpd9S2gQF0RKxWms3749Uwa21LnZJTfqnjR4dUpUQrwGDd5ycruJ3BdUWV/r+niHPWF4s0Vf2DEIl2AMYPhWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034415; c=relaxed/simple;
	bh=oyDvJsRsZUT5zQUvQL7230aHOCA0gis5Saf2Kq/K7e4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qSnwLaamMmJRGDLACsek9oQo+aZWcfLCatr+Jr2x1N+roCLVcIQVVAiLsQbfxryzho8TUj+GvK+d/uwCEjrWCCpjjdCl1UzsBvUJpJyqce8nKjmiV6m3KaSXPhKU8EPEm3g9V1UzmXtLAJioTmwRtj5ohS6UyKceUwZgcdWCTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d45e99d9;
	Thu, 10 Sep 2026 18:00:03 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for usb master clocks
Date: Thu, 10 Sep 2026 18:00:00 +0800
Message-Id: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08ac2971403a2kunmd372c5e61a4e91
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkMZVktCHxhLGk9PH0kdQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktJT0
	9PS1VKS0tVS1kG

Currently, on some boards with older versions of U-Boot, attempting
to disable usb master clocks results in a "stuck at on" warning:

[    3.005088] gcc_usb1_master_clk status stuck at 'on'
[    3.187119] gcc_usb0_master_clk status stuck at 'on'

The USB master clocks of IPQ5332 and IPQ5424 have the BRANCH_HALT_VOTED
flag set, so let's do the same to fix the issue.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
These boards run a vendor-specific version of U-Boot, and upgrading to
a newer version could brick the device. Therefore, I think this should
be fixed within the Linux kernel.
---
 drivers/clk/qcom/gcc-ipq8074.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d703..10bd2f80010c 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -2612,6 +2612,7 @@ static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
 
 static struct clk_branch gcc_usb0_master_clk = {
 	.halt_reg = 0x3e000,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x3e000,
 		.enable_mask = BIT(0),
@@ -2725,6 +2726,7 @@ static struct clk_branch gcc_sys_noc_usb1_axi_clk = {
 
 static struct clk_branch gcc_usb1_master_clk = {
 	.halt_reg = 0x3f000,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x3f000,
 		.enable_mask = BIT(0),
-- 
2.34.1

