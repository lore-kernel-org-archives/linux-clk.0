Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A37319D
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196903; cv=none; b=H2+DkCJCQ8T8Px7iulNraRGryMN69CTJMQDCcwOkmzyiESLOfaccUDqoMpM/mzq9ngSEJoSQI7nWg+fVvlcD6PR1valyh9UBaGYGpahoUi9ZzJIvwbhXHHX2hvQ3ODzj+7hQuuqzJIriZCDp+j+vUhHUEbFNPIXt3DOvXnYYYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196903; c=relaxed/simple;
	bh=93GkKmd4fyfQi5SOpTnAYdsS7YxqGZvt4lLw8GcEVM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIsRj+ZeXZ/rv63JJUVQEL4Ji+V3bCrGEVCqcGd+ckIP58VboEgOoifF+c++BiPtloDHuOU6p9xKbwRjGTwO4u6UoAXimCKFVZuQwrNQUfnqKOCbQ1ntotpz711PAWcBbmCPiNBGUwfSJe+BwV/t71BYtgnGEofLksNQF+Q4s/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by xavier.telenet-ops.be with bizsmtp
	id f3am2B00858agq2013amcN; Thu, 25 Jan 2024 16:34:58 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1jo-00GUvt-3q;
	Thu, 25 Jan 2024 16:34:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1kc-00Fs2l-3A;
	Thu, 25 Jan 2024 16:34:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 07/15] clk: renesas: rcar-gen4: Add support for FRQCRC1
Date: Thu, 25 Jan 2024 16:34:35 +0100
Message-Id: <f64d5573a92a18505619ff0ff808d50cfc2bde55.1706194617.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
References: <cover.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

R-Car V4H and V4M have a second Frequency Control Register C.
Add support for this by treating bit field offsets beyond 31 as
referring to the second register.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Tested by enabling CLOCK_ALLOW_WRITE_DEBUGFS and checking the impact of
CPU core clk rate on CPU core speed on R-Car V4M.

v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 8f771fe59bfdc756..8e4559fbb0bc3352 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -220,7 +220,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
  */
 #define CPG_FRQCRB			0x00000804
 #define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_FRQCRC			0x00000808
+#define CPG_FRQCRC0			0x00000808
+#define CPG_FRQCRC1			0x000008e0
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -345,7 +346,12 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	zclk->reg = reg + CPG_FRQCRC;
+	if (offset < 32) {
+		zclk->reg = reg + CPG_FRQCRC0;
+	} else {
+		zclk->reg = reg + CPG_FRQCRC1;
+		offset -= 32;
+	}
 	zclk->kick_reg = reg + CPG_FRQCRB;
 	zclk->hw.init = &init;
 	zclk->mask = GENMASK(offset + 4, offset);
-- 
2.34.1

