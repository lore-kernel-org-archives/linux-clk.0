Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB902F25F0;
	Sun,  1 Mar 2026 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329205; cv=none; b=aQytI9WOK/C2P3tHC4Sjj5ekECEbgE7mv2lWa96S1ZvSv5vcWgmXlD3OZ1FQsp4Qgn/GwyHACy5xZ+mNz7wB3i2zexz03oRzT8dWPl1qzl2eRSnNxIXCac/td/1oNxsZE74ipSlgZiAmVL5DJkFcTH69mPoKCF5ET2fIs4wLpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329205; c=relaxed/simple;
	bh=IVsdRCf09PIrz+NLVnJgcmyyqvZ1jGoF5WvH/1EnhiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY2lxn0pAajyVcAZofLHujYymYtHUCZ8yUbzMV+9kinQ+9LmT30ejesU8zQ1BN2zj+lIHkLHsZVlCflAUWYN+AsZ5AprvMB/ORPgpByD/RQv7K913mMC1iwYaL8OZLR1UGYAAxyUbJC2fIwk8W3u9m5SgtdTyMPWJWR1KLM6cqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkqvG2sy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkqvG2sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83016C19425;
	Sun,  1 Mar 2026 01:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329205;
	bh=IVsdRCf09PIrz+NLVnJgcmyyqvZ1jGoF5WvH/1EnhiU=;
	h=From:To:Cc:Subject:Date:From;
	b=SkqvG2sykx+7nXXIL6wfpM6bvWhmNPyZvBQLKGC87ebQNCbDzuEkYGjh97rYbK27u
	 mnjJMnL8qN3BHMnFgDKjSFE24pOT4Ap/jNDN2OWr2sXR00ocDdVozEeZ/sKntsm39J
	 0sdkK3GxaspqcfZ5m1XsBQXOklNyKT2oETz1NE6+6DVoyUoOGlV+59+AMEPBUehLEF
	 fGqHi+RCeYZDVcSBqxypWrM6PZpd5emVtWNAlB3qCocvo6o5Sh8ZX7H52HMeds/5oF
	 ks3NBJOuh1wYafVxUzuvuj1zTuCD+81TV9ait8pv16GbFFjpb9otauQ56AF4DdT+a+
	 gFkMjnlS6p7FQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chris.brandt@renesas.com
Cc: stable@kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: renesas: rzg2l: Select correct div round macro" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:40:03 -0500
Message-ID: <20260301014003.1701211-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




