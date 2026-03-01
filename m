Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574424677F;
	Sun,  1 Mar 2026 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327876; cv=none; b=sGayhK3DrOA+70RiVyEeG2A4n1DWqOrcVobJNFzgxRV7+QxD+P1Je4IBsepUcj7bU2EopUNWvYyVU9O9HNms5BHA7dFrnP2fX6yA7IHrsKyrp220/X/84oehnL4FDnlGzB+uEi1HDStHOZqId9tlG+hqZLLM2isk8jNmx39SoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327876; c=relaxed/simple;
	bh=wTygH+xhz+i31doTptf0UOJ9r+rsY43zNFTAhuR5u4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8IWuM5k5Vban49A0cjhTTtY6SdtQ364P2yWmJ24GOlmfGI8QV13s29M5l/1/vZV/tthb3piG64js1/IG97hCalZrzm/c505nJhFPpX+dA9ki1O/JLFheFnCxIM/cbYOgTppLZKYPorNvN1730NNPw8rTubB7gOLDoSvoTlW2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJf9mkAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJf9mkAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25956C19421;
	Sun,  1 Mar 2026 01:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327875;
	bh=wTygH+xhz+i31doTptf0UOJ9r+rsY43zNFTAhuR5u4g=;
	h=From:To:Cc:Subject:Date:From;
	b=lJf9mkAM08VQaE7hM94/IO770+xyglPY4Wh/YZV86sEj7w92lS+hB6pyLtpQUextG
	 g/w1//gW2AhHHiV8jTUa7wZHust/ZUiaAInBIC34Dptb4WtH8syRrmePjNR9FBjhtj
	 d780XcZC+S7gvT10w9VBr+gDFZJurOCHQDS/NNTQ4rL8ePSgAZmp31DB6XOFZXWc+b
	 SltVjYwpN3nbhi83I5Jgj/yjucwbP2K5+2CsQfc511MlwM8RuYW+4jZjC972Ni10rA
	 3QjD8MPOfS5r29koNb8c6KwHwOomZijgI0RKtPdU/smXvDXlfcgEOma+nx95H+hQpg
	 jQw5MywVQAaqQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chris.brandt@renesas.com
Cc: stable@kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: renesas: rzg2l: Select correct div round macro" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:17:53 -0500
Message-ID: <20260301011754.1671964-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f9451374dcfdfe669ee55b58ee6c11e8638980e4 Mon Sep 17 00:00:00 2001
From: Chris Brandt <chris.brandt@renesas.com>
Date: Fri, 14 Nov 2025 14:45:29 -0500
Subject: [PATCH] clk: renesas: rzg2l: Select correct div round macro

Variable foutvco_rate is an unsigned long, not an unsigned long long.

Cc: stable@kernel.org
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com
Fixes: dabf72b85f29 ("clk: renesas: rzg2l: Fix FOUTPOSTDIV clk")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20251114194529.3304361-1-chris.brandt@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rzg2l-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index dfe0f5e87d8cf..0bcf64b152e07 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -572,8 +572,8 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
 	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
 					   (params->pl5_intin << 24) + params->pl5_fracin),
 			       params->pl5_refdiv) >> 24;
-	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
-						 params->pl5_postdiv1 * params->pl5_postdiv2);
+	foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
+					     params->pl5_postdiv1 * params->pl5_postdiv2);
 
 	return foutpostdiv_rate;
 }
-- 
2.51.0




