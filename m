Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C3271448
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125612; cv=none; b=uLv41MPNOOxFeyctjgoOvt3k/HQEw1wg2xVrqkSTiQCBrLconNSVtv3oV6SRzon/Poq2pEb7Nqv8xj47Y6c6nW5phu/BJ+qQMFtcn3Igoh9Mdjs5VStl9cPyR6qGBKxbAakby3rFxUK7lnata22pJCgZFbgz+k9cKDus6yAX/vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125612; c=relaxed/simple;
	bh=bORZD0ftv7lafNnlIcD9A5BgmKTBJMkDSOwHEr6W5TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfJY2TPwg7gtcmOZ12EOebMhI/98JXido1amhexl/80CGgAJiQTlC0CpH0/4tWJgk+yHqcmPiTwms9xHUvuqaCIsMZwxpQZHfPzVFnmlpC4qj1j0SsNQYi2J5e1lBufUg93p7/+IKeu9y+BOorpi4S/NbMkSZHl+LuNgfRLSbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J45qznwe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J45qznwe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-292fd52d527so12135255ad.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761125610; x=1761730410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZO3gd3aaKtlSHxfTafUpJfSGcnBTUPfcxPRHPTW+vk=;
        b=J45qznwePGQb3za57aey8i0LRLc8xsfRXgWsBiyIB6dnYdgEJJaBUA+ya8/BZW7j8K
         mNSETv8mnpBNyBNM/ImjFozXv5aYZL9hX0S3+0inWDw0VnHquhBV5wE7GkUrrboYUvNy
         WAZ6JdDsaU7Kn/yQuBQx17u2kCvPdNxZj5n+yN7xyS0b3Tdj3JaeE/vAyIH68oZ02rUi
         YkXU1S159J7Z6R11h1paEXdpIkz+iLmjk3ooNkd3gotvEfOSTsOAPnm+kgk9LA8BWZBQ
         sMvxdA+jj5yGJ5xPHFgbX/xxbXLoIxCkRTQsBxzkzDqd8g0R1Rf+aKOAbjZX8sI67UoL
         Wh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125610; x=1761730410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZO3gd3aaKtlSHxfTafUpJfSGcnBTUPfcxPRHPTW+vk=;
        b=eqEI2PVVwYFH8onsxc1Vx1iRg6BGpgh5A+KFBBdmbNcygXurGO+UgEs5mLxrdH+KSj
         oO/ZjhXuVpaVOMilToP4355g/ZKoMqOvK7VaQGLdaVgA8GQxNSraQFmbQ3u1dWha5Yxj
         mm/ggA1hoTbWQvmwRU3rHomaq1p0yWqx4vxkvwCTF2mOqSvP0YNJDXUC9Jo4LEnABiJy
         7fE/Y+1H8e58wBI57eYUk3i9rbTLnt88RfEKHQlm95ZRg6FmrYjO1tiajgcf2d57Y6gK
         mGao9A3M9G3qJmbWyRoWkBTveayyYGRSH830A/xVhGQg3eHwlpFec71WFani6qQOuB7U
         Y4/w==
X-Forwarded-Encrypted: i=1; AJvYcCWq4qaGtHUQpSYuE6QRDSpzOQAcMw2RMpBklQb+k45jK8cM6jIU8eq1mtpdyAKeQr8pgJ1X8YASvDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PIJGvqj9CqpbUm41Ebqt0/0ygWnjeWa6R0Mghe56ALd8A2jo
	X9ddQJFF9nKL//SUKybGZ7GdOnhMoN7HhiVsCg1pBS5a1ZAT2T3U84QN62on7mJQRtE=
X-Gm-Gg: ASbGnctaZV/3aG/gswkjOmpvE830qIn8UappWFz/DBqMh9Qgb3prrvwCFC0UR3RHpyX
	SghFfn9WJjxS4GwljDsynNOfhnHBAwRAUjMkkgaAbyfAo3HJzf3IVzBJonQIHyBJrYEDyUKirjC
	u+pEE2cKo+lilJwvBAFCOg7S1PVy8ZSsApKOlLXLQ02QUVs3jFOrGh8MwY3YCtya9DeXFtVzFZf
	7/SShnXNrI+Ew/fEOQKtErNwjPAtyBedv1el/UDP5uWCL3AkQMdH5hP8NAHiUEn5lC33v+0JfFQ
	6gLRAeB9aGZ5DMANYRzjrQKUENs9889j5ypHLdNgCsiNzSCu/LKb9C6LA+7AXtRZJxeKJ7XQkoO
	OjCJ/rQ1DwwmkaljllJnERiDhutaI3bVpfkMqay0xS70Pimsk4az90Ne82Y6EkIvhJafOu/hI8e
	oAlJab0rnoVR1P
X-Google-Smtp-Source: AGHT+IG0h0QLiAXdO5f90+3enocmFMBYwXQQom51lDBPViwF3k673sJ3nLkZON4IZuqLIkcwKdYDtg==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr234660325ad.52.1761125609766;
        Wed, 22 Oct 2025 02:33:29 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd5d76sm133879585ad.39.2025.10.22.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:33:29 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:03:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
Message-ID: <jnpqitx2yup2cvt7ey4b3fgzsi62i2pkasjxgx6xfi2r45hhhn@qqle4nvlcbu2>
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>
 <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
 <aPiTm7Pb9WguOd9j@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPiTm7Pb9WguOd9j@google.com>

On 22-10-25, 08:19, Alice Ryhl wrote:
> I'm guessing this means you want me to take it through drm-rust? See
> what I put in the cover letter about choice of tree.

I was expecting Stephen to pick it up directly.

-- 
viresh
