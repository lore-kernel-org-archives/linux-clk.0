Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536934D4FB
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896744; cv=pass; b=gWd3Bb0Nbur4vOacv102AQQ0dG7zX9v7RJLlxGlNKiVmAbWhkHlUeju/3YkhKMW+FadGP+/EN3bvFTK51UJBMKntx8dhVEcckZaZoBF1pVE3tZwgnAllWtLOWr8Hafyw/iNl3aapUVKUxDsKSiANSm3F+fHf1juqjilAxW8Z8iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896744; c=relaxed/simple;
	bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyHhA3nfESAaixq6Qp0OoWrwRunoH5Z8cf5cc9opk7lqjKFu/BH4A5zlIZqlyDAXzXEFVkrOymNxAMO/xF/8HrpRH7jNXWwh11c8WsCV/kgaH9yHOt/77QMn+vGAJsGs4cyURSNHACBdbU56+E8xhwR7BytvFzPoVdzqaMzted8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcXQ2kG0; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcXQ2kG0"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1244bce2c17so529041c88.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 03:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896741; cv=none;
        d=google.com; s=arc-20240605;
        b=kCr2OLDbVT22OUeeUB9rGcIUaAFNH6Wbtuwi5aSFMzGRUSwEPM6+wun9FrW8lr10cA
         2fHMV+jZd6f/3630HE52EqWwDk9onPj+GzjBqGK2YXrIEoiBem2DRvt3kDiH8oMC6nCm
         YkPaGiTn0y02/zJsArLuCbJR/FaNI1Hd5AIJ59kufzJ3pvk0KZRHF8r/hJG4S7Cmc4v+
         mZP9/Tp2+8P2HVcn+UGfhR4dH8vAy1TvWy746m78oPLWIkIavbtxTbU59sx0NUq0Rv06
         MX23imrJ4Z2j2CLosE1BaRjE2CbPRL6McpRgNBb5ELulyvzNZm1s5PeriCHakblM/QwJ
         3xNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        fh=48g3xKUrp6qzDXpKPZ3A+fDcUz8Mad09l880s720g2c=;
        b=Axk1dOznpj61gScqNq1VkkMNlfhd8Lc2+1KzNYNXFjalVHHEV1LkNirA2H3eRe/I93
         BEo9L9NHqM9M7vuD/1aeRU1pL71URPHkYonJV8GwzdlzEmKVDmL3B7JN8+lAT3+Oracc
         uwvxQunKMiOFuBdMNVGSrzsHmbkK3xgC4e8NQWvTj9adns5at3qH8Dqc1Aa7QQ6PUV8X
         ZtuQplatqhYCvpu/CMsC5ZKVrh0YxfeoAuNeY6bB2iCAdr8KXDoxyhEP+rGYnO77Zcn7
         W8ZtGrIB8lAoIy23dWabfdZXtJ8LNW8V6V3wWy0vw8oLeWFbO3lm5AyKbnSvSEoslj/1
         ylug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770896741; x=1771501541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        b=XcXQ2kG0/4oTcSyjVdNx8+Np+emwCX7SxewOCDoYQO53GU1RfCDS+wbmFt8WJcVnPD
         S3ZGBGfvxltS3SsK8zLuIuBdr4eof35tH4TYPKzywNW1wwYlx7Vt8JxnQPPpmBSL0fCT
         ESYJoYHTkhuJTc3H07AfjOOQ5U5nLbjV4YXmG0VDO8pfsffKkNFkDJbqzk8hJ7/MwIZ4
         n+q7nhmjxJxcAzMVxSCtMU0vMwbxejKEn9280PjektUEpiOCTK/ceXDyO1QCLCRHImqw
         jBranbPi5vQl3qSlT5sJG+VfjFLUmejLYGAjQ9z1JqsCSabyLjcOYdMFrsvJXWmIYi7i
         mwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896741; x=1771501541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        b=tHhuKQjtz3FT52KhDOiRXpg/8Vlnkpz85Gno+GWD+J37A5CAif+AYujL4biN0uVA3K
         tjqESmv6kcZtrdGDOuEvKqTYV31GT8up8SzIK2xGXx644BHqhBDfUFGBsqcdkH7ziN79
         dzUBlZ6Usv0YE+fr1KLaHbhPelwQn88BhDs5rVaH/rK0vU6hqjiXqx0v75JTwTV6LjiL
         oHV7v10pVLcEoNOVgko6xeJ4t2jIjTx91kDUSlEMTPQi7rVHXzclwky9j7sSVWjQIY6K
         Fps45Z6WsMdmg7SzIOvWmeFGyINrNd2gdfSPN4gAFXhgykDUXu0ipnqfkwWeIna+N6jM
         efMA==
X-Forwarded-Encrypted: i=1; AJvYcCWW8Py5Do6a9iZjpkD0R9zBDZsBmiZpGrcXkZYBzSm1hrtt6RseDIz87CBZzMv4v+/ZpgJHmm1l5r8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySyK/S4TaAhujrAdziaZ/V1ucoEObmc9ZFhLzoBBci8/AAs5nD
	A6DWp7BHu1GwHgKzeRl1XZuYSPAJndvVU1Ea+eW1wkUM2TjrxL49NhgyGHYc3WLNnT0MtWu9fTV
	6n50AOjTkkeXQ3zwEbUzDM5XMwV8J17M=
X-Gm-Gg: AZuq6aLfyT3pWazoGtcpGFDzfGAtB6nvU7qp8htVrwOtBHgjw78fg1X96dIxvAZd60N
	7UxwsyjEpO21jBCZ4RFuSQOsJswWMYvn9JLwnnUH4PJP1v/AzmdEcpx3j6SuT+DkP8DSKqj6806
	ZQNZKeOkbd0DBaZjT0jqpzTKpT+WyGQJPF8Y4OIwQyohzf4SLIaPorqrjHnLz8NthAeghuh4KvH
	uK5GMLNcga/7Z3itnD5TKxEFXd67Z3uEgJe8Hk6F/oyiolJaEp8SGiZHJjZmApSgVRGppdcMQT3
	8gNAGYHNAS3Kz9p/Kbk/cj1HSamcgkIjZfa2En+uDhyZYV9buMM14Xob9+XVnYPAnSoXCqX4/vb
	GM939WOOeo7sfCZRTJjmvnAWw
X-Received: by 2002:a05:7300:aca6:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2baa806e40bmr507989eec.8.1770896740603; Thu, 12 Feb 2026
 03:45:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org> <20260212-obedient-faithful-koel-d8aaf6@houat>
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 12:45:28 +0100
X-Gm-Features: AZwV_Qgkz-xkhnIAg7JBqdav3KKnsGWyI0KDQ-RkibJi23X0-5wEzPLcw-SuW5I
Message-ID: <CANiq72m67XpoE-M2eiJn7RF3LvxRLKZ17YExJJFOFw+H0Bw39A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 8:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I don't think this is true, if I understand you correctly.

To give some context, when Rust was close to land in mainline, we were
explicitly asked to cut down what we had out-of-tree to a minimum of
APIs, which was fair. So I did exactly that, to a point where you
could essentially only declare a module for x86_64 and use `pr_info!`
in it (pretty much). I even considered dropping the `pr_info!` too...
:)

Then we started upstreaming bits piece by piece, getting agreement and
input from the relevant maintainers for each bit, and so on, which
took years for several reasons, one of which was precisely waiting for
actual users for APIs.

[ Others were getting maintainers engaged and involved for some of the
core APIs/subsystems, getting authors of the original code to submit
it upstream via patches was yet another, reworking and cleaning the
code with the new, better approaches we found meanwhile (like
pin-init), and so on and so forth. ]

Cheers,
Miguel
