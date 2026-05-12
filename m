Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B9296BC8
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549745; cv=none; b=pgei+kb2FT+c9uhhdFqYcKpzVzemJQzMvLaYUpXZX1dADmLBvPLJTu/3XK/eRdbpCe6k4KJUah5pHOigxFcA0f8kOaUy2cFiDqAnN+wQDRW4UoansxCGtDR7UHjOWEJBV71CAiWA4uDtlO+haOWdU4ctl2KJdkeePhN/8O+wGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549745; c=relaxed/simple;
	bh=skbb3Q/KpEBzJJ4+xxmqbXyYsu3zxBB1F90017Iknys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9CXQR4jNKItUU65AkR0iOd5xcAUjgCkMiDgKBscNV4kcZTPe2WphsQBbzFCqeSvw6VSk2dA1sJBK6x45fmppDZVYOSku93AWRnL2c9a1Q4s/BSwHaSHOUXr/ObsNhpDIvQIoKQCYviByAhlt8F4+oAQeHvRXqbfNq0+fCBkEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ie/49oom; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZn5pdml; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ie/49oom";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZn5pdml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
	b=Ie/49oomcCQZvMky/dXDblKk8S8TXBLLif0bLaz64IUVBMXXUbPvGjpw0c/1zts/XPoyhI
	G1jSUO+nO0WasVrH7dn5jx6svvW1oq0QpHMEMKUdN5wPmQJzDQFXVwEt5AuVc0M9eBl+lO
	qRE0UNpr8jpQVrreBDGfzLYbibK8Obc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-K7f5YHD4OmC6VcACeeQUew-1; Mon, 11 May 2026 21:35:41 -0400
X-MC-Unique: K7f5YHD4OmC6VcACeeQUew-1
X-Mimecast-MFC-AGG-ID: K7f5YHD4OmC6VcACeeQUew_1778549741
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b640ede74bso87310986d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549741; x=1779154541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
        b=aZn5pdmlFziVvA6r9QT73vRGA3LMYnETmTGReIRYfApgbVb4Nu4OGzWOB8FaoRBnl0
         lYlri1OCp5bTDUYuzC4vh17ftWWQ6D9zmiaAIoG6lVyJ+hNvzlZY2M7/wbzOlcXrZ2q9
         gPsx7MKoYd9GwsZkVrsepnavPW5dDNTg4HLSfqEIRssE+EEJjstealolgQu1ab7UBDDJ
         BtDCPPWCmLhMbFQ2mZNHyslHTwL2DhsONDPNgtWqQzNdj8ouViCIAuRQQHiAt5y59fg5
         AdBkIK57sm+5ORcvcfyxWnYulj/YxeJ0YSGQy/bshMz2I1WAsGGyrlr85HZ3ORnU/4me
         6Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549741; x=1779154541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
        b=fpgG9wILjNGeSRXhHMcWlSU8/vfXshr1vYG3M4HaQAAHTyKr3Ab0+9ysoYy447z5xO
         rjY9RivAHlsD3YqS4lgPgboPFmzQkVB1QK9uDnBpV8Px2D3MgGKwEZV/8FHb8T65AtDe
         zb1rywKbWOeeoGM1/XNQtOX0e75qOgI+hhzD1i/7inpcLm5huJuvwUMCCvmtyDtc+YLE
         hkS8Dy8ngAGz5Iq6YTj8g5NAI57zcC0+O+m7B1j9X/0P5ezJZu/CuioEoVC672vvNMql
         PqCWX6DdAJsI6fB9BXajs19lkI5m9xF+Elhb40/5X0RGZ3nZZB2kcW4MNqiowMwOJhnx
         WaEg==
X-Gm-Message-State: AOJu0YyMvndhONA4lYz8FgN4FB8Uo9Md+BKoyLRdOM9aLU82Q9d3PaLd
	m2w1dXcxeEFvL0//Gyu2ZisZELTf0aASlIGVczpifFX4A8qy5AxhFZ2OVGX8DFaTIoGmdJrDycp
	/sbomfu5zFZ6WDEkLRp926at2twe8okLXVaWUzzhdXfh1/xw8K1Bo3WiFFhfIbA==
X-Gm-Gg: Acq92OG+uKoPmEXAOJlMu1J/HQcyrASNdu9RGH6KwI7l53eQ4ORdA86n0HEXUpTTvij
	40nuJvT8aLGKQghIAhB0/JTsCKb7mElfhZcYesa+kk5V/ZSFriGXX4yXfXWapal71iTiMlUP2s9
	yluROEFAl3XzPh6TjHpJk9xOtFWz0Kl/kT0sTtM95lKxPHMK4fv1PqNpQbjlPtOAB38n9Chi+d7
	8lOBRk60gHGrFpeimhtRXaQIwr/2kTivrdW7gKZlTbS6DXsvqeilN+l4N5MxsO2ysQJbBzImTmO
	6LnKgJn3TVQ8OP55o7eoJ7nk4gEGXShskpaBxYXO3bxvfTa9dbgc+zETWu0/OZVSKfIIj+YK1OU
	+JAmtvgJ080QbD5/yR2U0CUSmTGT8X/uGBZAFbG5o/Y8uGsUmurb9nYQ5G+EXVA==
X-Received: by 2002:a05:6214:484a:b0:8b7:7594:b37c with SMTP id 6a1803df08f44-8c6619b4bbdmr15253096d6.17.1778549740912;
        Mon, 11 May 2026 18:35:40 -0700 (PDT)
X-Received: by 2002:a05:6214:484a:b0:8b7:7594:b37c with SMTP id 6a1803df08f44-8c6619b4bbdmr15252816d6.17.1778549740505;
        Mon, 11 May 2026 18:35:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:06 -0400
Subject: [PATCH v3 3/4] docs: clk: include some identifiers to keep
 documentation up to date
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=skbb3Q/KpEBzJJ4+xxmqbXyYsu3zxBB1F90017Iknys=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmp+eStNSy2efyhoat3uV8vy/B+6dM/Zck7c3voclv
 WtaWs71jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYi68rw36eteYq8jJ7a44U5
 lUZHezyvHn339Lpq2v0XMy0ETOr+8jIyXLztI5/OPu3B4bYEtcNNTafXqNXzXi7xOhdwNtshjv0
 hLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The clk documentation currently has a separate list of some members of
struct clk_core and struct clk_ops. Now that all of these structures
have proper kernel docs, let's go ahead and just include them here via
the identifiers statement in kerneldoc.

While changes are being made here, let's also include the clk flags.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst | 58 +++++++++-------------------------------
 1 file changed, 12 insertions(+), 46 deletions(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index c6aca8186a78..294ead519bbf 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -42,21 +42,8 @@ clock interface.
 Common data structures and api
 ==============================
 
-Below is the common struct clk_core definition from
-drivers/clk/clk.c, modified for brevity::
-
-	struct clk_core {
-		const char		*name;
-		const struct clk_ops	*ops;
-		struct clk_hw		*hw;
-		struct module		*owner;
-		struct clk_core		*parent;
-		const char		**parent_names;
-		struct clk_core		**parents;
-		u8			num_parents;
-		u8			new_parent_index;
-		...
-	};
+.. kernel-doc:: drivers/clk/clk.c
+   :identifiers: struct clk_core
 
 The members above make up the core of the clk tree topology.  The clk
 api itself defines several driver-facing functions which operate on
@@ -64,38 +51,17 @@ struct clk.  That api is documented in include/linux/clk.h.
 
 Platforms and devices utilizing the common struct clk_core use the struct
 clk_ops pointer in struct clk_core to perform the hardware-specific parts of
-the operations defined in clk-provider.h::
+the operations defined in clk-provider.h, and can set one or more
+framework-level flags documented below.
 
-	struct clk_ops {
-		int		(*prepare)(struct clk_hw *hw);
-		void		(*unprepare)(struct clk_hw *hw);
-		int		(*is_prepared)(struct clk_hw *hw);
-		void		(*unprepare_unused)(struct clk_hw *hw);
-		int		(*enable)(struct clk_hw *hw);
-		void		(*disable)(struct clk_hw *hw);
-		int		(*is_enabled)(struct clk_hw *hw);
-		void		(*disable_unused)(struct clk_hw *hw);
-		unsigned long	(*recalc_rate)(struct clk_hw *hw,
-						unsigned long parent_rate);
-		int		(*determine_rate)(struct clk_hw *hw,
-						  struct clk_rate_request *req);
-		int		(*set_parent)(struct clk_hw *hw, u8 index);
-		u8		(*get_parent)(struct clk_hw *hw);
-		int		(*set_rate)(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long parent_rate);
-		int		(*set_rate_and_parent)(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long parent_rate,
-					    u8 index);
-		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
-						unsigned long parent_accuracy);
-		int		(*get_phase)(struct clk_hw *hw);
-		int		(*set_phase)(struct clk_hw *hw, int degrees);
-		void		(*init)(struct clk_hw *hw);
-		void		(*debug_init)(struct clk_hw *hw,
-					      struct dentry *dentry);
-	};
+.. kernel-doc:: include/linux/clk-provider.h
+   :identifiers: struct clk_ops
+
+Core flags
+==========
+
+.. kernel-doc:: include/linux/clk-provider.h
+   :doc: clk framework flags
 
 Hardware clk implementations
 ============================

-- 
2.54.0

