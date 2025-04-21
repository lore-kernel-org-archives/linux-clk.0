Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFF725C6F6
	for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220220; cv=none; b=XPfHuC+uEvCXEBlxR/h18ysVL86hFx2Zr/9tTTQEq7thmWXHtlr11HME8IZGID3ZX/Svt9TFANTxlLutF7CCZKg6mwV/o4M8O5hL7uUfQzK1xcyQc2I3B7pHrtRoe2p55Qxij7wN0MP7cCowC5eH5O2luT7+lQZuqjBFTqqdcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220220; c=relaxed/simple;
	bh=ZJOJWcwqtx8d8xu+lxGA8TNMktPEoGoBFWcawtAMpbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3RTiTOtDaIe/SAOm1KpkVg5RVK4XRszexPo7dqx3cHn4+qW9MTeaXk3gm9a+QmaXwja8FdaE78UPjkJiRr1/d4GllI+agmi0pe/UoxjNs0z/tUZk9O+0F32Lv5Uroo5OYZL4+TQHZhQY/sbcq6jAjd2hsfJM2V/3N5koQ+Dy9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJv652ZE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJv652ZE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b074d908e56so2568563a12.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220218; x=1745825018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3pQlqLezjnktSQ7+5L21Axz5wFzz+Z2e/cSw6NoPQ4=;
        b=dJv652ZEcQfCXa0RNr34erD5xSbJOhKY/6sAwlcmAAPp4irZjFSuC2xb0cmKZT/Dyp
         taIpcDURihaaRWRO1K89P6ecIxFqzEfj1gqKTsPY4h1YY0lagaID2aMH+l0La1+d2Fpn
         FWAQnRBwjlomoU6Ai5D6iKS3rnE5T6/n4xTwcb89au3oefNDE9FJTz0Bf5X9bQXl67sN
         SMDcR5uOifLGcNdoziZYm2Wq7ir1a0cI1YoPwZWA9y5Ge+s7YumRRrzPkc2aQt2sNAAm
         WLOz9ypNIqR+PnMihvXdeLe9kjsJvikgPCfyiAi8x30omvdoULxGL8sPQO5puYPOLNmz
         AMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220218; x=1745825018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3pQlqLezjnktSQ7+5L21Axz5wFzz+Z2e/cSw6NoPQ4=;
        b=kv0+u7KneCFw1885bGJ38l5aWbVBRA5ZlnxB8+JAeRDdzWemW/JPPqfY4T0Vcqz4N/
         ke5t+UkZudIalVI2rv+RMAQI+ueKG8PsUg742dhAE4EIuQIQIKOT1Yxp87UlhDiQvk8z
         SEj2ftsdNUDmtefl5S3q2UgPSSY2qKExXLIzwKAPbGZzHynI+KezBM1/hZr26vhdbayM
         5JTlFQf08HjfxXA2u8ciDOR/7Q2s/Z2YiMn38BhDy5J3FTw3pcVaWJ6D4ddqnE+WvAs3
         o9AQBB7MKZMStbh0CC2h4tyQYm6H9WXtlqeMZF0IbI/ODGYubqI/0b5aN6uqivngvPi2
         foow==
X-Forwarded-Encrypted: i=1; AJvYcCXFwJkDER6FXAeC32dzYmWuEaENUGOT95lvpLo34MVhVafxvJnqNrklS7tb1uRQgu62n4KEOtZqm+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0B748YJxxGzqULR320e6eyxZ813GuZnVrka0OzDF3yyMpd94
	dSAKUmVS4d5PY8re5wg1Y6iXvRUHQYOe/OuOEY8YjlcBOFgyU7F7nOFSxBQuikM=
X-Gm-Gg: ASbGncsTtj77+W7emjJvK6qtNBpot/Mk/ivYDeFUOxx73uf1iQvTZAY1KApf4J4Fwie
	p3fHmXy+gAYBWqdM/Ejit5oH6C/ORkuMM6QGbGe/e+45Ox93un4hqfF/cpHy1r5baPhG/qZSdx7
	HLUEuJPZYcQtxQ6rInBMdULqDzWdldZvrL99EQGNVUQN+yCL4YZKfWgiNfIPjKbos5GEApk2boG
	sJhfkZPgHa2+7fU96fiScBperMdiFK5u//QWRvvwcM7o5xaotH/duAs2/LUgzgMhzjgkN9HI1vt
	NyiZHTfeEtl1rzPZyQSO8AVC/2dkSqnXSViOp3whjw==
X-Google-Smtp-Source: AGHT+IHlVDoLLN+L2gJp3wbagUJcT5yEg2+t7LybVtpznFOf8VXDnXYsgSPRwIYaml1Cy16RF0TexQ==
X-Received: by 2002:a17:902:f70d:b0:224:2175:b0cd with SMTP id d9443c01a7336-22c535a9bbemr150380835ad.26.1745220217965;
        Mon, 21 Apr 2025 00:23:37 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4292sm59122615ad.150.2025.04.21.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:23:37 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 14/15] rust: opp: Extend OPP abstractions with cpufreq support
Date: Mon, 21 Apr 2025 12:52:21 +0530
Message-Id: <a61540db4633389016e8a885c7f6e3cc117d04ec.1745218976.git.viresh.kumar@linaro.org>
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

Extend the OPP abstractions to include support for interacting with the
cpufreq core, including the ability to retrieve frequency tables from
OPP table.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 8b61ea8748a3..985d90dc0671 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -19,6 +19,69 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
+#[cfg(CONFIG_CPU_FREQ)]
+/// Frequency table implementation.
+mod freq {
+    use super::*;
+    use crate::cpufreq;
+    use core::ops::Deref;
+
+    /// OPP frequency table.
+    ///
+    /// A [`cpufreq::Table`] created from [`Table`].
+    pub struct FreqTable {
+        dev: ARef<Device>,
+        ptr: *mut bindings::cpufreq_frequency_table,
+    }
+
+    impl FreqTable {
+        /// Creates a new instance of [`FreqTable`] from [`Table`].
+        pub(crate) fn new(table: &Table) -> Result<Self> {
+            let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+            // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
+            // requirements.
+            to_result(unsafe {
+                bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+            })?;
+
+            Ok(Self {
+                dev: table.dev.clone(),
+                ptr,
+            })
+        }
+
+        /// Returns a reference to the underlying [`cpufreq::Table`].
+        #[inline]
+        fn table(&self) -> &cpufreq::Table {
+            // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+            unsafe { cpufreq::Table::from_raw(self.ptr) }
+        }
+    }
+
+    impl Deref for FreqTable {
+        type Target = cpufreq::Table;
+
+        #[inline]
+        fn deref(&self) -> &Self::Target {
+            self.table()
+        }
+    }
+
+    impl Drop for FreqTable {
+        fn drop(&mut self) {
+            // SAFETY: The pointer was created via `dev_pm_opp_init_cpufreq_table`, and is only
+            // freed here.
+            unsafe {
+                bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw())
+            };
+        }
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+pub use freq::FreqTable;
+
 use core::{marker::PhantomData, ptr};
 
 use macros::vtable;
@@ -751,6 +814,13 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Creates [`FreqTable`] from [`Table`].
+    #[cfg(CONFIG_CPU_FREQ)]
+    #[inline]
+    pub fn cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Configures device with [`OPP`] matching the frequency value.
     #[inline]
     pub fn set_rate(&self, freq: Hertz) -> Result<()> {
-- 
2.31.1.272.g89b43f80a514

