Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B92FC89F
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765369; cv=none; b=WkSd/dqEdziXJ3EgZ60RDhJR91tIeNPpJAFbPc1BNhly0MfCBn9U45ZUT52pfnpr2EcXmsmA2VwH26POMmHtD3xXNn2Rh+8afIxgwne0TfiNTojhXHrhxnhPa7Rzn8b6d1SRPwr6ThV537GssBBXhlVY5fEkbsldI3HKUeD5X4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765369; c=relaxed/simple;
	bh=lGQwVUMBK/+CPrWtS4F6QQXvH91dHdstz43CnGGeZbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L11JxtBy1+yZyOb6EXTXcTGayKANjHij9gd3MTP259fv1MSH4rIYezu76avnbA9RwjlFVTzwT6berHDfhb0ke3gjcpPFbxGa/VHrshboD8mqRwXZCwcZ8Xj9F6TVQH4qXzXOoYV6wi46hJeM4snkgUlJW8gMLrHh28dd7gjay9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4nTXJfkM; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4nTXJfkM"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b30184be7so455219f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762765366; x=1763370166; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIDUdeozIhDI2hlJ0i5K2pwvazKO86pOLo5DtCSzJuI=;
        b=4nTXJfkM094NT7s+ewY3JdtvhIGbAVZO8UTYobbhAKCehvcSpHXtYrJjUIe0J/R/BW
         5F6qrtfUp5Zm8n59XhTNybL+XX7M635fRdU83VwV4Li17dYMFsNu6DHc/2qfppYHUt+1
         pCbu/csRk0yo+U26DNVKAvhMSQDaT2i9B81eL9raeWIHd5dWKW+tdMM4qRZ1KbA7NBcD
         Ex+gDdiVKYML7Z0/UxdcRacS+k6KPCeFPp9rjHnTlaIRgBTA8pGvFq5iU3OlxWS7g0N0
         mq2fKRe2pFRfoIcFpSDGfkeF0oHt2mj5sC+xx30TtVgWDudvrMt/MBbl1uUjhw61IiE4
         /REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765366; x=1763370166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIDUdeozIhDI2hlJ0i5K2pwvazKO86pOLo5DtCSzJuI=;
        b=UdCDsVILWWvVpeQt9CXrOFGP22oahhiZ6CU782oH4onXICtbADORJ4x8/XN9gOKWSF
         yTQri+BQRcNmghsBJisIW+CuAVIvi0ufPl7B4iBDO1RJtrWiQ2yTMGxgvLM+HLePQH/C
         K4+tzEXm9r5yDFtnV6OYpVSI22+Kus5nfLkmKyKs60BIZhTBTbbUzUmhMzxp8pTs+vzZ
         3qYxBHEpKq0+g1zcRSEeidgf6wM1QCM/SDB1fPmInd8KeVhghJFtjArKI6nMZI9PkTp5
         Nnaf8iqAL7twphlCaEUB0bfKPem2UpWe7na0pm9PHKtN49vdRwo6i9Zv6oZVeH9nkGZQ
         MSsw==
X-Forwarded-Encrypted: i=1; AJvYcCV58A3DU+cDz5igzgixmi7Ko+Ak+AIJz3k1cNyhIMwUNiU0jKyZN++2kZC9I9jc0jeEekhHbDbvWtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rFfvhvRx8FjhnNWlPHVcyKNCHDLWG+icdHhrHDWMbqW3/4qU
	mhdSWKFiEoHtz+uwJCUnZ8gUZgdpivvfTecNaPlUiuNiUoPj/Z/8RxguVxl4auMp97Zo5tAkRWU
	ipJjrK8/EP1hX1XXhUA==
X-Google-Smtp-Source: AGHT+IG62ut6tZCTX7ilWOkDOMJIy2efcqrDPZDvsUPwtMS/puW7d2bX4/HekffUm0OxAW4LTrKcb+NjTPS54S0=
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:477:3fdf:4c24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f1a:b0:477:7f4a:44ba with SMTP id 5b1f17b1804b1-4777f4a4988mr7040275e9.4.1762765365927;
 Mon, 10 Nov 2025 01:02:45 -0800 (PST)
Date: Mon, 10 Nov 2025 09:02:45 +0000
In-Reply-To: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
Message-ID: <aRGqNUVwOcLr_UvN@google.com>
Subject: Re: [PATCH v2 0/2] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 20, 2025 at 09:35:33AM +0000, Alice Ryhl wrote:
> I added a patch to remove the Send/Sync impl for the Tyr driver as well.
> I think it's fine for the Tyr patch to land through whichever tree takes
> the clk patch, as there should be no non-trivial merge conflicts. Or we
> can also take the clk patch through drm-rust where tyr patches normally
> go if preferred by clk maintainers.
> 
> Regarding Daniel's patch [1], I suggest that Daniel sends his type-state
> change rebased on top of this series (without including the patches in
> this series in his).
> 
> [1]: https://lore.kernel.org/rust-for-linux/20250910-clk-type-state-v2-2-1b97c11bb631@collabora.com/
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Stephen, any chance you could pick up this series? Thanks!

Alice
