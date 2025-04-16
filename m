Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98C238143
	for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798650; cv=none; b=rX9v4j/fIngvxOc0dQ2IIROjFhoOtwBA7JL3LcQHvVn9+LdBblYottZR6P6rfMnBonS8wMSrOhQW4aQsr5STitAU79Ro3QWLUFPN28sf7pJmqGCngN7q/4tfwXvQueDdOMHHM0NoHuipdKPZuQq0876KvCdmegSF7yX4dvzJkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798650; c=relaxed/simple;
	bh=XmWerUv6DAZOzlCQim89TVXi8/uwr6MnEEJG0S01SjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m06PVQMj3WFfxlxq/hKUI1fqUr/z9keE3rzwm1hU4ViHIUyjw26T20tqhpiBJdT96qlTNoHGytaVVcCsZErU5RLOAQWdZvG2k30317nB/UFWSsvzSFWveoN/zNVNQjsenJnK/JIqNhKimAirq7l4j3Qs5cTIw6lxQ0JG3M63g8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTJ+KGHR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTJ+KGHR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227cf12df27so4746705ad.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744798649; x=1745403449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/ANKiJhFvihbg1XVir8LGKcyLP9qIkWBCOvxZUsgt0=;
        b=vTJ+KGHRkCySfO0ivP/SlYnPokydPCGY/eut3rWHB3qhHZQsBQ3Zr/85IqxjG0fCLA
         JQykRWn/X20NH2Va3JBg1PxemICdXYREKOchjPPa7EWNoZ34zWI/sweftkzUkcTH4vc/
         jJu58OopEC5eBgvl6nx869lR6VjhFmY/7RLBD9p4rNXInkpoFffpq0FTydSNq28HrEQz
         pWja/9ABDBIj8bPrvAs/HDJOTtZhG25YbZD5MOqu+kEWGC5n5pCH8Dni+MzSIyVFXSys
         iz85jnKKJDDYHpUHlumOwxK/GaKNtAbTF7HrcB5EcaXim7VowZiGlUVN/bEm52nRZ4WN
         zYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798649; x=1745403449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/ANKiJhFvihbg1XVir8LGKcyLP9qIkWBCOvxZUsgt0=;
        b=K2mXxtV5J1F9wKrQbmMA5Xqb9vhmm+KZ5DjSBTJ29s36lAxW5u9ySX9g4wnoiEqvfr
         dgyvt1fdDjscW643bVH35nYrjBVksGWbYgGwFhzNqOtmWL0dQqyqYbpslGgn7i+4mQXA
         vQtyOvt6IfcbfmuTTVkq6zodcdvihZjG32dMdnFJyyMTKjP+bIHvrtHk0ta5zj+7/1wg
         WdDLWgeEp+Nu+5dFCwfx+cYiS0rRTN4g3MeK89IqNapDWOkwdkK7da8kWy0X+Uegstc2
         JtXlTDWK+f2UF8bQ3AsGJQ0cc2KpdqHwG0B5tyNm7Ke8amZo+wUIy69/zvXna6rRf+OO
         g0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF3mSL0ZPsGEyRIu8ZQDAPLfAlXIqwX1QIYDDK8GGeUqXTCDL5V//J0HDeSa3A3uS0oRxdCp9ovos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7WrpHqxD2S3O1VADTWiVI7Hfjza8EWtlwfsn0cvH64DFnqmOp
	XepQW9LKHKpDBdaRVOv5NZOyRj+r6t16I6nP70W3dz2xScgBYVgGlpqtNbry54I=
X-Gm-Gg: ASbGncuVXcu8umfc8LGH+y9LSvCrfvaY7i0DJ0y3YvtH8wMjoWgbcuuPIxPnb63raLP
	crKGyJCMsNbz8lXSW6f2OnR7WGxvm1LUt9rAyC30M43mLSc/A+m07Ble0zdhXpjrUhgWpi3/l+g
	TCxzbIocK9MW1E6tSHU7fDb8+URcNwgPdhjrKO1ObFk42B51F03SmZyYvTCdbOVQseCU0qWP2xd
	hbZQ/1HX8/GqAflA/+to22i/Bpi7kHqMFwrzeVpqOQ1oF7vVuDySACTDMrLs4HAqfjGM27/9N1B
	ix7Cpspc5JFZV2kxtVTR9nnxQ0qFI39Dt0nlZph10g==
X-Google-Smtp-Source: AGHT+IEP5v+tXDBmTd5U0jC7DaGa/ExzfUSWGNIY5nfSg4zcC01NVkg6iyoz+YcRUATQclmDewMobQ==
X-Received: by 2002:a17:903:2448:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22c35d25e43mr16092715ad.7.1744798648728;
        Wed, 16 Apr 2025 03:17:28 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4b96sm10195445ad.174.2025.04.16.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:17:28 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:47:26 +0530
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
Subject: Re: [PATCH V10 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250416101726.g5jm6wnbbsmuskxl@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <8d04ef19d7a16610dbf0dfb5c9a611c6e1e3e318.1744783509.git.viresh.kumar@linaro.org>
 <Z_9ysHFmvZvaoe8H@pollux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9ysHFmvZvaoe8H@pollux>

On 16-04-25, 11:04, Danilo Krummrich wrote:
> You need to justify why drv is a valid pointer to be passed to
> cpufreq_register_driver(), i.e. something like
> 
> 	// SAFETY:
> 	// - `drv` comes from Self::VTABLE and hence is a valid pointer to a `struct cpufreq_driver`,
> 	// - `cpufreq_register_driver()` never attempts to modify the data `drv` points to

The cpufreq core can try to change the data pointed by `drv`. For now
it updates the `cpufreq_driver->boost_enabled` flag.

-- 
viresh
