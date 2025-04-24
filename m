Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595910F9
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474518; cv=none; b=QOwjXMV7xr0Y6dDKxgU0s7XfnSBO1xoSlLOcAW6rrKttWaRLz8YPEi6wbYxUULAi2eXSsUT7b2Z7ex7F1eBfqDdjgFj2R79ZaiQukq9aXawacvo3f0RsraaS88nTSazjGc+dyOATlsnDHxSFXcB7AALVRRke56HmGYOFg8M2nvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474518; c=relaxed/simple;
	bh=Z6mlm1vaiSd8DkRsHlERytRx9CV4SLqbuOmSjuJ/xNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf6YbJFukJYqYIo0uqX43wmTR7eUBW6E0DNJYgmafhyqydBizZWoAcnveOf79RokoAQG5hwlyUW6KHh3Mf7n4Oz2DkP+jjTToaMdXHuldUY7unu+0EWWu0yjWTWYgpcDmBwpYp95yvRYYSh7P/bl4R0K3scYNwOqYlLSUzYgBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvVTv8SI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvVTv8SI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so556653b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745474516; x=1746079316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItVzBTSerAAYDc2jtmllBIZUTwNzEBk5YDQRurUUd5o=;
        b=YvVTv8SIm/1ziikgPqOLmgvOOGO1SmfsO0yH2y9W/MobGSKdWIRQvTjyBckrmZaZBA
         23jVRF+rlKM7WIg7fTHeNaG7NlPKOZJ1lprvcz10MrSoyvoSN0nCmoB3Tt00w4kDJN4r
         Yf04VxktpC4gnVRqRHgeD/GHDTydV0DYk1ZWE3LkpMilt6JCiB7SUB9oBfG0dz2q2lsL
         7QbKgv9Cccz1PRngy7P5ozQQ59RB2k+4iVqcM54OxW9UEbN6Lz8BaS5j7dmhc9uwe2Bx
         ky0gTyM4LjyRLfOYEvso4OiQnGc3vyj+oqJuOWgMWv0VUcF6pApnKSGMn/PnxBScYUE+
         E5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745474516; x=1746079316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItVzBTSerAAYDc2jtmllBIZUTwNzEBk5YDQRurUUd5o=;
        b=vdl1JOp1/Had4Oq/WgdC340gkC7z6UjBV8H4HhfbDeup8fPEvwSVH/dNitJIYNsf3q
         4Rf9B64HwzwCMhuWqWE4hAcelTvvouoX90qe3HYpWZDi91q96RScMteB12+z1Jzpaum7
         zSbdtE52eb8c36b37t2PwyeTo0oyWxKUFaTzWjU4RWq1l9/wlQsnoUYBHJZtHo5gVSUu
         pd6D9d/xLmtiOruY32KNPhajJGqN7SDHq82e/xLqfj1HOUVcL4fvEjO1Qc95yxMset8E
         ZFyVehZadH1qXmv97czVfOeeLvCRZDLP0vJoKJMjb+IMdnAY8UH4H96i2lyPJMqYBBGA
         WnlA==
X-Forwarded-Encrypted: i=1; AJvYcCXqyPxH8GIoHNAtgZADPzweczU8PqUs8Hyc30jgrzZ8kXBUvNBvL+FjJXMvmrUwOis9RuKOQ/1lmB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bFxclX3kuxlTIQHVYahQdKPHiQduAlz47zVK5W23BnGdKRe1
	18I2jqsLvSJEX6gK1DuOGrQIk4wvRlGmqcintVPCXBRujzsbVpfN/HSZAJvz6l8=
X-Gm-Gg: ASbGnctJDp4azgUjv/SM+LqIx6SnE4Q+GfidBpcaCgdUnA6Dzbg76UOsnbX/TJgkusT
	PJ10gcKaSl228oaP65k600j96sOc0+D1X2Tzp+lP4Uqs86C8qKIJL7LGUT+8qo2u0gZdIJXy2PV
	UftmSyfobGpGaengWDil5liPrJnvKGpUupqVRnGv1v4UOA6s9XKFtsHi4qO6sCUQj6Cuhsuqbz+
	hJgJJvAXmYxQ7K1I1q9I9EfuKaSbvy51+Bbopc9pIGgNPJmBh+hQRUHBlUOnCwU81j4BJ4SvJiB
	R5zjx9XMYbTzVC/FWyBXeRAqooo1zYWEtdN0BGMC8A==
X-Google-Smtp-Source: AGHT+IHpb+KQKs+bCW6EMMLRqMG+2nRuFK3vtw1oUdYl0ZcihCBk4ttWoQ5lM8jVKKGTONgQMih/FQ==
X-Received: by 2002:a05:6a00:ac86:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-73e24ac977amr1991976b3a.18.1745474515750;
        Wed, 23 Apr 2025 23:01:55 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412b2sm603446b3a.66.2025.04.23.23.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:01:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:31:52 +0530
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
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250424060152.gsrdz3fonnnpn4oz@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
 <a14f6927488b5c7d15930c37a3069f46a5c888a2.1745218976.git.viresh.kumar@linaro.org>
 <975c8346-dddc-44ef-ab24-71cadfbce23a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <975c8346-dddc-44ef-ab24-71cadfbce23a@kernel.org>

On 23-04-25, 14:05, Danilo Krummrich wrote:
> On 4/21/25 9:22 AM, Viresh Kumar wrote:
> > +    /// Registers a CPU frequency driver with the cpufreq core.
> > +    pub fn new() -> Result<Self> {
> > +        // We can't use `&Self::VTABLE` directly because the cpufreq core modifies some fields in
> > +        // the C `struct cpufreq_driver`, which requires a mutable reference.
> > +        let mut drv = KBox::new(UnsafeCell::new(Self::VTABLE), GFP_KERNEL)?;
> 
> Maybe add a comment that it would be desired to make a struct cpufreq_driver
> capable of being declared as static const in the future.

Is it really the case ? I am not sure if that's how the C code sees
these structures.

Most of the driver structures (platform, etc) contain `struct
device_driver`, which is mostly modified from the bus layer when the
driver is registered, and so it can't be a `const`. Apart from that
too, the drivers many sometimes carry flags.

File operations (with just callbacks) can be `const` though.

> Either way,
> 
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks a lot Danilo.

-- 
viresh
