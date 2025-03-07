Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430141A3147
	for <linux-clk@vger.kernel.org>; Fri,  7 Mar 2025 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332207; cv=none; b=J9GWvFWRWzqEqgv6Ivf0siQfepClYzO3gnCPKyCEceGodW/GlMnTh3V/PaPLSZphGXqkeTNe4T/AArYStIeMvHQTFTTGo3yWUmw/Lsxy95333g54G1Hhr04ZR9tNtTG1jDk8f0Aoaa1gyV03Hj+D4e5XyGOTF1fmnFUC+JBDXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332207; c=relaxed/simple;
	bh=QqafGuAhOIuebi5LncashDc9XDAZ2JG7WWMLwyg4leQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBa7EFTY/hZouPODTQZ1Nb3alZqfYj0fbco0HRC2JUeJ7TytuDGGR+eJjKk7Ozml9X+617dUp3cmtPkp6c4yrQKK4sou8H4/Qq0aBYCimaPa1cGzAqRVKs7OGnNG5yntRPpccrFfHjJYFMKKS+iTEsghfy2V3cm2Rtv8+qR7gfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y3vQW+Sa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y3vQW+Sa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224100e9a5cso27967485ad.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 23:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332205; x=1741937005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VCjDatYdwCCsM/WfG3Y3BLozY6pEAZzndrpXaKUoI/0=;
        b=Y3vQW+SaJy/gHv6ZVcpj26Nz/nPLhjopvhJCzdQrwcq2voCbSuX4omSWT8qy7xAoU6
         waEKUYLL6qLvXMNhc2pgzKAoT3Pa6ysytjhU0y77D7gcixTQlro4lqLgBXFxcLgMxM9X
         T2/+Vm0Py0Is+em8EOeTL4zwUAeMMX6gSuiBc3VkbCHT/Mbj4NdmlkCPGT3eoDyJyPfg
         cfI1r7SwWj87rjhLH0ylAMRoxLDdWIzztZ21+ZD/NISMBUfIxxhVgX4ruWHalnguGygF
         p6d2jb+NkIyF8ibwdYKnfldV8GF71x4Yot1B8DRwm+g9ZAVabve/YWx7RBtZ6ZNYx2gz
         fH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332205; x=1741937005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCjDatYdwCCsM/WfG3Y3BLozY6pEAZzndrpXaKUoI/0=;
        b=YhhRiYiB57o9IleoSEio6allS7Y33VMuf/vvFZ9WQn0KQpdIzBkZRS/J1m9+oPaaGL
         mZlwe5N6il52NpAqkxlZW80iQaUaw5IkL4sZ9eyrCIbbyAIbL59R1vlUdhMRJ/54MbyO
         EmX6mJ7M0aceGY+F402uvSnEeLCTW0gOcQ8TF13GV0SaBOpwQbu7CJnQCd4B7W6nBvMU
         tFcv2NUqK/qVmHM3qv4WW8Uc3h3e93k33Yd3WGnyu1O/izXFtW2u8WNhFAjxLoMgY8wn
         2x5rCtzUfZtBSNYZOn8wAG6UoCUu+VSjpPz0K8g4/MbgeIQ4d3nSv9X1Z1FQoRTaMLik
         PviA==
X-Forwarded-Encrypted: i=1; AJvYcCVOUJdrBQdV20hbgzQaajHI8cdkRNOdOA1KDc7ceuo4m1twEX/41bOKG96ATxAy6WCxumTP27xSvcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9dDr+dV9UQF/lPIjKWrSalow/KLOsE6JstWlaL0q9OILYcUV
	DMgtFOEB6bucZf6atuX6kZ9VJQmopXUaNCcOEHr7NzG69oDWrGLoPuzZEKFUUGA=
X-Gm-Gg: ASbGncto93fvsMMCEO3zZXXgxAyoQPdQCx2l36/vdno8wsswqgiP0T7p9w6fOP0oRr2
	6Es6rDlAKZRpg04a0HSfaOpdpO1ax9/JnNTPBts1TUH5bE2jPGsNuuhvbKHryownXZt6mYf9B21
	fNCtFdX3o1gmKBT2nDNi2/auh+yciBi+pqWjGh47VxJjBBAxCHpafGKCZyqprTV5GkhkRPy4BnZ
	Ckt4/rZ6Fcu3hD1QHJcHYdm2Z3KbFugyX4utEt+WFCWVRbo6XXlOYMKKFGsskzIj92NB3hfsBR4
	5ZR+/jlBnKeBjwMjsOe/hhfnSUswXHDInlG42R+ryDfHKQ==
X-Google-Smtp-Source: AGHT+IGAtNyb2kEEWj4EBD2NQHNijL6RTt39L6X5JPOWRj3HjNXnhSpRkQZgMznJ39lNF6si/KC6VQ==
X-Received: by 2002:a17:903:192:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22428a97f21mr36812615ad.21.1741332205491;
        Thu, 06 Mar 2025 23:23:25 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109df225sm23794445ad.47.2025.03.06.23.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:23:24 -0800 (PST)
Date: Fri, 7 Mar 2025 12:53:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <20250307072322.5w2i7dxtcaani2ok@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
 <20250304085351.inrvjgixvxla4yn3@vireshk-i7>
 <CANiq72=sU1sHvamC5REFPEC1aOVdZw9EKdxOgkUYESTR2yh3iQ@mail.gmail.com>
 <20250305114659.k5pptszvmusblynm@vireshk-i7>
 <2c17361891c4eb7edd947e5384cc9741.sboyd@kernel.org>
 <20250306044028.5d2w4og2juclktqs@vireshk-i7>
 <1ad3e7e2f8f2fc375b472d7676e47f5d.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad3e7e2f8f2fc375b472d7676e47f5d.sboyd@kernel.org>

On 06-03-25, 12:58, Stephen Boyd wrote:
> Quoting Viresh Kumar (2025-03-05 20:40:28)
> > 2. clk is enabled / disabled from different routines:
> > 
> >    In this case the caller needs to call dismiss to avoid the automatic freeing
> >    of resource. Alternatively the returned value can be stored too somewhere,
> >    but I am not sure if it what users will end up doing.
> > 
> >    fn probe(...) -> Result {
> >         clk.enable()?.dismiss();
> 
> Yuck. Can't we tie the lifetime of the clk to the consumer device driver
> so that when the driver is unbound the clk is dropped

Yes, that is how it would work right now, the driver needs to store the clk
instance locally. As soon as Clk would be dropped, clk_put() will be called.

> and it decrements all the enables/prepares and puts the clk with clk_put()?

Miguel, how do you suggest we do this ?

> A ScopeGuard could probably be used for that on the struct Clk itself,

Not sure if I misunderstood that, but as soon as Clk goes out of scope,
clk_put() will be called from drop() anyway.

> but we would
> want to track the enables and prepares in the rust wrapper code until
> the struct clk can be inspected directly.

So Rust abstraction needs to do some sort of refcounting for this I believe. Not
sure if we want to do it and if yes, then how.

> The problem is we don't know how a platform may implement the clk API,
> and CCF hasn't taken over the entire kernel yet so we can't rely on some
> private API between the CCF and the rust wrapper to know how many
> clk_disable()s to call, or even rely on clk_put() to do the work for us.
> Can the rust wrappers depend on CONFIG_COMMON_CLK? If they did then we
> could have some private API between rust and CCF. We probably don't want
> rust code to _not_ use COMMON_CLK underneath so we can encourage the
> last few holdouts to migrate to CCF. I'd lean towards depending on
> COMMON_CLK for the rust wrappers in this case.

Sure.

-- 
viresh
