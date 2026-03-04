Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF603845A6
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 22:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664698; cv=none; b=J2b6N4S4vemvctgfrj0FDhrRf70h9W2paT0pA1UMZ9yCE/Qcel6Al6b0l4ninOXQ9eDVknKSeoXog/o3Q3nmui7HPt0F23IR5ES2DlZ9SsmZlzkNs+RZhAdkwqFHRfqmSYbbo6D8eWOJr3gQPqLI1Z44xxZ9QMtqI5hOXv85b08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664698; c=relaxed/simple;
	bh=CDynmqnNGNqeRMDqyGZQt5+Y7aUBAhjbZuUmwJcAQF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBTsQar5W9dvMKBPu90wAAfoDqGpS6JLCLbsT1Me5itkKSs3MhN3StGIeJAPyAoYBUjahbJl+zVzCXM9RXaFTVb8R+rgw/W25iN5Hbm6Chhtlq0wckEgJJQhqUdwy1WNZDQRK9UiQQ3YUVi4pBN/4G7cnj9rlalBIKi5OCcZJFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JumxrEDo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvENq1De; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JumxrEDo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvENq1De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772664695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAE4SvbVc5xuqVfNMXPNWetx7bFn7ASO7FJPhI+jmF0=;
	b=JumxrEDosYaaynRVc3sWoFnrXoflRaEwNmPTGrAfVS9u7trMaSMFP6YfXETmBvGkTwhoYi
	bYkS4B6G9KsO3CAoX7iuEKCx1ftHm/71WVa5h/PcMPuAEJBZH6XAoq6K1JGt+bBRcxCCFC
	bB8Su27x21HdRo73YmbNuMuhl6Y19+g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-wvNiiX9hOyCiUsUOTpyXvg-1; Wed, 04 Mar 2026 17:51:34 -0500
X-MC-Unique: wvNiiX9hOyCiUsUOTpyXvg-1
X-Mimecast-MFC-AGG-ID: wvNiiX9hOyCiUsUOTpyXvg_1772664694
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50620483ff6so571453451cf.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772664694; x=1773269494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAE4SvbVc5xuqVfNMXPNWetx7bFn7ASO7FJPhI+jmF0=;
        b=UvENq1De9YvutPiCMx/rNxIqqSE5oZbZh1tOlVNC+sWajkjAHbBrZ3zzSEUjeu4tMg
         Ah6BklIPQuAdJnDbKR8De3mx9csC2P3pQW3/kPiRLZ/ywi2zPt2bAiP934b+5nW8GdyA
         +dEq06yGnjb3X+Y5G9QSoX1a4KKQ+IOfySf8/V3zSbe+B4t/XDQSIY93elKdk0vqyHO2
         jBM/FY4PzImriePcQ4p05As9khUzUrBWb8vsn9InqeR/0TavHZXIyxRZ89XVr+4wJvnJ
         uLpVJePK9d2cABqJFGeQF1O3WrskXz2/+mjsCRhljbd6ukqBfDDnWK18GecRR2SjhzZB
         hLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664694; x=1773269494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAE4SvbVc5xuqVfNMXPNWetx7bFn7ASO7FJPhI+jmF0=;
        b=qZYdNjlOloiXv+g6kPSAjPYjAiNys+hcexCkiQMj82n+JWQPGsHtyV9cbaDbjjBTF4
         mU8+EgNkpQiS+g649Zbtmd6c0sGM/9tJz61vNrFphowUuDkgal+lxtVdMBHDzYKiyjyP
         nnKBKoWec49kBhrqQ9522q3aHqEaHW0dNrLFqT/rEAS5+dXefDPWXW40GILLGP1ToOu/
         SzOfSx4+Ae7j31iJrHTnQIHAD5LP+dbC2FooTEyqb39J4t8a2/wUV4OiFUphsTGEHb89
         g4h38keU9k6jzv4JYMesQTLsCGsQrvUscA9tlChqNmVsXIfnW+cHF8FJcBRtM1TOW2PX
         8h+w==
X-Gm-Message-State: AOJu0Yy0HTha/1Os1tZ0mg4ZsOchxk6NsEIhsNyRbwbLgeBz0e91jvVe
	/C2wgxVS7R1X6vpDR6JpFqnFu/3vT3lRXaViigzKUx96uJP7L5LU9vH+clkHaf3vJRt+vKLbX2x
	hzj7B+g7cVDrkD1pVxdizg8YsMm/vh1t4ZXpHmTeSfj6XLqEOJ/KAihnzAuuwpw==
X-Gm-Gg: ATEYQzw3F5SH3wxSWr7g0h74a6wLh4p1up3HLk9JasTTAMguH4jlM/gvLqkMgQemuTA
	dypyiZnsh2yrJfsi1C4M0yJYxbNsxnknJ/saiu3+pvDDt9nYG6XL3hZ41B4n6uNK5lf/svHUhpl
	hL0TUjk0ooiW+X4CoVHPq8KxWGec4cFothPeHIgXI3x38KsaUMRzj4v1ihlsVi64Tuq++BI9369
	E+GlbdjbiPhvEfD+DFl5vycS9oL+wMmxm6VZYlGT6LlFqtvfIzBHxwfha5KiZKP3yd7rAJ4IgFx
	iTHxiDjZSKZn2UaTIcdhselYXmKMM+aXxpIuomCMjoGkQ8Wi2p/R6z00HJYOebdpNHsgXaMzNp3
	31/l8Q6pBuVLbVacb1WrA9IEKBE+g
X-Received: by 2002:ac8:7d4e:0:b0:4eb:a192:de99 with SMTP id d75a77b69052e-508db42179emr47830311cf.76.1772664694165;
        Wed, 04 Mar 2026 14:51:34 -0800 (PST)
X-Received: by 2002:ac8:7d4e:0:b0:4eb:a192:de99 with SMTP id d75a77b69052e-508db42179emr47830041cf.76.1772664693781;
        Wed, 04 Mar 2026 14:51:33 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:7705:162f:3db4:e16a:e5d8:352e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449b4dc0sm157558891cf.14.2026.03.04.14.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:51:33 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 04 Mar 2026 17:51:03 -0500
Subject: [PATCH 1/2] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-clk-docs-v1-1-fee468db99f1@redhat.com>
References: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
In-Reply-To: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4599; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CDynmqnNGNqeRMDqyGZQt5+Y7aUBAhjbZuUmwJcAQF8=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGmot22jq3Pe1ymtU3Tdf4xLiZ5WMCXA2cSmkAz1GcCEyn49U
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmmot20ACgkQt9LdJ11+wIdx+wEAnDgE
 VvnDipPoU2NORr6nXjeaGJxfJqE7aA1js6Fo9C8BAOrEGuk1uMfDNBdO9WepblVp4M1n0dBEfP0
 xAVgeWaMB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Document all of the members of struct clk_core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..18b7a14e3f2c595d82401be9382a062fbca8a5c6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -63,6 +63,65 @@ struct clk_parent_map {
 	int			index;
 };
 
+/**
+ * struct clk_core - This structure represents the internal state of a clk
+ * within the kernel's clock tree. Drivers do not interact with this structure
+ * directly. The clk_core is manipulated by the framework to manage clock
+ * operations, parent/child relationships, rate, and other properties.
+ *
+ * @name:              Unique name of the clk for identification.
+ * @ops:               Pointer to hardware-specific operations for this clk.
+ * @hw:                Pointer for traversing from a struct clk to its
+ *                     corresponding hardware-specific structure.
+ * @owner:             Kernel module owning this clk (for reference counting).
+ * @dev:               Device associated with this clk (optional)
+ * @rpm_node:          Node for runtime power management list management.
+ * @of_node:           Device tree node associated with this clk (if applicable)
+ * @parent:            Pointer to the current parent in the clock tree.
+ * @parents:           Array of possible parents (for muxes/selectable parents).
+ * @num_parents:       Number of possible parents
+ * @new_parent_index:  Index of the new parent during parent change. This is
+ *                     also used when a clk's rate is changed.
+ * @rate:              Current clock rate (Hz). This is effectively a cached
+ *                     value of what the hardware has been programmed with. It's
+ *                     initialized by reading the value at boot time, and will
+ *                     be updated every time an operation affects the rate.
+ *                     Clocks with the CLK_GET_RATE_NOCACHE flag should not use
+ *                     this value, as its rate is expected to change behind the
+ *                     kernel's back (because the firmware might change it, for
+ *                     example). Also, if the clock is orphan, it's set to 0
+ *                     and updated when (and if) its parent is later loaded, so
+ *                     its content is only ever valid if clk_core->orphan is
+ *                     false.
+ * @req_rate:          The last rate requested by a call to clk_set_rate. It's
+ *                     initialized to clk_core->rate. It's also updated to
+ *                     clk_core->rate every time the clock is reparented, and
+ *                     when we're doing the orphan -> !orphan transition.
+ * @new_rate:          New rate to be set during a rate change operation.
+ * @new_parent:        Pointer to new parent during parent change. This is also
+ *                     used when a clk's rate is changed.
+ * @new_child:         Pointer to new child during reparenting. This is also
+ *                     used when a clk's rate is changed.
+ * @flags:             Clock property and capability flags.
+ * @orphan:            True if this clk is currently orphaned.
+ * @rpm_enabled:       True if runtime power management is enabled for this clk.
+ * @enable_count:      Reference count of enables.
+ * @prepare_count:     Reference count of prepares.
+ * @protect_count:     Protection reference count against disable.
+ * @min_rate:          Minimum supported clock rate (Hz).
+ * @max_rate:          Maximum supported clock rate (Hz).
+ * @accuracy:          Accuracy of the clock rate (parts per billion).
+ * @phase:             Current phase (degrees).
+ * @duty:              Current duty cycle configuration (as ratio: num/den).
+ * @children:          All of the children of this clk.
+ * @child_node:        Node for linking as a child in the parent's list.
+ * @hashtable_node:    Node for hash table that allows fast clock lookup by name.
+ * @clks:              All of the clk consumers registered.
+ * @notifier_count:    Number of notifiers registered for this clk.
+ * @dentry:            DebugFS entry for this clk.
+ * @debug_node:        DebugFS node for this clk.
+ * @ref:               Reference count for structure lifetime management.
+ */
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;

-- 
2.53.0

