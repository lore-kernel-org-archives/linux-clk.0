Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED9F1FFC59
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002250; cv=none; b=kyoONHxC9kN5/HowcDXVbKSUkqii9quRDtIUk9GLDxfxsf5eqvavmfDMWiH9xKrqi9kjz2ZQzjIo+EQPis12twqTeB4XRC9G2zuHfr3tbUc2ghoMQHCZFf7m2Jb83khOBNRRslQv1pIp//DaEWpnNoE+DZkBw8KtJLyyEX0fSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002250; c=relaxed/simple;
	bh=luQaXlapm+5N3MbCSgVBhzGQTHPZ+V+taACIos9pA2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xky6AKpSTYdoO0hLHxtUmjM/tLF5OLuXX+rtjtxh4GXgedAJC/PU6HxkobHp9Wd2ux8b2pwGGjScWtBTdzsexfpsvbR5xwkFhyNSt7eNomNAyJNYI48jtU4cufeRTgse4seDacW3vsi+zomItjfjgFnyk7Eg6YBngV2fnA3mI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eay5GK+5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eay5GK+5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2233622fdffso81548935ad.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002248; x=1741607048; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/iVipZdD4W/u6xESxWCd4AYGgSc83dG/Ajr1AHkUSjs=;
        b=eay5GK+5IUg2nQIEuL+HcdQXt6aY/71W1U7bdgeTTbeWlfeOvmrbJ69qEkHxL/V2S2
         GOleLwYYUi40hcbZQ+Hk0bhdgJhrOhMStUUlC//QByBxlvAWK0KEJZPKd5oAixkFryfy
         yek/Iyfe+vlMxJsPZBWVCNWDIInLhYTyx1XKF9HUPWKDnlLoFLbaCM7vzcXgldneFKSQ
         kNNVEqBZdxOsG9Gk/dKC5P9W6uesN59f4qZ6P3aDGJ7P8XlmkMvg5/+7bfZ0qYseXWra
         PCL9yXbel5L7q7qOApt5I3GLZD0KPBWneMTrq4rqRbZaS2uv3XpJTgLZlLwDXJ0ZvWbE
         sVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002248; x=1741607048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iVipZdD4W/u6xESxWCd4AYGgSc83dG/Ajr1AHkUSjs=;
        b=biQHQISy0YGF2cS9bogX66FekfQegl7ejXUtSQ6SyR47ACJPuirXfak53MT0Ljq57k
         9GuU9P2Q0lttAlVS/95Qr0d8g9jJJO0MeHjLxLn6afZJpD/PVv/E0fjJ0euK1KcDrjLS
         VKH+x7SgvN5FMszI22qyVIxtaFqdhMxyj/n1yKAvlO9sTU9Cy8dYUblVJDs2C2GTNECz
         7RFAHH5IHeNasUlp4r6+eWqHoAoRDf66hW5C2sgChfo79kNUUzJ3LqB5S8Q2jG+d09Lt
         yGjsXFh2AoNRg92udNlJsdk/ZyDGC8ZJ8oeAM8RPh0JJap0wDHnK9pzyumqI/WuXlC3P
         s6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrcr67r6ArH3m07+aJRKf9z0inABg1eS+5oO44UyzrBzYV9IeevrnbX1msvLUmH7PBn8Z7wqaAGR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoCrfpjGHbqschD+1mnJB5VFForhrT1/CbTpGXbIHvooPiWLf
	pwWuU43AF0gF1pblAkOillzrTXGLQcvJyyatQp+1ta3wN6QIFZ2Z5xhOtugbSNs=
X-Gm-Gg: ASbGncvU7Ug8igceMQLVNuzdumbEbu0pOB9cYoCM1mFPghdjVlwQMG+1mXqrCo5S9Ws
	Rsu1cHvkTWGlyBJn0VSCC1uv8WIuZIbx9HJFnx6lR//uG0VGHi4YpufkdkczSXwvNFPJJzxUBqc
	RhyekSy7RlHoCgBCSy/ZoV2snZHQ8QaIwczVqP02zAB7FddcA4Y8QEQ28MD6n9rrcKNawlUpj2C
	0sIJJKX4BEYQEaCTX2g1flruHWeewtho5WFsureQ4yT3aIJU0liUhcLFlloh+8nBEZFcuSBeJjn
	lgQHqGqqinMKLbn7GiYkueviBbMlfmqxPonMT32YGImdOg==
X-Google-Smtp-Source: AGHT+IHK6Lers8i6supYJLggNOwZjS+MBopT5CAeMJGX3443/hyOyrprvywUIlovcrK7G39ADGHiQA==
X-Received: by 2002:a17:903:1d0:b0:220:bd61:a337 with SMTP id d9443c01a7336-223690ddef3mr188436085ad.23.1741002248534;
        Mon, 03 Mar 2025 03:44:08 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050d7ccsm75787615ad.202.2025.03.03.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:44:08 -0800 (PST)
Date: Mon, 3 Mar 2025 17:14:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
Message-ID: <20250303114406.xbfzhw7nvxdildb2@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>

On 03-03-25, 11:16, Miguel Ojeda wrote:
> On Mon, Mar 3, 2025 at 11:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +/// Frequency unit.
> > +pub type Hertz = crate::ffi::c_ulong;
> 
> Do we want this to be an alias or would it make sense to take the
> chance to make this a newtype?

Actually Daneil did suggest to make this "Struct Hertz(c_ulong)", but then I
looked at rust/kernel/time.rs:

pub type Jiffies = crate::ffi::c_ulong;

And I thought this is probably what everyone would have agreed to and did it
this way.

> > +    /// Clock enable.
> 
> Should these be e.g. "Enable the clock." or similar?
> 
> Moreover, I see quite a lot of documentation about some of these
> functions in the C side. I think we should not regress on that. Should
> we link to the C docs, too?

Something like this (from print.rs) ?

/// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_debug

> > +pub mod clk;
> 
> Just to double check, do we need any `cfg`? I see some functions exist
> even without e.g. `CONFIG_COMMON_CLK`, but I wanted to ask if you
> tried to build it without it enabled.

Yes, I was using this under `cfg` earlier, but removed that recently after
testing this without CONFIG_HAVE_CLK. clk.h provides wrappers for cases where
the config option isn't available.

-- 
viresh
