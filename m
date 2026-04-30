Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9467285CB3;
	Thu, 30 Apr 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562424; cv=none; b=Ae+jG/7lMoLiihatAYkmnLdvsf+tJlPlTUqJH672qPHT+dJClk9WGfBS01FNOwxeVbaQDb8svGr1c+LaVcCtqkTam1L+EiGZbBEqLAdugUfcY0hwZqWQomAjFOcOgArscodIXDLRIEqP8uSmlNsU+4F16ggivRmTpqCN0U06mmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562424; c=relaxed/simple;
	bh=0bnEyU2FWlgdiiR1dQ0LBHS/zmPt6+ink62G4gTZTnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJjNb/QAwg+6kTNYXzdSuNRtYqt6986trCdPUpj2orM4SpdHjkSLW03q/DdYtT1O+zJAaeNugqpYGOTL8SOfjNKJtR/Jv0SDqWsk0ynLznqKGW7QqxfblnmSt4H9hORXV5XDm2TMgu5dbiLsrHyZ7s7g2WJxv7vXdkJw1NcvEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC049C2BCB9;
	Thu, 30 Apr 2026 15:20:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] clk: renesas: cpg-mssr: Add number of clock cells check
Date: Thu, 30 Apr 2026 17:20:16 +0200
Message-ID: <46e010659ffdffd5e3541369f3b65d43ebe236ec.1777562043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562043.git.geert+renesas@glider.be>
References: <cover.1777562043.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of clock cells is not validated in the clock provider's
clk_src_get() callback.  Add the missing check.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 26ea85cfaa02714f..5b84cbee030b8a1e 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -370,6 +370,9 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
 	struct clk *clk;
 	int range_check;
 
+	if (clkspec->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
 	switch (clkspec->args[0]) {
 	case CPG_CORE:
 		type = "core";
-- 
2.43.0

