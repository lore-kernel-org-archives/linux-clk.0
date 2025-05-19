Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726341CF96
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747630837; cv=none; b=U+lA+A4eiYEy5So6ibqOdoPnoDONj7gQIdIwQNmyzViDnWhvMkE23HWDzA0U83iYK12q7Wu2jhz5o+dNqgeQHTGiMi3tyCMMPgAjSCUXRvL6fWCai0xlikeiGRJvtwsPSVa6dLoEhBC2eMIoqTw1pYfs75G8k/Yucjysz/I4mW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747630837; c=relaxed/simple;
	bh=52xFP2yXmzdy76BSD3IQGcBieRU5x1c1JEIQJWBn5z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXtyU5mKkhpgr4U54k4NU5nXpoWKniiwaKrSSF4ahm59fIOBD13aANXzWejNXQfyoRCFxSuBatmHFKzaswJU2xkjNaqdis+gHmRe/Mh6RmRf85SZwJpFYuQ9q6q5CcmL1+vfpelNFQCOb4qZcrMc1lgKw+xyI12Y8tmJLRZeZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BujHbdjw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BujHbdjw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231f6af929eso22803565ad.2
        for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 22:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747630835; x=1748235635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82v/sx1Sw6y7WKPsyPlbe0lUzCp5MKII3VW5cqIabiM=;
        b=BujHbdjwz+ibS/qq5qTUi7Kf3A2x+VhVDYQNsDpQhJ3ScvbNjK19LtOnDczuX8bzeM
         piabifgBhTbmIOb+QHftgYm1EOKsYv8CCfXiaWxfYE1PwGYACUlvdIRzG65IrtBlqnB0
         mBVHzvrJoYz6zmcf3saFZDNOoEmx93+XwqydK4PmFXdVhGDgAyoQBQkvFOYW3e/1VOHI
         V04RAzMeKJLbt433/29SD/hPzLJm/B1x06p/M1B7kVGtJrTG3KUsuOtVH+izueTLYi5M
         +6ro7mGpskuIyLJGHkeWk3hRB3YL40fG/bpo83iJUWlF4wmsHabid9Gr1W3AnAjj0CAV
         pRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747630835; x=1748235635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82v/sx1Sw6y7WKPsyPlbe0lUzCp5MKII3VW5cqIabiM=;
        b=pllT4ODIb+s1HS62+C7eZfzFH7Q88uFvYG/uGnu3qcGYm9G0CTwj9kv9CfkZdgMZI7
         MUjOHBz/V2Afdgn4IC97ecHo6TEu4Mw/JQqJtQ1/f58Lay8Lx8/k/txN/mjKH6C7SlnF
         pRNrfKTr6mgHcGGcJ3IV96ikUxovxiJS8pubDcLcL9ZVD9XFXVFit53wvHJQvMIwAsRV
         G94YDcrB25suf6eHicbDJ+vhBQkK4kzyHzI+3AWLdRPEvcM6BA4lPddvFB/7d4uQ9PH8
         zdnjxiMYCe5dEp319oqgGg5abLtfUHxQYD3lkMvv7loiMKG8MMmy1n/IR5KHl3C/aer7
         HZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWZRxY4mvnxNUTsXwDCkv58CQ8t08IWIZai/GjNknw9hQXAcUK09g4ki0kLffBO2/f7IQyowDsDZUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDYhvVHJL21UyAka/0aBoKRVkJWctQacCTi/puPzRPJ5X79F5
	jMZiV88VhL1R/1aOhMlKqrCcL+1rJ/y03OlkLCBJIxOG6hpJZgFkQmC57+Ss3fpGNHM=
X-Gm-Gg: ASbGncvxy0c7DRygD8gxgwKYlv/NuBy4vTqFF9TRddnl6ailZzVjwrjljhCGYUnBufK
	p9+PEx5gsqozjeCjIeCVcb7lbrx/kG+HKqr1gPrMdl5SprWJWbcb6HP4BAN/QXJKwP+wWgsrXom
	A/phnZHkcm6hkAHu9V+X5g9J9YU3p7Z7SzKdpZW8zV1+w5dLJMn8b6sRQA+sX4Lf4cjPwk9xlXL
	c5HshEF0uKYDxFkSMGlRJoS38eQhMAXrFHCjnCGG13TQsjYHtNleShlzGLaTzBQj9SLUKEvkgKF
	RjNrPDeW8sJqBRoq80XiKfM3IzYP1tDoHHwIgkL0OaAbwJ0cJbu6
X-Google-Smtp-Source: AGHT+IHY0g16rfbp5zZDSXcf+iHzCxEm729X3u6FpJ10x26f8ry1SAGnoYpao17zGAVNjZkMWFdSFw==
X-Received: by 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id d9443c01a7336-231d438b420mr168488495ad.9.1747630834666;
        Sun, 18 May 2025 22:00:34 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9256sm51112355ad.35.2025.05.18.22.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 22:00:33 -0700 (PDT)
Date: Mon, 19 May 2025 10:30:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Philip Li <philip.li@intel.com>, kbuild test robot <lkp@intel.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
	alex.bennee@linaro.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	anisse@astier.eu, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bqe@google.com, dakr@kernel.org,
	dakr@redhat.com, daniel.almeida@collabora.com, gary@garyguo.net,
	joakim.bech@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux@armlinux.org.uk, linux@rasmusvillemoes.dk,
	manos.pitsidianakis@linaro.org, mturquette@baylibre.com, nm@ti.com,
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org,
	robh@kernel.org, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
	tglx@linutronix.de, tmgross@umich.edu, vincent.guittot@linaro.org,
	vireshk@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250519050031.ubtfvbzjuyhc3bab@vireshk-i7>
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
 <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com>

On 08-05-25, 07:40, Viresh Kumar wrote:
> Thanks for the report Andrew. I was expecting to get
> these from LKP (for my branch [1]) but I didn't. Even if
> my branch isn't getting tested for Rust currently (please
> enable that Philip), I should have received these for
> linux-next ? Philip ?
> 
> Anyway, I have prepared a branch with a fix for this, but
> facing issues with pushing my branch on git.kernel.org
> currently (Don't have my regular work setup while traveling).

Andrew, I have pushed the branch today, should be fixed in linux-next soon.
Thanks.

-- 
viresh
