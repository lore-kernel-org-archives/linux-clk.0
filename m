Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009681;
	b=PtKu/jc+xpiqs6ZlYXW5J618oK8d9Lpoh3E9MvY6fDOMvOmzLfdTLuSj1AFPKn+sAEsM
	 NVb6p5GHT4n/d7YGWox7I4GL112NO5BGMmTIuY2Qazb2JMZ0eC1pc64ZCqOIE25YKnf+H
	 u4lH7HDoKS9THndVgxBDln6KcY/gbA+QSDjbn7qZcvxMqe5hwyXf6Uw8jW/rXOXoHcstI
	 NftP4u6KLNhMC+5p7cLgJ/99/ZlzLXwBQCwUc02mp9nJNtHpJ7V4Sr6xNEPSA4qXCFiRY
	 xh4/G8znifr/2NFSt0e7CBeKOstlUgHiKPqFSMYvNqnI1pgYn0BFmJh4+cuq81Osczw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YBVvUekf13M+I2J4OXSpne5JBm6BNzst3m7Bc2T2IGo=;
	b=RQOb36t//Axz+nb61vt644G5kBSR6vOLhTXfWr13wP5+foh4BJU4KqpZ+04J/jhF0OpX
	 9rMlzbhSM1v9DVt4R8Ue2wKyvN3LOJFsrNfWQH1Ao77lRxzkRXWB1BxMA+ibq9XQsZe6B
	 Hfp1nYqOR7Y5zK6HO+HLZppyNIqYx6TDSZdyC7YmY2OtSGjPbNsct2tEt2hSpc3xtMjBK
	 jpnpz6clCHq9EqouuTDF1e41wtalj+2wiI4MLsVwtZCWHjXQxXfp02CV8MdqEcnW5HINg
	 BPTBYmf58FTsbKb6PGtlRzezNzNNz2wXqOvoYxTLWS2zEd75fb14A9i4bEq/xf0FoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yy21S5I2;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA860A2600
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 13:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADA860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yy21S5I2
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-499ca65ae87so503888f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 05:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009680; x=1795614480; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBVvUekf13M+I2J4OXSpne5JBm6BNzst3m7Bc2T2IGo=;
        b=Yy21S5I2XLIJsEjcJfnwiafnIj6tQpwVdezBaC/tKTofNpSoYeCUC8Eqddrb0Q+Ida
         42tnkukBTfvYFjB5yTqBCnuYhMhBjy7nNUAq0rOBgyHA7smTq+DK0gthUc2+MV513e+Y
         fBKWifCkWg9CbSuph2Zu4cfmZ9HHU+ZPXkMs8m1p096BNJ/4PS5aS8TUfb/AlyuKXVPl
         q5uXgvrgGofr5dAglr5srIa/JwsbgyhPhqKy7eSMEJBCCe//vjXyJwvqV7DtiJe2sERU
         ZSrJURmnfhZH81d5iLycCXCcH3RROk6TTob8tBBscrTol/e8n5X9GQZ+SEFDR/zWjjx2
         c0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009680; x=1795614480;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBVvUekf13M+I2J4OXSpne5JBm6BNzst3m7Bc2T2IGo=;
        b=KOeU1V1D5r9uUqzbbPdbMd/Xhooli6xKTcfNLX9jmuMfKQyqWIKiPRl9KofLhlegQ4
         bndRlT0PDZy5Zt3qFYv6xjbeZld8joOe3e7NMToF0FI9G5bltuNwwcN2MyRGpTbATN2s
         n5O/rSMyUStUORrUtLo3g/jJk8UPIJLLtb2yVLTf26etdkdXN6z7S7TDkaKduM4RnqGF
         pli3zorEgsN3rZLYzLKs90VaTvVNkh7aYfNWU0PtL4rT6Q/UwIYxcxTzuifu9CfnPUeR
         EY56zpKlfRiDimUSGuigIe64r8m1gmvd8rTjrrJVu7w7gRhI/lZVHCnoMnGtvlzq9q6X
         P8bg==
X-Forwarded-Encrypted: i=1; AL+hErF6Bp92pMCQU/D/jJwimn3BKjdN0eAzObpv1LSBsEAYA5XSFVXXuZ64E9X4hO1XhgPEF6b4FNxKMqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o4JWIgzEUpbIN7Klq9lQzkYeHT7Q5hUAlCQ9t723PLhKHbvYG
	XGvhIFmrzLUbhT8ZqPqpuk3T3rdsV6Htlazu+a1mqv/fk2V/dFLVGo3Oxl2mBebVWOR/cevSa+F
	20y7cYV/SXG31TwIyaQ==
X-Received: from wrvt10.prod.google.com ([2002:a5d:534a:0:b0:49d:572:f312])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f91:0:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-4a37294840dmr12837911f8f.8.1795009679054;
 Wed, 18 Nov 2026 05:47:59 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:58 +0000
In-Reply-To: <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134758.658847-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 6/7] rust: clk: add `ExclusiveClk`
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 02:07:45PM -0300, Daniel Almeida wrote:
> +    impl<T: ClkState> ExclusiveClk<T> {
> +        /// Takes exclusive control over the rate of `clk`.
> +        ///
> +        /// No other consumer of the clock may change its rate until the
> +        /// returned [`ExclusiveClk`] is dropped or [`ExclusiveClk::into_inner`]
> +        /// is called. This may sleep.
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API.
> +        ///
> +        /// [`clk_rate_exclusive_get`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get
> +        #[inline]
> +        pub fn new(clk: Clk<T>) -> Result<Self> {
> +            // SAFETY: By the type invariants of `Clk`, `clk.as_raw()` is a valid
> +            // argument for `clk_rate_exclusive_get()`.
> +            to_result(unsafe { bindings::clk_rate_exclusive_get(clk.as_raw()) })?;
> +
> +            // INVARIANT: `clk_rate_exclusive_get()` succeeded, and the matching
> +            // `clk_rate_exclusive_put()` is called when the `ExclusiveClk` is
> +            // dropped or consumed by `into_inner()`.
> +            Ok(Self(clk))
> +        }
> +
> +        /// Releases the exclusive control over the rate and returns the [`Clk`].
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_put`] API.
> +        ///
> +        /// [`clk_rate_exclusive_put`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_put
> +        #[inline]
> +        pub fn into_inner(self) -> Clk<T> {
> +            let this = ManuallyDrop::new(self);
> +
> +            // SAFETY: By the type invariants, `clk_rate_exclusive_get()` was
> +            // called on `this.0` and not yet balanced, so this balances it.
> +            unsafe { bindings::clk_rate_exclusive_put(this.0.as_raw()) };
> +
> +            // SAFETY: `this` is wrapped in `ManuallyDrop`, so the `Clk` is moved
> +            // out exactly once and the `Drop` of `ExclusiveClk` does not run.
> +            unsafe { ptr::read(&this.0) }
> +        }
> +    }
> +
> +    impl<T: ClkState> Deref for ExclusiveClk<T> {
> +        type Target = Clk<T>;
> +
> +        #[inline]
> +        fn deref(&self) -> &Clk<T> {
> +            &self.0
> +        }
> +    }
> +
> +    impl<T: ClkState> Drop for ExclusiveClk<T> {
> +        #[inline]
> +        fn drop(&mut self) {
> +            // SAFETY: By the type invariants, `clk_rate_exclusive_get()` was
> +            // called on `self.0` and not yet balanced, so this balances it.
> +            unsafe { bindings::clk_rate_exclusive_put(self.0.as_raw()) };
> +        }
> +    }
>  }

Only new() states that it may sleep, but into_inner() and drop() may also
sleep. This may be worth stating.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
