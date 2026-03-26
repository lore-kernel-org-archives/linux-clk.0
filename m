Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1E3F7E8E;
	Thu, 26 Mar 2026 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534813; cv=none; b=FFKPO+UjzNyYLDRiXxuy667GM5BeA6FnJmQ36s8SNJ+naWANjyhNQClzwyjKOAIW4ih/u5wDz8wuF1bI1ztCdXMlBua45jqD5lFfvDAXNI7tuivNv+s+8oXdTBGl7sbcNoaSz6K55ovWS46a/YJgj7Wd3uEiCsuBsmKa3svbD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534813; c=relaxed/simple;
	bh=1geztx7gOOOQ3Ea+6GyMatL2oKviQ5auDdltYQVNLw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JrN4MJab/xRWeh8L6mK3/wpVsGj2pAJG6UilHpYxuold8uGEmHqkTxjS8eKZJYi3AiN4mQhDz9xRvzsCfQPvPXy0pwpXIomKlHLXA2n8xji1AwY2CVNvkEOGMsIwH3eHaWVk9qZJq+4Z0xvidPUXbr6uSoI0dwqt2Fy4hzFJiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSvFHBra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSvFHBra"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55C55C116C6;
	Thu, 26 Mar 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774534812;
	bh=1geztx7gOOOQ3Ea+6GyMatL2oKviQ5auDdltYQVNLw0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kSvFHBraFz1wHGjbdJ03QSw2gldPu8LYhgTtVpD6HCho+BtNu9q8mpTjlI2CkkaHq
	 MeNbxSXUjBGHl+sBl5yxzlcao6xwlUWoCRV5cTvCbhaS0wt05t8RzmMFrL2uyXPoGx
	 00mmbA7D1KZrPOQo8NC/7b+5gFgrb37HIGC7f4V5aLAJFcBK9YtXx2PyFDF8zzo7wT
	 rLUY59FvNTIWWSY18f4bRV+qpk3TdW3hNMLBFvvDtplJByiw8gY95kjQim4S3XKUUO
	 qGkjb2MKfGXV80GTubJ142q/6dirisVjJnBOf+RJtSN7FDam0enW5a3zmY9tLbCYrc
	 5CL2Pk7wS7PFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4624D10A62DB;
	Thu, 26 Mar 2026 14:20:12 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 26 Mar 2026 14:20:58 +0000
Subject: [PATCH] clk: clk-axi-clkgen: Add support versal timings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-clk-axi-clk-versal-support-v1-1-f21f5d385fcd@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJKRGJVzEuSv3RUQLNDBASw
 t2tuHr5Nm8jgwqMrsVGikVMxiGjPBUUX2F4guWRTd752lW+5th/OKxydIFa6NnmlEaduEFAV54
 r11wc5UFSdLIe89v9b5vbN+L0O9K+fwHT1HBJfgAAAA==
X-Change-ID: 20260326-clk-axi-clk-versal-support-8eaef1530870
To: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774534858; l=2135;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=H6vZLDBkRf0dpmeOwTvI9djAQiZUxNSKWC9aFQZVfXY=;
 b=qpUbdMOGAu6px7J7fJs8d6gX5Pv21xt8FDdHehGEb0WmNwCbsDDZarbR8zNYFEkbQW5dWx9Xl
 YMuAOr4wspUCsKC9Cmk/+gsoC2jJ8Qkeopk6QF/k5prOC2MzJ8FFoM4
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Add proper VCO and PFD limits for versal based platforms. For that we
need to add new Technology and Speed grade defines.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk-axi-clkgen.c   | 5 ++++-
 include/linux/adi-axi-common.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index fa5ccef73e60..26f76a6db820 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -521,7 +521,7 @@ static int axi_clkgen_setup_limits(struct axi_clkgen *axi_clkgen,
 		axi_clkgen->limits.fvco_max = 1200000;
 		axi_clkgen->limits.fpfd_max = 450000;
 		break;
-	case ADI_AXI_FPGA_SPEED_2 ... ADI_AXI_FPGA_SPEED_2LV:
+	case ADI_AXI_FPGA_SPEED_2 ... ADI_AXI_FPGA_SPEED_2MP:
 		axi_clkgen->limits.fvco_max = 1440000;
 		axi_clkgen->limits.fpfd_max = 500000;
 		if (family == ADI_AXI_FPGA_FAMILY_KINTEX || family == ADI_AXI_FPGA_FAMILY_ARTIX) {
@@ -546,6 +546,9 @@ static int axi_clkgen_setup_limits(struct axi_clkgen *axi_clkgen,
 	if (tech == ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS) {
 		axi_clkgen->limits.fvco_max = 1600000;
 		axi_clkgen->limits.fvco_min = 800000;
+	} else if (tech == ADI_AXI_FPGA_TECH_VERSAL) {
+		axi_clkgen->limits.fvco_max = 4320000;
+		axi_clkgen->limits.fvco_min = 2160000;
 	}
 
 	return 0;
diff --git a/include/linux/adi-axi-common.h b/include/linux/adi-axi-common.h
index 37962ba530df..e7ba393061ee 100644
--- a/include/linux/adi-axi-common.h
+++ b/include/linux/adi-axi-common.h
@@ -51,6 +51,7 @@ enum adi_axi_fpga_technology {
 	ADI_AXI_FPGA_TECH_SERIES7,
 	ADI_AXI_FPGA_TECH_ULTRASCALE,
 	ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS,
+	ADI_AXI_FPGA_TECH_VERSAL,
 };
 
 enum adi_axi_fpga_family {
@@ -71,6 +72,7 @@ enum adi_axi_fpga_speed_grade {
 	ADI_AXI_FPGA_SPEED_2    = 20,
 	ADI_AXI_FPGA_SPEED_2L   = 21,
 	ADI_AXI_FPGA_SPEED_2LV  = 22,
+	ADI_AXI_FPGA_SPEED_2MP  = 23,
 	ADI_AXI_FPGA_SPEED_3    = 30,
 };
 

---
base-commit: 18023cf0dd64f67c403b85dddaada1e9f8c00482
change-id: 20260326-clk-axi-clk-versal-support-8eaef1530870
--

Thanks!
- Nuno Sá


