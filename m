Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58125C829
	for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722141; cv=none; b=u8PZ7Wy0oZJDXvzue8YNK+y89vhn1uTqOWh7aHQ8FlWxS5HU0lsoYDykiBURg/JKGKVvsr+5OMdnhyFLfhMBis1R7y8S82yAQo3JX+v3mU7TCOuP7Te53sjxKdBr77PJRQ2b4s+ZFYxy68tbzhdWi3FS7o7TLf7IrfrosdzE9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722141; c=relaxed/simple;
	bh=B/X6KNDiCJa6ANQuk/d5rOGAHgPZdwkWQandSI2PQck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+KXQ28tqwlIwIxf+F/l1nTbmYSli/K/FE/woRAsOst2fOcdHmfL7dUuTCuRrR3/Hv0oknX0wTS/V6NJh3IG6Ou6F+ynW6B4QRNCvFBSHlSILx8SNUleVw4Og2iGXGOhhBkiLiszAL85eJgGdnuwZRPunfwk2LMq4+2nJYx6UPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SU4QjGgK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SU4QjGgK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2320e53167dso30479665ad.3
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722139; x=1748326939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=SU4QjGgKN3wg9epxAawEM9OWJgzIxLhjEF7cH8MYUxPjfNSQczKVMzaJYTg5Zw2s+i
         PRx8sCUwKmJz2rRK6KGvgs79JAeuttnjh4HjyQytURxmkvxiBXIR0VbfzuBEEWkaAWIR
         JjId95bnOLTIU4g92JBE5R+l96SRKkpxBLkgYX3HVACBQtg/uIVYi7bh4bthP4yYis/+
         vki2IRJ73Xqn366iJYf4++9XdG1vLAb3h0dzUOi5H7x29Lg54PlvJwLx6XsjtagitPTv
         FM6Q/QMKQuz8ABN0KfyfwEPK2Sr+3Jt12wlnY2gCWzFWu7BWj4WsOHcXmkW3kla7UHIO
         tqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722139; x=1748326939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=TPrFc9u3UN6bmQTUErG2K8ZQFk44E6uLn4xLvuVThfgpy2YtVb0d/KkgNFFb/xQ8p5
         asKLw0p3O3cOgJm7AP7/K/Z3S2l2RKMzFrPnCKoRAmzw3UN0nmsVdYFOZ2T8KFqJElgq
         nmFUmvOa1PPRH16LelulyNdQA9U6d6BJwW1V3aMa0cNjWXjngyE0E+ZF2yIzGuKZyvTG
         VCfggO1n/3tc7H2vm88NY2DRhP0uAf2ixHIYnm112DtAdSb9ljmy2erQv7I77wmKjZlD
         VmTxlQB/+SRB6P4iMxqLeipEou3/XLBqa5MhBjnEkf/3YjS8UudG4xWXxA95c8IQ9MhK
         zLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyRkREFuqd0WrPt407NUvPWhLKTEQ3l9ydKDXecyDwZtGH8CfWsjXcLwaLGCAZvgsUsT3nFTcw8Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxABGHlRoX0FQkErJVMpT9iR57XBb7GNRSTXDQE9C3b35hS3ADs
	w3J6WtxqpUDFV9k5u6I3U03v+/5s4RH2geEK12uclaSEdN7pgzrg+3KUQDV3xno+TDk=
X-Gm-Gg: ASbGncvzrmZvD2RRu2DajwN7fA4IoEUbwPuQx5XErussyKmutBF+qm22EgzD81DXVUD
	VYOXg7y0AEDPD0KISjPnAcecUMXyEV/B6DtHNewSS3g+tJtEJ5kDEvi5PMDZpGyHRp5Y63Co6IV
	ZTFYapkY5B6aYkCLomz5Inlmhg8CjOh1dDARRYh6cdkm5kii7/2bBg/Etqvlms+L204+m4DKntQ
	StLrGvYhEY5nDyyZUBVpJ8shPJOU51DivPw552WOiv9SmGrVE3qLA3KMevAGcVRql3FMXQonPjN
	riNcrqplmEbEXUStSeqGmI8ro5BpstVfUO8OtORf1r1nNTxi6Aip
X-Google-Smtp-Source: AGHT+IHqX4UIh9iZKFgN3Ay/GR1l8mxNVHiGVA+Xwyg70cgbG5KGI7VYQskHB7LBusRKk6dj1H1mWQ==
X-Received: by 2002:a17:902:e801:b0:22e:4cae:5958 with SMTP id d9443c01a7336-231d44f6bffmr191916275ad.18.1747722138909;
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232044a59casm51435295ad.244.2025.05.19.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Date: Tue, 20 May 2025 11:52:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
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
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 06/15] rust: macros: enable use of hyphens in module
 names
Message-ID: <20250520062216.7lyqzvhv4mgzoudl@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
 <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
 <CANiq72mNHYKXcDm6DiB=69W0w8pZ1KhqeARqqKBK_s01PPRsmQ@mail.gmail.com>
 <20250520043355.wjkrslnripaqj6mm@vireshk-i7>
 <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>

On 20-05-25, 08:13, Anisse Astier wrote:
> Thank you Viresh for iterating on this and picking up review
> comments. Do not hesitate to add your Co-developed-by.

I haven't added Co-developed-by, but I did mention the changes I have
made in the cover-letter. This is all your work and thanks a lot for
this patch. I was struggling with this for quite some time and was
desperately looking for help :)

-- 
viresh
