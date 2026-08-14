Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F53DB636
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718617; cv=none; b=tEn6omo1+2OMmbT4ymgEQJUbyBj+WS+Xrmpdxy+xjd8tqhYZtLP+72bqbzF7rG+M/1C7Fi3ImB997TWXv26c+MyCFrhJlpQhJscbHjajW8BHtgbjmXJsDnioAvkhMXNpRO7yEpmldo1MqnI8sBFvo4W1ujz1nA5qLmO9jz9zlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718617; c=relaxed/simple;
	bh=IC67PEE9+fPtFmz1XJWBv81ADuES9hOjTMKaTfMtBEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQB8Y7brbVbpPw+1jHJnzeuWI9FP5VCbluWnonsDKNlUKH7S57+aVGm3C+V4ClS+WVmbtqL7pOijRKeSgD3hCBw/Mg0sJZacboX2pm7TmHA6+uV1dQvzxwyGTmmOPkfOOSDxhy9tojUNGZp6mMz0gNGXqkh09Ht9tBIqSCVH398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EA61F000E9;
	Fri, 14 Aug 2026 14:43:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops
Date: Fri, 14 Aug 2026 16:43:30 +0200
Message-ID: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is already provided by <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested.
---
 drivers/clk/actions/owl-composite.h    | 1 -
 drivers/clk/actions/owl-fixed-factor.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-composite.h
index 6d7c6f0c47c8b701..ca055599b2fceb8b 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -119,6 +119,5 @@ extern const struct clk_ops owl_comp_div_ops;
 extern const struct clk_ops owl_comp_fact_ops;
 extern const struct clk_ops owl_comp_fix_fact_ops;
 extern const struct clk_ops owl_comp_pass_ops;
-extern const struct clk_ops clk_fixed_factor_ops;
 
 #endif /* _OWL_COMPOSITE_H_ */
diff --git a/drivers/clk/actions/owl-fixed-factor.h b/drivers/clk/actions/owl-fixed-factor.h
index 3dfd7fd7d292a456..bbac5afadd670da4 100644
--- a/drivers/clk/actions/owl-fixed-factor.h
+++ b/drivers/clk/actions/owl-fixed-factor.h
@@ -23,6 +23,4 @@
 					      _flags),			\
 	}
 
-extern const struct clk_ops clk_fixed_factor_ops;
-
 #endif /* _OWL_FIXED_FACTOR_H_ */
-- 
2.43.0

