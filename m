Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4271F7911
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000550; cv=none; b=f0KsUde2QyhBnCZPjUEM9tU0ML3Dd1FQ0HM1CZ2Gr4ar+g8Kd3Mrp1YjBUKbIIPdB+MK+cl8m/PHW3AB6gVZAW8pq4XxFDXphDnnuBjY6g2vymVMVtWzEk0H+754OtTrhWWaRe6SEgtM39ltGSAhBu7wf7TC3oAaaBoULS5/xg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000550; c=relaxed/simple;
	bh=5hC/zsYW4m5dWMFoZYSvLKC4QhkY3ONrIAi+2Fa+xC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uROiogaM+kIzlcPmAg0X6fzDzq16jRYy8GKWwkLBadWGcPuZey8W53FbhueF5wbCT1hBZ3pNenPkzOsH4XuJiJnEA6R8VQORXodrfzKj9bPfKSWKaEJbU2ipoYdN9r8A8+gF558Xa333F0UgE9q+XkdkzmSh5r3jpWSLBn7E9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBu647ZG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBu647ZG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22328dca22fso63349405ad.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 03:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741000548; x=1741605348; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSxQXnps0NX3/X724vkMJF3+1qjDBVTjDpo2eD773ZA=;
        b=rBu647ZGQ7FavGU9hTdt424Qee0DdYiWJLFz8OxjX3rgtONSQVWBqDEuLT54PJzUDq
         aYOYHab17PUQqk4UM6ydmYm5OmJyE34/vT06aLOQT1JYO1kUCE+NSRZqQB2FnQfH1wGN
         RmBtErI8OtRov1oMZ3USehptc712n6Wy1TB6Zgd/u9cRk9r/7PweBTQFpvBV7AWaE3/k
         HL1DU/wwWki276QoPGegs68X03jMioM5Jbg1n88b7xD+adQdncz9QMh4q6tLiOcXsFvL
         /3Zd2LPHVtgH2wLSkXlfqDHZfzPzE7aoqK14r6ztSWOfX4yh9sVKhGkJGgr9NS0gWKWf
         KI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000548; x=1741605348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSxQXnps0NX3/X724vkMJF3+1qjDBVTjDpo2eD773ZA=;
        b=s02H3NGTMFFAMVHZ0Zt01hKgcQEEMddfQCi8Xy6McJQE4R/zyv/hbyUA+IE17IxRXk
         AOzR6XUFkt3BeJdqgMGjLLBdsRVjHOM4YuiN95TscgUv9RmBTf3dKKxZgDgn6K4sVRDQ
         olvXTd8losU484PrnnsKUz9bBWdrbu/l2spIXCKv0ot+46xisEeAcTipSQj/MF0vONAv
         Ps9dGqR7f+TouZ5Yv4n8VXn8RE9Pbjl7u8CMr4nalTYpRuyBl4vj8qSRldB3nMo+GkuV
         X8JnQbwmIkZW2ODNbHD2pzN8x8rfIuJVkojfYrFY+RfRLCM4ZFp0lDQT/h+rx/gto38c
         uUFg==
X-Forwarded-Encrypted: i=1; AJvYcCVBlFfYqChAVXI5te1a6Huk+cwkSqzhbsZphwmn4JiOfY/XT4562lwnBZKGPHsNBU1Jo2ObL29FNbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFRVCyxvcOkXELFIdFF8izH7qplfd3anqQMffJx+TxqNnX8Cc
	Fv/gmf5yiqZ79zA9Ry3ikIGLAeVmNvrIO2qKPBa60SPvbZorS9/4D0D0n1oryEU=
X-Gm-Gg: ASbGnctPt0jVabeApefh4F4mMLF+iewmC4J7KcQCax/RAsjCbPR+omVm0+4DkwjwVk/
	nNjhcBn2dh+41sp/fopqSwGgieQsPN0npCLfq7yjqCg7tbUE1m67oIHYrV5bVDugzfGuQeC7bQL
	sFKW/WaizzG+VC4yFmcSWOqdUCg+xyY0JUaANQw6GLk0Dx97CzJ6pwEjfv12xPxMgpXBnXwVHxj
	dK4VGCRlT1KL9syB+Ugh0XzptSmc5E4dN78D0zpLsBUnyGu+J4WGjMmg6vDKIhKb03Hz5R2BoCn
	w0ASuoC9mQYQSN1DceLm1vSUIfvQkBB5ElMBKt6N06vWwg==
X-Google-Smtp-Source: AGHT+IFZbp31fkpQhA+gdP4RfVHPSfPGmjA4KgAfzi0kwaQaY1tDD62JMcHr6vaO69K8iFjA7m+Low==
X-Received: by 2002:a17:902:f548:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-2236925f2c5mr179305795ad.45.1741000548141;
        Mon, 03 Mar 2025 03:15:48 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d29cbsm75815325ad.50.2025.03.03.03.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:15:47 -0800 (PST)
Date: Mon, 3 Mar 2025 16:45:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 1/2] rust: Add clk helpers
Message-ID: <20250303111545.ekszepspoghprh7g@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
 <CAH5fLgjNE7BF7fC6TxO3NjKV1OHXRxZFKn2Bs6fy8h_0zYd1tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjNE7BF7fC6TxO3NjKV1OHXRxZFKn2Bs6fy8h_0zYd1tg@mail.gmail.com>

On 03-03-25, 11:05, Alice Ryhl wrote:
> On Mon, Mar 3, 2025 at 11:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Non-trivial C macros and inlined C functions cannot be used directly
> > in the Rust code and are used via functions ("helpers") that wrap
> > those so that they can be called from Rust.
> >
> > In order to prepare for adding Rust abstractions for the clock APIs,
> > add clock helpers required by the Rust implementation.
> >
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Did clk maintainers ask for this to be separate? We normally just add
> helpers in the commit that need them.

Greg suggested that earlier:

https://lore.kernel.org/all/2025010708-commence-exile-0946@gregkh/

-- 
viresh
