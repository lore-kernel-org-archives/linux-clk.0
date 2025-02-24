Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19E12B63
	for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390352; cv=none; b=ZknFFtHeyOSHqC4mQh3SI/WIX7RMaDwEzGS+yyAoVVzfuPXQSEUGgdn9w0bjuV6ZXlRNRlJ2+p5leQN8Y9BSq860yNoj/m7T6t14ZKcrruj6UdCfat5a+q/Y5kHGj2yx1jBhGCUUaViwM5uEpmDHkE8KZtaMdSYJO1f0Z6HmL2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390352; c=relaxed/simple;
	bh=yI9tsEdrCq+JVlU4+kbKkbwWKZIvMC5rRRc9jI/P0aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAN0wk8U19+LGLRcN3ITJ0pvMoPgR+tReFitJ7AKYodwyKuIgLFF8lu/XtACwAdzYVGh+/vhc4p+zAGdWOwMxmCnYZWrzEIJEDiZEK9QV+IAzucEAY4O9kv0Z6SmqYj1HSn0sk9z9PbK+M3TYH4dPiSUrBifAwolHaydwcZ7rt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4eU5hQ9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4eU5hQ9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c8eb195aso89916465ad.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 01:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740390351; x=1740995151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxGqqeJLsYbeTE+fl2BbkVU3VCr8NgnhEkdjvf5/E4g=;
        b=I4eU5hQ96a3BiKJELv/W5VvP4ql8/+5FakUXyNF9yyQ89OgNA4TTEcOz6VADNhn574
         tDpjrdZzAaMVCfgrBP9w4wgwIMPeUXI7hKCf2185ulMVnIlVG1hn8DpQhB8Bfr5ZSwE2
         TOPk/lCzFyYCF8/o9z0Nh9/MEnOTYXbldgauErMmgw2hvy6iUZGPb9I7A7wDW/rS15mO
         jMirpWR9gpYo9szt5uWmiiKSoG0rGzYBVZkEcUfY0o5uB4OXMTOznDhDnmTztBFpq8ql
         ROGfgqqk76i1XxX5iPGRPP8phk/ljgjWXBEyMYQB20UNiwKJkmkw3F1r8Bmm2pyv7NSV
         hZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390351; x=1740995151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxGqqeJLsYbeTE+fl2BbkVU3VCr8NgnhEkdjvf5/E4g=;
        b=S0/5c3CSv7My7vggMDOQbLt9KKrudQmXCrrsYZ3KFyDtwsRxYoYJRhcahIT9WQJViJ
         jQ3fd7vnx9o5LuaT69E0CPMmhTzi49nNseDFxfZ7yhsjN7DsSLttwOdCeTnRYyVOPzv4
         GT0LHsgQSwTBgaBWNM9pl/HCCJmH77WQP9+CIQrTF/VInRT6F3pUwaKXuKA/7QOHIafC
         cCM4srO9GgEF7cHwAxX5hB1Sn6XEKvl3x8JXwBQKJAU7Lnr8k1XquFAaPMvQzHJNuc2W
         Wds+tYH0FUCStFdy/CMHcYxkYohbMpGiGBw5leQayHONqjxL1Ie0Ak1T7xdBTMdIclc/
         GcCA==
X-Forwarded-Encrypted: i=1; AJvYcCVqt0ztR7URgtpFcHNxl7j/sblWJdqXYwgZcvA2zCMJEHIZOtkwEn4IpwbT/pVv9zyV79RmBA81YSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGH1NPLYjzrI92sDqFoDs8xDjOOgcZ4r3MVRiOGdhfnt8IMhDD
	ExpGM1Da+TjoqPx+ORUAUOFtouLvtvDRsMV+mWR2RkFWqidhjsp2sqLHsd8nAf8=
X-Gm-Gg: ASbGnctHEfpSXM85G8wxEQluVX5jy7QtwR02OdPalJMqwHD4FVJddzQViKAlMmAlprL
	cj4uwcT8KbppkW7NhFTqNZ/ZaqJT8qh+mZVxM9YWA7EMmR9w9bl+JgeH9BwgNKwAgEfg89DmgyQ
	CBjmZtvfD1Glxp1PK819V88JEUSy6f/zIXu4V7qcR6YOUH+3GSJw0YJk+8pHdfzS+NWnM16R32T
	HEte0I8Ntbd3ykzlq1iJNt+HDLX9k8otXt3TVIfZvPPOPt0js97PR1WbecyiR0rOHkMJh6mo8dU
	IPfCTs8/hiGffaEeHsjVUWsWtEQ=
X-Google-Smtp-Source: AGHT+IFJVi7/YSBChXY4dh8iK5Nu0pMgjUbuxiXxygSfU840h8IClcdVJYvYBB1ghUBATj9XYVnhcA==
X-Received: by 2002:a05:6a00:1956:b0:732:6480:2bed with SMTP id d2e1a72fcca58-73426ce76a4mr21390090b3a.13.1740390350591;
        Mon, 24 Feb 2025 01:45:50 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73287ed12e8sm12957914b3a.180.2025.02.24.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:45:49 -0800 (PST)
Date: Mon, 24 Feb 2025 15:15:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V2 2/2] rust: Add basic bindings for clk APIs
Message-ID: <20250224094547.dv3apdbpwhesminm@vireshk-i7>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
 <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
 <Z7iSHR0F2QpiNpMZ@pollux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iSHR0F2QpiNpMZ@pollux>

On 21-02-25, 15:47, Danilo Krummrich wrote:
> This was badly phrased, the current implementation does not need to consider it
> indeed. What I meant is that we have to consider it potentially. Especially,
> when adding new functionality later on. For instance, when accessing fields of
> struct clk directly. Maybe this only becomes relevant once we write a clk driver
> itself in Rust, but still.

I don't think we will _ever_ access fields of the struct clk directly.
For the most common use, common clk API, the struct clk is defined in
drivers/clk/clk.c.

> > MaybeNull<T> sounds nice.
> 
> Yeah, it's probably the correct thing to do, to make things obvious.

Still need this ? Any example code that I can refer to implement it or
if someone can help with implementing it ?

-- 
viresh
