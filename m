Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227E221421E
	for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220186; cv=none; b=jTC8QZ97NiQkcCtlAkKy7aJscl+9/dYdc40z1EhsFrTl5eZoGMVVRlKH0yOSodwe4aPrq1brImR/19T94a/ti2Xn5f0andrCzsg5iCLTfQtRhqPC97TlUpr8Kh8RYHKsCs5bhb7+Fxxy3oDZhYkpvoNB3gMP82jA2uCGntduLYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220186; c=relaxed/simple;
	bh=OK9LP8IuB4dZ4tNPJ7BqHK7tgUFvTgGIoVzWhWAVPdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tk36xUVQcD4BwL9VaePxvcQwHu4tVRC4dVG6KB2sORXr7IAzVKb1h3+aul8JuEzrhq1dwoRAxj+hCkTXncNGSMjwNmTPpyl/DZEZrVbz3YeWPZvyQrBlulGPPHEjzW36Fg5m+QYOr4x+Iv5/PQ60ixyZsCPEoMxOvQFV5/zhk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1uCaZDl; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1uCaZDl"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af908bb32fdso3080083a12.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220183; x=1745824983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiIzVJT0XSWQl5nAIRSPSyCufgx9olJIUW0gvaR0zI=;
        b=M1uCaZDl8ZuuVrXq4TUUL++JNgnHWs5QsYSKl0tPyNQayOy9dKOeFk2THoVExq7BLE
         Dy6cGYijQMxN4ND5sb4LuxnYJ9Qp/1bBAz7MUbm29THxgsLcY67QzvRlcDkr5NphjZp7
         RI36sx3T/nnvRK94U2pqj2Msqr/D/ecwK2Enk2buXxYz8tuwsXIHu2A9pOorD/ZJmjKf
         yL9cvkVS5gUgBFS0g4Zh98vHUQLfERX+q7RVtoRhl+pp+6OnT0Y04MW3XV+I1EU4nV9d
         Dj97yQKXc+mdaiGaMfijG56N47UbqGgJ0uD9umRVVbWRZGYV6an7M83NI8dT+p5bOVz6
         T0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220183; x=1745824983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiIzVJT0XSWQl5nAIRSPSyCufgx9olJIUW0gvaR0zI=;
        b=MHkgsCSQJ4Bi4dGMxEGjF5cOTKN5GhV2yzjo/rjZNurr37ypuVITEGYOSgrNcFaeQt
         zN1OsYRpE21o/+pY3l+OHIFUIbZxce/yvx7riyfcuSGdSwhhZ6HHkwvLZZ7/n1J7/diH
         reXQvXHPUSn5nnb0uXKyezJD1KGGPqy0UQc9K6oNfdbO8mVrxS9qv4ZqbzVK1jxJ5EFh
         f2lOkzt6E63Q7BkWBNHXOZVOKU0L+gYmdwEmIMmQRVxW2k4QbapF8VOCWXVke2KOZPB+
         9tEap6OtcpqOo0I67fwf9J+Lug4tOEhtlh/2i33YBqsVZo4/J/R/QRCHxR3ChkWFNmqc
         tH7w==
X-Forwarded-Encrypted: i=1; AJvYcCVr/eCCqskR6kRw/w6eEW1q74+iqHnkotBQ634T8hoqgLusT5uPT6QEZVxhvVfY+WmBCygcwRl3rjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZiOTJ3lYM9JX83HgfMuVRVRt+Ue9AqRScmyByeXvU+2nsdOD
	cZ2YhQ8b1hFjWTFugqZS3U4YU0aaBlAOkJBs90mScYiDS0Tbgb+eIs/B9Cmq/vw=
X-Gm-Gg: ASbGncsIJckMJoZK77Hc9jtHHtk26bxhw1cyzKQAS0Gaaf3cWualz6WqEaa9GdTMmj6
	lT8GpwHFyzZ3PwJ8Ymnk9nNrG7cRZY5J+Ms1L540SQFvEOepiQ4ZQ++NCVHy0/t0NXlPBzGooEG
	So9TUqYWmggK2R3OwuLnWHXmohXRWBK37AxvciWlhwhh6Tm/+KpveK0xL4LY/hDkOfrgvhkK2HQ
	7Q8F7NvNMtv/pXaKjNeKS5Ny0wLWNkIK/9/aZurMF0fUJfydWljrUTInXLRB7MXqJIC95xtcgRR
	qvk3nYdVMnQBWvdpIaT7M6HmU5kHnZhtyoboJgPggg==
X-Google-Smtp-Source: AGHT+IG/K1n9MVVWhTOCeTnXsbYnm9I3PSY9j+F3zLgSt0JORaaGUxrZBw1+JjRYJ5ORjK0iHn/kNQ==
X-Received: by 2002:a17:90a:e18f:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-3087c36106amr16259582a91.14.1745220183161;
        Mon, 21 Apr 2025 00:23:03 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee8956sm6708675a91.8.2025.04.21.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:23:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 05/15] rust: clk: Add initial abstractions
Date: Mon, 21 Apr 2025 12:52:12 +0530
Message-Id: <4207f5bf540de148e1bd31a88dc75eaac1aaf897.1745218975.git.viresh.kumar@linaro.org>
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

Add initial abstractions for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward
to introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS        |   1 +
 rust/kernel/clk.rs | 318 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   2 +
 3 files changed, 321 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 608689342aaf..12cde55579a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5884,6 +5884,7 @@ F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
 F:	rust/helpers/clk.c
+F:	rust/kernel/clk.rs
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..698e05cd41f8
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+//!
+//! Reference: <https://docs.kernel.org/driver-api/clk.html>
+
+use crate::{
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    ffi::c_ulong,
+    prelude::*,
+};
+
+use core::{ops::Deref, ptr};
+
+/// The frequency unit.
+///
+/// Represents a frequency in hertz, wrapping a [`c_ulong`] value.
+///
+/// ## Examples
+///
+/// ```
+/// use kernel::clk::Hertz;
+///
+/// let hz = 1_000_000_000;
+/// let rate = Hertz(hz);
+///
+/// assert_eq!(rate.as_hz(), hz);
+/// assert_eq!(rate, Hertz(hz));
+/// assert_eq!(rate, Hertz::from_khz(hz / 1_000));
+/// assert_eq!(rate, Hertz::from_mhz(hz / 1_000_000));
+/// assert_eq!(rate, Hertz::from_ghz(hz / 1_000_000_000));
+/// ```
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub struct Hertz(pub c_ulong);
+
+impl Hertz {
+    /// Create a new instance from kilohertz (kHz)
+    pub fn from_khz(khz: c_ulong) -> Self {
+        Self(khz * 1_000)
+    }
+
+    /// Create a new instance from megahertz (MHz)
+    pub fn from_mhz(mhz: c_ulong) -> Self {
+        Self(mhz * 1_000_000)
+    }
+
+    /// Create a new instance from gigahertz (GHz)
+    pub fn from_ghz(ghz: c_ulong) -> Self {
+        Self(ghz * 1_000_000_000)
+    }
+
+    /// Get the frequency in hertz
+    pub fn as_hz(&self) -> c_ulong {
+        self.0
+    }
+
+    /// Get the frequency in kilohertz
+    pub fn as_khz(&self) -> c_ulong {
+        self.0 / 1_000
+    }
+
+    /// Get the frequency in megahertz
+    pub fn as_mhz(&self) -> c_ulong {
+        self.0 / 1_000_000
+    }
+
+    /// Get the frequency in gigahertz
+    pub fn as_ghz(&self) -> c_ulong {
+        self.0 / 1_000_000_000
+    }
+}
+
+impl From<Hertz> for c_ulong {
+    fn from(freq: Hertz) -> Self {
+        freq.0
+    }
+}
+
+/// A reference-counted clock.
+///
+/// Rust abstraction for the C [`struct clk`].
+///
+/// # Invariants
+///
+/// A [`Clk`] instance holds either a pointer to a valid [`struct clk`] created by the C portion of
+/// the kernel or a NULL pointer.
+///
+/// Instances of this type are reference-counted. Calling [`Clk::get`] ensures that the allocation
+/// remains valid for the lifetime of the [`Clk`].
+///
+/// ## Examples
+///
+/// The following example demonstrates how to obtain and configure a clock for a device.
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::clk::{Clk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::from_ghz(1);
+///
+///     if clk.rate() != expected_rate {
+///         clk.set_rate(expected_rate)?;
+///     }
+///
+///     clk.disable_unprepare();
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`clk_get`] API.
+    ///
+    /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr()
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`Clk`] goes out of scope.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw [`struct clk`] pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+
+    /// Enable the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_enable`] API.
+    ///
+    /// [`clk_enable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_enable
+    #[inline]
+    pub fn enable(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_enable`].
+        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+    }
+
+    /// Disable the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_disable`] API.
+    ///
+    /// [`clk_disable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_disable
+    #[inline]
+    pub fn disable(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_disable`].
+        unsafe { bindings::clk_disable(self.as_raw()) };
+    }
+
+    /// Prepare the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_prepare`] API.
+    ///
+    /// [`clk_prepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_prepare
+    #[inline]
+    pub fn prepare(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_prepare`].
+        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+    }
+
+    /// Unprepare the clock.
+    ///
+    /// Equivalent to the kernel's [`clk_unprepare`] API.
+    ///
+    /// [`clk_unprepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_unprepare
+    #[inline]
+    pub fn unprepare(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_unprepare`].
+        unsafe { bindings::clk_unprepare(self.as_raw()) };
+    }
+
+    /// Prepare and enable the clock.
+    ///
+    /// Equivalent to calling [`Clk::prepare`] followed by [`Clk::enable`].
+    #[inline]
+    pub fn prepare_enable(&self) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`clk_prepare_enable`].
+        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+    }
+
+    /// Disable and unprepare the clock.
+    ///
+    /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
+    #[inline]
+    pub fn disable_unprepare(&self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        // [`clk_disable_unprepare`].
+        unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
+    }
+
+    /// Get clock's rate.
+    ///
+    /// Equivalent to the kernel's [`clk_get_rate`] API.
+    ///
+    /// [`clk_get_rate`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_rate
+    #[inline]
+    pub fn rate(&self) -> Hertz {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_get_rate`].
+        Hertz(unsafe { bindings::clk_get_rate(self.as_raw()) })
+    }
+
+    /// Set clock's rate.
+    ///
+    /// Equivalent to the kernel's [`clk_set_rate`] API.
+    ///
+    /// [`clk_set_rate`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_set_rate
+    #[inline]
+    pub fn set_rate(&self, rate: Hertz) -> Result {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_set_rate`].
+        to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_put`].
+        unsafe { bindings::clk_put(self.as_raw()) };
+    }
+}
+
+/// A reference-counted optional clock.
+///
+/// A lightweight wrapper around an optional [`Clk`]. An [`OptionalClk`] represents a [`Clk`] that
+/// a driver can function without but may improve performance or enable additional features when
+/// available.
+///
+/// # Invariants
+///
+/// An [`OptionalClk`] instance encapsulates a [`Clk`] with either a valid [`struct clk`] or `NULL`
+/// pointer.
+///
+/// Instances of this type are reference-counted. Calling [`OptionalClk::get`] ensures that the
+/// allocation remains valid for the lifetime of the [`OptionalClk`].
+///
+/// ## Examples
+///
+/// The following example demonstrates how to obtain and configure an optional clock for a device.
+/// The code functions correctly whether or not the clock is available.
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::clk::{OptionalClk, Hertz};
+/// use kernel::device::Device;
+/// use kernel::error::Result;
+///
+/// fn configure_clk(dev: &Device) -> Result {
+///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+///
+///     clk.prepare_enable()?;
+///
+///     let expected_rate = Hertz::from_ghz(1);
+///
+///     if clk.rate() != expected_rate {
+///         clk.set_rate(expected_rate)?;
+///     }
+///
+///     clk.disable_unprepare();
+///     Ok(())
+/// }
+/// ```
+///
+/// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
+pub struct OptionalClk(Clk);
+
+impl OptionalClk {
+    /// Gets [`OptionalClk`] corresponding to a [`Device`] and a connection id.
+    ///
+    /// Equivalent to the kernel's [`clk_get_optional`] API.
+    ///
+    /// [`clk_get_optional`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
+    pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr()
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
+        //
+        // INVARIANT: The reference-count is decremented when [`OptionalClk`] goes out of scope.
+        Ok(Self(Clk(from_err_ptr(unsafe {
+            bindings::clk_get_optional(dev.as_raw(), con_id)
+        })?)))
+    }
+}
+
+// Make [`OptionalClk`] behave like [`Clk`].
+impl Deref for OptionalClk {
+    type Target = Clk;
+
+    fn deref(&self) -> &Clk {
+        &self.0
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 75f78f6bfaa6..f4dcfefe94be 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -42,6 +42,8 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+#[cfg(CONFIG_COMMON_CLK)]
+pub mod clk;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514

