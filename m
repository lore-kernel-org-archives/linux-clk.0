Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F172749DF
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549742; cv=none; b=WW132SpZoXGamCQDUT4esyXVG/W2bpIIoXzooOtEnIZJd+Lpekses+60Fi6aXChmBRJ8ydoSgmDErEbSSm57fWjlbeu1tlVbgnptsSclxmZXIqASibtE5K43TXTJ7JmC/nZnUJQZUWoMG+gI0BKLYhxUW9ey5W/9rTcIeI2Z6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549742; c=relaxed/simple;
	bh=JcS0PBiexjUmxANNsma/LGKNMCI48CNd8j71XULK4UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BI+xmitnFyG/LC+o9Op6890v3B0gLU+7Z28Nzh0SiKqy5irVfuU9NJlH1xW00U19zlApP+22zxDPaNc6wUsujgu+BHjiasC2X4uR7pQStsddS82V3HvXG220cOwOtqjb27GssDT0gz+UhymPBLy+pfLmXKqLqW4kQt8MJGXaWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I9+kn49/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJkjWyYz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I9+kn49/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJkjWyYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV/kQDo/wRMnIi8Dylb19q8LjihJ2zEmf7whdFoofyU=;
	b=I9+kn49/80/UJq9eaPDFn9FDiUTULAAvKOu2jaHIG2T/kjGfT9+wWJfTxp4kwNeJ2ULzoK
	8uqRj8xkFjjk/HkP1xIZjB0ztq0OePcxuroQWHHd2BMFmAbSTp+gbHG4D1j4NiFWHQtYFc
	8Fm6boi7OcJX50JQOTceJPSay9yO13o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-zyRvJS6NO0SICyDVNePm-w-1; Mon, 11 May 2026 21:35:39 -0400
X-MC-Unique: zyRvJS6NO0SICyDVNePm-w-1
X-Mimecast-MFC-AGG-ID: zyRvJS6NO0SICyDVNePm-w_1778549738
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so122575271cf.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549738; x=1779154538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV/kQDo/wRMnIi8Dylb19q8LjihJ2zEmf7whdFoofyU=;
        b=eJkjWyYzWU03gOzdlya56VnA5vsoeJvfsYPaL9GNi7eY98z6jmjtVCZC1V6n3egKiR
         PARQyAAYdiOvevMkv6cRpl4jSFaITt+4ZbsDYHp8OfF2kBoleSHr28QxD7mcAq/oCuXH
         HP/QA4Y7yNcFQaQOg2KBe/aSrkEIhRGOGLqxYXXqC58W2828ddmZvtsLOYcb5O99+qVM
         uq7J7geTFjmodBnqAlytnu0aXUTbiiGN5QC3cdQJMsu57ZvJbvvLNnQinspasqIb9LkV
         CRsozwBorweoEhGcRNzBXvETJPfXh1Ky3wFY8Rqo02AL6sZhJhq0jQPMqiw3AJjL77MT
         iaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549738; x=1779154538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oV/kQDo/wRMnIi8Dylb19q8LjihJ2zEmf7whdFoofyU=;
        b=GcqL0oJYVPLJrE1lE0Z4yiRuoLNMFsUfSgFC5TvLoBSPxlZmGxIPyKr+h0mJ7lEkVm
         mIsUBr1rwn830QWWz52wwH2SEom4RVUUX2Pa3lpS2FuGA8Xq7/29SBFHaysGDGkBR2au
         jcHSiQV5CIaefA/NFjmXrbuPSxm3KSHHhBUH+k9X07C//I4ZY7KEjaaPc1KsKEs6D9xg
         ekotNnJ0WR8Lhi9mtCF9i8cO/PyUra3fh332qrnVzlQTAWoR9Vd7k8aHb9v6Px+E3dyE
         bdW8/XbPKZi71rrSUhk0LTZxzxRb1kJlMp6o9+bBpQAsqngIk1JM3mH2hLoDQAfs1ZOz
         Ou6g==
X-Gm-Message-State: AOJu0YzX9JmGpB9Aajqknas7s+zKfgqAotwr6NstOEV3U+HTmMPtjIeJ
	eEVx5YyOEgtndghlV63xPs3AlWwOIeuTA906uPtjX06gxXI1l0oubJtRyNx5hz4d2AndFWrHG0W
	4ympLzrjHPq+t+lA8MypG7X3ViK3+YszpfDfMJgh71FT36Hr7pHQDM+ihHwRSmA==
X-Gm-Gg: Acq92OGnbmc2h2kDEVE/E5NyoOb+NuhAQx3U2zIRZTw1T6T4bNDlS8XdupByLBhPUow
	K7EuWn2ZsiPRFAdqXE7LqDEQ7vFaKSXqudshBzziJbqklJF7P6XGiAdRZMBlZjpWu3OENQvcOza
	mqxeomwLWWVOn/PlQQMqoxdIvPaCN0j6Nl6/o2jeA+eqhuRtlq2aIXN8/eCQJZzp+e8zyQycpIV
	wvumO0L4Wb/+dp0y6AE4pKcJdOJUB5pgZHa46e+T1+xCFjWN2RzN/QkSaDhqXbts5txfE5AYM/p
	aPAiqEcNSJKb1DvKGJwN6Mf0onZpnAKJDQdjXwhjbioMm+BxLg3KFj+vQaCC1MsfL+Hra/g9V39
	RxZNqPuA7cHhEP5Xt0BLLw6I3tgKbSOKwGyNIX7/igVvtqvau14JPKN9JyZdfPA==
X-Received: by 2002:a05:622a:24e:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-514a0b6f2c1mr166888011cf.45.1778549738329;
        Mon, 11 May 2026 18:35:38 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-514a0b6f2c1mr166887761cf.45.1778549737851;
        Mon, 11 May 2026 18:35:37 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:04 -0400
Subject: [PATCH v3 1/4] clk: add kernel docs for the core flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-1-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3542; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=JcS0PBiexjUmxANNsma/LGKNMCI48CNd8j71XULK4UQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmh+zd52Rc1gdL8btY34lkOWp7Lame5LJvjvjppstz
 VbvN4/sKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCKNfIwMb96KrAw7ENk9Ye/y
 sOyHBTYTf7nKPXXzUmjcYv7V7mf6C4b/qR/iXbUNN7VdrQm+9nFf4jPH11d/PjbzLVKp+bGR6yI
 PMwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Let's add a DOC section for the clk core flags, and move the
documentation for each flag into the doc header so that it can
be easily referenced in the generated kernel documentation.

Note: The comment about "Please update clk_flags..." is included as a
separate comment so it doesn't show up in the generated documents.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 include/linux/clk-provider.h | 46 ++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..151ebdc20a29 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -9,28 +9,40 @@
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
-/*
- * flags used across common struct clk.  these flags should only affect the
- * top-level framework.  custom flags for dealing with hardware specifics
- * belong in struct clk_foo
+/**
+ * DOC: clk framework flags
  *
- * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ * Flags used across common struct clk. These flags should only affect the
+ * top-level framework. Custom flags for dealing with hardware specifics
+ * belong in struct clk_foo.
+ *
+ * * CLK_SET_RATE_GATE - must be gated across rate change
+ * * CLK_SET_PARENT_GATE - must be gated across re-parent
+ * * CLK_SET_RATE_PARENT - propagate rate change up one level
+ * * CLK_IGNORE_UNUSED - do not gate even if unused
+ * * CLK_GET_RATE_NOCACHE - do not use the cached clk rate
+ * * CLK_SET_RATE_NO_REPARENT - don't re-parent on rate change
+ * * CLK_GET_ACCURACY_NOCACHE - do not use the cached clk accuracy
+ * * CLK_RECALC_NEW_RATES - recalc rates after notifications
+ * * CLK_SET_RATE_UNGATE - clock needs to run to set rate
+ * * CLK_IS_CRITICAL - do not gate, ever
+ * * CLK_OPS_PARENT_ENABLE - parents need enable during gate/ungate, set rate and re-parent
+ * * CLK_DUTY_CYCLE_PARENT - duty cycle call may be forwarded to the parent clock
  */
-#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
-#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
-#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
+/* Please update clk_flags[] in drivers/clk/clk.c when making changes here! */
+#define CLK_SET_RATE_GATE	BIT(0)
+#define CLK_SET_PARENT_GATE	BIT(1)
+#define CLK_SET_RATE_PARENT	BIT(2)
+#define CLK_IGNORE_UNUSED	BIT(3)
 				/* unused */
 				/* unused */
-#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
-#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
-#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
-#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
-/* parents need enable during gate/ungate, set rate and re-parent */
+#define CLK_GET_RATE_NOCACHE	BIT(6)
+#define CLK_SET_RATE_NO_REPARENT BIT(7)
+#define CLK_GET_ACCURACY_NOCACHE BIT(8)
+#define CLK_RECALC_NEW_RATES	BIT(9)
+#define CLK_SET_RATE_UNGATE	BIT(10)
+#define CLK_IS_CRITICAL		BIT(11)
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
-/* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
 
 struct clk;

-- 
2.54.0

