Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9087219E8C
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100023; cv=none; b=YNprZaRclYTsk0Cu/56kiy1QP8SFIzRbjGHEoPjBs/9VSZ+Am6NA90HE441PuYmDNpEfUEOl/tJBWnEh/doNFcRu1wzwbQvappb/+BqshHILfASsTsLpkkaeOlEb7/uo7SArkvUqCdXht7Orlo8Ps4plHdrTFI9L1IaVrjfKJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100023; c=relaxed/simple;
	bh=GHDQMCS5dEWxKn+0Txm/veOfLoI8l83ajhIWcN5rWOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJYy+H4/oAtxKjiS3jiuWqGAhX6FG012RPstmMS/UhS0cNVbFgdsHQ3fsMZJ768Z/ERiOJJgXWbAFj6Hz3kSnCMzVuQY054Ro9RO2jSlXFDOZ/zxmqNUNHj1QAGJGSrXs/Q+JyAQPttN7tvN8pJRj6sB7TPt7G7a5UcS+x7LVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mg+cjNtW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mg+cjNtW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7835321bc98so5664452b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100021; x=1761704821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=mg+cjNtWy85MJ5yikxe1d5u3CQrZAjAaOamlRzfbcdkFc85wGXMOx7OimDEizRlL13
         txfW2OZvUMSY5eFEerqT7QTicfB804oqCBqCynrAlYUTxnsBqONIs7uIKiRQx1ktaOGA
         loKeDRjhNZyPV5Rmfbrl4X3ij+Zz7r2XmLJX/ilOvwgPp6gCuFVfiehV2L5iKcnHSVjP
         5PCELIx8MNhXM6fFehUhXBSUX35G/sCuqZ9nS7oBOqa/UsJPWmIfs5B6s5xwP1pBkLYb
         sjSYn6ux8ztx2kOSkpyBJ8c4L5WvphtjFNHRtAArdgUZ25ChBq3laCFW0RNTBtCty38g
         hTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100021; x=1761704821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=kz2jwpiBxQqokSaxoElYZOd363eBq3VWi9dBqHPUW87otvdeO2IniB6ZJhF/LHzmh7
         AsYoGD3kXklHlJMa48+SczTBy+jSOzYfFTYPGBVI7svuL4DtSgam10fovU22a7zxIQBo
         eD0bpZjbWu61bx4zTxnBrrVMcbLmiVxaBWNaSbGqYEqJP9MWwG0DiiLEVKcFZV/9nHv0
         ff7xaGrs8/zF5IHWRBmsbUUOfCPC8M5hb9b7UCmlXyJCHtWwJz69kj/nOpEHS1jO/nTz
         hdy2R83b+NNww9et/qz5CP0QEujd/76HyiBtGwiZfVldU8/O7P5R7gSCn+9qYrKwHwN0
         zgEw==
X-Forwarded-Encrypted: i=1; AJvYcCVzhAzmNPAEApABZmuMVY5XQ3oQqpXaj7vGanK02vNokCpXyY2OIk8KABdqzS6PpWhilC7egJNqKJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1PJbNxOyVqc/0zw4TMjddYJ9bayn5ixLFxUtiQE92k46mdkh
	8F7P63PJI1rltVDNj6yKcexARR5FyceimG2x1yDJZjCnX3HyXbQ4hJEAvHCfyI0w4Zg=
X-Gm-Gg: ASbGncuh1VAIRtK5/CAOeTrrLpTD+x2HEPWSUHawbGrxw8Ae0Wyu29+zKH3VwNnT+Mx
	1LwnRMqvu6LxgmwCRNPI+YSCPsan3ENi66LbHSPK44ewolR3UTLRxxeiexOznlmAhomJ1kSIgYe
	f3bBo98rIP2ubpfCBbSLkZws+aZlIJ1iGXo+KBT3R8M2GIYppokeUk7xiDq3y4JN6Ua6Yjg4+K2
	M3e2cXVXHaZI+eEi/gyBu1rjaO5K+Auk1IzT5mSAlKwlcb3oeFV3r5RSfrWYRftHzIOmd/Z86wA
	crwVF0XO3KwbWUyTAL3y05/dzhq8+fHT3I0d8adUUZhL4DrUs1Xjd5nTMagA2nFFE7nuEQYzibY
	PZrp7FerKz1rMtCHgNVRyeKObb9svF50OtFbB/gN0PV9d2KNQ25QYSkHPvGiwp3g6dShtI6R+h6
	IQLA==
X-Google-Smtp-Source: AGHT+IEiODVZTmpBKH4GJGfRgQpdF+p0v4t2QcX4SapXa+98D5HxqE/HG1opMUzT/b2Bq6W9RKZPmQ==
X-Received: by 2002:a05:6a00:2e1f:b0:781:171f:df6f with SMTP id d2e1a72fcca58-7a220b14d80mr26349244b3a.18.1761100020948;
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011088fsm12778187b3a.65.2025.10.21.19.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:56:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
Message-ID: <75keuxnrpd2p2lumgmoxpwt42ovsx4xyltq3dimarvlspjq3gn@cmadekc427tk>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
