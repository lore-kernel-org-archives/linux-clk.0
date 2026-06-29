Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6537BE98;
	Mon, 29 Jun 2026 16:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750094; cv=none; b=kl4jYLvEhbviTIlXz9Y85d2GQByNF65XduaYoRbTSiwFukDSiTNLb6CA+g28ns+LNbLsCK7GrTR8UqX/IMD6oUvxymXp8qwHmGI7hxmj71bcmZ0qxTkUMnXnf/2WHyjftfY7ofV+yAOFY5OeXFirpXdDmvOfvnxnK1aOVXyebiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750094; c=relaxed/simple;
	bh=YGTtvuE3fRTdn1qglNY9re/NmMXGJSzNpdQ8eFKnym4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMcZMStJslM9gAp98XbrC3/rNsKAvtV1S6RMtv5deP5d++od/MrKVmW930h7WBgfrut5u7SyN6K0FVURhLUpWyHgXCuMVHbnLDY2flmPaq8+JRvdsetvBASDuge3mF0xZUnnG1ikUJ/f/ZinHtM3/2Vcs+5udVqE0Viy86X2YiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdApimA5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdApimA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3778A1F000E9;
	Mon, 29 Jun 2026 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782750092;
	bh=G6jjgqpqxT1AuZuu6dJfJFBbcVqmRjD4QvBxyDXlB9E=;
	h=From:To:Cc:Subject:Date;
	b=FdApimA5JP2jjLL6PnepG/tfxb8aeIvGWVg8nx6EMCZ0MIxXIwCwNG5h681XFY0LJ
	 8lCsvoKVVClrdfUTsSTK/cyiNqjpkcKrh82lM3qAq4AnjkFYPMAsn0yXm7LaVk28qD
	 gAcPxLMV4PcYl1XJbpOPP13OsbXjs5PoPE8/WAkPb6U9745ozHjHzTay3cxik7Y8Yg
	 FQxdJWwWq6Ol7oVsphSgebgf2awTOPh5e0cnqMInzctQpH92CgWl48CTj1Uqhk1UIh
	 UjIPWBO7GREi4MKqw4jfiroHQye+ogRwsEPaGD1zJB6ojHSkulkPsnEpx/IIll0aww
	 MRBTpl6O6ZVlg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic allocation failure
Date: Mon, 29 Jun 2026 19:21:27 +0300
Message-ID: <20260629162127.3910603-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a dynamic memory allocation fails, the returned error code in clock
controller driver probe functions on a few legacy platforms should be
set to -ENOMEM instead of -EINVAL.

Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/clk/qcom/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..0e8f380873af 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -169,7 +169,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 	if (!node) {
 		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
 		if (!fixed)
-			return -EINVAL;
+			return -ENOMEM;
 
 		fixed->fixed_rate = rate;
 		fixed->hw.init = &init_data;
@@ -186,7 +186,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 	if (add_factor) {
 		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
 		if (!factor)
-			return -EINVAL;
+			return -ENOMEM;
 
 		factor->mult = factor->div = 1;
 		factor->hw.init = &init_data;
-- 
2.51.0

