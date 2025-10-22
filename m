Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC538308F1A
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121183; cv=none; b=KFwAdwpqIzhCrEn1fs2beP59+jqDE2G69Pe8yTdavyvEr795qhDsfVq7Y/Nd5Vf82wfkMYfQNUtw8qPc3B65mAkodr23A8K5+w59uWDQ4+qr6nVNPv2AjHbPvYwkBkH68PLgjmHqf91YuMary8oPK+C+wX1DbDU2KYHIF+UCQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121183; c=relaxed/simple;
	bh=RHEi92BrqYPevwcCSHph3ISxaBSTH5yv2OoBTfvdyOA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QRmjFtPUnL0TvaCgWGVCEhfgC+YUngHSguI6D+Hr+dFlbZCew6YF58SRnN3hrHXihLGLwYh+SNQ7f6UEAasgpGWVPReWM7Xw/pI1AGA75rTi+/nqpsqeYIGpq6Q/qQbH+emIHkyHSgfJ+Euy7iTEYDVWNA/uD0/8/b+df5FXiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/YiIvEV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/YiIvEV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso17707055e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761121180; x=1761725980; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wEK/i+XAkLQEgOG+ywHekwqAFjmlaiDFBYJQ7FDBQr0=;
        b=V/YiIvEVvbIymPXqtJLPYRTu4QnlxPwJaj7UzB5jcs2VXVsyvnrPtwGNn2IBXwVoKc
         q8lPuDNLUgUfYBNKFpMjtFJZC9Tx3bnnNylsXcyA1d/O+AXh/ADvunks/o/Gz/nsAUU0
         QIhHnad9Vjz6T3BzhAPjVvuew70SHMNu/0BbKJhXqLny4Bwiedcphq6vkJBweYDcmQKg
         YZEBYDP0N7pzX+xAAFeBN+l5AYSmFUgp45C/bUi7IG5V2YqFLISitjmDuRtD/seEeiOV
         0MXlG7A+VGZPYYJ/6fowVvSW4JWe1N1YpDsqRsnTJY+DYvOCS0fhqeuMiujA+tQymzRV
         BSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761121180; x=1761725980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEK/i+XAkLQEgOG+ywHekwqAFjmlaiDFBYJQ7FDBQr0=;
        b=tGtNG2XYeTlDzWc/NzF9eW7pxt4FxEsWCm5XPPrwKJoQeu5l1qM22tXllvoNFyHaKb
         yyO3Su+RBjNc4nr3yNif8ho6o2WGzPvGYFbQ/lnqd9PT/vlkwmofmGr6cvjEf2x0aTin
         vUDRRXfRrpCY6oKo0L2qqEsQ6UNjLwK7ORi+R/AzeqdF11V11dZ0Bi79A1PrUmWXS5XC
         zl/B8HZwiIicj/jZhkOPFkX/UYI5xA40z6w/2aVUB37omtQapWZTqV4pqgrt2JIJ8TQW
         Iwn8ZzeVPzojNCER68Po18G5ErGGly4HEp60MAMqUBoFyRnsWTJXsSbhc3ZooEU4wi53
         cicw==
X-Forwarded-Encrypted: i=1; AJvYcCXXfOnBZ29jGz3D6p/ga+ju51FmzTIglTNNSTAIaR/odms0bvzmR4sZ3MVQqYv8BjahVDbPLE5260s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4o0DbuQwhjxA6UqvQzU3l3AHJFylMOXQXzqsbTtVVaR3q6I3
	i+fZqp+O4iMYfAXCiBRMVqao9mkQI2ZeM1YAGzuuRHNu/b13OusBj9RGcaJPyCDx204wIZWM9tO
	wmnoDRT0ZlpnBLdcTfg==
X-Google-Smtp-Source: AGHT+IETajWDiqpRqa12EaVRu6fAxwYa+sMKITK3BOKL9H9yAMyU5Oa/ffCwAo+MISi9sybobSyD7GdOvUHfNzo=
X-Received: from wmpv36.prod.google.com ([2002:a05:600c:4da4:b0:46e:2eb4:38d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8509:b0:471:16e5:6d7a with SMTP id 5b1f17b1804b1-4711787dca0mr106715285e9.13.1761121180045;
 Wed, 22 Oct 2025 01:19:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 08:19:39 +0000
In-Reply-To: <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com> <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
Message-ID: <aPiTm7Pb9WguOd9j@google.com>
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 09:21:38AM +0530, Viresh Kumar wrote:
> On 20-10-25, 09:35, Alice Ryhl wrote:
> > These traits are required for drivers to embed the Clk type in their own
> > data structures because driver data structures are usually required to
> > be Send. Since the Clk type is thread-safe, implement the relevant
> > traits.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/clk.rs | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> > index 1e6c8c42fb3a321951e275101848b35e1ae5c2a8..0a290202da69669d670ddad2b6762a1d5f1d912e 100644
> > --- a/rust/kernel/clk.rs
> > +++ b/rust/kernel/clk.rs
> > @@ -129,6 +129,13 @@ mod common_clk {
> >      #[repr(transparent)]
> >      pub struct Clk(*mut bindings::clk);
> >  
> > +    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
> > +    unsafe impl Send for Clk {}
> > +
> > +    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
> > +    // methods are synchronized internally.
> > +    unsafe impl Sync for Clk {}
> > +
> >      impl Clk {
> >          /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
> >          ///
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

I'm guessing this means you want me to take it through drm-rust? See
what I put in the cover letter about choice of tree.

Alice
