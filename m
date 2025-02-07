Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE721DE2C5
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738924996; cv=none; b=a3JwJ+lMaEYvxrz74iqgPSMgoANbRWPqCpTEhmHZPN12oOF2AJGJoL0pEkp9nbflgoUO1TWg9Xk4guYZL4NPRRqfpi94IYGfwjWxMeOy4SSA1XId/u8cZKRyP4Tt2f3YG7LsHbwhRCV27Do+2EV4YM0bJ9noXcsAkibZJsDzkeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738924996; c=relaxed/simple;
	bh=hAoNykFyJ7QZhJYFf4N5rnUpO0uqECz17MfHTMXMUC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouehcxxZLoUxYP6ydB3NOJZdNrD16vdFare778nwwJcM1hx8fJgwdN681zKwLc8xcjKEApdw7xz3jhF9zFLZ0/iASU57gX75TTnaZWBrEZYtTCZDi83sUt5V5OBwNOcQODTr16vpZ5Ba+mbdJ4yddGFeXTrB9QjxxHbd3PcY2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnfPJdu7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnfPJdu7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f5660c2fdso6592985ad.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738924994; x=1739529794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=vnfPJdu7MsXDHg4E+P5wN6VqJIJQ4bNizNlTrqjj0EKHkJw2o7AANMm1iUJVtBDxql
         vchVkX8cyyp91Dg3LMll4Tr0kMj8cNcRI7kJGXruWl9177GkitVDtiEBfYhzpyetOYvp
         6U2jVjNQdCOUkUUlx2Is3QxwYoF8f7B/EwMal9xFP71geSFF7gTzsPOniYv5t5Z7VfOq
         8WJ8bNNdX6brp5a3c6jFqIjVFDhu2UkBH9uTwR0TcIDjJwoF73Tp86NCcwANA93eDNiv
         ho2tIc6IKVhl2dBRAYgStZw0+BTUmRBp2OrO5y/3eg04byd0L+ilsA6Jpz/rzEyosOHZ
         Ycag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924994; x=1739529794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=Wmkj0MKzyKtnng5VVD1i4rGEn1K8SnhTvUe28D4LQiI9KLN+GY6kgMoASvpRsBKiVx
         vHM2ijQKqgG38Er14OPwk1mNnSp1IoCYH2f/qVlK2wFWAPTUsnCroC3niggUsQs+GAo0
         b8Z4KrXHbeQUXsjGFCmsV0mC0Dkw1mFSCWtoJjz5vQvD8QMlIn8q/5p9o+zBmAZNhYzU
         AxEBEGetqZDK32AEtgsrc/3/zI1bnnlnRlGOfT+j2JzVmfR7H+AAgRx/iJ1tykLEuRy1
         jtaSWzJVO2M+DEYUgWQDaHDkFlhbMcXSl0nPMzoZPRTaz2RUJ16Vf+RKFQ5mJGG0TX9U
         jb1A==
X-Forwarded-Encrypted: i=1; AJvYcCVATddeS7lKpdMmLDPYS32t26sYbit3MZz5VlMt2wcyDPMEcOrzkioReLqFRD8+fB1LmeZyNXzkPKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsC3cpDZDysfUQ+cO9OJpp+9YC2hAnhDrgiz5SGcXChL/8CK2M
	XL42qL67sA/C1xOg/AnejprX3VpaxngtTIO67Nyq84IqRSTk8s3nSEs6w33broE=
X-Gm-Gg: ASbGnctiq91guPPda2uJ6trYVYbAsQLFgi57GOfZA3PiV6yGUXem8TprAGsR5zWLkoy
	pLfleK8dpxFV52AXsu458qO6mdWG5h6+Oxcbl48JuryeNHiDyg4yeSItaiNqCoG+LHa8TXJEUVm
	aaiVvfPxn7nJkHPDPeGVftP7lJu+fpusGqROsxCqt2QQAFKSd892fTXzzoM1AEK9sqdSJJhKzjR
	Y1W3S0aaGVuE6xAX9h0atKShHxOZoxcIrY7nbnoIVLd3z4afmUTdkJlvFO83sQiSy1GG7tTt36/
	CNaw/NfoO8nuyoG4gg==
X-Google-Smtp-Source: AGHT+IG+GWLav9UJfqyQ68A1jcf3lhjRtJkvLA7MYkbHl336IPSn8Kmidgk/a94noG0INXD1mHf3Mw==
X-Received: by 2002:a17:902:ea0d:b0:21d:dae6:d956 with SMTP id d9443c01a7336-21f4e6e1eb8mr44938405ad.24.1738924994072;
        Fri, 07 Feb 2025 02:43:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm27289215ad.78.2025.02.07.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:43:13 -0800 (PST)
Date: Fri, 7 Feb 2025 16:13:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250207104311.g2lexa75o26z6aox@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <Z6ShsuLykigNscz8@pollux>
 <Z6SiiRubSXGInbgj@pollux>
 <0cd42d2d683ea057e6034978b02c7f84.sboyd@kernel.org>
 <Z6VBo51g54xAmelQ@cassiopeiae>
 <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>

On 07-02-25, 14:54, Viresh Kumar wrote:
> On 07-02-25, 00:11, Danilo Krummrich wrote:
> > Guess this should be Opaque<bindings::clk>.
> 
> So it should be this now ?

Also, I should be using ARef and AlwaysRefCounted along with that ? I
am not sure if I can use those with the clk API. Yes, it is refcounted
but there is no direct way of incrementing the refcount unlike other
frameworks. clk_get() accepts a dev pointer and a char pointer,
whereas clk_put() accepts the clk pointer itself.

-- 
viresh
