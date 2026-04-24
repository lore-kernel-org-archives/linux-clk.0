Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E33CF671;
	Fri, 24 Apr 2026 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051707; cv=none; b=j4vQl/+ZToICagBMIcFO++s9Kxw/SmzEr2MMdlpp+jul07ANPIF94oDUZsZpxw2LQA8OX5gotCwkDhCHXawgUoX4i52sheRt09vC6qQAzIzsYJMRoYqP6TbkARjZ4TX3NyyRJ3IpapHt70XlotRcVVrk/nMCz5MQsy3wWGbyhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051707; c=relaxed/simple;
	bh=zjLq2MJ14g+pDsxbRVldWQUsQ15WaWOISs+plCyr/bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ookJT/+9l3MC+buHTN3svaaNjwNRchmaUgtx7wq28hAXZ8IXDf+aRib/Sfc/saiiYoATNzHMTZpUMELcQxZV6INngVvPnOd8lPEUeowz9fmsmfeZSZ/E7o4OjmkX5CnyGsJ8pXzPC0W4CPuIqa7ftDiXlKOnOanog+FcOgfGrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLXlOOSG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLXlOOSG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F0EEC19425;
	Fri, 24 Apr 2026 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777051706;
	bh=zjLq2MJ14g+pDsxbRVldWQUsQ15WaWOISs+plCyr/bY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cLXlOOSGMrvUzQo314UoH4WaoL1JYDmxhgPtcH5YcB9tuN2eAj22FzbO1f8zD5zeX
	 zaWDw18ktawMvGe9Yvs+wgRvSQld6nfRxJALR2q0r5loV2s1XYnF1Jp9QwvRdMHnX7
	 u98+iyAQ79x87ueqX7nIkFd1m2kYwXKTMsa5Bbau573FaPUrfmH+vIiAW3rLGSj3Jp
	 3VaGFNWpmOrbUoxyijFiREObY4+Pz9bP+rI+R0KS5sFSHQDnt2XGme2B0Za6ffyzVe
	 +4UIZpn5T8NY9eBbPju9NCNMqRmdX83iwhigC9xv3PAQRai6ZRjXA6qNSz9nm80fYq
	 XXkAkQX+QOJaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65447FED3E6;
	Fri, 24 Apr 2026 17:28:26 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 24 Apr 2026 18:29:04 +0100
Subject: [PATCH RESEND] clk: clk-axi-clkgen: Add support versal timings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-clk-axi-clk-versal-support-v1-1-ea070f83db7e@analog.com>
To: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777051758; l=2171;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ZJ7v3IULEwypmWeLvk+oGggx/BI4TrC+oz+ZpJ6hz4g=;
 b=IgD3WmaOreQD7oiTcwpPbMcPlx3y0X2j0mblumLdpeNQOe5T+ZmEzCJUetlnQmbJze74wys4n
 eB0ydWoD9W2CzN4AWuMJKmGSXtH/ZOpEqZu7yLrBPYr1CEaeQA/STYh
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
-- 
Nuno Sá <nuno.sa@analog.com>


