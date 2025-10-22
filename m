Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC7347BDE
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142121; cv=none; b=FBz+j49Y8w+WIspM+zdaEf5/5VPKA+J87g1mT3Y0P+XvAntFr4vewNRxHlFuzww7zFOfdcrCBlMnvHkA+36SkVFhYPDJMP6r5abzJMpbYoGYFWUoCI3GCudQZCkOsHlOru7gVRuhH2Sm7/W6Ogblaw4o9Zgn1DBJD+P+BrBhwXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142121; c=relaxed/simple;
	bh=nf6lYvULmbWaC/xW9v0Y1FlJ/x3FuK/AGx8my0sNvcg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HiGg+W4cy7fy/uyrADSYhaek7dy+YzhrD/UKY2IYTKAaYxSmv0wmtXZH4lyZorOpZ9v9oAbqw2AEgb6inyN+dgFWo1d4gzG5lQ4tpyq3bqSJ72iS/9eht+R4EeZY0Q+4quxMg2fy7xTGpj1PFxl20N5pF9edBSGn2vu5Znuk9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qF7XKvKB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qF7XKvKB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47106a388cfso31909815e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761142118; x=1761746918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATlrZjqtWRkDgSGBMom3PghpDA1GYToK819nxmIH54Y=;
        b=qF7XKvKBWv8/UBbXzTPd6EBis/6kZfznFn9ZfAGFjfclhnSHQTpHdHLryicTUurJOP
         iUO0AdHakdp/wlIs6kgTnw1vLotjNL2W8Cd0SfjnUDAwSSTxY1uYdPhfFaQ9q6xqohjX
         PXzN64LL6cpA2JMzSzI+JXLbbyY3T2COvqq0T9mAXDRrIz0xCePFgm1XHupaJpGECtrg
         4D2vQ/zmUM3w1398ErmUc8UlE+6f3g4zXD6OzBIL6lvevvSE2whnugkkYcPidAcWyZfa
         ay+5RAr6X0d9sOZ6cyoUk9zYKEjBJHTg5vp/tu25E2fSDy6E/azskM0ttPLsSFFg9hB0
         dTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142118; x=1761746918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATlrZjqtWRkDgSGBMom3PghpDA1GYToK819nxmIH54Y=;
        b=LPYUk584RWNwX60Pxeh5Zwl5PRIVXjSE0o80nU0LoY41qcTF1IJp9qwGIIGGCJyj4u
         dssjU8Y9mPpZ/MH2qypnFfh7r3E1hoJoSMjUC1/dJSJa+UYfbSVlaFORZNpQdhHbIymT
         ivvwHOOqYn8/jCjMmgNJVQdoJnTbqKrv4QZjl+QNUKIh2s9Yf/rrug8y1rKsm4tjJ/iu
         qYBJlCrtqu+/AbjR4cis7QJ/icOvkKV1br+aVlS1A6Nsd/oSdFrN+6rjj/QSrUkVg0WG
         JmoRRQlospNfM6TI/YewQij3jXZYoVOtiNjFwpB8U73QFpoRxiP/QnvJs7MSmBGqd83C
         IlpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZCcnTrZ94C+7ofztUXv0XU5ta1MfENSLeAvPryNAyWKjDFJoY71QlIR1B55pygsi4y1vxssK4zlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+8Oieb7jlHYz6ETidnjnnEVGFxc2VrB9RgXk01U+x9LqTQ1A
	2otB6OhXRTvJmbYaMQChxXESy22yS/8dBBE2oRP+ICQqmcJqKbiJn44HRctsNEwYpnoEQruEnkh
	MujjlrGKgRY4dDu0p0Q==
X-Google-Smtp-Source: AGHT+IGGiD7bely6ltA8zojQnpBYzqlN9EfV8SH7PMi9UDRTq16fyrTVPdiLdtgeh1l7/mph0NHAx7PqvBdfS3Y=
X-Received: from wmom23.prod.google.com ([2002:a05:600c:4617:b0:46e:15a3:1c9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f08:b0:470:ffd1:782d with SMTP id 5b1f17b1804b1-47117876a19mr174974085e9.6.1761142117704;
 Wed, 22 Oct 2025 07:08:37 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:08:36 +0000
In-Reply-To: <jnpqitx2yup2cvt7ey4b3fgzsi62i2pkasjxgx6xfi2r45hhhn@qqle4nvlcbu2>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com> <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
 <aPiTm7Pb9WguOd9j@google.com> <jnpqitx2yup2cvt7ey4b3fgzsi62i2pkasjxgx6xfi2r45hhhn@qqle4nvlcbu2>
Message-ID: <aPjlZMg7UXc099cU@google.com>
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

On Wed, Oct 22, 2025 at 03:03:26PM +0530, Viresh Kumar wrote:
> On 22-10-25, 08:19, Alice Ryhl wrote:
> > I'm guessing this means you want me to take it through drm-rust? See
> > what I put in the cover letter about choice of tree.
> 
> I was expecting Stephen to pick it up directly.

Ah, that's fine, thanks.

Alice
