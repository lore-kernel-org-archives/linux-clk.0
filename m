Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2F26D4F7
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837578; cv=pass; b=J40T6Oa1YRTkGwZi7f5Ir6rv1JPAOCzFAKx5uhNoUTFHUpBm3xP/bHV/ecTUTd7Nh2gkL2Ye/ng9RLqiO9wkhcgRazgd3SiOOGyakiSMxegQZO6++vhQH+yukEC585X/fEIwg/PwEYvkcpZjIOB0YWWnbcWKFFpdraY5Hw/4UH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837578; c=relaxed/simple;
	bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooFQGaEUQZk2GMyYg9nHfnav78koOWnf+NXjGT6N2Vx01leSzr0liQtdcd5vS2SFYLHEQc3eClC9u9iSVxgydIxRlwh/xVJKkH1sbfqSUz1UJYzAeATZw0RQhBZqBb7DodAkzqemfMqLrZDA4dJIb50fOUrsnnB8w9NVaRGg3sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXXSCU3C; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXXSCU3C"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12336c0ae91so388815c88.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 07:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768837576; cv=none;
        d=google.com; s=arc-20240605;
        b=G1zy/dPsHkRn1eEsnRAdyWQFQvd2nRuaNkbILEIu/rhHlEDJ7g0vkTro5bmDTZTpQQ
         9CUSWCUeCUt65aK2heGFmwI35OSgDnR135+AdO/iqNt/BWEqQDaX9DDS2sKzjdhmg4R1
         ivDmQhhN6r0TA7K+1PkZB/TC5b5XmJOlCKnRsxm8QbG8rlfmzP6EGRW52ZXL7YG9nbOL
         1RNNuIlUYmzAIAuSmY1thlNkpjngHtliANKNp/ysrcBtZJPEVxfH4JtvKLPEfNUQonBE
         uRbVlp7PBraDo4TBadfAxd3ijalWNYC8ULpRaB7xJLEiZb2ZwVwWrlTLCkOgDz4kP3rF
         dhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        fh=UC9njL+Ayft2HU3lPOqLP4o0pO1KOW/azrRlvFkWtYs=;
        b=VmXHVEWlZ0Ui6c2Bw4HHXWysVf/JSGMU0aLmTOk+nCLUSGIfdFoyoiFYG7hW8Gt85l
         uFN5llUhJk47LGf7BPCkYF8FqInQ6DSw06QT2pQsx/eGOOncIhqbsBYau8BIkbjbcxSE
         8yfI7+drDwrklTR0VLHGlfJhZ0nn2nCzyXdng9g14vvG9p3rp0TkQWhPuA2eWFQfcEY+
         /vmtYveckdIZ6F1UPDO5UdJX9cMKJB+rsvIq+QO953nRCfWl+of0KIpdz+xSmxSBiJX5
         5AwAGHo/xuacd1Hna1IVt4FB4C9rE9tC/iUC1usXGXh13ILFzIt8JgiNia4Avwb6nXRg
         570g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768837576; x=1769442376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=GXXSCU3CdBM8c+MgPSzgQooJIutWbrMebgtv0WvYE3ZbubHbcip+IwHvDJ9eq+wc2B
         Mka8HrKybre44Z5qJ81M4hwIGKs8x2I+658pDDoSYO5lAXNfuDFahjA5+wuKVOy1uqD5
         +QtGt8P8oTZgfrEpER3ICDP4awqpYwtUy0Cdfkkc5jUGjG5KLHrhtMt86+UkUrx9mL8+
         WKjjF0LOngCoioejgRfEY2bol8HvX5QXUMzXuFzgemphATe8K5EXp3BKdfXwsRtH7l3i
         hYQpfsAggJbzU9tB4Vr9HxzGWJfrreJyN649wORSxiagGFl1ze2jhWOJH0cugSxtW5nI
         PRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837576; x=1769442376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=BoUi/qCLVkMcEdqrf9oJjACb8bf6/hBtYFOHGp0GYMfQLkYoENuDrcfdmdrYdabu67
         UEKQJ9WlNTKWE/mGqantF0nrTb30hTleNLrnYNED1YgUnGGgkrvFr6Pmk4lVUCO2oSU9
         aBB6a1m1bljUCrhVfF+TwHfKvL9MXMIp3WPxAc7kEG2H8OsJywOcbV2ZToJaKhV9EXfM
         wE2lGCSMsX6NJAzq4G3jMAvSwUTw6IrbyGso4hIMQbmHG0bE7j2BHGAeuKKBMbvkMhz4
         zdovYx7oSFNyOwCetUVQ84CLCmiMb35mQlmzkP6CyBzJC8czmhldMqYVrwX81TWG2hkE
         Zd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBe9lcD0iIp0ZTZBk3PGx6kk7anscHCe2a2JLvM6qe5XpHQcd50Rlb7n8hYfOhEiHQb5LXiyWIU2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYg8gsdOVjFFljShoQbsGhyevk1AXMS+zh5BFolF3RZcObBqCH
	cctP6KNU9XPG1rB58D3o7KitECHtVuZlUE4nsjK2jV/i40++Vf+TDHPEQ8VqJ0FvSrnM3Km040n
	Wam5/NUhutvGGMP6NxJiMF5PJUisUXGw=
X-Gm-Gg: AZuq6aImRKBsxLwqWHu5F08ThLiOSoydWOEWq1fJK57GyUmUsNcUgd2XeO9TMDoCSyP
	jOYgN5wg4IJr6SNDKS15WkEEZYpwDMThWmY585dFQxyeM8yqEtI4zRt6kjM4GwbI4tIO/p4Ihy5
	YPg8tXABbnxBCRlNKaYMrTM7OJyg7HWaD8vziojGmvG2GbMGzw3wrDt6fmqPyt6j2Ze4AJD89r7
	97tyRwuVk4hJYkiQpgADXEkcVhkqS+JF42x7MntNnEMLr/b4030YTRgOElDE236OxqgYHn4oPdr
	K1WpYF9uOEFV69TzaRLU/rUDsmcTgF5oKw4d9sC1vGMXl3+ZyHaFf4od8PUwePTyPdYcjoBvORb
	lYP2P1Dnh0nmdymGMumBead8=
X-Received: by 2002:a05:7301:3f13:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6b40fc353mr4845380eec.7.1768837574267; Mon, 19 Jan 2026
 07:46:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com> <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
In-Reply-To: <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:46:01 +0100
X-Gm-Features: AZwV_QjEkXpU0cn_dPvCmG7mx9ccCkl54ToiMM9A8sew4Jw7jWCplASiAflPTPs
Message-ID: <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 4:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Which crate are you talking about? I can't find a linked crate in the iss=
ue.

The commit message (i.e. not the issue) has an (unused) link with the
`sealed` crate:

Link: https://crates.io/crates/sealed [1]

Cheers,
Miguel
