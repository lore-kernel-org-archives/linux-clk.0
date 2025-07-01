Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A726FDA9
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366656; cv=none; b=Cn1t9bgg8WSsAh15MapGQGSeXLQh+mbUxoQYsmz/vgd88JCtKefz3zXO4LJJzUCFZJ6fysCtaHZ+pDVIA6GfusFTXLJSDvK8adQ598A+U5aymnWu6V1TIsUo8YTGOwcaMy6qjOiYQPd+AToq1KwhrGgAUZhGEfsDzFRRWZSxRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366656; c=relaxed/simple;
	bh=FjNNJQuNFHz/e6yt6+QF01AIHDz6pY4OvsUX2LurgSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qycZN8fVrg9WJeGXg1Ske5R/6+bJ/47Kry70t+Niw1vwO4LsUpIohuhHH0ksh4m2PsoStH53N5k/9zrgxEq+sC/kBzWEegbEQSJpjJJKA/82TZ9JtLR/q9YsAOBKuoUdw7BaJ1kv0qqUq6umCOBqVQzDrdfJfwlIZF0ZchFvg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yAXGl2UE; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yAXGl2UE"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-60728151592so3275522a12.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751366652; x=1751971452; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KkP3Q/mrHcTXpi5jFAQSRZZTttwkOM8RfBay5zssxDs=;
        b=yAXGl2UE0qGFLEXo8I/Q2Me+hvVbD7mps4Qv0pBulP64GzRp969FW+u0lywERoqpQ1
         ZjN7Z+eLDoqa7yoDrhFaRojz57rhL6Rir/zpwzCWKuPEEyGre87w/lCKpfuIR13kFpKf
         yCy6wzZ6QgkBK/ptREQ02Xm5pvimoCLIT3982qRqrBRkaoOSTgjddPD2/M0krisx/I70
         x0/3GmhDt3zFn+6ov2RP3FHOBkSbhkVi2tlA2nKgBkQh2lw7FMQ85VQvaFylCsDlB98p
         buq6+GFlh7eDHsEvqV3s+Q8LCNNNGNncnj2SKXdG6kY62ZswTAKQnbbWL2vwc+JqJ/ZV
         lw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366652; x=1751971452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkP3Q/mrHcTXpi5jFAQSRZZTttwkOM8RfBay5zssxDs=;
        b=f7bBjZqYOhb6jOg842e+YFsf0NMLfsqRcTIlU1gblq3K93KmMGTHBmClJXUG13s/LC
         BjQiXkwly+j9FJeQQR7HpZDlIz1PyWQleIdQHNP0DxGffFaV3+hX8Qr5swAo0EAchQXS
         T90/7nKbCXEoWp39nUQtl3EezLa7X6Ng37zID7BS7/NHfIzYJFoeqzUhsBrBZJQ1Cy2H
         dFDQ1e9klW0Fe06c+4ECoQDPuB6E9uBhMfffpMVtxbN2lF//rIgKTiiTS2Ohcllu/n4B
         tYyQ8a+MtueRiL3lpwzcwtAfNesTRNHTRBALW1p+V4P60ByMIvMbEo4kMzgV3IwcK39z
         Nl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8ujzC/GkEutZ4SUBq2vpLczU5oedppXFftjq9kZZzeuDWSu+1fTxtn60UfEQznmq+qZA4FxocXlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4VGr2PxcTjrQxHCCTinMGpp3WQ4qBkc1570uSoYsi1AHRVFB
	e0oekSgTXmZBydJyQlDhKCBnx4CuoP6/jftjgs+EJTnAJqkv1mMxCtHk3IajSUaFA2CNh/g6S6V
	1wmWcPkvLkn/MBMNpPw==
X-Google-Smtp-Source: AGHT+IFVVYwcwXIW2+rs+LXCKTLno19A5yuxBI/UefmvL0JcGML1UYLUePmSmcmNLPYFZsBsDSZ4dtmzcyM66Ug=
X-Received: from edwf17.prod.google.com ([2002:a05:6402:1511:b0:60c:3b8e:c3eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:26d4:b0:607:f431:33fb with SMTP id 4fb4d7f45d1cf-60c88b26b30mr16470283a12.3.1751366650570;
 Tue, 01 Jul 2025 03:44:10 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:44:09 +0000
In-Reply-To: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
Message-ID: <aGO7-SQUUgg6kSVU@google.com>
Subject: Re: [PATCH v12 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 19, 2025 at 11:06:24AM -0400, Tamir Duberstein wrote:
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
> 
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Overall LGTM. Only question is whether we should re-export
core::ffi::CStr from kernel::ffi. Reason being that right now we are
telling people to never use core::ffi as the integer types are wrong,
and I think it would be nice if we can continue to tell people "never
use core::ffi".

Either way, for the whole series:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
