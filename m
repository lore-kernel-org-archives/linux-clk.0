Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442AC72639
	for <linux-clk@vger.kernel.org>; Fri,  6 Jun 2025 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183626; cv=none; b=rASqXgRIytAoD3jzl2yTnbnJNMUhD8ZhC1zXaxozG+KP+Ll6kNiBlG6RzZJNP9Vj+wLGSbnjmeP95utSCuGnBuehiKooGMqWMrBP6XwU3ZEJKnEdujmrOqM7V3069kDNREFQmFhRHqHHYiyLYJaqnZkFLQ1LHOQBIbXHmI1vQNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183626; c=relaxed/simple;
	bh=cBPVUZEqDCouVeRGB+TRMPGlVd7k9y+CujAOPGFklYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFvliQy7DtDA3atNot3BJo/xmdm8k33x5Jdvr4NiCgBAhNRLAFsANdycucMf+PVxAtRQt6oY82ozYvcdVYvF9GaVY7k8vbNIRoRkPiPY/YhudejS8B0jTNaNkpNf87A0oBPSksNLyq9cgyxkT90zuD1iGYkARJBxZWSZ7w+QuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8Wi0j0i; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8Wi0j0i"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so1535467a12.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Jun 2025 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749183624; x=1749788424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7TQ+3XX3FlrGS8OYKUYQhs5M06UIOQDCmX22nbGDmQ=;
        b=L8Wi0j0iij46YCZxAnh4eP82ssKergFuTF+qf3R/L+ApEtSE+Anb9VmYR7Lgb+1gLQ
         kvPoSY2eNoqqJ3WAeIkWb2aBB7rf04jys8tEdZ7s88UIxOofePP/mxbGATKgYcY1k6Lz
         Uid7lf98X5gC9eRTolqzhqrAEDclwwt0NuSws8e5m1Jbi+i4g1+VjeNLSRqZpVGCjWF2
         AFaGKbwGD/EFXowED4ExDejr7J1nnobHmKVo21UHsWDvXqFQj4ZhF0/UyS+7tzuRDxbf
         1zr2/UG+PU/LvLFycAT+1uRu4yBmqm6k/N3xzaTrI6AXQY6vsSJ2HNsX5Lap3PY2Q/ui
         Z3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183624; x=1749788424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7TQ+3XX3FlrGS8OYKUYQhs5M06UIOQDCmX22nbGDmQ=;
        b=FdVajNWpREIRS2XhwPaIUjzUJESYl/SFSTW9YCJXWLfGfExoEV8BbikP4v9GketOyo
         NPC3pUoun1/vIIa2L5vPy7jGWTZA2h5QkvBRYq9Lt8Z2VEt0fDo2Wn+Whod9s7rwyGYl
         e53PwDHqpZDEeMBZp42Hm0x0uBCsQEZQtvgDiYIoAVsEo5sffVc8tcYqnRuo1Casev+m
         8kldyxKoQuNmVeEOtolqUb267hz/Cm4xpbcqw5yGpU3bW2v14lzaTRIxv0lUAmTvPXrV
         Y74zJBKoNtx0NHhYqVGBUCfDvt8AtDQmEYSacmU6VG2DO0xujML74ZpdqJtp4q/LoQit
         TK7w==
X-Forwarded-Encrypted: i=1; AJvYcCVF7XVrS/ONAViDbEGziI5T15FoVDpuNzkrBTtMczVYotDqsI4SqPGMbIfEUdFnrLbM1IMm9u9cg3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YypYPzIwzPI+kqCsH4OWhk1kNs22F6OuWPW/L65AZZf35CI/tZo
	XSfDrtUjkTzs88ySE+2r5ahJwX06gn0Fk5qpMuITaARMscDwJFUAX18EawrcKxhK34s=
X-Gm-Gg: ASbGncuyGd0rl+taa29o5ps52/UJX8Tzmmfos3guLITJJTaqYL+TyViBVdcwBesfQld
	bkNwkxQO9wGXv5j5hQc5+DvJ9nqNnX4H25vDVe9Gednit6ZbUZPvKLGAVCMM5YNibqZowv+0nmB
	FT8ecuZtFrilnNh9B/jIXnnrSjnvYNhowcT/HPU5xJtfOaRKS1bgAUqvn0t43215O/zbRXKWLhA
	hUuv50DI8zBI0NSa6FEVxe8uR0CbnfNspTwlKuzs3KJ/kn/1P1+dCWw+rFScckabFXa3ap/K286
	hi06cEcx1R2a6dCTUeSONhkVUeDxhq7iSi01y6E8vrLvbSguMj4H
X-Google-Smtp-Source: AGHT+IHFJsnesAwLkWRA6zdkndEn9SX9qS0GFQhYN/5iMboGyQM1Gp0sj8pgSAH/JFC5Su+szK4MWw==
X-Received: by 2002:a17:902:e88a:b0:235:ec11:f0ee with SMTP id d9443c01a7336-23601cf96d6mr29339135ad.14.1749183624573;
        Thu, 05 Jun 2025 21:20:24 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313286fa44bsm908620a91.0.2025.06.05.21.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:20:23 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:50:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250606042020.ytpvgd43auymf65b@vireshk-i7>
References: <HVTDJypFNQFfSQJmmYDSPU4o-irFnjmDN22RW3S0z5Kwe_hVk9kquZWElv-C2k6d5kOIiewhj_Xo2kAoTHbHgg==@protonmail.internalid>
 <cover.1747634382.git.viresh.kumar@linaro.org>
 <87qzzy3ric.fsf@kernel.org>
 <aEH6GzCTgXZSneHt@tardis.local>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEH6GzCTgXZSneHt@tardis.local>

On 05-06-25, 13:12, Boqun Feng wrote:
> I assume you run it in a VM? How many vcpus are you using? I've checked
> the code, cpumask_{set,test}() can set or set bits out of nr_cpu_ids
> without triggering warning if CONFIG_DEBUG_PER_CPU_MAPS=n, but
> cpumask_weight() only examine nr_cpu_ids bits. So if you run with
> nr_cpu_ids < 4, the test case may fail.

Ahh, thanks for that. It was really helpful.

-- 
viresh
