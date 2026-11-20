Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193322;
	b=tE4xr7/yx6CnPtZwf0SqN09qxU4JXssPgH/1soNFWk0e7UpUZDjuDpwYKDesl59pZHyK
	 RDqbqEvZNqJZU1P/W+p2ONlnoDf6RrwG3aeZoRrcwboPOIM9n26CObHD2580zS8AK+5hh
	 qgJB+GNuY0O0yONxfwUU1Uurl+NOlSuhrWBlErpThSOW+J4tx3BSWg/uicigNXdg6mCzH
	 cSkifQc2LowfDu7356LXnxccbW1uSbyhlJVJeHl6tOt7dU1a/WfilmwP/AkvKyX/u6kVb
	 atgt0YU+MT5j/1leOKe3H3JQYJzhPbsFjyWxslby84wVB5Pp/dK7ojbMgNabP6O0oGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
	b=Cqitzr8z2JOtjKAJQLWb0XGNj4x6kWFLlYJASg+44gqZe1yBR0jPofxojHs9uTi7qbL8
	 AvFz3QmGZTy6Rg6qygfgBlhbAkYBCRFyzE8fBMIAO9nMTC6L5ivab+aiUFAIyvfw9y4md
	 P1BcYU1K6tSQN10W7WRLX2C105/DuQyIoKBeSMwkH88UZkJpIoCIHvL/GPqLOvM5rjZ9E
	 eIJ4bzCfeadbtsQ/xrcz1cfZF2s4k1rNKkSl8WpoD9wTjYC9HM+SBHzZebbPZaW8CkJe1
	 e7dqsZfHY9w11904gQM8eAXgbSTot+aRx4jRW7deZJRLM3Omr5uOYAEQGAtgind1k4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RNAMJ6sM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F91960A2601
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F91960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RNAMJ6sM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so9815665e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193320; x=1795798120; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=RNAMJ6sMUpkWN4HrB0XYJTVcOtjWWEYhH6d3S9pj85lhBPRg5KkeaWo1USMBh8nDxJ
         w/2T2XYDMgVkyVrFeq/jl71c4n93hO/4Nc7iCIfX2OaYcsUU5pWUfNweZrU7lY4qEIxS
         4eh9dpGdnLaPp6u/BJuIaSUEM9sKLBQrNTbenH1nsZTez+0/KglhUPE3Mx537/pB4xRP
         8US4Tq4WX3HzsJOKtAtUGRlXjScW3SZXmw2uEC/7LSr2f9aIch+VfB/A7NqU30NL7hee
         0gL2JYNXK9f/Y2bCnqnXnDCx6SIjdqdoRXZ4BKvTX66tKXa7T7/hV4E9yjYAFoJPIXic
         WR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193320; x=1795798120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=XH0y55K0YLEgL4h1NJ7aquLLV4HDy0+Mp2TGyUvetpVurPpn1neZKM1JbkYnxU29Ji
         9fUrFfrbwrZbdX9Syh/MRnVcJESW0uz8iyxD0+gKSnR30zTxt0d/TwQqvpbnQitxv7Dk
         OVH6CmjQtZQPjMTfQMp+at9e1a8UedsfNdtTeWpfugutuwh2zs0b+PDxJxtO6WD+7Dzg
         9EolWgJ2UU1vQDpQV1t3nBRuPA+qHrhSUFi8zeMAFRjOEzpfLrDCPURk5dK5CgMqSeTu
         I3zjhsokGRzFIQtHqsg6BwKnc0iiHXxtJP8xPkIzx4SU5wpcPHOcmfAXGIasCtAHsqnH
         5lKw==
X-Forwarded-Encrypted: i=1; AL+hErEhLFw50wU0YFS1yFYOXJpkBSzzyBQVLhUgQdkExZUfALd02R9HdLf5LV3X6ANL1STlCIeeUevjhd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zlhLtLnSSjsaT9rouulau8q6omwtbbzPkUORtrBPHynSUZLSJ
	dOIpNk/ivOMIeYt7Azo4a8i/Ac+GtVAuMEZLMtd0jJzVDLPC1gxyWvPFOu0Pb41UZ28=
X-Gm-Gg: AYBFou3DNcMcvrJrNN3Au+T8F4fvoIiPx9Nn6HNFi/BVGDeLD8NL+oZ4gj48Udh4289
	2LGRS8HX4jzdbxc6TdS4hTaJv5w+h1bG34bDRqXr/3l46t8b5SRBXOb++dtNvky/D+TJkEjsuZR
	LIBV9KRNXSo+af4BDuytGR/h3WcuLDuroHJIn4UsaB50wpbK8sPe05OvgV31iJFjWNOMVNkr5wM
	oP/lKn3weqjM+IwMQL2kajOKYtBc2asPjIHVETW5nfLFU1ob93p3SNTczs1Iz1CFYxp1yo3PVlN
	4HjgysBzjp9Jl/IxPCiP7liQEXvUckTkAYenOioEEDExe/rtfrDBHsJAc8c/NRj8fJWmjCLqhNy
	W/Hj44GiuuocYDFSBbyHKr0yZTR/vEOhk3W6zVpoM4Hq/YEUfkAEy1PZLcb2uCrrRzJbc5+cJMg
	IvraZw4wuFWlS+NzX3IAg4b/VsJwt4gfoKZ1V/GjCQL9jGxxpxHk/fzA3vJEy67Xbfa9yyQKPxv
	cAO9Xyih5AIYMGdQ44R+zMVQHtoO1RpdL6gzNKEgoVLFSv1JOd+deg0WJUziOokQFTV/PMyf7y0
	2PuOY6HH+rfYEqFAIBIK/cEFAzS9DmYfHcie1O+vXc2HxtRm
X-Received: by 2002:a05:600c:848d:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb8880fd0amr81601005e9.16.1795193319985;
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm102415595e9.15.2026.11.20.08.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 0/7] Clk improvements
From: Jerome Brunet <jbrunet@baylibre.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 linux-pm <linux-pm@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-pwm <linux-pwm@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
Date: Fri, 20 Nov 2026 17:48:38 +0100
Message-Id: <179519331840.3795820.8047048832159165355.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4z3/sdMgR1NP7DfsDZx0tYiu2dW9UOhvaq59u1rg0JU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlc+2Ksh+kZXIPh/3rDDW4Kn27hqR6Y15t/Vndc9nY
 JL6uuFhRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACYSOYfhf77/s+M/3jXtP6oy
 5+cRhk+hnv9r4q4aztv7e7Xt8cINxx8zMkx3PJygYGn8ecrZdJeblhwduyRv7OkO5akz19EKybu
 wlhsA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-11 13:54:01-03:00, Daniel Almeida wrote:
> Hi all,
> 
>  > This series contains a few improvements that simplify clock handling for
>  > drivers.
>  > 
>  > Patch 1 converts clk.rs to the kernel-vertical style for imports.
>  > 
>  > Patch 2 replaces OptionalClk with Clk::get_optional(). There is no struct
>  > optional_clk in C, and Clk already allows a NULL pointer.
>  > 
>  > Patch 3 implements the same typestate pattern that has been used
>  > successfully for Regulators. This is needed because otherwise drivers
>  > will be responsible for unpreparing and disabling clocks themselves and
>  > ultimately handling the reference counts on their own. This is
>  > undesirable. The patch automatically encodes this information using the
>  > type system so that no misuse can occur.
>  > 
>  > Patch 4 adds guards that prepare and/or enable a clock for the lifetime
>  > of the guard without consuming the Clk, so that a driver can keep a
>  > long-lived Clk<Prepared> and enable it for scoped sections.
>  > 
>  > Patch 5 makes things more convenient by offering devres-managed APIs. This
>  > lets drivers set clock parameters once and forget about lifetime
>  > management.
>  > 
>  > Patch 6 adds ExclusiveClk<T>, which holds rate exclusivity over a Clk<T>
>  > in any state until it is dropped.
>  > 
>  > Patch 7 uses it in pwm-th1520 to lock the clock rate for the lifetime of
>  > the driver data.

Hi there,

I was wondering how the rust folks expect these changes to be handled since they
touch the rust/ dir. Should the clock changes go through the clock tree or the
rust one ? it is fine with me either way.

I've added small comments on patch 3, with my understanding of what of what you
are trying to do. Please take them with a grain of salt. While I'm eager to help
rust grow in the kernel, I'm definetely very new to it. It is very likely I got
things wrong.

If there are pain points regarding clocks with Rust, please feel free to
reach me or Brian. We are happy to help if we can.

Cheers

-- 
Jerome

