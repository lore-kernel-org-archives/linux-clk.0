Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E1396B9D
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482766; cv=none; b=kt0FS0+2NNbzYxv1EwgMe1v7LCO/yMXcAJX8fv+vLPSZvLhsOxFV/D72fWUOkrNpPmFGPG00B8unWPe6X2s050yUn6iOwpapCUn0BNAEiJwR5bJ406vzCkqWu2yvhO7OmQMhRkfWaipNAPuaJ829RY/8hAwAIIY1d6htW/KU/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482766; c=relaxed/simple;
	bh=3FuJuDRCk2GGugQIv8w/KFcBteXXe2wlhM60mPaXzNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isoFg98KpuIqWiEzGhN/1x6qwt/WfYsnXfe+BcALl8gPzDJmivcXIpHcpH3T6Yv+T0oAxNGLz3su8rTLAOogcpYE2GNmOlNR8rLfi6DsM2Rb4F3Jw2/TMQA8qq0t8y8Nr92P1SttKT0vSfs2L6yOxo+byRDiv67uZFW3YQBi54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFLnhs3z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M494XnCo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFLnhs3z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M494XnCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stCH47cuvvcQcqflbk9cboggTCLsKnNEJ6X8WIUPijo=;
	b=TFLnhs3z3R5RlwR3TOMWcwlTuC0gow6rtqjkPa200o4DoR0ol2oFFxykR4h3MO53EUEWny
	aVdkyXuUimYVQ6aeCb2hPxTqy+rrAn+Dhz5hprbgAPpZpgbatqv4IFM9vXzhtMw0n9mkcH
	ZaWanQuxNQaQ/WbtDuQIZpF8SawEJWo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-Xmvnk82OMPSgmcrhWt-_mg-1; Wed, 25 Mar 2026 19:52:42 -0400
X-MC-Unique: Xmvnk82OMPSgmcrhWt-_mg-1
X-Mimecast-MFC-AGG-ID: Xmvnk82OMPSgmcrhWt-_mg_1774482761
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfdc479f5bso125189985a.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482761; x=1775087561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stCH47cuvvcQcqflbk9cboggTCLsKnNEJ6X8WIUPijo=;
        b=M494XnCofsi7EPQTpOx7lSumO/tRvRP/F/rcYQ5bOZ5uhNzHPHR7HLBuSqbSbeq8gY
         txvWmZPI1BWylzECTHyri5evPHTxlubChp4djFWsSV5GA6R3jcRl+HhvcF51+io9GoYR
         WlgbdZRl8FPqngDkUgNIosxExv5EI/1rYF0z9H0OEZcQ07fhAXGQLMPoNmGibBxnnlOd
         ZomNF/YpktWT5H+AQ5t9+Xl77tvDCf7Ry1AVjxyqD42Ye1ZcYkn7tKxzaRByC9xA96zv
         MNpP/fzodUD/NMmMO6F13HoeCNORvz6eSzzkRfJscTJIsgnN0Q6fqwTD4rlRYS3sD6wV
         9r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482761; x=1775087561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stCH47cuvvcQcqflbk9cboggTCLsKnNEJ6X8WIUPijo=;
        b=TJINHvQezxJHQcnCIrUMetZZPQU9Ygn92ersLzLPYS5jpK85B6RE162pbm//Akr/Sj
         I1btX65yQieJte61WdXLrXqHWUWu9jmdQlC8qGWoGQbQLeP1lvkkhGNseTNymLwNb0xL
         red/IuIb0mtWVNjHzEWrq+KmhQjPSk+VSow7egsV1lXeeAe/y93dag7mRIsI68xkIVrc
         pCriZcCCFdc3hETNdCs+ArCJFl0xMrM7Nraqc+uuCkuKkZHKPaI9NuftiAPtrPXGzKdJ
         QI5CG51mUUAnCp/B4Ai+ieyTsnrmDE4T1605gAmpYLXFOYLEsdRE9zK32HP9cDj5zHBl
         WIsg==
X-Gm-Message-State: AOJu0Yzb9w6bjXqXnQov+vRmLg1IcPRi7CfTz042odX/iowSzwq1xE0T
	18KQB1ohr4ghwAfcXvhYDdHb4LhJR1FWskNCxuPTIX5I8UXRL46edCEiQotWJRjZlXtJ7o3KCP1
	IzPbTpkvwerAWJc7SHEDPcYfn8F37pMjRgcmBHNPHtSiabLqU+/CSheK4Ps7FTg==
X-Gm-Gg: ATEYQzymZ5/mQvVXtSWuOwqE0hWPcx1u9VPAnfqrBRX72TVQqfE3tj7m0Cs49tgC2j2
	N+h8zCuD2zvEBkH5Z6z97Rqfw60RMKzKCOUhzzre1E2WQXjqWMI4En8H8e7oUlH2JWBQNDkgf7e
	sBcpbFHkTxhvqqPofoJVWhAeh67bsr91E1qk+9f21RFwWyZrfE3dkIZu1yP+2/Q0ya6xtwgLi+6
	k2+ViVNYPlqWQT0Cyg+d1jJrLekdJvlxefajh+IXwU5cg/ffBqdDd1MiPznFHbnKhWzf8s4s1/E
	+xfrlZ0RGF/vpSFcPv/r4QKA1ZidwzqmMgngRVwHcZXbPpEbTsObHK9+h2fp/me3ps9dFcC5GVz
	WJipIvstK8a6pfseREf8y/9b8XqkF8JvLGUA+HgBRufHf7RZgH7Owzdmgrw38
X-Received: by 2002:a05:620a:448e:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d000ee456dmr688573285a.7.1774482761539;
        Wed, 25 Mar 2026 16:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d000ee456dmr688569285a.7.1774482761043;
        Wed, 25 Mar 2026 16:52:41 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 25 Mar 2026 19:52:10 -0400
Subject: [PATCH v2 1/4] clk: move core flags into a new enum for kernel
 docs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
In-Reply-To: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3FuJuDRCk2GGugQIv8w/KFcBteXXe2wlhM60mPaXzNc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlNqL+pVtual40T+p3Ds2b4Xfjr6D8e57Gj86MyxX3
 MJjV2bWUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwET+eDMy7PzWdED0folyRPfO
 g4oteslZRt8852etqUgwnuT/bN+BSYwMs8UvbWCa++HOwcreGN60dQu0nsvNnmr+T+BQmEbfpcB
 jjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Let's move all of the existing clk flags into a new enum so that all of
the flags can be easily referenced in the kernel documentation. Note
that I went with name clk_core_flags for the enum since the name
clk_flags is already in use in clk.c for the debugfs interface.

Note: The comment about "Please update clk_flags..." is included as a
separate comment so it doesn't show up in the generated documents.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 include/linux/clk-provider.h | 55 +++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..cb167c17c4f79cf438a26bb113b4968d0f223468 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -9,29 +9,42 @@
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
-/*
- * flags used across common struct clk.  these flags should only affect the
- * top-level framework.  custom flags for dealing with hardware specifics
- * belong in struct clk_foo
+/* Please update clk_flags[] in drivers/clk/clk.c when making changes here! */
+/**
+ * enum clk_core_flags - framework-level clock flags
  *
- * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ * These flags should only affect the top-level framework. Custom flags for
+ * dealing with hardware specifics belong in struct clk_foo.
+ *
+ * @CLK_SET_RATE_GATE: must be gated across rate change
+ * @CLK_SET_PARENT_GATE: must be gated across re-parent
+ * @CLK_SET_RATE_PARENT: propagate rate change up one level
+ * @CLK_IGNORE_UNUSED: do not gate even if unused
+ * @CLK_GET_RATE_NOCACHE: do not use the cached clk rate
+ * @CLK_SET_RATE_NO_REPARENT: don't re-parent on rate change
+ * @CLK_GET_ACCURACY_NOCACHE: do not use the cached clk accuracy
+ * @CLK_RECALC_NEW_RATES: recalc rates after notifications
+ * @CLK_SET_RATE_UNGATE: clock needs to run to set rate
+ * @CLK_IS_CRITICAL: do not gate, ever
+ * @CLK_OPS_PARENT_ENABLE: parents need enable during gate/ungate, set rate and re-parent
+ * @CLK_DUTY_CYCLE_PARENT: duty cycle call may be forwarded to the parent clock
  */
-#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
-#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
-#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-				/* unused */
-				/* unused */
-#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
-#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
-#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
-#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
-/* parents need enable during gate/ungate, set rate and re-parent */
-#define CLK_OPS_PARENT_ENABLE	BIT(12)
-/* duty cycle call may be forwarded to the parent clock */
-#define CLK_DUTY_CYCLE_PARENT	BIT(13)
+enum clk_core_flags {
+	CLK_SET_RATE_GATE		= BIT(0),
+	CLK_SET_PARENT_GATE		= BIT(1),
+	CLK_SET_RATE_PARENT		= BIT(2),
+	CLK_IGNORE_UNUSED		= BIT(3),
+	/* unused */
+	/* unused */
+	CLK_GET_RATE_NOCACHE		= BIT(6),
+	CLK_SET_RATE_NO_REPARENT	= BIT(7),
+	CLK_GET_ACCURACY_NOCACHE	= BIT(8),
+	CLK_RECALC_NEW_RATES		= BIT(9),
+	CLK_SET_RATE_UNGATE		= BIT(10),
+	CLK_IS_CRITICAL			= BIT(11),
+	CLK_OPS_PARENT_ENABLE		= BIT(12),
+	CLK_DUTY_CYCLE_PARENT		= BIT(13),
+};
 
 struct clk;
 struct clk_hw;

-- 
2.53.0

