Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EDD2561AC
	for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220188; cv=none; b=t1ioNmrLr71dvNYzT4bW/q0L0Z/hxjDCvVfr+Bu1RjtVgX9QlLXQUHUXflAMPQKbrH5a5UOjaMTAQXPk7XAyPim+4zPb0sBr6yCOs3PU4SKSkORRV8p2VsHB+XA7EAWftCBxxYTKqIWyGgLOUiwuaWEk74i9KSyf4XpV4pSx3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220188; c=relaxed/simple;
	bh=RPs39+G/2/WRBdJP3KwTQnQlR3Lp/kvURzUIgtDgvwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cYCLMyYomVHpaJFLMxnSHthFm/cBDiwo1ScWFNOV0xgjx/GDe8Vg340S7rCStt1K83ANn4IbSU8oH2LmpGdy50HWfeVjMZnz7g2BIBscsmN6Ubz6vHmN8gvfU0Np1vH3nINKz2i6dkIz3h1cmOiEBUWiZO/DFmczcbkrAVpf7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAfcsTJb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAfcsTJb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fd89d036so44642275ad.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 00:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220186; x=1745824986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=XAfcsTJbmJL+OSKmyD0WVm243+wjfepWXYh3R7aeLQlzDMSnP/r/MQEgqe17BMucAX
         s5PULFCXBcEXtR026bMFAxICr1WX2ersvA3SVA1pbSNICCJMnb3vmXzuXhUT+gNbNCHl
         tj4mkrUbu4cLe0hIk1Z99pD5T6XtKY18X6GnCPaarqahEhRkv9HXYeuOsyzpk1nCseO3
         kH/EZB2WipXcNSVzf32IVsAb1hCpDlF8oCi3pika/0lSCkYg7w4n1NmmKS+godqFojyp
         9lDSl2eN/oVDnflMpxXDvM3gOdip+5cKUTjN22ka48tZjD/gOvGZweBL0BwPcXpLqwcg
         HZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220186; x=1745824986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=rrGruptahR1WRleBE7SygoXExCVj/K5SyOPFpkr8va7lB3dZz5LflTN1yRphwibcHT
         ANW7/Y0jfhdZVZcHVPGIY/lMFVE9BpENQBcWi6u1DOKGDXxKSnSl2BPJPOGAAsFqkkwu
         zFNIVBr9NT/VgMrO1pCVQVyG3Da6J+FTqtl0XlL44Ji1MsXE4+v5c/Cq2mGP7CvRgx+V
         j8//lpAyVjZaSViCnPZDjLnnHfp2gX8wzw6JMOGOiyVAAhqcAJYPotyYe5DgAx3wWdSm
         H9BvgIcO8BMqucSN07CGvs+qk4sitQe/G+bHw7Z2EDw87WkgeJ/8F604C75TjbKAH5p5
         wmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtuCecuV7MFUJwW1QPf4XlDnqmMm+gj49XiLYhzEudodh8FZMDu8RTmILUdbakt72+zfy52kFmQN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HAYPLLj1yG2Vx8ZmvZA+3z45G8iIwiLr/XilGf31ktIOXf4+
	JOLoCVX1WT/sy6GAY7oDyYAPiHoum1lzB/PW13EnE7JSN60968EXo3/kzWiI8C8=
X-Gm-Gg: ASbGncuGHPVChDniU27XWUNkIYDSgNC3pfryHHpuerzlmfNt9LLAXIpwaMQpPwqGOMB
	UqBleego74+QqYPyEEiuN3TQ+qLZZ5V5Dm2PP1Kz7SoUKmyoUe9RL91P2+1ujLduahDJavNY83V
	cI5iOLkXpzb/xn27T03ztiCbR0SafbL2F6KseqMhN2qaLvuhWocoKcQWKNnOQHOZExwq8K+1p0x
	b/vvddjNqfelL3hnbz63qmbJqB3InMyIRughDfIzfnjAkYv0P72GsWGh7WxkYILN45Gl+e84sjQ
	BVFvInFB2mOi5OZHqUo0XqO5UNrK+eu0RW2bHr00vg==
X-Google-Smtp-Source: AGHT+IHzFs+Yl0YKuPCOslDLAjE9ywj82yfkuqAwtgX61FbjT05TSlY35lL/GVySQmYtWNQHRuL2Lw==
X-Received: by 2002:a17:902:dac9:b0:224:a74:28c2 with SMTP id d9443c01a7336-22c535aa4femr163703795ad.29.1745220186519;
        Mon, 21 Apr 2025 00:23:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf31e7sm59281455ad.55.2025.04.21.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:23:06 -0700 (PDT)
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
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 06/15] rust: macros: enable use of hyphens in module names
Date: Mon, 21 Apr 2025 12:52:13 +0530
Message-Id: <b7f534dfbb63aa0e8acfe90f122e23ad052d5e19.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
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

