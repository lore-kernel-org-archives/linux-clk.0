Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF03403E96
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571836; cv=none; b=OvF1IVhN6+Ndo8oq/0TBgxwub3J3SrmeFJu+1XZhhzfz2Vgecfg4aQsQAHbROrXWYykF74R9P64cZziTLBlcVIakz4m3X/yan/jAuZIvTZEApknPZO/BCR/GPcTQqCj4YjcxOtbrJ1r6eht8pXO7cy8CsfoqIFpJ1L/rdLx8M5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571836; c=relaxed/simple;
	bh=Li3Wd9vZ2do7YIFFIrvPQ4L5MznI5BwPjL7AunXsO9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZtFXCywAVZjeZ1aVvjJgs01awXB1p46v7f3IV3SF5Fr9ba5IzRfHvejUz8KY0Bdl5PWgKh56jZPjXtMiR+b4QXOQedUNSDQUF91BO44SlmKPUWLI77lhyqqB49Os+Yo3kGlT4fhdpqkpa+RSnpHqpnYLmzJaKIon8BVtTCPzCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gYTp+Quf; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gYTp+Quf"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45efa12a788so405708f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571832; x=1781176632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3cr/N4yYTt9Xr62pbCqd/6k/zRQ+lTKB/ioJiYtd8=;
        b=gYTp+QufI3nmoz9QgIZp8U8dUJagdM4uI0naYbBZywZOvgsYzVOtp4NxtW4h3Rlk2L
         gXWzPZmlswTMp63++Qpk/wWM/Lm4PC/j4vokcNeT5j5CHvDK8RlYk51TwrcnCEi5ma1b
         nxK8Ofg+KTHU8eQsDfsR6h08d1ktBUCoM/Gqn1cSPVPq7MMsSGQbaHyqz1KyyxTeH6XO
         i6XsA8kT239ef2tyUGJG28pH/JsktC0HnNYgQ6itlfGCTIctXPsDXMUl5al9N8lN3A8X
         hmMRo6vdxujDVb6Mso1OjAt//A1elq3DVwQ2yUgLZm2eraBsXJ8L6pNuDDKCBRU7veIp
         conQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571832; x=1781176632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3cr/N4yYTt9Xr62pbCqd/6k/zRQ+lTKB/ioJiYtd8=;
        b=MbtI73+RWVkrN7HTgUxTtjLTiFdTmC9HDsB1gwoK34/YXhhmh2we8KYNtpx88FYO5i
         Etfe2m7+Hlod+4vhwAoiJ++wY7NlfqyYa06mWaTx1JiM/jPqrPz0fZTH9VDUckpuoZTL
         BRXTQr0Y0pYANYuUkWHW/voG/PBk0ALLZdnZ80sV/qvIXeWM0k4dd55Aq3ohh39pBlNI
         vEQeGF23UkKGeTfW5MThmCvFONQwO/x/SHgfCteR5zyg+jNceb8m9zYRPyCBhAKnjMnf
         bnZtbccjgnT2K/Z1i0ImAlVfDTpm83Za7sFMXNEL3diYnZt8UFKUFJWorZri+6Tqyt/c
         DUhw==
X-Forwarded-Encrypted: i=1; AFNElJ/pbbIHsWE0bcdSjREJ51qqzWTrV3FcrmB5s6pKf0GXM/PwvDW9Oc1FRYRFCG2nkyL+wsUjKT8N8oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgUS33+DL3H43SqzkND/7TFDIkiY7qQAac1k/Xs/8KFfIuTTQB
	Et2EqhXL1tTCcHl5pb3e2TSXfdhTKowUIBQL/KNmgJU3xm5tYI0qlzx5xyaeuEsX4DmECF7kGKP
	7x+0X6pr1uBySYu1E2A==
X-Received: from wrvx5.prod.google.com ([2002:a5d:54c5:0:b0:45e:ee1e:37d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1993:b0:490:bb19:b110 with SMTP id 5b1f17b1804b1-490bb19b19amr73563895e9.27.1780571832368;
 Thu, 04 Jun 2026 04:17:12 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:17:11 +0000
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-1-34cf034e1764@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org> <20260526-rate-exclusive-get-th1520-v1-1-34cf034e1764@mailbox.org>
Message-ID: <aiFet_2SNAwj6o2O@google.com>
Subject: Re: [PATCH 1/2] rust: clk: Add ExclusiveClk wrapper for clk_rate_exclusive_get
From: Alice Ryhl <aliceryhl@google.com>
To: mhi@mailbox.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 26, 2026 at 07:04:57PM +0200, Maurice Hieronymus via B4 Relay wrote:
> From: Maurice Hieronymus <mhi@mailbox.org>
> 
> Add Rust bindings for clk_rate_exclusive_get() and
> clk_rate_exclusive_put().
> 
> Clk::rate_exclusive_get() consumes the Clk and returns an ExclusiveClk;
> the matching put is issued from its Drop impl. ExclusiveClk derefs to
> Clk so existing rate / prepare / enable APIs remain available on the
> locked handle.
> 
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Overall looks okay to me. With below comments fixed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/clk.rs | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index 7abbd0767d8c..8cda40cb01e4 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -249,6 +249,23 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
>              // [`clk_set_rate`].
>              to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
>          }
> +
> +        /// Acquire exclusive control over the clock's rate.
> +        ///
> +        /// Consumes the [`Clk`] and returns an [`ExclusiveClk`] that releases the exclusivity
> +        /// when dropped. While held, no other consumer may change the clock's rate.
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API. Must not be called from
> +        /// atomic context.
> +        ///
> +        /// [`clk_rate_exclusive_get`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get

Avoid the newline here. Links are long, and it's okay that they are
long. They must be on one line.

> +        pub fn rate_exclusive_get(self) -> Result<ExclusiveClk> {
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_rate_exclusive_get`].
> +            to_result(unsafe { bindings::clk_rate_exclusive_get(self.as_raw()) })?;
> +            Ok(ExclusiveClk(self))
> +        }
>      }
>  
>      impl Drop for Clk {
> @@ -329,6 +346,54 @@ fn deref(&self) -> &Clk {
>              &self.0
>          }
>      }
> +
> +    /// A [`Clk`] with exclusive control over its rate.
> +    ///
> +    /// While an [`ExclusiveClk`] exists, no other consumer of the same clock may change its rate.
> +    /// Obtained by calling [`Clk::rate_exclusive_get`]; the exclusivity is released automatically
> +    /// when the value is dropped, after which the inner [`Clk`] is dropped as usual.
> +    ///
> +    /// # Invariants
> +    ///
> +    /// An [`ExclusiveClk`] instance owns a [`Clk`] for which `clk_rate_exclusive_get` has been
> +    /// called and the matching `clk_rate_exclusive_put` has not yet been called.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::clk::{Clk, ExclusiveClk};
> +    /// use kernel::device::Device;
> +    /// use kernel::error::Result;
> +    ///
> +    /// fn lock_rate(dev: &Device) -> Result<ExclusiveClk> {
> +    ///     let clk = Clk::get(dev, None)?;
> +    ///     clk.prepare_enable()?;
> +    ///     clk.rate_exclusive_get()
> +    /// }
> +    /// ```
> +    ///
> +    /// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html

Unused link.

> +    pub struct ExclusiveClk(Clk);
> +
> +    // Make [`ExclusiveClk`] behave like [`Clk`].
> +    impl Deref for ExclusiveClk {
> +        type Target = Clk;
> +
> +        fn deref(&self) -> &Clk {
> +            &self.0
> +        }
> +    }
> +
> +    impl Drop for ExclusiveClk {
> +        fn drop(&mut self) {
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_rate_exclusive_put`] and balances the [`clk_rate_exclusive_get`] call from
> +            // [`Clk::rate_exclusive_get`].
> +            unsafe {
> +                bindings::clk_rate_exclusive_put(self.as_raw());
> +            }

Nit: usually we format this with the semicolon outside the unsafe block.

unsafe { bindings::clk_rate_exclusive_put(self.as_raw()) };

Alice
