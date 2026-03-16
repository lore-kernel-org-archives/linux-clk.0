Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4F371878
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700457; cv=none; b=E6jYrD5VcVKtPaMN9WlQIczU7GQQwaw9qVcPD5aIuXtwdPoTThmYJ0YKfHprsh7z19hSVVYMDrPBdrD+K6JzM/4emQtslzRfd0xAz6OvGmkxIxx/SBfiq3xvQ1VMDEtiTyUvZ8l+INuV28YfLQ4zUfh6nZiuF56WIRED0/wiTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700457; c=relaxed/simple;
	bh=0xCjTnQlG1U8KFxdCHLVY8uV/kewZx19MaNmIpedMpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QT12vjtQ6tQmDOaEfBrkzWEH+Ir3pwV5Qf697zjrUjgjvFskvZ8JhAew2XQnX1xqAlLf99dvwc3oAfVz31fDiIgNKKa3aREAmvYMVwYadgG6ZSaml9mitBgMGOFzi6JBNei7CJGTZfscgBnOb3TFgmACSbJ3y8A50fBV2M5R/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKaNGO8V; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqHs7PTY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKaNGO8V";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqHs7PTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773700451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
	b=BKaNGO8VMlEITu88pzuTzoaNYAfT7lHxuPGDsBX6WlKOGCfo3Jk2fwvfWI5/TDGjZ4iXYR
	RHecDOVZswrzk/HBgB1qnvfRlVRJsrhv3mBfHqm+AtFXb1ZyX+TOZYBgnGCjfCEpA/nWJr
	rAXWre5YmiEsPDtJPVsejB8dPFf6zB4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-Sz0oAH2aOgusGXmT3ZHz6w-1; Mon, 16 Mar 2026 18:34:08 -0400
X-MC-Unique: Sz0oAH2aOgusGXmT3ZHz6w-1
X-Mimecast-MFC-AGG-ID: Sz0oAH2aOgusGXmT3ZHz6w_1773700448
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso14582991cf.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 15:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773700448; x=1774305248; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
        b=LqHs7PTYmhjYdhWa5YjGW7wiKN0ntn67HZ9iT4Nw/hiPjoel9KLnKW6a0M7bnRmRfK
         atQCRJwSKCPemgZnYj7+ewEApHn1/jt6Y6MuhAd+mBrUBI1lkXptgJmzhwsHtsEaOXVe
         7prTGLUXbKQSjvMmYoAbreG1l3ciZX5PQci+L6Wf2kpwhNvNN0ZFf8Du/iEl28x53Lao
         E1ifiZL2jsW25RkoV+xoaAqYtuCM21cPBAmspcN7ZMr9WJMpTWJOu/Kyd/NwUgS+DO+6
         F7Vvr15AEqTMX9/hOiy3sMXYNJsYkJWK0QmoFvjV5luDcLmmFg6NOIx+haRHnbGcXUyo
         +mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700448; x=1774305248;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
        b=FC5qghlpzhekPBjckxCj25k87/2qv96RaxUfV5Cwm1s729TQUjLWCndgRkKcmOgFP8
         hqXBYblCuSLEVKIZRY+uLX/UgiahzGdFfiuVJwMPRIetDM9dFUnxMl3oDgvd0bIddDKa
         9Bf0tc+2ZAUIsht1tnYd4wRx2cCAOZfj2TTfQ55BnMscbBVY1D7T+BDL6uzL87og9/xb
         nt0xjnyyhu16Wi8iutV77A4sP8AOFT636JodY0Gqc3wj9yOJWjOtmq3siyDrtc6I2fXE
         QjgALVlBC6J9aEC5ni2I1tfUeq5ug4Pbxj1y9aB1UhbWux04AXNXUxSGL4cFibaAT8NG
         mYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8HDy2Mw2w8P2st11PNfzTSIf6cLovWi3MDFPnvKMGKKgjJj4hwvNu6roJaUzvliiGXnugFhADDek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84YDrWcC447wH5bkctfTR68aXxLzgyUXo4Z3VsPZAQlXR8QDL
	ULahwsRAlc9ZhAdfxe9g4EtTwZH3K94hpcK3AyN8J4fcWxC0bqxZdTUBXlrsInqFAcaHNz9Vcl7
	Rkw8voxCfXKYeFUABKl3SxR5ljfR2KVl40a1k7MZ1VJl7pl7J0FI33v9VlKKdJA==
X-Gm-Gg: ATEYQzzH+WWfUwjc0ArPAYhiMlkDDCwARAQjjGqSk5rmwWlDuYpwwRhU6VnAVLHQ79Z
	LdyR4CIYUL1s03qo3KEcZmPTbVdYmpVcbueVfS9Ax/VSBl/o1JjJk+qYqPQAqymZudwNiedSt+n
	WyH+QdwGeSiW6O/gyaYIGMzeZ9w/7D3bv9YCHdmhnRQRcgEsIRHKD8NG0cjWnvp6JCO416ltPTV
	Ie+9PzUnBezXcxPm2Ermab7XGZeghBjViUFKd+TFx+vavapncVqVcVoQkl2XD2qCQ5+W19iRSL9
	IHDkkt5YrGUkjxGi37FhtQyBtxm7AocepqnNTqRAo+nbf4+tHyfEIMCLIG35pLCfHfB34tCcQ2E
	kiq3yzGBJBCBAeFm+k1R+Q0VWqI8SF2ZxkB158tnsKYgmJu8oGtKedHvPAXGm
X-Received: by 2002:ac8:5782:0:b0:509:1b01:8916 with SMTP id d75a77b69052e-50957cf51d8mr212787881cf.4.1773700448050;
        Mon, 16 Mar 2026 15:34:08 -0700 (PDT)
X-Received: by 2002:ac8:5782:0:b0:509:1b01:8916 with SMTP id d75a77b69052e-50957cf51d8mr212787461cf.4.1773700447549;
        Mon, 16 Mar 2026 15:34:07 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0e9658sm155941071cf.21.2026.03.16.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:34:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 16 Mar 2026 18:33:45 -0400
Subject: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB2ISpPiVYoLjb/poExKglII3
 r2hy2/xXqGMJMg0NoUSLskStaJrG/LvWQNY1mrqTW/N0Fn2x84SNCbwqWfGyruPuklgB+ewPJb
 nYCzV/pOwyff/fk33/QM/YYCTawAAAA==
X-Change-ID: 20260316-clk-ignore-unused-kconfig-7e77eb5b8306
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6205; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0xCjTnQlG1U8KFxdCHLVY8uV/kewZx19MaNmIpedMpI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ3tEb9e+Bsy3LH9ekkvVKOWImLrUkH7vxM7GIOkz16Z
 dtTb3W+jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyxY+R4eIa/q+eigJWS5Qz
 SxtLJ992r3fUyv/AsPde5lS5jI/2kgz/wwQ2fFzB8V5jefVL43fbkrZ8f1nKWWcxq0++9SLH8X9
 NfAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

At the 2023 Linux Plumbers Conference in Richmond VA, there was a
discussion about how large number of systems need to boot with
clk_ignore_unused. Per the discussions at the conference, the existing
behavior in the clk core is broken, and there is a desire to completely
remove this functionality.

This series introduces a new Kconfig called
CONFIG_COMMON_CLK_DISABLE_UNUSED that when set has the existing
behavior as clk_ignore_unused so that people no longer have to specify
this parameter on the kernel command line. This Kconfig is disabled by
default to keep compatibility with existing systems. A kernel that was
compiled with this Kconfig enabled can have the clk subsystem disable
the unused clocks by passing clk_ignore_unused=0 on the kernel command
line.

Note: The existing clk code calls __setup("clk_ignore_unused", ...)
without the equals in the name. So someone can actually pass a kernel
parameter today clk_ignore_unused_foo that'll also match the existing
parameter. We can't change the existing behavior, so we need to look
for the equals sign in the value.

Link: https://lpc.events/event/17/contributions/1432/
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
I searched the mailinglist archive, and couldn't find where anyone
submitted something like this after LPC 2023. This was the last
suggestion discussed on the LPC talk, and it sounds like around 14:40
that this is an acceptable change.

I looked at adding some Kunit tests for this to clk_test.c. I planned to
export clk_ignore_unused_setup() for Kunit testing, however that will
require putting "=0" instead of just "0" in the tests. This won't match
the behavior on the kernel command line. See comment in the code about
the equals.
---
 Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
 Documentation/driver-api/clk.rst                |  7 +++++++
 drivers/clk/Kconfig                             | 16 ++++++++++++++++
 drivers/clk/clk.c                               | 17 ++++++++++++++---
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fa6171b5fdd5ff55b3203272568509bb45c69856..d559c387ca32425c0a3776bec899f48a21ed3026 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -830,6 +830,15 @@ Kernel parameters
 			platform with proper driver support.  For more
 			information, see Documentation/driver-api/clk.rst.
 
+	clk_ignore_unused=0
+			[CLK]
+			Force the clock framework to automatically gate unused
+			clocks at late init, even if CONFIG_COMMON_CLK_DISABLE_UNUSED
+			is enabled. This overrides the compile-time configuration
+			to re-enable power saving by disabling unused clocks.
+
+			For more information, see Documentation/driver-api/clk.rst.
+
 	clock=		[BUGS=X86-32, HW] gettimeofday clocksource override.
 			[Deprecated]
 			Forces specified clocksource (if available) to be used
diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 93bab5336dfda06069eea700d2830089bf3bce03..31ce4e3889f09a4f9c3b63cad7ded214125702f7 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -266,6 +266,13 @@ parameters::
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.
 
+Alternatively, you can enable CONFIG_COMMON_CLK_DISABLE_UNUSED at compile time
+to prevent the automatic disabling of unused clocks by default. When this
+option is enabled, unused clocks will remain enabled unless you explicitly
+force their disabling by passing "clk_ignore_unused=0" on the kernel command
+line. This can be useful for platforms that require certain clocks to remain
+enabled for proper operation, or for debugging purposes.
+
 Locking
 =======
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5fd9fb38ce94fcb1098810c3f52c36..d7503517f6ec1ed773b2dcb9e3a7a0b5bcdea353 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -33,6 +33,22 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_DISABLE_UNUSED
+	bool "Do not automatically disable unused clocks"
+	help
+	  Say Y here if you want to prevent the clock framework from
+	  automatically disabling unused clocks at late initialization time.
+	  This keeps clocks running even if no driver is using them, which
+	  may be necessary for certain hardware configurations or debugging.
+
+	  By default (N), the kernel will automatically disable unused clocks
+	  to save power.
+
+	  This behavior can be overridden at boot time on the kernel command
+	  line with the parameter clk_ignore_unused.
+
+	  If unsure, say N.
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..4afbf011de6f1727a2bf330465c95407e51d04ad 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1508,10 +1508,21 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
-static int __init clk_ignore_unused_setup(char *__unused)
+static bool clk_ignore_unused __initdata = IS_ENABLED(CONFIG_COMMON_CLK_DISABLE_UNUSED);
+static int __init clk_ignore_unused_setup(char *str)
 {
-	clk_ignore_unused = true;
+	if (!str) {
+		clk_ignore_unused = true;
+	} else {
+		/*
+		 * Typically the equals is added to the __setup below, however we
+		 * need to be able to support clk_ignore_unused without an equals
+		 * since tons of systems just pass clk_ignore_unused. So look for
+		 * the equals here.
+		 */
+		clk_ignore_unused = strcmp(str, "=0") != 0;
+	}
+
 	return 1;
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260316-clk-ignore-unused-kconfig-7e77eb5b8306

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

