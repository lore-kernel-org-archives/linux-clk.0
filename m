Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC544C4FF;
	Fri, 21 Aug 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306730; cv=none; b=TLdkEGYQgyflLxXXuQ1yKtfR8a8cIUD6OBnJrLGscITEdEqjqyFV6Db9fASHQbq9ywOEOQoNHmx5QBVn9D2Uod3clQ4EJ71bj8AM/q1xCF827DtFWMkqk+GmyNsxUOKqjt/b20coelPef3sGOyZ93//FCocU+wXOGJe4Sl/4i6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306730; c=relaxed/simple;
	bh=JXbRXNW+nzT+G1mWEFJpN2bsZuiPKU8aSyiCtUNt3V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZURF0UKe8SQ88aLecDpD0c8vjYwMDV/Lv7Uj4W0qjWMteCPDM1NOoAemAjLmqavzjHaviTkNLhTondi0N3BDeyM1TAc4dzoSyh0GkBxyQgJb8MZlVzrV/ySEC+h/L/hZ26vHzLX69D+xEwN3hGAhDDss2SuxCGM3aW9yMJbBARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CD61F000E9;
	Fri, 21 Aug 2026 10:05:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:05:15 +0200
Message-ID: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This patch is the MIPS subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
---
 arch/mips/alchemy/common/clock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index 62a7304ff35f6190..b5d2cbb7c69ec475 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -150,7 +150,7 @@ static const struct clk_ops alchemy_clkops_cpu = {
 static struct clk __init *alchemy_clk_setup_cpu(const char *parent_name,
 						int ctype)
 {
-	struct clk_init_data id;
+	struct clk_init_data id = {};
 	struct clk_hw *h;
 	struct clk *clk;
 
@@ -245,7 +245,7 @@ static struct clk __init *alchemy_clk_setup_aux(const char *parent_name,
 						char *name, int maxmult,
 						unsigned long reg)
 {
-	struct clk_init_data id;
+	struct clk_init_data id = {};
 	struct clk *c;
 	struct alchemy_auxpll_clk *a;
 
@@ -754,7 +754,7 @@ static const char * const alchemy_clk_fgen_names[] = {
 static int __init alchemy_clk_init_fgens(int ctype)
 {
 	struct clk *c;
-	struct clk_init_data id;
+	struct clk_init_data id = {};
 	struct alchemy_fgcs_clk *a;
 	unsigned long v;
 	int i, ret;
@@ -959,9 +959,9 @@ static int alchemy_csrc_dt2[] = { 1, 4, 3, 2 };	/* Au1300 */
 
 static int __init alchemy_clk_setup_imux(int ctype)
 {
+	struct clk_init_data id = {};
 	struct alchemy_fgcs_clk *a;
 	const char * const *names;
-	struct clk_init_data id;
 	unsigned long v;
 	int i, ret, *dt;
 	struct clk *c;
-- 
2.43.0

