Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E713E41A
	for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692537; cv=none; b=jEgJTSsm91+P2MvSBAfsstUBzaQph/WBpviv0wMYOQf8CLErn8bKdAqBI+JWFxlJH+nL6vl9zN+PrO76gS37o4AdL9MqEIePeObSz5WPo2AZFK57vDAKNyjVAue0bql2eUf+7bk0bqy8uxSVK6CU1+BzL5VmItf7i4ZsqlV5NbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692537; c=relaxed/simple;
	bh=yekqGRUYYLfu4rmZNRUCu0QzvWyE3YgMNmc+9ucJ2S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2k0xuqNo5BSvuhDOuZZUD70yPFTf/ZZNKrZkvvTowj6oEBqCW5zijuHbiga8L0NeXNODWdfPrPZiMCyjZU7lpTRDcSvq1AlFODgFNvfx8H1WfoWVWfCVIbMGJZa59wg9x8axKWJ7hlmhgyzWYFVXYEc3A24eVvSNNlGqc7scOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aS8zANfF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aS8zANfF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167b30so4246725ad.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 18:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749692535; x=1750297335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GMTYoO/hH1xieNN1bEgiAsAF7Z3yvr8fWaDaLPOgs0=;
        b=aS8zANfFOoewlnHoxS75gB9a2NKvfc3aVwtpEuYLvBRkUgLVdbajvUugYuQnlpiNgX
         O1vKvdtO31ytv5O8Mpv6Revr0jOt5r0H3cQboSyBx5UpHSu2FM7rNHau145oNwt24JgM
         SuPLRI3E8lOxkoeS5jsYVmwIEgpwgtHa1VWEqgKk7D5ZtMSX3gB4Cqk71BJhAsNiyXN7
         dX0Z3h29YqnKsTl0q3Gv+PLrMWZF6BXjyYldCXIP9LmhSs6CdjrHtCVjTwZqVrkYp5S5
         W+ktguZtboDEG+3XOVE7id4b+mzh+bJz//xjj3N8qzHy7CnlD4GLKsYG5jWbJ4wm3aZo
         dfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692535; x=1750297335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GMTYoO/hH1xieNN1bEgiAsAF7Z3yvr8fWaDaLPOgs0=;
        b=IdWXGfC79a100CmFbbB+Hhwo7dSlxtGU9MeCZw4X4GLMJ9B2D7FrdXDIsiYHKEyF9B
         cst4bPqXgLy0UpLga6aYjJPG4AtMuR7cgeu5Dt/Cag8e8zCfl9IaJ3UYib/loXBai4tv
         Yy03z3P4KRtmzqMRc52iGFIoC0Zt3eZOovF7LFhBQNgE90DYTv6d2GPFp6RFEPhbe5H+
         hItZezNQhsI8/ZHRXwDD8m2cNtKd+2ej0xB6OM6Nh0WLXaZ9ivWavYxKqk9+BaTUGZ8/
         dW00Pg7IoP4uPcKL5/WZySqBRxOycvf4jFX8UduZuqQDNcFOd6Y5iR9xKb8pMILzGj5c
         sWoA==
X-Forwarded-Encrypted: i=1; AJvYcCWrE4ra79GBPMf9tEO71fSgSKF+tJXJTGQ6HP1pwRFq3YZ059KOCgVmWdLLBfVpmPmrtZYPZUfHhRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmOh1G61G0L1PuUoY6fz4ElVV8/gHKjIit9o6B6mzavBMWJfj
	vI7JCoav/s5HU65YAbbtDFn1JqsjT02VAsy4SvyOuOkvNMhG1BEaP6QVFWNPrVesa5k=
X-Gm-Gg: ASbGncu/vCS9dq1I6Pb4Ois+HUVl7dwe70hKJ7TkQ/IB8+gwd9mUnqZVGIza2jndcMl
	LPbStDtxzYS4CFw797RQ7sQCHC4a6ls4abUKXbPggWcLkBVFtSHO3KLeU4HzQ4vg5CM332ij+hs
	scT/ZE0d8CAtTo83qjTo9+YAUaV33TNUPGd0IN3ewCPZrxjcD95zVSRVzyIyFYArHAmAaFmcaNI
	2dOYoyTlvG7zB2W+qAbjLjJDN9kVIFESeKWyoWmmqs5pa2846knyt4CYQQXZwJlQpPOL1d2n+eP
	lMGIsmC4ArssiiiL/OxJxkOusQUeoFU9gYgEZqk7CNeSGB2lESGcictq+osQa6o=
X-Google-Smtp-Source: AGHT+IEYQuQrQ9pSkTkNr1pxDJTIIU0K6qyK009mvjKSvoQj1EO38HYFTD6dT0wcT093olcResSw9Q==
X-Received: by 2002:a17:903:2346:b0:234:d2fb:2d13 with SMTP id d9443c01a7336-2364c8d1932mr20654285ad.18.1749692535270;
        Wed, 11 Jun 2025 18:42:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e7195c0sm2365445ad.209.2025.06.11.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:42:14 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:12:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>, Nishanth Menon <nm@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH V2] rust: Use consistent "# Examples" heading style in
 rustdoc
Message-ID: <20250612014210.bcp2p6ww5ofvy6zh@vireshk-i7>
References: <ddd5ce0ac20c99a72a4f1e4322d3de3911056922.1749545815.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd5ce0ac20c99a72a4f1e4322d3de3911056922.1749545815.git.viresh.kumar@linaro.org>

On 10-06-25, 14:33, Viresh Kumar wrote:
> Use a consistent `# Examples` heading in rustdoc across the codebase.
> 
> Some modules previously used `## Examples` (even when they should be
> available as top-level headers), while others used `# Example`, which
> deviates from the preferred `# Examples` style.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Acked-by: Benno Lossin <lossin@kernel.org>
> ---
> V1->V2:
> - Don't change the header level for the example in workqueue.rs.
> - Update the commit log accordingly.
> - Add Ack from Benno.
> 
>  rust/kernel/block/mq.rs  |  2 +-
>  rust/kernel/clk.rs       |  6 +++---
>  rust/kernel/configfs.rs  |  2 +-
>  rust/kernel/cpufreq.rs   |  8 ++++----
>  rust/kernel/cpumask.rs   |  4 ++--
>  rust/kernel/devres.rs    |  4 ++--
>  rust/kernel/firmware.rs  |  4 ++--
>  rust/kernel/opp.rs       | 16 ++++++++--------
>  rust/kernel/pci.rs       |  4 ++--
>  rust/kernel/platform.rs  |  2 +-
>  rust/kernel/sync.rs      |  2 +-
>  rust/kernel/workqueue.rs |  2 +-
>  rust/pin-init/src/lib.rs |  2 +-
>  13 files changed, 29 insertions(+), 29 deletions(-)

Miguel,

If you are okay, I can also take this via the PM tree along with my other rust
fixes for next rc.

-- 
viresh
