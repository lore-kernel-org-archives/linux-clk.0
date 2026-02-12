Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E210B346E5A
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904947; cv=pass; b=OU4hGQoYa8uli/HIP1/2FK0DOYfCrOSvk5mlDZZjeZ00nwNiCuhpfW1CsDeSgJDPkvpJvge79UhE6x7Br6sBG73B9dz7JLuxcjiBm9O4L8RcJa7LSDNXTo7ecltf91A9q7ywLApE8Z2OXg4QPczynOHIr1o8UhQ4esrwl1a4UkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904947; c=relaxed/simple;
	bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvY9nbDtRueAQoLThKSUfjibCF4vatMVLX4zXUd4lJvcO8mMrddSH7svYH42d/u9wGWlvoLeLRxl0XlBA+oIp2pK6JQaFxNjcT15FAd6WSx0mgBYbJaZmzv0DbQpvGPzMhWFghFbwB6VFvUh17gfnpF1sTX1TPHwtDTL226BC2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lOMXKh+p; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lOMXKh+p"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-436317c80f7so1311746f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 06:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904944; cv=none;
        d=google.com; s=arc-20240605;
        b=WV96rPk/fvJfTEjC8RJBa0lSPIj6oRulpFFf+pxEm4P77ToeuW2oyTU5+S+GcuTD8T
         bse5JyxX4j8klqDfQGPuwB9tDeB5l+H8HZH5FPg5h4/ZonmrewoZimxb7ILY02Hfafr3
         33N9rKzc0KLZrsASBqUP17zRRar0acZPYAkIols6KdbcyjG2RipeQ9FU6Cd8o21wFubR
         NthcGeJD53uOjh3OvPLmNOTc8Tw4bOCNuVQ1qTPVNnJQjwa3wkohnq0QYfgYJkW+DJJH
         TCTD4MmW8YgN1dJSBhAi3xDIyl33OvLboySl9dl2tA9uKmAQ6XzbHNP9UFZoE/FAmnhp
         PPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        fh=PdABJtQ7fqf8DdWx/+QNK4ruXAf1wkOFOqNtinRcg9g=;
        b=YcA6zLiO1OOrwSwrSFYlZ6rO5j8kxIc00ZjhNcl1sJquRhba9MRg6q/GEKGABF6VI1
         0EKcOuzG5OLIJwzeSOrNvSxXvIUduufs9Ng1qtmSl1p3fipVLqBzvJExPSxLkEnwTee+
         LEUcrebUhqhDcLKpyYKb/7Nozl6EpLRP1QCny3ZtM0vDyi84HneoCy+fynjCc6ElQ1gA
         zoKdqHibJYi+4ADcV3MG6Kp3w12aCSrcKW+dzdov9YbhyejSBCfWz5Ub4b3Nx+w8jOON
         9vL/uISIs6nWWQya7cOURfxG9leqVvjvPxhcFp6kVGhdps1YAvQw8BjEpl7IouDBSUPT
         hgJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770904944; x=1771509744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=lOMXKh+pJ2MAYdK1dFaLFz9X0kKl3IQrEMYw5DlXavR7KkL5d1e7atKYlhfUSsHm5q
         HrcHt7AcCWibQwJGTdprFXa2IyZfUO+6N+NhmmPzdNK93XJD9d2kTOCsZlD/9kJPOEK9
         YA+9S6yamGjzMN+SqAZqgTiEzbhIYZprSA2U5/0tPpMg/iMkpobfjGuzV5zzEHf6cyDU
         gDHBzS2y80PWwX9hMMZyL+ETE+OTbEz1eSJaE8GQmOgQjKMlM26ZjRVUz/zG/K5riXwj
         wc7b7EQI0gDI+/pD/546fKspM66mIkKZ2gZXWbe8LRDUXndneeOlCA1iw5CGwhsONeK4
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904944; x=1771509744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=XzW1xufpW4k8bDK8F6bUlRwNgf6r61FFqn4Xf7GxsVxgqHB9B452SkcgOTKxR+HznJ
         wdhUinJuJY2Yh213ZXQyQRFF/rrVBzDlV1+GjNjAPg+gJSKNf9ng6WGycaid5YMvSd/9
         9bjcIOsOPuyCrol/uaQjNTCFPtbEGAwFzpkw9oZb0XzI9OANQuVEF0MNwiYHQ+vST3gD
         3a9RjJ7xRpSq5qQI51qpjuOJ/5L917VP448/w9Ac/oL1Y6NWcBPii0ivgKZgNY7BEpKW
         B2lD0GtzR1Pl79y3POEg6w0wd2biFeAXS27lQMUDIfdYRTJTI5LNHM9A1JwEwlk6tewO
         BAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFw3Yz6jDENAI56ZslBVk8pYsxK6oD5xbQntHxqhklNcgIPrIxpIuDG4m5O8cUa7JIl6dbEtt8hTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LEfjPhHT+sGwOKhxtpw8NXFRyryFNURB9JUzd3z3Vv0ZjCnO
	YZgsKwj0cNFIl4kzm9HMPrCPkE4CNuI+uQGPswPhocqeFjw7bXJMmW4RM3YSdeX2p9cNiKnBIGs
	lI2qs2DpdJkUIES9KJn1MVPz1u0TNTggFf/HIJuiQ
X-Gm-Gg: AZuq6aIRkbva05UpdiIfZTd4lmWw+SnE7jPyHHzUH/S2Nuye4hJBIUfGhrG0dpkfQMm
	ZQzSehAIwKcN5sXTxa3sYifujpOKBeZj0kiKJtHLM3C6KtuxN1NhKe6fqFtyl8KiMX57IvExzEd
	2nHQEVK6FXMU0trLjSr0UvodolkVaz18NQ5+xzikg95qZPGeji600a9XAwNzHqdcurgyMMw5kNG
	8giIRo48J6rzNxGpR718AKqcebVcz6UH6rNn7EuYV8zkcSMqiSuTRYryUz2rEHy7c0t85NMDxRE
	0wFzbfOCZpBjNX9+HpbRL8OCPxAOkFNmScXCs71u8H8kWG/Xq2s+tyBrcLymHWg+cp9upQ==
X-Received: by 2002:a05:6000:208a:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-4378e6d8d92mr4583407f8f.2.1770904941572; Thu, 12 Feb 2026
 06:02:21 -0800 (PST)
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
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com> <20260212-lumpy-uptight-petrel-cac725@houat>
In-Reply-To: <20260212-lumpy-uptight-petrel-cac725@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 15:02:09 +0100
X-Gm-Features: AZwV_Qg2-1q5B4F446nU29Cn7SlWuusys2TSQd4MD8qGMnFLRNj2Nk7LREIXN9Y
Message-ID: <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
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

On Thu, Feb 12, 2026 at 2:38=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Alice,
>
> On Thu, Feb 12, 2026 at 09:16:51AM +0100, Alice Ryhl wrote:
> > If you make the raw API unsafe, then that's okay but any use of an
> > unsafe API from a driver will receive very hard scrutiny.
>
> And that's totally fair to me. If drivers want to have a more optimal
> but potentially unsafe use of the API, then it should be flagged,
> documented and scrutinized.
>
> > Yes, there are occasionally good reasons to use unsafe from drivers,
> > but the entire point of this Rust exercise is to isolate unsafe code
> > outside of drivers as much as possible.
>
> So, aside from the risk of fuckups, are you concerned about something
> here? Do you expect that scrutiny to be constly on the maintenance side
> of things?

Well I do think it's mostly the risk of mistakes, yes.

> I guess what I'm asking is: except for the obvious "review" cost
> associated with it, why would that be a probleme if we have, say, a few
> dozen drivers using that unsafe API?

The reason I wouldn't really suggest the unsafe API is that, if I'm
the reviewer of said driver, then my review will be "just use a safe
API instead".

For example, if you really want explicit inc/dec calls for
convenience, we can make a safe API with a counter that returns an
error if you decrement more times than you have previously
incremented. Or if you prefer something else, I can think of several
other safe APIs.

> > If Daniel's proposal is inconvenient for some drivers, it would be far
> > better to have a third API that is both safe and convenient for those
> > drivers.
>
> Yeah, I guess I was expecting that one to come after we have a few
> unsafe drivers using it and we do need to consolidate / make it safe.

For most things, we implemented and used the safe API from the very
start. I'm not going to say there are never exceptions to that because
there *are* exceptions. But I don't really see why clk should be one
of them.

Alice
