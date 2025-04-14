Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C527BF6A
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627938; cv=none; b=AFo/26KJfwyfSlcI11k9MdQ97mEfuuYwHMOTwaCq7FRgqafiiBswQ2+5QWnlKzTa6EoVkAFSm1DStmZ7YvmiSDN+lUU35FZGtlCo2UGYPZ2nEpdiZaJxC008e65t2BZUJ/L3Nut3MkF1NCAm9gvKwkwnrIpCCOIuEX/n4+dN1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627938; c=relaxed/simple;
	bh=OfXWzcASFdHkw+rQrReNFmKefWqB2Yv7RRdxhucvLis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH23v1sadlt4uUFTFN6/2OuRU538SPimaBQE752GADLvo0rf6dsoEqzPrTpFxh0+XzQ55Xy4VciMxZIBEyHJn7C7hxRY99TJCqtFuudgZRenSAh/S+oTyFskipW8PWqg+2vhakgJIV5saAPdfSWT/FDlMVWEXi4YEcCxl98jC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQTD9NRo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQTD9NRo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b350a22cso3375851b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744627936; x=1745232736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK+fUhBepKMqw6zHBM4g47enyu9DAO43HLamRknec80=;
        b=FQTD9NRocJbqRIX+JwfKqeU+eZ3LyKe7ulsBwyen37iYJfmSfYKpGIik+SKxxDXTu3
         RUMCd7T5ULVxC/Z0JN12wtVLmoqVQ7Zi6cKdNdQfy4br8w7kHC+f0vKad6DOnFdamrZP
         /cyIAqfPxYY5YVVvXfEDvEo53uoy1gGNgRHOjlQioHTmyX7isiCn3n/rGvUTLlyHiy7L
         UAhaBMQFVrLK+7JUe/QiXSJZfs1MftC5ubhyCMyULhTswExkpJ/qnU8ogKX8BSAAygkX
         4AW6/y8p94CHv0+ovJlkxmr0gn5x0VqhxgOTiKsKFjJLST8AJgBBhceEXVVTPr8ak0zi
         oWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744627936; x=1745232736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK+fUhBepKMqw6zHBM4g47enyu9DAO43HLamRknec80=;
        b=iHRR+WYPeLAEJyx1antNNBR1T3wJi07JrIFJyBwbjhp+77JZROek8NYbAdvH68SZ08
         xT+jIzLqzE8HLYkR7OuDOUoNXQImguLepy17nYTzzdaUNWG2wcrmpeVfX5NsorKKgqZh
         dpXHhpSb2N45yp3AFYyNIvkLBN3Owrt4tcbD1MgtgERXThWicbnk4TcP99k1FMCflLLm
         Mu3GMO8LJpn8Nx4QpYxq5vAcqyi2japWBi70k5NslUOWEIK7YgCwHpXSveq8WnmT14fO
         CldP2bJI46zQbGv99knr+kUBi4S9N9T2iclxB06sbmccpzZS2axvhKUQ9BP1naDwsjPd
         +mkA==
X-Forwarded-Encrypted: i=1; AJvYcCVlGubExvQboS+Gb5rn8+StUTFJQ075I06BQLRg7vHE+EdeqGUWzZFFUpyL+aMZV7JfX4vpHSsvZPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ujXYMQowvE/ey0geGPgPdV57LgwzVHlT8ieXuUm2pI8Y3pcE
	D0zlrvrTi6uzlIcQgA2vaQ8p5GIP+1KzhK5217QT2HWVjdCfh26fYN5q3tvOByo=
X-Gm-Gg: ASbGnctqeVYBERe2SLx1NpJRaBYWHUEBxT110He7qdzB1s2GC8EgvRuCgVPf5YWqLkN
	ICrVj5Y3r8REwwXlz89a9JeSxh59aEOo41BYWQJl84FuK5KqMFpglGLNJW15Sfu4mi087J0nFgG
	/DR3psM74ZivpukEDt1CVd+wEgiH+Ep/gkFaQISZB9h83Y2qtapxupFIZJHrsoEFL4XwyXgR+E1
	XniLu/Gu26RcErNd4+RxryhxNiSaSDWp7ZAWvnL9QR6iOSzywyhIxmipXp9UwnGnm50HgdgxuQr
	RLO3cr+3oZ1KNYTlWjHkUfeSwthsBza2lFwZ/qHRr5EyLJiiDg2A
X-Google-Smtp-Source: AGHT+IGf76/JgRAw8wNgwqBKu4NDlC8JrtbtBDopdoD5Xs6AJphS7tnkVXQ5d2l1i97zuQqjxDVevg==
X-Received: by 2002:a05:6a20:cfa1:b0:1fd:f56f:1cbe with SMTP id adf61e73a8af0-201797a192fmr17645570637.13.1744627935875;
        Mon, 14 Apr 2025 03:52:15 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm6516216b3a.90.2025.04.14.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:52:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:22:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9 15/17] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250414105212.glxkrto4ybvxgx3y@vireshk-i7>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
 <2f7a1331ad513b94fb47c05bf1d0f5c3fa803858.1744366572.git.viresh.kumar@linaro.org>
 <Z_kD5G3WhcYlgqmr@cassiopeiae>
 <20250414084706.rjsdaoxmug4p4e7l@vireshk-i7>
 <Z_zX22N9cFmVpC_5@pollux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_zX22N9cFmVpC_5@pollux>

On 14-04-25, 11:39, Danilo Krummrich wrote:
> 	const VTABLE: bindings::cpufreq_driver = bindings::cpufreq_driver {
> 	   name: Self::copy_name(T::NAME),
> 	   boost_enabled: T::BOOST_ENABLED,
> 	   flags: T::FLAGS,
> 	   [...]
> 	}

Ahh, thanks for this.

-- 
viresh

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 9b275d4d3eb6..a6e660d46304 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -9,28 +9,32 @@
 //! Reference: <https://docs.kernel.org/admin-guide/pm/cpufreq.html>
 
 use crate::{
+    alloc::AllocError,
     bindings,
     clk::{Clk, Hertz},
     cpumask,
     device::Device,
     devres::Devres,
     error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
-    ffi::c_ulong,
+    ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
     types::Opaque,
 };
 
 use core::{
-    cell::UnsafeCell,
     marker::PhantomData,
+    mem::MaybeUninit,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{self, NonNull},
 };
 
 use macros::vtable;
 
+// Maximum length of CPU frequency driver's name.
+const CPUFREQ_NAME_LEN: usize = bindings::CPUFREQ_NAME_LEN as usize;
+
 /// Default transition latency value in nanoseconds.
 pub const ETERNAL_LATENCY_NS: u32 = bindings::CPUFREQ_ETERNAL as u32;
 
@@ -855,10 +859,8 @@ fn register_em(_policy: &mut Policy) {
 ///     cpufreq::Registration::<FooDriver>::new_foreign_owned(dev).unwrap();
 /// }
 /// ```
-pub struct Registration<T: Driver> {
-    drv: KBox<UnsafeCell<bindings::cpufreq_driver>>,
-    _p: PhantomData<T>,
-}
+#[repr(transparent)]
+pub struct Registration<T: Driver>(NonNull<bindings::cpufreq_driver>, PhantomData<T>);
 
 // SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
 // or CPUs, so it is safe to share it.
@@ -870,135 +872,136 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
 unsafe impl<T: Driver> Send for Registration<T> {}
 
 impl<T: Driver> Registration<T> {
-    /// Registers a CPU frequency driver with the cpufreq core.
-    pub fn new() -> Result<Self> {
-        // Required due to Rust 1.82's stricter handling of `unsafe` in mutable statics. The
-        // `unsafe` blocks aren't required anymore with later versions.
-        #![allow(unused_unsafe)]
-
-        let mut drv = KBox::new(
-            UnsafeCell::new(bindings::cpufreq_driver::default()),
-            GFP_KERNEL,
-        )?;
-        let drv_ref = drv.get_mut();
-
-        // Account for the trailing null byte.
-        let len = T::NAME.len() + 1;
-        if len > drv_ref.name.len() {
-            return Err(EINVAL);
-        };
-
-        // SAFETY: `T::NAME` is a valid `CStr`, and we are copying it to an array of equal or
-        // larger size.
-        let name = unsafe { &*(T::NAME.as_bytes_with_nul() as *const [u8]) };
-        drv_ref.name[..len].copy_from_slice(name);
-
-        drv_ref.boost_enabled = T::BOOST_ENABLED;
-        drv_ref.flags = T::FLAGS;
+    const VTABLE: bindings::cpufreq_driver = bindings::cpufreq_driver {
+        name: Self::copy_name(T::NAME),
+        boost_enabled: T::BOOST_ENABLED,
+        flags: T::FLAGS,
 
         // Initialize mandatory callbacks.
-        drv_ref.init = Some(Self::init_callback);
-        drv_ref.verify = Some(Self::verify_callback);
+        init: Some(Self::init_callback),
+        verify: Some(Self::verify_callback),
 
         // Initialize optional callbacks based on the traits of `T`.
-        drv_ref.setpolicy = if T::HAS_SETPOLICY {
+        setpolicy: if T::HAS_SETPOLICY {
             Some(Self::setpolicy_callback)
         } else {
             None
-        };
-        drv_ref.target = if T::HAS_TARGET {
+        },
+        target: if T::HAS_TARGET {
             Some(Self::target_callback)
         } else {
             None
-        };
-        drv_ref.target_index = if T::HAS_TARGET_INDEX {
+        },
+        target_index: if T::HAS_TARGET_INDEX {
             Some(Self::target_index_callback)
         } else {
             None
-        };
-        drv_ref.fast_switch = if T::HAS_FAST_SWITCH {
+        },
+        fast_switch: if T::HAS_FAST_SWITCH {
             Some(Self::fast_switch_callback)
         } else {
             None
-        };
-        drv_ref.adjust_perf = if T::HAS_ADJUST_PERF {
+        },
+        adjust_perf: if T::HAS_ADJUST_PERF {
             Some(Self::adjust_perf_callback)
         } else {
             None
-        };
-        drv_ref.get_intermediate = if T::HAS_GET_INTERMEDIATE {
+        },
+        get_intermediate: if T::HAS_GET_INTERMEDIATE {
             Some(Self::get_intermediate_callback)
         } else {
             None
-        };
-        drv_ref.target_intermediate = if T::HAS_TARGET_INTERMEDIATE {
+        },
+        target_intermediate: if T::HAS_TARGET_INTERMEDIATE {
             Some(Self::target_intermediate_callback)
         } else {
             None
-        };
-        drv_ref.get = if T::HAS_GET {
+        },
+        get: if T::HAS_GET {
             Some(Self::get_callback)
         } else {
             None
-        };
-        drv_ref.update_limits = if T::HAS_UPDATE_LIMITS {
+        },
+        update_limits: if T::HAS_UPDATE_LIMITS {
             Some(Self::update_limits_callback)
         } else {
             None
-        };
-        drv_ref.bios_limit = if T::HAS_BIOS_LIMIT {
+        },
+        bios_limit: if T::HAS_BIOS_LIMIT {
             Some(Self::bios_limit_callback)
         } else {
             None
-        };
-        drv_ref.online = if T::HAS_ONLINE {
+        },
+        online: if T::HAS_ONLINE {
             Some(Self::online_callback)
         } else {
             None
-        };
-        drv_ref.offline = if T::HAS_OFFLINE {
+        },
+        offline: if T::HAS_OFFLINE {
             Some(Self::offline_callback)
         } else {
             None
-        };
-        drv_ref.exit = if T::HAS_EXIT {
+        },
+        exit: if T::HAS_EXIT {
             Some(Self::exit_callback)
         } else {
             None
-        };
-        drv_ref.suspend = if T::HAS_SUSPEND {
+        },
+        suspend: if T::HAS_SUSPEND {
             Some(Self::suspend_callback)
         } else {
             None
-        };
-        drv_ref.resume = if T::HAS_RESUME {
+        },
+        resume: if T::HAS_RESUME {
             Some(Self::resume_callback)
         } else {
             None
-        };
-        drv_ref.ready = if T::HAS_READY {
+        },
+        ready: if T::HAS_READY {
             Some(Self::ready_callback)
         } else {
             None
-        };
-        drv_ref.set_boost = if T::HAS_SET_BOOST {
+        },
+        set_boost: if T::HAS_SET_BOOST {
             Some(Self::set_boost_callback)
         } else {
             None
-        };
-        drv_ref.register_em = if T::HAS_REGISTER_EM {
+        },
+        register_em: if T::HAS_REGISTER_EM {
             Some(Self::register_em_callback)
         } else {
             None
-        };
+        },
+        // SAFETY: All zeros is a valid value for `bindings::cpufreq_driver`.
+        ..unsafe { MaybeUninit::zeroed().assume_init() }
+    };
+
+    const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
+        let src = name.as_bytes_with_nul();
+        let mut dst = [0; CPUFREQ_NAME_LEN];
+
+        build_assert!(src.len() <= CPUFREQ_NAME_LEN);
+
+        let mut i = 0;
+        while i < src.len() {
+            dst[i] = src[i];
+            i += 1;
+        }
+
+        dst
+    }
+
+    /// Registers a CPU frequency driver with the cpufreq core.
+    pub fn new() -> Result<Self> {
+        let drv = &Self::VTABLE as *const _ as *mut _;
 
         // SAFETY: It is safe to register the driver with the cpufreq core in the kernel C code.
-        to_result(unsafe { bindings::cpufreq_register_driver(drv_ref) })?;
+        to_result(unsafe { bindings::cpufreq_register_driver(drv) })?;
 
-        Ok(Self {
-            drv,
-            _p: PhantomData,
-        })
+        Ok(Self(
+            NonNull::new(drv.cast()).ok_or(AllocError)?,
+            PhantomData,
+        ))
     }
 
     /// Same as [`Registration::new`], but does not return a [`Registration`] instance.
@@ -1259,9 +1262,7 @@ extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
 impl<T: Driver> Drop for Registration<T> {
     // Removes the `Registration` from the kernel, if it has initialized successfully earlier.
     fn drop(&mut self) {
-        let drv = self.drv.get_mut();
-
         // SAFETY: The driver was earlier registered from `new`.
-        unsafe { bindings::cpufreq_unregister_driver(drv) };
+        unsafe { bindings::cpufreq_unregister_driver(self.0.as_ptr()) };
     }
 }
