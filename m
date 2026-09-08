Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443746AEE4
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 22:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908229; cv=none; b=mPbWy/GjStcjROhhaaleKtwShvsoZXDZHDtekSIgwPA3anYorDZGwme7kAb2fi4hnFNtci8Qbq1g/jG3gIhAM7UdqnHZf7LDLs3urUL5TlOX49dc01HJc+i0puzyDGrKdbMU2vEQLrI1ASHA0qEYXIL6EBwFhwkv/0rz4k1E1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908229; c=relaxed/simple;
	bh=XkixryJ6xhw8563/RoCRB90dkT/SyANOqsZRCbfhKT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDlBZWYVi0GyTCtJr/b3sHCFH2oIYhW+V3pE4zr+0MhoJ/XbM6JiKKwc6DMEi+CAEVCcOsC+v3WVp5cX4bvI9DtO5gqSWHReJlAnNN68LUdwl+YD0hqRxI5r+AVK/1VwiqHj6LB8DcRU/fGcv1Z7pEvr29fJJY1AYeB2MlYX42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvlw8Q1B; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvlw8Q1B"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9399d91ee7aso349843585a.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908226; x=1789513026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0nTiw6DiAHBL12WLJk9/nfr01yMXuLmUjwkrlJeooc=;
        b=jvlw8Q1B2N8SmqZqnPrDXYLnKyfMT8DcG08s+EuBJRGNnjsSZFz5jYPVOeOjC6abIk
         V64X0NUOFiE+PAd4nP2/e7rTzTlm0OpQ2zBIkhF5w3j4vaGAC3IFaa8vqFs9PX2cW3cj
         Q8g87hIqmiE/YlPnd1VA4oIeEHRho++27DUgolwxHJtSS6bfb4an+vD9LXvytqQtuMbu
         AG7hCjxcAD/Jv9jIqpY+5bt9tXDFKd1OPUqSjpdd1EPH6cSDWNvJbjN25C+jmXlSW1AQ
         uK55/X/Ps8dmIR2mOlQBYDz9hAwKQRxjGGpdRXInJeMpOXM9IaWMf7yhu/khRRogFp89
         fdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908226; x=1789513026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0nTiw6DiAHBL12WLJk9/nfr01yMXuLmUjwkrlJeooc=;
        b=IoLLsDP+TYV/dUOSk/4Z4+mltUGGx3DsbB5MQejiBQP414VKPfiWYTNg9vscco9S4E
         rA/ecQd6jU2exw9OqA63wQP+ZtT69Nvvrqz+P8kE65RX9SOlgkRtK5ZfD0MZ4czXOq3O
         zzJcsoiMfDqAF99J/myZsh++jsu98XqyYobYCYTvcunBycWqSyiu6+alPSSj+Y7p0b1e
         ykXMiwW54bZKltgI8W4NFLuBqY9oQKFFG/hsWmpdyXEK++bzn5cWA2S9ZlLL2h50K4aR
         9MjYP8eK/lDXtrZMy4uM3qjnZ9LfUSPBvv5d2R8fW/lm08QkLBds/9DTgDR5ZxUkjF1k
         PJcA==
X-Forwarded-Encrypted: i=1; AKwUvBw8MEc0srNDBRjx3iUnx8CytsIMQuRhnnQ6hQ2ZyCedL8e6kxdjuexFGToRlA6oBX3p6gDcQTS3tqs=@vger.kernel.org
X-Gm-Message-State: AFuF++n/FsO6NGj/Ehxd3H8TfGLYpniT8797TCNMo83kQCDKIJZboNik
	7mLJO4uXR5PYooqVm58axdwEfEXYq4500WNSPD5Eq0zJSBd1fLTV+8iz
X-Gm-Gg: AYBFou08Z7X2U/g1zQMsguugf2RzuGqUyYISbycaL0FPFxEwhSFEGv5USFMX9DUpDOV
	Fkrw0FWV9JdDoNL37139bt6IAkspFDubhoU7nVxBCBBUP8VsVzjxWzswXN6TWFl0SsIUWnonhY+
	RbX9OCgaZA0Y2V5zjso1VRpYSsZFo8FeGqmM2Q6se8/pdBlfnSsZPhwMx86VwfUkG/jZ6cJXAYr
	n78mR5uKc+2O9gtLLiEVAJ4l9xnvShFF3tYCj4rCAB7yrGWXnH7y54MwzbVCQ5jSb59Nli+sFrr
	j//7qK0CsOu7Kobz0TYQQnC59wf4+ihfzvXSLlrGAM3N135k2513RkqKmZnPp1G3FZgU3CZy2g4
	fnV38sL8qpLUK8HUsfacDnkbMDdLPVe4OSTDjBsrpArqkuqTxbAGXdhZwpZlwvjBCGRKXz2Yj1W
	sMFeoTcMvnCpT1JaZLBqP8yCfp9mg1xGOhf1FCTjO/SJhGlxy1xC3IWbHVfs4=
X-Received: by 2002:a05:620a:410c:b0:936:bcd8:8650 with SMTP id af79cd13be357-9398072a3f9mr3588825185a.38.1788908226211;
        Tue, 08 Sep 2026 15:57:06 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406afe48sm127700986d6.43.2026.09.08.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:05 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
Date: Tue,  8 Sep 2026 18:56:15 -0400
Message-ID: <20260908225615.1732105-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
each panics once its argument exceeds `c_ulong::MAX` divided by that
factor. None of the three documents this. The panic occurs only at
runtime, when the argument is not a constant expression.

Add the missing `# Panics` sections stating the bound for each unit.

Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/clk.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 7abbd0767d8c..f04f5c4a03d6 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -35,16 +35,31 @@ impl Hertz {
     const GHZ_TO_HZ: c_ulong = 1_000_000_000;
 
     /// Create a new instance from kilohertz (kHz)
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled and `khz` is greater
+    /// than `c_ulong::MAX / 1_000`.
     pub const fn from_khz(khz: c_ulong) -> Self {
         Self(khz * Self::KHZ_TO_HZ)
     }
 
     /// Create a new instance from megahertz (MHz)
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled and `mhz` is greater
+    /// than `c_ulong::MAX / 1_000_000`.
     pub const fn from_mhz(mhz: c_ulong) -> Self {
         Self(mhz * Self::MHZ_TO_HZ)
     }
 
     /// Create a new instance from gigahertz (GHz)
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled and `ghz` is greater
+    /// than `c_ulong::MAX / 1_000_000_000`.
     pub const fn from_ghz(ghz: c_ulong) -> Self {
         Self(ghz * Self::GHZ_TO_HZ)
     }

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3

