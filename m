Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929262BE7A0
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369196; cv=none; b=T9FXLCYmudNcHCTGQesN9vItjnP8B+e3IIFvQ0iFCWvxHRmWjPz8Gmhx/HSO3JwtzVvd+vq6sTuQ79Mnx8KIEEWwivCtfdy+z+WOjbfJYzYJE/oxqhIJ1hSkub8YoDL5jaSZLxiYlSG6kFLMD5Lx4OFxLEDKDBBuluvve7LPS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369196; c=relaxed/simple;
	bh=ve4uaTlnpOk59FdaBaj9fjJnck3Vslx0Y5m1STEhIVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AwVZpq82tzQu+od2ooSdunn+8T8+dLeumxPVPD7OoisW3LCbhEP2KFc6TWXrk8aOr8Z18zY+Psi7Ee1m3j2UYuNoEmLbQ5rK9oaET98NLcBiX53CVS+3RGQcKPwQ3Wo+33ce2t3mMlsNEgg+RL/4/1h41gTFu7Sx7cW9y8Lr2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekDGQ6tz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekDGQ6tz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223f4c06e9fso18438345ad.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369192; x=1744973992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwItONSje7IwudOg4/U5GXZJbPWqvM1n8G6qlnqWHvg=;
        b=ekDGQ6tzQoj2wO/pxz51ld/mcgOq48XaaSGdc/+lBGklDeR8PSnRhowCGB/GKpfAm5
         GoTqavZEumeSeT7p1vWlR/fqqt6/5XOJJWXJT5ZrizvhGru/17qtqaQaDEeoVak0Clfs
         LwaL6L4nvJ+GsfN04ZgXNtnxhO1IwEi0pCw4474EyoXZ2cXkfCq1ajydDRssbwLgDAz7
         /G296n3sZN7X/n9uxh2y6mhYvmO+toV2VUmJmpOWGfsDgN2k2Q6QZmPztKa1GfCh5OFE
         P3+S1e4uFTIVYk9Kj3FzpnYmGR+/h+btOLZd5276IYKXIt8hSy9Om/pOs9QHWgbpMFsK
         THAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369192; x=1744973992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwItONSje7IwudOg4/U5GXZJbPWqvM1n8G6qlnqWHvg=;
        b=BgDeKNDo78N8X75kx8B6XkHSyoHTwCHyRfyUhJ3aLBswmPzALgwuJegCpBPZTQazRO
         Bd2HRru0YwD6oJp4y+584trA2yk0zG1YPe97aX+hVEtV3qeb14ISlCU6dnNA4ixD9KdB
         cEUvpGacZSTbWwgZENqX/tepncEosiWOLivI7Tsf1LEhBTk+1AjVnFLhNyst+Wyvbkf0
         AremNpXY23JURM5kQr6oSRqcFp/5MtZq51b3Q5ZcjdKLsvIFJYx3GSBZXI/9J9oBXqPH
         ebVqiwZZv/jppkOtRBWccGDqFoxEKNZWXFPubvCLIOUnX7aWLIy1RmqmVCF9jHMha7C7
         3eKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWP6dN3zmh84lLdOBV76wq/uMeOPegoNJSO9P9M4sQh8SpgI1Q+VFvpuMCBva9ckfj2giBuuo7Gls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uwajjMcmjmmF3tDsoDaguvqvQv1m5N0wbFNuUPe+S+Cj2e07
	EuMN/glxRq5ZLxZ+vJ07SsRcLr86d1ZROX9x+QTJqv3eYi4Cqitz3CP3zUXVhuiPKFEVfhEytiw
	F
X-Gm-Gg: ASbGnctwA875J96ScJTeWgog0g8Zqe/6WAsvnto0UrK2GoSV8Oxj8Un412Sl8Zkrei+
	MYUkQcd0DRcUD26Qr7ebwCMh2rzfudQiTLCnD8m01U6ag4dW84J949gFeMdXNKAtn0U4bCOESI4
	8kt4ZM82Za47nlzylIRoBrTyW8KqEcGbjP7UY0KQJStRJhVl9H8P5NcyWJtjrvpjesmU3s5iRyP
	m16Lf2e9KswVou/VxTanmXlJtUwnEJSC9Q7IRaY4+TEUdNIe5pgWjhgyplvXw7UeJcv/xWA77gT
	E7MRqE6rV4/JwI1+iIZ6kzfxRmYWrX2HjBFM89Sn2w==
X-Google-Smtp-Source: AGHT+IHomEwFL2gHvxrxNHMQWNlcLnq5Zomdcm07JpmqvC/LUe0dEuJJbzq+96IF9UMnhFMOjwOvCQ==
X-Received: by 2002:a17:903:3c64:b0:223:3eed:f680 with SMTP id d9443c01a7336-22b7eaa35e1mr99860315ad.18.1744369191767;
        Fri, 11 Apr 2025 03:59:51 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb57fsm46002545ad.229.2025.04.11.03.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:51 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
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
Subject: [PATCH V9 14/17] rust: cpufreq: Extend abstractions for policy and driver ops
Date: Fri, 11 Apr 2025 16:25:13 +0530
Message-Id: <38807a42b5ee71c31ff5dd342ff6b5202c86a46e.1744366572.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the cpufreq abstractions to include support for policy handling
and driver operations.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/cpufreq.rs | 455 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 454 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 19bb616d3625..3e9ded655d46 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -10,15 +10,24 @@
 
 use crate::{
     bindings,
-    error::{code::*, to_result, Result},
+    clk::{Clk, Hertz},
+    cpumask,
+    device::Device,
+    error::{code::*, from_err_ptr, to_result, Result, VTABLE_DEFAULT_ERROR},
     ffi::c_ulong,
     prelude::*,
+    types::ForeignOwnable,
+    types::Opaque,
 };
 
 use core::{
+    ops::{Deref, DerefMut},
     pin::Pin,
+    ptr::self,
 };
 
+use macros::vtable;
+
 /// Default transition latency value in nanoseconds.
 pub const ETERNAL_LATENCY_NS: u32 = bindings::CPUFREQ_ETERNAL as u32;
 
@@ -339,3 +348,447 @@ pub fn to_table(mut self) -> Result<TableBox> {
         TableBox::new(self.entries)
     }
 }
+
+/// CPU frequency policy.
+///
+/// Rust abstraction for the C `struct cpufreq_policy`.
+///
+/// # Invariants
+///
+/// A [`Policy`] instance always corresponds to a valid C `struct cpufreq_policy`.
+///
+/// The callers must ensure that the `struct cpufreq_policy` is valid for access and remains valid
+/// for the lifetime of the returned reference.
+///
+/// ## Examples
+///
+/// The following example demonstrates how to create a CPU frequency table.
+///
+/// ```
+/// use kernel::cpufreq::{ETERNAL_LATENCY_NS, Policy};
+///
+/// fn update_policy(policy: &mut Policy) {
+///     policy
+///         .set_dvfs_possible_from_any_cpu(true)
+///         .set_fast_switch_possible(true)
+///         .set_transition_latency_ns(ETERNAL_LATENCY_NS);
+///
+///     pr_info!("The policy details are: {:?}\n", (policy.cpu(), policy.cur()));
+/// }
+/// ```
+#[repr(transparent)]
+pub struct Policy(Opaque<bindings::cpufreq_policy>);
+
+impl Policy {
+    /// Creates a reference to an existing `struct cpufreq_policy` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
+    /// of the returned reference.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpufreq_policy) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Creates a mutable reference to an existing `struct cpufreq_policy` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
+    /// of the returned reference.
+    #[inline]
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpufreq_policy) -> &'a mut Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &mut *ptr.cast() }
+    }
+
+    // Returns a raw mutable pointer to the C `struct cpufreq_policy`.
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::cpufreq_policy {
+        self as *const _ as _
+    }
+
+    #[inline]
+    fn as_ref(&self) -> &bindings::cpufreq_policy {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        unsafe { &*self.as_raw() }
+    }
+
+    #[inline]
+    fn as_mut_ref(&mut self) -> &mut bindings::cpufreq_policy {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        unsafe { &mut *self.as_raw() }
+    }
+
+    /// Returns the primary CPU for the [`Policy`].
+    #[inline]
+    pub fn cpu(&self) -> u32 {
+        self.as_ref().cpu
+    }
+
+    /// Returns the minimum frequency for the [`Policy`].
+    #[inline]
+    pub fn min(&self) -> Hertz {
+        Hertz::from_khz(self.as_ref().min as usize)
+    }
+
+    /// Set the minimum frequency for the [`Policy`].
+    #[inline]
+    pub fn set_min(&mut self, min: Hertz) -> &mut Self {
+        self.as_mut_ref().min = min.as_khz() as u32;
+        self
+    }
+
+    /// Returns the maximum frequency for the [`Policy`].
+    #[inline]
+    pub fn max(&self) -> Hertz {
+        Hertz::from_khz(self.as_ref().max as usize)
+    }
+
+    /// Set the maximum frequency for the [`Policy`].
+    #[inline]
+    pub fn set_max(&mut self, max: Hertz) -> &mut Self {
+        self.as_mut_ref().max = max.as_khz() as u32;
+        self
+    }
+
+    /// Returns the current frequency for the [`Policy`].
+    #[inline]
+    pub fn cur(&self) -> Hertz {
+        Hertz::from_khz(self.as_ref().cur as usize)
+    }
+
+    /// Returns the suspend frequency for the [`Policy`].
+    #[inline]
+    pub fn suspend_freq(&self) -> Hertz {
+        Hertz::from_khz(self.as_ref().suspend_freq as usize)
+    }
+
+    /// Sets the suspend frequency for the [`Policy`].
+    #[inline]
+    pub fn set_suspend_freq(&mut self, freq: Hertz) -> &mut Self {
+        self.as_mut_ref().suspend_freq = freq.as_khz() as u32;
+        self
+    }
+
+    /// Provides a wrapper to the generic suspend routine.
+    #[inline]
+    pub fn generic_suspend(&mut self) -> Result<()> {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        to_result(unsafe { bindings::cpufreq_generic_suspend(self.as_mut_ref()) })
+    }
+
+    /// Provides a wrapper to the generic get routine.
+    #[inline]
+    pub fn generic_get(&self) -> Result<u32> {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        Ok(unsafe { bindings::cpufreq_generic_get(self.cpu()) })
+    }
+
+    /// Provides a wrapper to the register with energy model using the OPP core.
+    #[cfg(CONFIG_PM_OPP)]
+    #[inline]
+    pub fn register_em_opp(&mut self) {
+        // SAFETY: By the type invariant, the pointer stored in `self` is valid.
+        unsafe { bindings::cpufreq_register_em_with_opp(self.as_mut_ref()) };
+    }
+
+    /// Gets [`cpumask::Cpumask`] for a cpufreq [`Policy`].
+    #[inline]
+    pub fn cpus(&mut self) -> &mut cpumask::Cpumask {
+        // SAFETY: The pointer to `cpus` is valid for writing and remains valid for the lifetime of
+        // the returned reference.
+        unsafe { cpumask::CpumaskVar::from_raw_mut(&mut self.as_mut_ref().cpus) }
+    }
+
+    /// Sets clock for the [`Policy`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must guarantee that the returned [`Clk`] is not dropped while it is getting used
+    /// by the C code.
+    pub unsafe fn set_clk(&mut self, dev: &Device, name: Option<&CStr>) -> Result<Clk> {
+        let clk = Clk::get(dev, name)?;
+        self.as_mut_ref().clk = clk.as_raw();
+        Ok(clk)
+    }
+
+    /// Allows / disallows frequency switching code to run on any CPU.
+    #[inline]
+    pub fn set_dvfs_possible_from_any_cpu(&mut self, val: bool) -> &mut Self {
+        self.as_mut_ref().dvfs_possible_from_any_cpu = val;
+        self
+    }
+
+    /// Returns if fast switching of frequencies is possible or not.
+    #[inline]
+    pub fn fast_switch_possible(&self) -> bool {
+        self.as_ref().fast_switch_possible
+    }
+
+    /// Enables / disables fast frequency switching.
+    #[inline]
+    pub fn set_fast_switch_possible(&mut self, val: bool) -> &mut Self {
+        self.as_mut_ref().fast_switch_possible = val;
+        self
+    }
+
+    /// Sets transition latency (in nanoseconds) for the [`Policy`].
+    #[inline]
+    pub fn set_transition_latency_ns(&mut self, latency_ns: u32) -> &mut Self {
+        self.as_mut_ref().cpuinfo.transition_latency = latency_ns;
+        self
+    }
+
+    /// Sets cpuinfo `min_freq`.
+    #[inline]
+    pub fn set_cpuinfo_min_freq(&mut self, min_freq: Hertz) -> &mut Self {
+        self.as_mut_ref().cpuinfo.min_freq = min_freq.as_khz() as u32;
+        self
+    }
+
+    /// Sets cpuinfo `max_freq`.
+    #[inline]
+    pub fn set_cpuinfo_max_freq(&mut self, max_freq: Hertz) -> &mut Self {
+        self.as_mut_ref().cpuinfo.max_freq = max_freq.as_khz() as u32;
+        self
+    }
+
+    /// Set `transition_delay_us`, i.e. the minimum time between successive frequency change
+    /// requests.
+    #[inline]
+    pub fn set_transition_delay_us(&mut self, transition_delay_us: u32) -> &mut Self {
+        self.as_mut_ref().transition_delay_us = transition_delay_us;
+        self
+    }
+
+    /// Returns reference to the CPU frequency [`Table`] for the [`Policy`].
+    pub fn freq_table(&self) -> Result<&Table> {
+        if self.as_ref().freq_table.is_null() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The `freq_table` is guaranteed to be valid for reading and remains valid for the
+        // lifetime of the returned reference.
+        Ok(unsafe { Table::from_raw(self.as_ref().freq_table) })
+    }
+
+    /// Sets the CPU frequency [`Table`] for the [`Policy`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must guarantee that the [`Table`] is not dropped while it is getting used by the
+    /// C code.
+    #[inline]
+    pub unsafe fn set_freq_table(&mut self, table: &Table) -> &mut Self {
+        self.as_mut_ref().freq_table = table.as_raw();
+        self
+    }
+
+    /// Returns the [`Policy`]'s private data.
+    pub fn data<T: ForeignOwnable>(&mut self) -> Option<<T>::Borrowed<'_>> {
+        if self.as_ref().driver_data.is_null() {
+            None
+        } else {
+            // SAFETY: The data is earlier set from [`set_data`].
+            Some(unsafe { T::borrow(self.as_ref().driver_data) })
+        }
+    }
+
+    // Sets the private data of the [`Policy`] using a foreign-ownable wrapper.
+    //
+    // # Errors
+    //
+    // Returns `EBUSY` if private data is already set.
+    fn set_data<T: ForeignOwnable>(&mut self, data: T) -> Result<()> {
+        if self.as_ref().driver_data.is_null() {
+            // Transfer the ownership of the data to the foreign interface.
+            self.as_mut_ref().driver_data = <T as ForeignOwnable>::into_foreign(data) as _;
+            Ok(())
+        } else {
+            Err(EBUSY)
+        }
+    }
+
+    // Clears and returns ownership of the private data.
+    fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
+        if self.as_ref().driver_data.is_null() {
+            None
+        } else {
+            let data = Some(
+                // SAFETY: The data is earlier set by us from [`set_data`]. It is safe to take
+                // back the ownership of the data from the foreign interface.
+                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data) },
+            );
+            self.as_mut_ref().driver_data = ptr::null_mut();
+            data
+        }
+    }
+}
+
+// CPU frequency policy created from a CPU number.
+//
+// This struct represents the CPU frequency policy obtained for a specific CPU, providing safe
+// access to the underlying `cpufreq_policy` and ensuring proper cleanup when the `PolicyCpu` is
+// dropped.
+struct PolicyCpu<'a>(&'a mut Policy);
+
+impl<'a> PolicyCpu<'a> {
+    fn from_cpu(cpu: u32) -> Result<Self> {
+        // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
+        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(cpu) })?;
+
+        Ok(Self(
+            // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
+            // the returned reference.
+            unsafe { Policy::from_raw_mut(ptr) },
+        ))
+    }
+}
+
+impl<'a> Deref for PolicyCpu<'a> {
+    type Target = Policy;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
+
+impl<'a> DerefMut for PolicyCpu<'a> {
+    fn deref_mut(&mut self) -> &mut Policy {
+        self.0
+    }
+}
+
+impl<'a> Drop for PolicyCpu<'a> {
+    fn drop(&mut self) {
+        // SAFETY: The underlying pointer is guaranteed to be valid for the lifetime of `self`.
+        unsafe { bindings::cpufreq_cpu_put(self.0.as_raw()) };
+    }
+}
+
+/// CPU frequency driver.
+///
+/// Implement this trait to provide a CPU frequency driver and its callbacks.
+///
+/// Reference: <https://docs.kernel.org/cpu-freq/cpu-drivers.html>
+#[vtable]
+pub trait Driver {
+    /// Driver specific data.
+    ///
+    /// Corresponds to the data retrieved via the kernel's `cpufreq_get_driver_data` function.
+    ///
+    /// Require `Data` to implement `ForeignOwnable`. We guarantee to never move the underlying
+    /// wrapped data structure.
+    type Data: ForeignOwnable;
+
+    /// Policy specific data.
+    ///
+    /// Require that `PData` implements `ForeignOwnable`. We guarantee to never move the underlying
+    /// wrapped data structure.
+    type PData: ForeignOwnable;
+
+    /// Driver's `init` callback.
+    fn init(policy: &mut Policy) -> Result<Self::PData>;
+
+    /// Driver's `exit` callback.
+    fn exit(_policy: &mut Policy, _data: Option<Self::PData>) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `online` callback.
+    fn online(_policy: &mut Policy) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `offline` callback.
+    fn offline(_policy: &mut Policy) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `suspend` callback.
+    fn suspend(_policy: &mut Policy) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `resume` callback.
+    fn resume(_policy: &mut Policy) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `ready` callback.
+    fn ready(_policy: &mut Policy) {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `verify` callback.
+    fn verify(data: &mut PolicyData) -> Result<()>;
+
+    /// Driver's `setpolicy` callback.
+    fn setpolicy(_policy: &mut Policy) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `target` callback.
+    fn target(_policy: &mut Policy, _target_freq: u32, _relation: Relation) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `target_index` callback.
+    fn target_index(_policy: &mut Policy, _index: u32) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `fast_switch` callback.
+    fn fast_switch(_policy: &mut Policy, _target_freq: u32) -> u32 {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `adjust_perf` callback.
+    fn adjust_perf(_policy: &mut Policy, _min_perf: usize, _target_perf: usize, _capacity: usize) {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `get_intermediate` callback.
+    fn get_intermediate(_policy: &mut Policy, _index: u32) -> u32 {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `target_intermediate` callback.
+    fn target_intermediate(_policy: &mut Policy, _index: u32) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `get` callback.
+    fn get(_policy: &mut Policy) -> Result<u32> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `update_limits` callback.
+    fn update_limits(_policy: &mut Policy) {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `bios_limit` callback.
+    fn bios_limit(_policy: &mut Policy, _limit: &mut u32) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `set_boost` callback.
+    fn set_boost(_policy: &mut Policy, _state: i32) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Driver's `register_em` callback.
+    fn register_em(_policy: &mut Policy) {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
-- 
2.31.1.272.g89b43f80a514

