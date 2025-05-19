Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E1269808
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638488; cv=none; b=IlSJ8ImVca0edzUPP6xOyV+gn/kQgrhHLY8adjQm+MRQvAXmMN4jfPg8dxE9qynwxplzNYr7LWcB5UKWV321lxO4CH0rZaKEd7pdkkIZJKUiAmcQdpaMbknpCHPVs9JXLTDZQQscYxsWIhUbJqsNG9czGdZwulagEi2FLwGRUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638488; c=relaxed/simple;
	bh=RPs39+G/2/WRBdJP3KwTQnQlR3Lp/kvURzUIgtDgvwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qupdL8hob0S+CW2+eyycgVDSsUw9PBrXR+KqFVmvDn/24jXxKMKZHCFI7LS4TU+nt6N69mhlaeDdcTlc0w8o0m5WhXDi390Gso5aUG9YIsNRYH9UXrm80TmQ479i/UFQPpyO6H410WFIJIaViTdkEi/a32Cjn+/+AxHj9Vm6Fjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpvJi+Kr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpvJi+Kr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3602004b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 00:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638486; x=1748243286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=TpvJi+KreG9k+1tnyhg46J2UAumtPDce3pxuk/EPgy9RF25DuB/valuzxXRAOIzTX/
         5zr5MF4xvECZ3/d+xd0M24bFSUzUOtAN24ifMNxOgaFLFeYy16psv0DRCgTt8rzNaK1g
         hGphfvcsFtV4K5sjUuyugXdLGPIfWxl/ktSsqZ6z0mIpMYWBK5Y1VXjTCOyp0beMSAD0
         uOer9o4z9VYJwtpYkawNXQCfECTbUDncvYusT5Ml6duR/7j3ibBX6PdpTUnOrKhEsPtF
         I8praT4zGMDz5KdygZFooZovOscrT0qfiBc1aIb4kmBiVWPQt37P9ykwEnd9NY8M9KF9
         3p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638486; x=1748243286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=Zt2kCxP808+Hzuo/JLrOs48Xw8SlmKqMkqoEXAFNklz0K5RRgNV9tobvmhYnXB4oj0
         PrtgNUD3VLXJkMGRk9od0lyLew33aGejUC8Yb8zUr++c7wMaxTFEmqLxpE/vXyl09K50
         ikPSy5bbFLESlGpd5YjvUCbTjTN6QDCz4x3q/Zo8mUVdYsAy/zz0YM0gvLAecfAOZvnl
         fwLDDvPd7qW+hAfKAL7Mk0eEa4vca7v89xe+Z9c6QFrSZVS/FdUNtm8Grh+ILEIp137G
         B7O2JZ4irqq1VJamKm+1Ecg3VCW360s4HrLDy7hCe492exw3mzhSNAe44b01p3ss99al
         4uHg==
X-Forwarded-Encrypted: i=1; AJvYcCUMPXvh0F79Tze7bHCeTmr4dDf+OibvTziqqHFLaVPtP8P+D3rqWBn1pfdcNfvcRQC9cwSZ7Qz57so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAYadlaMFAHLK8UK2rXtHdMyMadNkW0usuTAVaOg9258a3Ald
	D1Q5h2J5BqsIERMbcGfob2BrXOfwnvPR19/BvQCxlxd94/IxHxBn+P6Bf8ofy13ZLiI=
X-Gm-Gg: ASbGncsKfOamqyXgtxBuPsKjZFDcCVok98fQeOg4PQQhsvLscsJGp65JgzLahK1A/xN
	9tanEIYAG6VonizFTH6v4SbVa7tbVFnBC0miYOWmza0nLPGc2xa1sBJ2CbwjCATyA9J74EyXopC
	SLpwrmzGkA5qg9dho17uSwp2+beEvbSGVHH9QlhJXorIBd01teiYrCGPS/ws/d3QfT1Z1ike8GQ
	GYZOYoNCc2AoCELRfooQTwF2dUeXFp0JKBLMIz4snZlT77Me2srdIXP8zzN8QzToHMV0u1OBRkH
	jt5ZyWFPsvoVVNysU4gmhOeysWGw/aBWk7GN/c9kFSFWg00+HmzY
X-Google-Smtp-Source: AGHT+IHDxTCILxiZSszxnTc982DJY8orsb9n0sCiFXe5hNTg/g6o+f+sr8ozsUbLXvO9AluZPucbQw==
X-Received: by 2002:a05:6a21:a0cb:b0:218:c22:e3e6 with SMTP id adf61e73a8af0-2180c22e3fdmr15396853637.12.1747638486393;
        Mon, 19 May 2025 00:08:06 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742acb8731esm5294876b3a.168.2025.05.19.00.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 06/15] rust: macros: enable use of hyphens in module names
Date: Mon, 19 May 2025 12:37:11 +0530
Message-Id: <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anisse Astier <anisse@astier.eu>

Some modules might need naming that contains hyphens "-" to match the
auto-probing by name in the platform devices that comes from the device
tree.

But rust identifiers cannot contain hyphens, so replace the module name
by an underscore anywhere we'd use it as an identifier.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
[Viresh: Replace "-" with '-', and fix line length checkpatch warnings]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/macros/module.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a9418fbc9b44..27cc72d474f0 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -185,7 +185,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
 
     let info = ModuleInfo::parse(&mut it);
 
-    let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
+    /* Rust does not allow hyphens in identifiers, use underscore instead */
+    let name_identifier = info.name.replace('-', "_");
+    let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);
     }
@@ -310,14 +312,15 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name_identifier}_initcall: extern \"C\" fn() ->
+                        kernel::ffi::c_int = __{name_identifier}_init;
 
                     #[cfg(not(MODULE))]
                     #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
                     core::arch::global_asm!(
                         r#\".section \"{initcall_section}\", \"a\"
-                        __{name}_initcall:
-                            .long   __{name}_init - .
+                        __{name_identifier}_initcall:
+                            .long   __{name_identifier}_init - .
                             .previous
                         \"#
                     );
@@ -325,7 +328,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name_identifier}_init() -> kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -335,13 +338,13 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_exit() {{
+                    pub extern \"C\" fn __{name_identifier}_exit() {{
                         // SAFETY:
                         // - This function is inaccessible to the outside due to the double
                         //   module wrapping it. It is called exactly once by the C side via its
                         //   unique name,
-                        // - furthermore it is only called after `__{name}_init` has returned `0`
-                        //   (which delegates to `__init`).
+                        // - furthermore it is only called after `__{name_identifier}_init` has
+                        //   returned `0` (which delegates to `__init`).
                         unsafe {{ __exit() }}
                     }}
 
@@ -381,6 +384,7 @@ unsafe fn __exit() {{
         ",
         type_ = info.type_,
         name = info.name,
+        name_identifier = name_identifier,
         modinfo = modinfo.buffer,
         initcall_section = ".initcall6.init"
     )
-- 
2.31.1.272.g89b43f80a514

