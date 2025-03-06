Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B5481B6
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741236495; cv=none; b=hWBjPIFIDQzi1YxRKEw/c8/DzS/Ee3tSLvP5Hm2cohKn4Gi1pSGdZUzpPOiIx7MJCVntHAE0TSbPYueiGHew69OuXmFavgVw/IBvMFakik3GkwAHdtAk5aE9RjAxeh2UErFev42o6wLdm0DTRu0YtMpQwAWiM6bAeB5DplTa4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741236495; c=relaxed/simple;
	bh=SkKfQC6CZcQpKn3fA8/UGW3rZ+8PsyS1MkVPLxlRNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNNBrNPuC4Tg/RTpOQf1n5XJwjcBT4RYAeyCg24WnsXBP3eWDlMz/n7vimsg7eoi6z7Dg4HTVBCNRHyCAt9thLN0kASqcQfOm8M54xssNki/VOER7Ogzez6D7x9Paq5K8wUCeJIpKb3TuJUPz7nxx7r7j+EKE3Rlqy5h1Da35fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMpHgUwP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMpHgUwP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240b4de12bso4630835ad.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 20:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741236493; x=1741841293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVhCeF3zfzn4fOX1E4nH6Dq1VG6iFwnhwgnMjYfbfh4=;
        b=bMpHgUwPQQ3kBe0bHMxiBD4El/qNbW0D6ULjA0jjV1iyWPU4110SJdFhZHRVXDOfr7
         lVh88ROeGXrddGokIVlm2rKDWy9k6hol2v0nxuK2JoIWt4RkcUdzQsMy3CJd89u0C7RG
         r+Y4Y2/yWLmf14owCWZ2Lz1IRb8OpcmPn1YkDNLCRtUcAZJx109N7GKTp81pG75T2FcF
         j3hp9vWinhGqu5I5Xq7i3FwJh5QcBpRzUUUILSXCJKpToBUyoNwqhpH2y9Ewta5yot8R
         OealpzSFnOxNuw7b2410LcPSPcqvUEWn//NAphrv8lzirFTzgLM+kAeBt1sUe2OHRCly
         Q5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741236493; x=1741841293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVhCeF3zfzn4fOX1E4nH6Dq1VG6iFwnhwgnMjYfbfh4=;
        b=at0ijIJHMDMrPa6Wm02D7LwmDkoWdjcbsIXWdFmRvCOUPkJKWVfysRKAMuRzjS6ElI
         OQtmSnXtezS1JJhvGrH0XbWPsDtNHB32WSiiJL1HLnKLxzDY722Bu9aznafMe1MRjeeM
         NJ+K7gPR7SlE0qkKPk0DiAfc2CFV7Uu6I9na1aLWGXeahhpORwlWs5xKIkq6bszapTHy
         bsg1xmnNSOCg6ujtJcbCKOVZ9vfZvTUYeIo6XKuPvg40lAdQTEJzBqnhAQsyi/EQd8nt
         b/pvaDw+YI+lp6evu/waQo4x8an7J5CnVzQ5+kgLWZT9F9pdfVYp9Op87BamI9Plv+wq
         tayQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjeiIpIaaAWYewRUVfHkxlJgj0An2/c2rxK8Ug6dFuBBI6ldyNdxAxHtE+gsMleZpnz4c/vbrjDpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5yNsrXRG1YvTmxl7dYrerbhaSjO8HgryOrcN8rNblhdkUvJg
	cDAV1zuG2hlO8fOeZ5/slY6YF6QNy01Ryo0zO67ON1XZMmkxnxy8kE92v9ZofMU=
X-Gm-Gg: ASbGncuh6VWzWDCDSJmkg7pMixej3hhZPb20ZaOmEcQi7SKM5hyczeFKME8cBENsCnm
	xYJsNpHMKUuuWGP0tiD7/8n/0A0Lxt8d3KgfLyeWpeWwKR0a8AD9qLCcf2EHahhrgKNDUZF8CK/
	Uoi02dOL6gDeP7Ocqs8SxZagp1LsIuBCk8LbCOseM4D8e2ajPwnk3YyQrQBiXrFMRrpxmOdthp0
	xbg4HDvl58fjBabB3WsCwbMjIRUhBR6Rf3mwfbC3gPvHlHuXmORYeKxUvaXCN91bAYiXigM7cRH
	4lIGJ8Vmo2jaNzljWlFmHsT+1EY2/vKf0ZvlsBSIP6g0FQ==
X-Google-Smtp-Source: AGHT+IF/7SpYm7RhZEOVyZQ0/yR2A6FRsW6wiwdOD3yjpFUdPfld11PpaLDCbSfVpUDCWJ0TInwjUA==
X-Received: by 2002:a05:6a00:4f8d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73682d10227mr7674703b3a.21.1741236492786;
        Wed, 05 Mar 2025 20:48:12 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736985191cfsm333947b3a.145.2025.03.05.20.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 20:48:12 -0800 (PST)
Date: Thu, 6 Mar 2025 10:18:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20250306044810.mqbo74nc6ch4dauw@vireshk-i7>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
 <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
 <Z7iSHR0F2QpiNpMZ@pollux>
 <aoprvojsnmkbzmmpgx5wxjqtamnr3jyhyqfcqnwhxulp34gn32@aau57u4cotpe>
 <20250221215931.GA134397-robh@kernel.org>
 <20250224095945.xjcjwkoqlgcsd2np@vireshk-i7>
 <CAL_JsqJFeb66pt37wsTB7esCpRD1tpvqP1bvW=Nw8MmP5LvktQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJFeb66pt37wsTB7esCpRD1tpvqP1bvW=Nw8MmP5LvktQ@mail.gmail.com>

On 05-03-25, 14:09, Rob Herring wrote:
> Either way, but generally I think 2 functions are preferred over 1
> function and flags.
> 
> The harder part here is in C we just return NULL and all subsequent
> functions (e.g. clk_enable()) just return with no error for a NULL
> struct clk. For rust, I think we'd need a dummy Clk returned and then
> handle comparing the passed in reference to the dummy Clk in the rust
> bindings.

I have implemented it differently in V3:

https://lore.kernel.org/all/023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org/

So even for a NULL value returned from clk_get_optional(), Rust users still get
OptionalClk (Deref as Clk) and they keep using it as if a valid Clk is returned
and will keep calling all clk APIs (which will return early for NULL clks).

-- 
viresh
