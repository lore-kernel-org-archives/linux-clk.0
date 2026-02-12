Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028124466B
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886390; cv=pass; b=ivLy2FecPFA/Al2DIeYQODwSeBgokctE+gTL+nvtzs0plFWg4nEhAl8xZDGSa1jMwspTy1SSbef8c5Xnyadzy7nT+xIX2S/gjrag9QZNZdQmTLkgWgpg4hOjSirfLUkRdAK2HKhh4qudOBkv3Eyzj333dEVEWhLoqXgL/4NMVDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886390; c=relaxed/simple;
	bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW1zknb8xlwNoXfsIWK6yHgepEQo8zL6fJL2MDUjrH9Rh72BOHp3N2BgSoy6fvwHEfRG4d9xWdydD8TprpZPY1qSaaKSTUkxKXwAOJizOa1cDrxq/rVdPij5AK34Bbnwf2NbaYZ7TYb//B3PIrQgGRhtXQD6R6omtdfuXYO6xrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tz2xb1Fu; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tz2xb1Fu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so34267305e9.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 00:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770886388; cv=none;
        d=google.com; s=arc-20240605;
        b=YoxJti+hom375R+RjVV3iUesGiPclwwBGSBEvz1DuH1GeWD/xExYdcpv+hdnrN7mDj
         RXvvTAgS6Xkvysp7Ry6BoioHIRYMgafEWViCcGO2baZOhhLSuzrRrhseISmwxlErdJ+c
         tOghlFofVWnp29f9538/b665rZLKnTHBCZBD7JJ9vzQQUxGLjut1oiIeKHqRr8++2cUV
         FEJtvMjDXAZoNrwJXrePvWO8bvNkFPqozYV0/yYD/lyJWiU9JkK3GgzQ01/qQ07bfxPA
         HYErmkrZmf3kzDRZdsMxUyrsGd60F1F0Ju8+uk8Gw3vqTEJSy4qcJ0D50OfRXZ/caBsH
         ZoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        fh=pwxjJ/4ylqbRr3K9vi9xLZkrwuwPZ+L8IvlnoZshPjA=;
        b=JBrIYsHEB/TeQCxMpJ5eZSrrq3v1fIKddknOORn1fiYuDF5NgRfjj7+QTOO6rfPvZu
         YOZVNcL1aWyltE41bYJqKJLM4KQjaqkNPPnwZgwLk7Shjw3Aa0IfAbNxuvpFWnuVwDHK
         6i50FFY9r/1w+scZ74FgOin/vYWtIsdnwf2hIt89bZcj4Awf/iI9NHqCMvBUdEyqdaiZ
         /zvtwO0mJZPOmS0KNTzNBb1+CJB2FZDf0RkszjTAZGJX1bRScl9Pd7u7h0rWcrWMadmC
         jDtDHT3vRzPzELyBxqBdZbKUBdXE/4EWXbk4xi70ndnxjAsH8cR7irWcAg0nZrVXmF9q
         TClA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886388; x=1771491188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=tz2xb1FukJ8IwqH5vPBDKiArb7vDXeWccfAGLURwfoqDOK3rhUSIHhZysV0Bqo4WJ7
         4q1EaiM93bfDUz/KhRl4TYbzZhylynP1AKRTFz5zcFQH2UB0cCk+QThhTPCGRnYtvprR
         BLFKZ3uSuxppePrfyabtf+2kW3sWDrZqdZsYpE2npLLk0No4n2TDAoImjo46JcgOxBhF
         dTiUyEfsRSlg7VobqKrU/4Ehr0W/SGyRP/UKcJhSTBjRtz3iwQ8+ROklCqq2+QGCAcee
         ji+cqiODORgmk6JkeP43alph8IyjYHZBXNwpK+rv67uO3DKA1MhX/4OhKueHAf7iwcfZ
         0ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886388; x=1771491188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=KJAoI9rZ8U2FkWdm2H9buR/P5FHeQG54gHAVPauKW+nRWf179GGc0EWgb+mWF/aSYy
         2YHoPxYe8TMqNi1YoIGcuoJZQ9QEpcGeuzrPfBixrxnkcXAME9tXwPaKmvmu8vCFGvzC
         se2uq+Ge2aO7DPYMSoJVjZ8PZzzJW/Nvf/hPRsofv1KRFQVGL6mVGxvH/EZrAdlTaC8g
         HMUJGkiTl7g0oBwPmjf3el1w8Bjod6/965W7dzJLEk/DH3OqSms4D7V7+tubfBCt3kXS
         U3co8Qm3z9hsCirhWZoJJoZhiVt2VK53LMO4KEARyboZLbYwD0kvC6d+x7KhVPk793Sp
         OrmA==
X-Forwarded-Encrypted: i=1; AJvYcCXiWBsMlaX6vMSxlk5uIkZZCzcHT7xpIEWEIUFuqM+vbkBmp9iu21HEndQLQy/e5otSPFma0Pwf3YA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykDvW7oFVoUjfqi3mJ1L2JuoEkwhfYKGIcEodn73HV6vG0EJvT
	W3gbNskmPbqdXDRThBhOIxlaVQwOTHr/84m6aIKZ/pvN2KT7uYX+ZiPhyIKfwzTGKlzHJ6tV07f
	501zNZW4+LmJPK1kIsXbQM256b9xBNphZY76Iglbv
X-Gm-Gg: AZuq6aJ2p54uGBdv/UTX39dAsgllLuhnAxZ0Tzmhdlg3U0uHOzyv5aGRzZjtoBT/OQy
	C6zleJ5MATwKQ8AyGsFx2KvB2kxbjU0waUN8/mvdCGkF140I/3jLbsG76z9InrhSLujnz570+Hz
	kjcl7ypD74XTH5/svyCw+ukpx9Zlhx/RcDvJNLIaSbB/6O8lfukJV3DGLY+M58X9lSpYrIhu3lL
	xwtlB9fy5nbU0vA5lmeoGDXZcUUcuzxLRzyw9oyzkTrGlG9oTWa8Wjhr0Kj3tWobhAXI3/A0M0p
	eY7kpeAhasr+lzcuDQ+GjqGiu3Vc7j88GVJqOA==
X-Received: by 2002:a05:600c:a0c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-4836715615bmr17466765e9.22.1770886387455; Thu, 12 Feb 2026
 00:53:07 -0800 (PST)
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
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:52:55 +0100
X-Gm-Features: AZwV_QhgJnsuH1kZOi2k-I_YfnetcmGyr_LHt3UuVnGbxnKyOqJh-xBICfTM86Q
Message-ID: <CAH5fLggWdQ04fVjmcNcNYvUTx1zTqU10usFbypPV+fe3OpwbkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
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
> It works *today*.

The code we have today is both safe and unsound. That is a bug, and it
*must* be fixed.

> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I don't really know what is meant by this. This API is for real Rust
drivers that have already started landing upstream. Sometimes we merge
APIs *before* their user lands, but not without a user. We generally
are quite consistent that Rust APIs must have a real Rust driver that
uses it. It's the usual no-dead-code rule in the kernel.

> Either way, I'm not sure what the point of that submission was if you
> will just dismiss diverging opinions, including attempts to compromise.

It is true that we are unwilling to compromise on the requirement that
APIs must be sound. It really does not matter how convenient the API
is when it's this easy to get it wrong and decrement the refcount when
you did not increment it. I'm sorry, but that's the way it is.

In your latest email, the suggestion came up to make the API unsafe.
That's more acceptable, but see my other email from half an hour ago.

Alice
