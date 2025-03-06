Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391B18C035
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741236033; cv=none; b=kSYLsWtxLVmVpSYyeq8QfqlZC+doqYhLO4i+Pd/8tBH4TP10l2BUsXBAzfSov2Mlau891PdL6jeKL7C6VkHQlNJFVHmvaR28jdnFQ0xaRM0gi8HJHbOsSCdw4RizR+A2Qk8EiM8LeY7PU5QG0f5n+6Srcl0VPwWB2B+1ZK9GA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741236033; c=relaxed/simple;
	bh=TNmgYWlFDAMgA64pxjarHkEGTDwxdEKRi2stuvaaK3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fA7LrfLsfu0tZkrg9gISeN8WRVGxCgQJY95wP2jDhmoraHkoHBncQX2Dd+3TobR5Mfg19h6B/8tmjynn5midTz2d/OARBA76b8wxbn9BeUBEvFr45pPZa2wLmvEJi7mzeJqGl9xGBUqZ/Bg8ExBdixuc9pQvkuv9q0EriaZJN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlcOQw16; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlcOQw16"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22349bb8605so3158155ad.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 20:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741236031; x=1741840831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9YP9oXkSaz7kqYoQl3h7VT7PIEJ2wgfc59g3M6xM54=;
        b=zlcOQw16/QRjGvkg6iYXAaWKqSt4tLJAlqPLBUoJQ1CppdX0sVHh98ZKxxl46UoAh2
         C4aoLbuhHV3okiB1l6XeVyspWnW8i827mEuJZdiNZsQyUjNXdsBO9ksV1qTxabjXloC+
         ZzSMCapgEKVaaf8bxgEvw7VGKq0J1CkD017RH320wIwyjSAug6bljJBCjJ9ezAOMWDmc
         4jOrlb5qzsnmai4WW6XWiDVcyE23aof8rjh6tVf99YMK44PtRjCilKqkB8o42+HGD0qS
         MTuY/jYQbdRYmbIrnz6dgSlCi7VwUVeYSI5wH5ss69qNehHyJgCcA2rG//uGqvQWazrB
         PYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741236031; x=1741840831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9YP9oXkSaz7kqYoQl3h7VT7PIEJ2wgfc59g3M6xM54=;
        b=T3msOjXEXyqnR6yyPZgPlo7dtOx5wvSmdoDNVt6WrDUmWadqxtBkGMbcFW15SNA0Ng
         e3tHhxrel/J44K3CiGMSxO+mTUcIPTOEbRkdHNNgTr/iaInK5Oqf9Te5KaHvR4WqbwUe
         MhVfF3HN+wRM1EioDIX8kJJm7qzwkCwhAAjH9Ukl73KJHF1drrrmMwnhVdL5ddlnOcSE
         C23pcJn068m100PNUO6SQHtXbVC/5jaclW5altGomoSK0kLsqCeB8MSovJpmgAur0v4j
         sfEQXVgbmN7t3JMOaaZCDzX+rzTWl34DAzqi21NW2RBmHgUtB6QvmcnQKTZ0nN5HY3G5
         2grg==
X-Forwarded-Encrypted: i=1; AJvYcCVdqRLG2BzK57rWdPFt61fjTNpdvcyzA+sYgjfz8SbRfs76O0srxp/qBm1mKjxdADTeoK3KN8D+8hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJnvsIn0SDhINQVrdz6GldeiZY1EOBBnhK6sRpg8FARjw9c3/D
	3gGjYrQeVGKyYAzkvdoRqQ6w4AJNZgmxPqZDTbMhxqcxxdYYIgkhqZSBSfQ8Tb0=
X-Gm-Gg: ASbGncvgGGqs6MfYVGRhAcBskPhgVPx9VZX/15vGySTnycURAVHfURWU01ZMDVW+RPS
	4mkSAy3rx70wbBQncNDSO3K+kQDdZtLIH43pL2MeQKi+EXURgsEhM7qgcVwRdfdyDC4Hll+fSZZ
	I0AKV7HUUKjmxRURo+StxNspFnmhaHiRzcSAhCPPn3rSYeXtz2Sp5S9avRNXoNWudb/9/1w8U8y
	XZRKr5a7I35BkA3ITmUixNXIg4lyK6+usNrWAWC5vDYi3F8RRdmDuLowddMdX+rNt7OP/VpsM1A
	bzTsZ3tllmjURDvCXytKdSvnjmVZ7MFZyuTZGHF/ROakyQ==
X-Google-Smtp-Source: AGHT+IG7J6Pxt1P8Fs8iADeUT/+TxuIZLpkhrxazqlARnEVvRjqbFettsput67aKtZ+Lr4L7IRHItg==
X-Received: by 2002:a17:903:32c2:b0:223:66bc:f1e6 with SMTP id d9443c01a7336-223f1c6afa6mr107513485ad.5.1741236031221;
        Wed, 05 Mar 2025 20:40:31 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f75dsm2656285ad.122.2025.03.05.20.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 20:40:30 -0800 (PST)
Date: Thu, 6 Mar 2025 10:10:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <20250306044028.5d2w4og2juclktqs@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
 <20250304085351.inrvjgixvxla4yn3@vireshk-i7>
 <CANiq72=sU1sHvamC5REFPEC1aOVdZw9EKdxOgkUYESTR2yh3iQ@mail.gmail.com>
 <20250305114659.k5pptszvmusblynm@vireshk-i7>
 <2c17361891c4eb7edd947e5384cc9741.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c17361891c4eb7edd947e5384cc9741.sboyd@kernel.org>

On 05-03-25, 14:31, Stephen Boyd wrote:
> Does this mean that a clk consumer has to keep the Result returned from
> enable() in scope until they want to disable the clk?

Yes and no.

> I don't see how
> that makes sense, because most of the time a consumer will enable a clk
> during probe and leave it enabled until system suspend or runtime PM
> suspend time. At that point, they would disable the clk explicitly with
> disable(), but now they would need to drop a reference to do that?

Broadly there are two type of clk users I believe:

1. clk is enabled / disabled from same routine:

   In this case the result can be kept in a local variable and the matching
   cleanup fn will be called at exit.

   fn transfer_data(...) -> Result {
        let _guard = clk.enable()?;

        ...
        transfer-data here
        ...
        // clk.disable() will be called automatically as soon as _guard goes out
        // of scope.
   }

2. clk is enabled / disabled from different routines:

   In this case the caller needs to call dismiss to avoid the automatic freeing
   of resource. Alternatively the returned value can be stored too somewhere,
   but I am not sure if it what users will end up doing.

   fn probe(...) -> Result {
        clk.enable()?.dismiss();

        ...
   }

   fn remove (...) {
        clk.disable();

        ...
   }

-- 
viresh
