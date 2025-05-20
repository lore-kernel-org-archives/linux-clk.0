Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE7313C3CD
	for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722244; cv=none; b=b9DuRvsIs1Lt6GdpTlKte/JFAE46xKTOJ0KDbFin18NW56AKbe1vrd6GjPILWZ0IGUJD1P2W3LiB4836Dg1GRgR3BD/aO5ywGr8t1Yu8+c/htsTUAVTWF7qZeRpqhCzjWCM6xITBhzLbCHV5e2xDH9OcRhzCpdBT3geGdHXwk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722244; c=relaxed/simple;
	bh=OErLSkE/m1BgaO00NjK5OW2PuAYt7QDHMHCcdsySpeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7PrsLhi25R0Mkmq3gWuhTMVhHeem1p9N23JD1AyJZSGMibTjWC62UR3UqySGebNw6Pqye+DkQvxf54BQhm6Hxwb0ABy+W1bGkJLhLRVIXIq/zTx25CF2hYnrmSEvvcVUEL7WIE7ZjHzSncFI5/gagQV/iaecUOSY71b/uTZTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxvDIST9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxvDIST9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30e87549254so5322653a91.2
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 23:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722243; x=1748327043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=xxvDIST98ZmUGClwtCZ1V8zaW6UkaSftWh70vM+tKUL5mKWJNVXfO+hWqXglXNR2pZ
         uy5c8IyRLbUyJdN7vuDdOOisyG6NCChfVX/38mQ4jje8kDpbx3zNB3eEa+26GF6uaoqO
         nkpcmhJ6I6HZePUwE1m1vpHRgyC5iu+G5hn440eWjwa4URvNlt0CkpqthPxQVA53oMEw
         liLGTmFMdGqi9ESszqHbFfdVZ4fWU89FF/ZSC25c3BflElXOw6BTJYR/F5hDEp2hnZqv
         nshJ5t6BwkN4DXHf49j788sSJbZDjKQAW5xyjU5Izh3ZpRI/1WjGvwxhAfw6Tdpwiyan
         hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722243; x=1748327043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=ak0/wNmEoVBrNjuGZmi69YyFekcmmtf0U5PLpJXuzEZF+TVVPNw0PthYFBgfeMZMC2
         NfPjblLnk4KQInWPQrLqODSvTcHbKRF3Msaly/qcXyqrnw0un4xhCImQP0LqBS0nHDQf
         vtGg0HNVIq2tSVQffQm1YVuRfNNNLsKEni0R0Z5PxugNbzkYVdX40dnkh/ZBauqv4jCZ
         8wi1+psU2ZOj2jgMQG+ulgBqkf4onP98o+P6tilep9N4udSHy8O1c/RR0/siQUHrJFdv
         ITYjPJRKpXL6txFmzvOf9RWXwAwKKlrKKj8mg5l7YLizAE0UUP4qxsrpmkgzGbJI8lWa
         6kYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFTm9DQxTSQO3EMcIDgByPKwfE9/BYJweEgZ4It6AehUe3TsgkuVmtAZNR4oJifiKqYQrhxj5Keg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa99DpFmgHY/lq9Vi87y3PWlEQ5175cQHDSaUZlyenUS//tcvm
	5oKieo38Sbnw6KiHpWwxc8hQs+DOgF+lTs3NdK7RS8STXNR5apqZQW4WBJ2cB6f7OGE=
X-Gm-Gg: ASbGnct5QI5KQkIK144SLNuvbCBIerAk2cHRPvkgzptZFWluYDhHmJFWNhulK/w/wDN
	6EuK0F4paPf5bfBnVirVVfyIebMnErzzgYQXPCxlNPWRBMmCXeWuuAJYsqRA4hRjgHOTi3XN63i
	cufpRu7dVcsQYnD9z3iTw2ScgS8vc9+oujOYslxmTYs6W6BsGiifIMyV0h3DEsez8bAldKwLCFm
	fK4aq9vmayOJbU1aq9cm3/FpEQQYRt/tuOGV2sHwPt4tZs74kHvwUbtJKk2t5aLQoyRmmXWdpWO
	7UuI99VlEoIVJ0Xxmjr3RnOMGBbNwVLDp3Zb0ezSoVw/wBBpUiec
X-Google-Smtp-Source: AGHT+IHX+LQFIfZztGFcwBpfpATN8GuvitXJDkA2u+hyNtGRg1r5lgWVjoOyMg8lPkAa6aTJv5nQeA==
X-Received: by 2002:a17:90b:394d:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-30e7d5bb433mr28527339a91.33.1747722242148;
        Mon, 19 May 2025 23:24:02 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36515776sm934684a91.48.2025.05.19.23.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:24:01 -0700 (PDT)
Date: Tue, 20 May 2025 11:53:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
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
Message-ID: <20250520062359.paojvjytle4yznpz@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>

On 19-05-25, 12:37, Viresh Kumar wrote:
> I have queued this up for v6.16-rc1, will merge it via the PM tree soon.
> Thanks.

Sent for inclusion in the PM tree for 6.16. Thanks everyone for
reviewing the work.

https://lore.kernel.org/all/20250520061944.pl3mqw2clo2roe3s@vireshk-i7/

-- 
viresh
