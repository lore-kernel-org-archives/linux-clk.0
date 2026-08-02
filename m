Received: from out-2z4y-a129.jellyfish.systems (out-2z4y-a129.jellyfish.systems [198.54.127.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F425392C46
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785662116; cv=none; b=f2V9chx90hnwtkYwunod13mKHELJXDYJiKaIDzMHSVzBYscoZ3oZfXWI0oi+luK8u799zYCQ7BpRp3x6ZHf0TagAoi1MamSGkuH66Vmk41LpqH6w9ucdDrygrh3XQYRy1j0xjZHCstqg41PwWC9/AxipLO/ZKCOhgFnUPaIcyIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785662116; c=relaxed/simple;
	bh=wY3AH4kpCB/EKNyzWz74s5X3C9uvQ1wrv5KH2YvB+qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cOSHlGFbnZHo63nzevl9+gzSp6FAZOE4XwyX1a16m/9LzAH1+UcMh0YumDGGFNegsCh4nWP1joApIKd2wHfw/vz5GIE5z2HYGOKBOnzxV3bEpwtDkdc/mJ18UO/c5oYu0c8UXkYB7USCHliABUJxoL6R7KeEc934ASmBGRAqPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=E48utA4z; arc=none smtp.client-ip=198.54.127.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="E48utA4z"
Received: from [192.168.1.103] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hCYWV2MZgz8sWQ;
	Sun, 02 Aug 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1785660838;
	bh=86TAPTVjtGuqIdr0iX7wtF6UQ+MyLM9YgXwyM+n4LOQ=;
	h=From:Date:Subject:To:Cc:From;
	b=E48utA4zgN1xgzJjBPr4YTfTlSdv6JX2WXfDAzXPMpi+yiBX4zgxgD3zmQQmAxvvi
	 aMF6zNM+OfBP6j03u7OzaqRC3zWwMsdoUYlFjDuR88JeDVoQTGvv3t7dfKrZI8nbWs
	 LHC/FP1HUc7pSQoxv4UNIouzc6flAJ9HcX9+T5vZpN7UENkauE2kiuwTRNZ7wTn/p2
	 mJGp5XCmClgNXrSRyhQj1yu7aK1kx2tWxrubALTQ3DVjJjon6pFnnJyTXStfSPznV4
	 jZVD3dAeRq6vMK12L2IlusX76OOmdnOs1oc2VW5awxg3lfkwYYFpoNS3yc8ME0Hsek
	 R+xfkms0yPUog==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 02 Aug 2026 01:53:52 -0700
Subject: [PATCH] coccinelle: Detect clk_register() anti-pattern
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g3MDCrVq0gXNkZNW1QSLYJ4d
 0ddvsX/GxirsEGZbKD8F5NxiPCPBKivh45RmmgILuTu6QLSSCRIvy8qd2IzKxaZb4o0ZL5uU4j
 hpNzKek2r121b3h+m+TzBvh+Mejo7dgAAAA==
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
    if (ret) {
-       dev_err(dev, "registering %s clock failed\n",
-               hw->init->name);
        return ret;
    }

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
 MAINTAINERS                               |   5 ++
 scripts/coccinelle/api/clk_register.cocci | 125 ++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

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
index 000000000000..fe5bcd4b00d4
--- /dev/null
+++ b/scripts/coccinelle/api/clk_register.cocci
@@ -0,0 +1,125 @@
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
+identifier reg =~ "^(devm_)?clk_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = reg(...);
+if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
+{
+...
+*voidfn(...);
+...
+}
+
+@depends on patch@
+expression clk;
+identifier reg =~ "^(devm_)?clk_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = reg(...);
+if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
+{
+...
+-voidfn(...);
+...
+}
+
+@r1 depends on org || report@
+position p1;
+expression clk;
+identifier reg =~ "^(devm_)?clk_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+clk = reg(...);
+if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
+{
+...
+voidfn@p1(...);
+...
+}
+
+@depends on context@
+expression ret;
+identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = reg(...);
+if ( \( ret \| ret != 0 \| ret < 0 \) )
+{
+...
+*voidfn(...);
+...
+}
+
+@depends on patch@
+expression ret;
+identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = reg(...);
+if ( \( ret \| ret != 0 \| ret < 0 \) )
+{
+...
+-voidfn(...);
+...
+}
+
+@r2 depends on org || report@
+position p2;
+expression ret;
+identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
+identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
+@@
+
+ret = reg(...);
+if ( \( ret \| ret != 0 \| ret < 0 \) )
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

