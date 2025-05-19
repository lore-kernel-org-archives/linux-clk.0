Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA31F0984
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631543; cv=none; b=PvmMUVLVM4TQngQy1cUAubR7NlKRCzODKspjEV8RSi2dk4X7ci9q7b7oDBIzz8wGuhtpG6XBDAlZbpRMVHmqbS/2nHc8AlYN2JRmiqqlE+d81B/iA+yNL7cqTlIeel7IFbQLh5Ufm2qBX/JaIezvbTMSSWkydge6Qq2DY7APVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631543; c=relaxed/simple;
	bh=YREARJL98nMn8x0h6I7v+KTCGPwNBPRJT3dvhaSnBAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luEXJhPeCvoTgyucVIhA/N/6xblBtGoRwBhVTeweOo+pmEqnrpC50lchQmDmqOnTHWVcZ/fyDu+7rARvDl1I2BUSTNqxU4KNwjPGESYPWyi/VRtWmu+BOjfEbEWv5e6St1vQmXCIZcxdUA1krZx/cRPHXD9YhocGaPES1W+rZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1fJYvUo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1fJYvUo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so1320823b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747631541; x=1748236341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=K1fJYvUosTAhlTY2ECMk9s9FMsopa4uxNMH9CI5vlUfpJaJOjZ4UP41a5Nolksv+Mu
         wZMcTBDwB0dMOZFxTIvNz0JjlXqFVe4haoYI1FM8EFMcRqRjytCW7VF7jMAgdnCGw+Zd
         J1NW8JjkzkGnvsIjljgwvVQTsKmu11SNzgWbA9A5BDAa3R+VvcPUbtV1yEV8fsmH8FEq
         zSIAy7Pbj4wFJ1xPDgtUzjQQ36G7ETv/N+LsSdiJq728PXu0SYiZa5h7bvtgz/e3bNi9
         YK7d2TBYuqqMvWU/4+UKkyvxyk6Mly7Yssk5Un1B7KzPIiP0K7GKWrnew2rCLr0DTqG5
         qaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747631541; x=1748236341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=OH4NzpyfOoG9p6BKVB0+72RNWrH7VzKss7LFwCBYyRjK/yZBflpspcG8IQ7ppw2Jgd
         aW47mPIDe7jvOM1vhxFTsGcKmcbAen8Qsf1GUVI6N2nVtyL42NIy4TuwzNKbXeN9Y3DK
         wb4808pN8P0IcQx/ZNWVSOwHdqvR11zZD9+ttgtYSyiLr7HFISDmTlVVHhVBZfAvTy+x
         VJ0GhGfONtDhvMdzkKg8O4dySSFvqLDd89F6vvTHCYNCrdkZKzyOOm8seI70VlbzV9IR
         u9KIqrvR0liJfuju4mt2bnzsvFjrVnmq51vezi5V7uNparZmpA4YreCnJQOD0rODA/Nd
         ig7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5nnkGLBsbrqSflcjz1INuSMz1WtIOngXwHOBJwVTj7AkOyXGSa6eGvoG/JAb8F5GqL+T8dQDZE5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAzoDytYMJFGKhDNr5uHby2t2MDcGWVUDK4izXRK38apGN32h
	MJIT6g51RzTUDOg3FcrX5iC2etCF5KanGujoAQb33Cqc7xLWNaExB04+mslfdJKxzTo=
X-Gm-Gg: ASbGncvHW6M8zINhs4B84dcJ82V/POLFXVTYFKFbOYftxZc2mwCFtZ8nCC44eDQ61Se
	fuqy/8AMj/5ISM08Sn1ORNpNBipSdyYPa1bLyG7MgpJm50kH2A/Bmw4pXJEvT5dcQx16z4LOJrQ
	SpVaMygdEIMt98WMxZJGDqpI8LHMUt/Jwq224JH6wNqJdz3Lbg+6mUxpP1R0Jo1umMWUfKlQA1N
	cXG957XCiP7tt+kqkAQcaJnenwrsCVjK4d1/JfQNekQvRvBPR5CUHrQvkvS1rSkAqOQ4FhXFj8h
	fXOphRreMgmEqR8UvnhYSOAre2n18fBW9KN5wU9WjCG9hlL53+rg
X-Google-Smtp-Source: AGHT+IEreJKmg3dlWZ4j347XsS/9PUGaSzSwWgE94zxhHw42bn9a5SbwwrfFutiaT9FgmTDVKLHP/A==
X-Received: by 2002:a05:6a20:6f8a:b0:218:c01:ddce with SMTP id adf61e73a8af0-2180c01de06mr16043557637.40.1747631541346;
        Sun, 18 May 2025 22:12:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8a199sm4560811a12.33.2025.05.18.22.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 22:12:19 -0700 (PDT)
Date: Mon, 19 May 2025 10:42:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	kbuild test robot <lkp@intel.com>,
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
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
Message-ID: <20250519051217.clxqculya7zxl7rp@vireshk-i7>
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
 <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com>
 <aBwcWzc4zmPzAW5s@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBwcWzc4zmPzAW5s@rli9-mobl>

On 08-05-25, 10:52, Philip Li wrote:
> Sorry Viresh, there's coverage gap at the bot side. One is rust kconfig
> is not set as mandatory early on. Also the bot met build test slowness
> these days and is under recovering gradually. Thus I think the issue
> is not detected in time.
> 
> We will resolve both issues asap to provide better test coverage.

Thanks Philip, I can see the reports (with failures) now.

-- 
viresh
