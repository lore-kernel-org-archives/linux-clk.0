Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167551E3DCF
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740119712; cv=none; b=kXhEH5kuI1wniW487PDopJWgKZSVHkZpZ8/kVz+enw0sLLQWGFPFzolcDAUVYFClBithB07tAkH5dSIRUmAu397R+3gXjsJpltTUws3U5nCV6INxjiyQBuPG3GGQJFLuG4BmQypKh+F4Sq2AdQCBK78P3em2MxxKQfp18i8+llQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740119712; c=relaxed/simple;
	bh=oc+EtHShi6bbNj9AJnLiY/NJj0NfEanMXEUTL2lUbmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hto5nPTIFUGQFFM49SgKudoRpKMYxVhquHuG+79R1+Cgox1bLtaX5NwSDA/d4huUmDzQHiVlsXnFm73RE0T3mO0I8AXnj4KcKyx4pJXMuc+z4jaXkrbQlm2jBDNFUL9BKJTDf+XYzS9NtGR9v40+HLnRqVXx4ek+jrzsULl0uzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idZAGIMr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idZAGIMr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220ec47991aso23323105ad.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 22:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740119710; x=1740724510; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+iMivRKCEBsggc2rtGQq+coCu/bncplKGZAc6W2LxM=;
        b=idZAGIMr16AeU38mVAUPU1g9TanDgO5TeB7Pv4IqYTw6Sv/Iwz2dQT/nXj9EGQXEaV
         3SqdmwZz4Lo5Fda8PcJkT90hKaHznB3dEZUQbtNRl/i4L8HpxRNc1mHxDMRhtdo0A3Sm
         aFKT0MYtKtWXHTEAYH2eTMTxQaKq/L6wHJyRLYC3ZlTQCYWGU9y624JZ1/pK2N5bCvwC
         Bq1Ufa91CFoaCfQni5AvDauaED9YveH0TFTIhPoqnaDRWaBJ2KDzHPSlh7eObMngmwsW
         WR4+Qc6lO3Q8mD8nmz0VeZojSJTQIDoQ31SkZ19lGBT+mGbVN9D9WSwbJL2vD3M3lHqg
         t8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119710; x=1740724510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+iMivRKCEBsggc2rtGQq+coCu/bncplKGZAc6W2LxM=;
        b=pn31jCb9xuvza+Hoix7JXgewQD657owt9lIDapHi7try4TLkrusyPkIOgLTFaIge7e
         sNajzAS0l38YS0d0vX+j2eqCIKBzSUPJqeIgKnx8xo8aJyvyTbcWgJeNg3reGEcMwHYd
         lroPJrBBVvllgbKlSMlWJuQ0fb7jFupza0shXu5ALDYccIuz5NycIdRJ2R3ichnY2MGb
         YmoIQL7ZYnLibA2sDfxN/LK2QDvwVxde45vmg1oyhjChp0dRTczuFASq/4IYMI/Yn8a6
         3KmRtMwD9zUPpZG4n2uNzzsK0mR72KxlcDPtcjjd79jyr/4HrtvIcMaAf1Zj3C6B+Yge
         cu2A==
X-Forwarded-Encrypted: i=1; AJvYcCXLPG/Ici5RWB+kfpRvILRwRGOjNGSS1H+MA/nbSF4s7HOnhm+pkKv135IOCAx/azvFbK0MghUco+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCvLUExN8473XV7PuuqIZdx+vc6U2K+/xIH/8AyFdRV0rtNT4
	UR77G1RzholDkYXjxB+5fDo3DF8qOjD/mhs0UkUUpgxvcF8ss7r5u7zn/1c6X2M=
X-Gm-Gg: ASbGnctMuvUs+mivEH08rIVACBYZ0sZftiTrB6jsVfx+6+DpbvmFU86grVZ63Gh3/DC
	D8qr5J3MmEFzgh/fX+pbYwRX7Kbqd5RcSQT5NHijvqenHzrdBFtf70J+A/sOxDNj60nPv24KpXD
	0XNvapchBsynRMj/DkUyxfDSTtw2vOhAa10XLdT5/Fe1yoblPzr0wFOR38qd++x2h43XFa6JOls
	YVIvwjLr8DmHVNz2G+xoPvoUjhVm0Xn2Nrd0KK8R4ow6e3B0gxD5XYjv2OzWl60sogF5gZk68U8
	g7m1+duaN5OFHO6pjqVjG+aayMfe
X-Google-Smtp-Source: AGHT+IEjF2u2RW/3YdAr0lHzjtV+TNOOgg3zCjt+GF/uyeQexQA0ARkffz5BS1YIj4YSEzPUqYDV+w==
X-Received: by 2002:a05:6a00:2e08:b0:730:76a1:3935 with SMTP id d2e1a72fcca58-73426ca8308mr2801175b3a.6.1740119710461;
        Thu, 20 Feb 2025 22:35:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e324sm14929891b3a.88.2025.02.20.22.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:09 -0800 (PST)
Date: Fri, 21 Feb 2025 12:05:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250221063507.3vffn55hkmcn6x35@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <EC290802-2C5E-4ACA-A530-E776654C7E94@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EC290802-2C5E-4ACA-A530-E776654C7E94@collabora.com>

On 17-02-25, 09:19, Daniel Almeida wrote:
> Hi Viresh
> 
> > On 6 Feb 2025, at 06:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > 
> > This adds very basic bindings for the clk framework, implements only
> > clk_get() and clk_put(). These are the bare minimum bindings required
> > for many users and are simple enough to add in the first attempt.
> 
> I am missing clk_prepare_enable/clk_disable_unprepare.
> 
> Otherwise I see no way of enabling and disabling clks. IMHO I would also
> consider these as “bare minimum”.

I have posted the clk bindings separately now:

https://lore.kernel.org/all/cover.1740118863.git.viresh.kumar@linaro.org/

-- 
viresh
