Received: from out-93wp-a26.jellyfish.systems (out-93wp-a26.jellyfish.systems [104.207.68.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBC207A32
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343631; cv=none; b=A/VGJU0tlxE2AWAzyV/GM3dvX2Wu8clhkeXVv5okYKMTaljyqWK1Ob1rjSB/5SfSDJz1iUM8lYgY2UlxDAqMh+cK+TvGz3xpR6O6UJJ3q7xAxEPZPPp8gYRSUNloAMpEeTLmzKqwtlAQDfaTYjBAlWn43xKQEzaFYZnInSzAkhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343631; c=relaxed/simple;
	bh=AFPT8u7LNiauwEGkMir1DHMtLP/fYIGESuh6KSdORrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xe/k7GAWIa6h2TvE40RFaV/ebIFA27pYdfZnqhBuZinttZstViZ50MJF7pvlx8GsWD5EBSNqejZIXC/A5ModyREI0mbaTgIJAkRmkJsNoALjMEIxO6XJ7sFb3ctyll2tMJ3qv1iQo7gjXzKvibyK/sNL9nSGSLGfqZ6aKx51yG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=ACb0j/NI; arc=none smtp.client-ip=104.207.68.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="ACb0j/NI"
Received: from [192.168.1.103] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hJQ2226YNz6tl8;
	Mon, 10 Aug 2026 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1786343626;
	bh=GL/ztLMOvUH4Q12i+RAlPby9ewt/dD+XTkUVXgI/UnU=;
	h=From:Date:Subject:To:Cc:From;
	b=ACb0j/NIgXXa4BbF9IYzX9/9B0VGCyTYr9vAitLGsFHOGLYYxe02GLhBV4cIZ6Er6
	 REmeIdCERw7aSRV22FTrCQ/VvDfJmLbNGQkUA5VUtUHx/UWcFZzA75KkcSPZtKeYkw
	 d9EFFvIH39PWGEFGddTRGqYyZKiPFne4ACGiJr6oj3gwEHu9bxv/Hx/3XdOPJLRqbb
	 OjddvAaiHAcNXP4lnDOgeMWTVoZuRBStQxEZcy0HBHMMjgxHOObDkLGyqDkCVQQcsN
	 Xhs/+vLS8gC+0+bD4kC/FY78tCr+MqN6FqPczkSnPdDFn0CcJgg/JqBadKaYNh2Q77
	 Z+SP76zw2cZdA==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 09 Aug 2026 23:33:32 -0700
Subject: [PATCH v3] coccinelle: Detect clk_register() anti-pattern
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw7CIBQFf6VhLabcvsCV/2FcULi0qGkNtETT9
 N+FutHEuJzknJmFeHQWPTlkC3EYrLfjEKHYZUT1cuiQWh2ZQA51znOgalTKUnW7Uoed9RM6Kiq
 mRQkVk6Yk8Xh3aOxjk57Ob/Zze0E1JVNa9PE4uudWDSzt/gYCo4xqU3NpVMsQzbGb3ayl32sMJ
 CUCfEqKnxKIEgBsuDBNZQT/lqzr+gI2bsfVDQEAAA==
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
devm_clk_hw_register()/of_clk_hw_register()). Both families match
regardless of whether the redundant message's "if" also has a trailing
"else", via an "else S" clause with S otherwise unused.

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

Matches regardless of whether the "if" also has a trailing "else", via
an "else S" clause with S otherwise unused, e.g.
drivers/media/platform/microchip/microchip-isc-clk.c:269-275:

    isc_clk->clk = clk_register(isc->dev, &isc_clk->hw);
-   if (IS_ERR(isc_clk->clk)) {
-           dev_err(isc->dev, "%s: clock register fail\n", clk_name);
+   if (IS_ERR(isc_clk->clk))
        return PTR_ERR(isc_clk->clk);
-   } else if (id == ISC_MCK) {
+   else if (id == ISC_MCK) {
        of_clk_add_provider(np, of_clk_src_simple_get, isc_clk->clk);
    }

Testing:
- Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
- "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
  hits, unchanged after this revision, and verified to have zero false
  positives.
- All four modes (report/context/patch/org) verified via "make
  coccicheck COCCI=<path> MODE=<mode> [M=<path>]" against the
  drivers/clk baseline and the new else-branch case above.
- "make coccicheck COCCI=<path> MODE=report" (whole tree, no M=) finds
  94 hits; the 21 outside drivers/clk are not part of this series.
---
Changes in v3 (Julia):
- Match an "if" regardless of a trailing "else" (else S, S unused),
  across context/patch/report/org rules for both families. Found via
  this to be a real, previously-invisible case in
  drivers/media/platform/microchip/microchip-isc-clk.c.
- Fix the org-mode script rules: cocci.print_main() takes (message,
  position), not just a position; the previous calls omitted the
  message entirely.
- Drop the MAINTAINERS addition from v2 per Julia's comment that a
  specific maintainer isn't needed for this file.
- Link to v2: https://patch.msgid.link/20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev

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
 scripts/coccinelle/api/clk_register.cocci | 165 ++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
new file mode 100644
index 000000000000..150279827bf4
--- /dev/null
+++ b/scripts/coccinelle/api/clk_register.cocci
@@ -0,0 +1,165 @@
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
+statement S;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+*voidfn(...);
+...
+}
+else S
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
+statement S, S_else;
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
+else S_else
+
+@r1 depends on org || report@
+position p1;
+expression clk;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+statement S;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+voidfn@p1(...);
+...
+}
+else S
+
+@depends on context@
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+statement S;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+*voidfn(...);
+...
+}
+else S
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
+statement S, S_else;
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
+else S_else
+
+@r2 depends on org || report@
+position p2;
+expression ret;
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+statement S;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+voidfn@p2(...);
+...
+}
+else S
+
+@script:python depends on org@
+p1 << r1.p1;
+@@
+
+msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
+cocci.print_main(msg, p1)
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
+msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
+cocci.print_main(msg, p2)
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

