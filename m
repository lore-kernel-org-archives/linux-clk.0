Received: from out-93wp-a46.jellyfish.systems (out-93wp-a46.jellyfish.systems [104.207.68.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE62F1FDE
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785824484; cv=none; b=DCyKhrqKCb6UScTJTjYtxPLFLhgMhfbxzuBp6yWV4m5vOdKywGjurk2l61YswIc0MNi+s/nfmiKEmybXvWLyKnkVl7X+svw7H4pIqhJXIGH2BFx6JF0l0NaQ/jnyFJVAk+M8ascifGtcusK7PAKcSgaI9RrKYOB5SBdU31KrBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785824484; c=relaxed/simple;
	bh=AqBqIRSpS2p23Z2bVD/be1kPPk32YffhX38rUPfDoMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RwsQ/IX6abWfxgHFihlblFNwIq/87aKf8LsxYXTpHBnpXfM3j+0YBiEFpvA3zlFE5U/ERe9/UuYm+HWSlma+g94AKos7EE9xsLw5N14XGMy9Va1Nvg7SsNJrJtJ+Qug8y7wWaWnCjfsVi1IRVz54acegLJ4jMqqGHCLgRpHwbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=M2p+rWHX; arc=none smtp.client-ip=104.207.68.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="M2p+rWHX"
Received: from [192.168.1.103] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hDk2H0D4bz8sWP;
	Tue, 04 Aug 2026 06:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1785824471;
	bh=0j2IjYYe0DeBZ3SrdQKMWnu0OIVYJsc/SeuNE53vh24=;
	h=From:Date:Subject:To:Cc:From;
	b=M2p+rWHXiDhxov5TD4XKbq1mpxjJ+K3P4EDaYVU9OHHxK/j5YEUsT95ckCXynufAA
	 Y9tSjjTA7O5Kp3Tv5J5XhEkLU7vL1052VN0iDAj6J3BweRnMk+l1mk04yUrDttp3tJ
	 0gulvR7ntH2F5uJj9bE2FHtI6i8NkPeTmaqR9pj0Dr1KvjFT7WY9nGHWcEkm2GDa1Q
	 8v0Oy3OnX98tO84XDp+g2GtBdsscgdbuRNX4F19WcHPpgTobHgE+n2XOhdSmp5sxzG
	 kqbaJZgX2X04y3dry/x8R9sGsI2MavCLnugYijaf0jVn09/PBSefRvUYVc7dU3BrOf
	 5GnN4Z2DkOdJw==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Mon, 03 Aug 2026 23:20:57 -0700
Subject: [PATCH v2] coccinelle: Detect clk_register() anti-pattern
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RjaAAFX3sOwKNMpVA2YKTQaw
 t0tuHf5kv/+WyGweA5wyVYQjj74aUygTxnQYMae0dvEoHNd5XWukSYij/R8oHDvw8yCTalsU+h
 SGVdAEl/Czr+P01v747B0d6Z5f9oXQxIn+RzVqPbd30BUqNC6qjaOOsXsrv0iizXhbDlCu23bF
 z8N8OvIAAAA
X-Change-ID: 20260802-cocci-clk-register-951d94251af4
To: Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, cocci@inria.fr, 
 Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
log their own error on failure, so driver-side error prints after these
calls are redundant.

Two independent match families, one per return-value convention:
pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
and int return checked via a nonzero value (clk_hw_register()/
devm_clk_hw_register()/of_clk_hw_register()).

In "patch" mode, removing the redundant message also collapses the
enclosing braces when only one statement remains, and deletes the whole
"if" when the message was already the only (braceless) statement.

Assisted-by: Claude:claude-sonnet-5 coccinelle
Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Add a Coccinelle semantic patch enforcing commit 12a0fd23e870 ("clk:
Print an error when clk registration fails"): flags, and in "patch"
mode removes, driver-side error prints that are now redundant after
clk_register()/clk_hw_register() and their devm_/of_ variants.

Two independent match families, one per return-value convention.

Pointer return, IS_ERR()-checked (clk_register()/devm_clk_register()),
e.g. drivers/clk/clk-xgene.c:152-157:

    clk = clk_register(dev, &apmclk->hw);
    if (IS_ERR(clk)) {
-       pr_err("%s: could not register clk %s\n", __func__, name);
        kfree(apmclk);
        return NULL;
    }

Int return, nonzero-checked (clk_hw_register()/devm_clk_hw_register()/
of_clk_hw_register()), e.g. drivers/clk/meson/meson-clkc-utils.c:49-54:

    ret = devm_clk_hw_register(dev, hw);
-   if (ret) {
-           dev_err(dev, "registering %s clock failed\n",
-                   hw->init->name);
+   if (ret)
        return ret;
-   }

Already-braceless single-statement case: the whole "if" is deleted
instead of just the message, e.g. drivers/clk/ux500/clk-sysctrl.c:171-175:

    clk_reg = devm_clk_register(clk->dev, &clk->hw);
-   if (IS_ERR(clk_reg))
-           dev_err(dev, "clk_sysctrl: clk_register failed\n");

    return clk_reg;

Testing:
- Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
- "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
  hits and verified to have zero false positives.
- "MODE=patch" verified separately on scratch copies of affected files
  to confirm minimal, correct diffs.

checkpatch flagged that this new file needs a MAINTAINERS entry, and I'd
like to maintain it, so this adds a standalone entry rather than leaving
the file uncovered. There's no direct precedent for an individual .cocci
file getting its own entry - the only other named .cocci file in
MAINTAINERS, scripts/coccinelle/api/string_choices.cocci, was added to
the existing GENERIC STRING LIBRARY entry by that subsystem's
maintainer, not as a new one. Happy to fold this into COMMON CLK
FRAMEWORK or drop it entirely depending on what the maintainers prefer.
---
Changes in v2 (Julia):
- Use a literal function-name disjunction instead of a regex identifier,
  enabling spatch's file pre-filter optimization.
- In "patch" mode, drop braces when only one statement remains, and
  delete the whole "if" when the message was the only (braceless)
  statement.
- Drop two never-observed condition variants (IS_ERR(clk) == 1, ret !=
  0); keep the one with real precedent (ret < 0).
- Link to v1: https://patch.msgid.link/20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev
---
 MAINTAINERS                               |   5 +
 scripts/coccinelle/api/clk_register.cocci | 153 ++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716acfc3d7c1..26788ccbf98c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6363,6 +6363,11 @@ L:	linux-clk@vger.kernel.org
 S:	Maintained
 F:	include/linux/clk.h
 
+CLK_REGISTER() COCCINELLE CHECK
+M:	Guru Das Srinagesh <linux@gurudas.dev>
+S:	Maintained
+F:	scripts/coccinelle/api/clk_register.cocci
+
 CLOCKSOURCE, CLOCKEVENT DRIVERS
 M:	Daniel Lezcano <daniel.lezcano@kernel.org>
 M:	Thomas Gleixner <tglx@kernel.org>
diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
new file mode 100644
index 000000000000..86a8be92f2a2
--- /dev/null
+++ b/scripts/coccinelle/api/clk_register.cocci
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Remove error messages after clk registration failures, because
+/// clk_register(), clk_hw_register(), and their variants already log
+/// an error when they fail. See commit 12a0fd23e870 ("clk: Print an
+/// error when clk registration fails").
+//
+// Confidence: Medium
+// Options: --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@depends on context@
+expression clk;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+*voidfn(...);
+...
+}
+
+@depends on patch@
+expression clk;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+-if ( IS_ERR(clk) )
+-voidfn(...);
+
+@depends on patch@
+expression clk;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+statement S;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+(
+-{
+-voidfn(...);
+S
+-}
+|
+{
+...
+-voidfn(...);
+...
+}
+)
+
+@r1 depends on org || report@
+position p1;
+expression clk;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+voidfn@p1(...);
+...
+}
+
+@depends on context@
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+*voidfn(...);
+...
+}
+
+@depends on patch@
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+-if ( \( ret \| ret < 0 \) )
+-voidfn(...);
+
+@depends on patch@
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+statement S;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+(
+-{
+-voidfn(...);
+S
+-}
+|
+{
+...
+-voidfn(...);
+...
+}
+)
+
+@r2 depends on org || report@
+position p2;
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+voidfn@p2(...);
+...
+}
+
+@script:python depends on org@
+p1 << r1.p1;
+@@
+
+cocci.print_main(p1)
+
+@script:python depends on report@
+p1 << r1.p1;
+@@
+
+msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
+coccilib.report.print_report(p1[0], msg)
+
+@script:python depends on org@
+p2 << r2.p2;
+@@
+
+cocci.print_main(p2)
+
+@script:python depends on report@
+p2 << r2.p2;
+@@
+
+msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
+coccilib.report.print_report(p2[0], msg)

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260802-cocci-clk-register-951d94251af4

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

