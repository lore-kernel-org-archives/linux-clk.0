Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF161E5714
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393031; cv=none; b=n3V0/faQ7/GiYXX3lS7Pp/cGNVEpQML78txvx+pR0zkGITUmQaFeiY1ahjg9MRVIcH4PZOiz+ZdgwbX2Aed5qqW11b2rvn7cKGaygQOp7ddlVqqAinJ+GJ8vUbTyh3jZ8LxwtAnrxihVua4ldGxyaeFUhoLnzjwB3kQa8Hyd5OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393031; c=relaxed/simple;
	bh=udeggmCb3Rt5fw3hHrTwRt0wekfKqGLiEZYraZsrQ40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ec3C8XjbSTMdy5C+Cj20v542xzpgJ4jNnQ3gWI81RptvP5KfD7BF8o93pjRebcygoCkUCcSslPMf3xtAqqBYRwvt5SzNBiCPU1lNPSbMRefiA48OgZeoP/9ec9wlqS/dkgUowyumFqbHuPd4pOnhOyQhrGcT16GTZTwZWMRZ3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=P7zOURVs; arc=none smtp.client-ip=198.54.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="P7zOURVs"
Received: from [192.168.1.106] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7RDW4VnZz2x99;
	Mon, 19 Oct 2026 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1792393020;
	bh=cA0aY2mWghiYPgF7Otc8FZGSfqB5i/BfGMxAWkJiOuE=;
	h=From:Date:Subject:To:Cc:From;
	b=P7zOURVsVpz7knEZeeF6Xwf8Bd+GMdb51KHHUQGgh71QeqmUinIRS+ecZ3ihRlf9v
	 TU0k51k/GprwPG5d5gqUygnl9xD6BqRBEL2h/gB4rqHI9uTIYzxRm2ClN48NVxIdCu
	 HU++VwaxujuRKARTO3VdKuZyRTcEijbAlc1logQ/w8cJBTQVjJcKane0clIR+dL8lL
	 PVs84svNhLoV51HHdCjDOKhevs6H3esIS1TsbVVPaXTfue4RG02AuxMyLTYxSX/enR
	 A86ZO9Rvr2JlK7cnq9PMZ/eZ54d5TG7KF7wX5VLzKwQlHfM10i+jiQT5p3ACBxPNO6
	 +vzfzOax71j0g==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 18 Oct 2026 23:56:39 -0700
Subject: [PATCH v4] coccinelle: Detect clk_register() anti-pattern
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-cocci-clk-register-v4-1-ed611b1c0da6@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NSw7CIBgE4KsY1mJ49IUr72FcUPhpUdMaaImm6
 d2FuqmxcTnJzDcT8uAseHTcTchBsN72XQzZfodUK7sGsNUxI0ZYQSrCsOqVsljdb9hBY/0ADou
 capGxnEqToTh8ODD2uaDnyyf7sb6CGpKUGm0c9u61vAaaen8PAsUUa1NU0qiaAphTM7pRS3/QE
 FC6CGyN8E2ERYQxKCthytyI6hfha0RsIjwiBdGEF0A5L8k3Ms/zGxK+yAdSAQAA
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

Assisted-by: LLM
Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Changes in v4:
- Rebased to v7.3
- Drop verbose cover letter examples of transformations
- Match any voidfn instead of specifically only dev_err, pr_err, dev_warn, etc.
  to cover pr_crit, DRM_DEV_ERROR instances
- Simplify functional-final `ret = PTR_ERR(...); return ret;` to `return
  clk_register();` directly such as in clk-pic32.c and clk-sysctrl.c;
  the new rule names the functions literally, per v1, to keep the file
  pre-filter working
- Similarly simplify within-if-body `ret = PTR_ERR(...); return ret;`
- Drop a local left unread by the removed message when it is declared
  and set in the registration loop, as in owl-common.c and clk-rpmh.c
- Running script on whole tree produces a single positive:
  arch/arm/mach-omap1/clock_data.c, where the removed message is the
  only user of a local variable, resulting in an unused variable
  warning. Left this to fix up by hand to keep the script shorter, happy
  to add rules to handle it if preferred.
- microchip-isc-clk.c keeps braces on its "else if" arm which checkpatch
  flags; this is also left to fix up by hand for the same reason.
- Link to v3: https://patch.msgid.link/20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev

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

Testing:
- "make coccicheck COCCI=<full/path/to/clk_register.cocci> MODE=patch SPFLAGS="--in-place"
- All four modes (report/context/patch/org) verified via "make
  coccicheck COCCI=<path> MODE=<mode> [M=<path>]" against the
  whole tree on v7.3.
---
 scripts/coccinelle/api/clk_register.cocci | 262 ++++++++++++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
new file mode 100644
index 000000000000..01d272e2d96f
--- /dev/null
+++ b/scripts/coccinelle/api/clk_register.cocci
@@ -0,0 +1,262 @@
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
+identifier voidfn;
+constant char[] c;
+statement S;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+*voidfn(...,c,...);
+...
+}
+else S
+
+@collapse depends on patch@
+expression list args;
+identifier x;
+identifier voidfn;
+constant char[] c;
+@@
+
+(
+-x = clk_register(args);
++return clk_register(args);
+|
+-x = devm_clk_register(args);
++return devm_clk_register(args);
+|
+-x = clk_hw_register(args);
++return clk_hw_register(args);
+|
+-x = devm_clk_hw_register(args);
++return devm_clk_hw_register(args);
+|
+-x = of_clk_hw_register(args);
++return of_clk_hw_register(args);
+)
+-if ( \( IS_ERR(x) \| x \| x < 0 \) )
+(
+-voidfn(...,c,...);
+|
+-{ voidfn(...,c,...); }
+)
+-return x;
+
+@depends on collapse && patch@
+identifier collapse.x;
+type T;
+@@
+
+- T x;
+  ... when != x
+      when strict
+
+@depends on patch@
+expression clk;
+identifier voidfn;
+constant char[] c;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+-if ( IS_ERR(clk) )
+-voidfn(...,c,...);
+
+@depends on patch@
+expression clk, ret;
+identifier voidfn;
+constant char[] c;
+statement S_else;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+-{
+-ret = PTR_ERR(clk);
+-voidfn(...,c,...);
+-return ret;
++return PTR_ERR(clk);
+-}
+else S_else
+
+@bind_loop depends on patch@
+expression x, E;
+identifier voidfn, n;
+constant char[] c;
+type T;
+statement S, S_else;
+@@
+
+  for (...;...;...) {
+  ... when != n
+- T n;
+  ...
+- n = E;
+  ...
+  x = \(clk_register\|devm_clk_register\|clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+  if ( \( IS_ERR(x) \| x \| x < 0 \) )
+(
+-{
+-voidfn(...,c,...,n,...);
+S
+-}
+|
+{
+...
+-voidfn(...,c,...,n,...);
+...
+}
+)
+  else S_else
+  ... when != n
+  }
+
+@depends on patch@
+expression clk;
+identifier voidfn;
+constant char[] c;
+statement S, S_else;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+(
+-{
+-voidfn(...,c,...);
+S
+-}
+|
+{
+...
+-voidfn(...,c,...);
+...
+}
+)
+else S_else
+
+@r1 depends on org || report@
+position p1;
+expression clk;
+identifier voidfn;
+constant char[] c;
+statement S;
+@@
+
+clk = \(clk_register\|devm_clk_register\)(...);
+if ( IS_ERR(clk) )
+{
+...
+voidfn@p1(...,c,...);
+...
+}
+else S
+
+@depends on context@
+expression ret;
+identifier voidfn;
+constant char[] c;
+statement S;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+*voidfn(...,c,...);
+...
+}
+else S
+
+@depends on patch@
+expression ret;
+identifier voidfn;
+constant char[] c;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+-if ( \( ret \| ret < 0 \) )
+-voidfn(...,c,...);
+
+@depends on patch@
+expression ret;
+identifier voidfn;
+constant char[] c;
+statement S, S_else;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+(
+-{
+-voidfn(...,c,...);
+S
+-}
+|
+{
+...
+-voidfn(...,c,...);
+...
+}
+)
+else S_else
+
+@r2 depends on org || report@
+position p2;
+expression ret;
+identifier voidfn;
+constant char[] c;
+statement S;
+@@
+
+ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
+if ( \( ret \| ret < 0 \) )
+{
+...
+voidfn@p2(...,c,...);
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
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260802-cocci-clk-register-951d94251af4

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

