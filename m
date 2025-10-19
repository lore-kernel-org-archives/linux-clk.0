Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037F2206B1
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909170; cv=none; b=qbpnqJwPT0gt8d6ZCOTzePUTBGObnbO5j+ImOGNfLbiHc/r8CnKKkN7Axm300+jptIB4C0ckKiJKVd9b79tjVG4x3PD9p3y+oxvxRGQBRTDgcX46wuWsrJBJlK8/I71ZOb2Np76mMcO45kRjtAh4TjZ/BEpIdqUCLr+QYzziVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909170; c=relaxed/simple;
	bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8a/2Gq/KTf+2fo87Sk2nh34W/wSTGEZYXFNjkeg6Y28JaFwo+Nmo1rPA4sJZIRPtPcvHsuWe7cMZuvTTjfRFO2hJ8j+U/8h+F9WG0EryHUEgMGDd+ipDkOAWYviuWKp3xCTV+sqQ2DK52gC17Acqx5Xupd1NiVq3jz32ii4mM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDq7Fqvo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDq7Fqvo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33bb66c96a1so1048980a91.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909168; x=1761513968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=PDq7Fqvoti6jPtW18JV8zNYCD4MF+/+5YXqFhSF40rJQ2ZFet8SRtKsBsR97WCothn
         qASGpWu/s+Pi6zMEJX0BTA4qKHPIeIb9rrBMjXogOlE6D6FwEub6lA33lq6V50E40sS+
         sC+6jjHrEVnxy2466yLZHos/VGNYN4QtGHXPPJvUjY93p5TydGBDeDzWMG+Xrsj2F1u+
         Nf7+jAOmXHe5o8D70M9FfWLfPQXkD6KmyR59HiYceSduOwnxZ3KKCwkfRgDsU+DQT6wo
         HC/pKRdC0Paci7gbI9oIUOxQPXfKmxajfD65UJyql4eobfugI+a+6j/sSpxPVJxrK4xO
         f4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909168; x=1761513968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=iPeQl8i90gn/Hxy+TF85X93Ukcqb3m0LaamGbSP3KGl0VRutJF55JSjaMxGfKJzy/m
         5ygSmaeNkg88S6dxNq9kwVC649eygT5dfRBwRXumWsDJWg3/+yRZ6UYMm6x9owTdBDs6
         xhO1T+td8ZpGXU0r3OIQVEqTMwAus3k2ZYygseeeniH/JSN0Oqd/EmP9isrojcdT7qfW
         Y92Jbzvpucof4800CbXrfqLi2kLh86r0gzxDFOkhW/i5uKG8xLNVoZ/KsCGNGu6AE7P3
         lKhRCM6sH8dnehqHvg49iB+7hZzxs3Fgg2cVUGnOFl+M0NcV4lFSS4/r34uxa3J4KiQv
         f+Og==
X-Forwarded-Encrypted: i=1; AJvYcCXC5BBj008WCY0YaOWNxtUGc42hLEU3QH3JFt4eBuZVh5NC/BKfbiu1011B6dmFfVSeo2Khg212Ngw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLin5iMtdKlF0SsIGEHV0kvhQTzFfg6KFiL18tKYHvTNNRMblK
	Ka4Ugx2AV+V6+ExUAMjFnm04BJCY8VNNSFtFyMCmw0MjwhjAQwV1O3lpRaGQk64sbpsvKugXg6A
	VPw8cj9db1XF4lA1mQx9x0ofjcZMLeR4=
X-Gm-Gg: ASbGncsWNY+z/f1Tgt4y6MlaiEZzZuJNWZiqtzmylXlB5TCs1QU23PUgMzTjpcydD51
	XTwEA5nDFMMRWX71xMNGnN0d1GK87fdPiDEBOlpVM5Wm7BdhxNQl1V+S+aPgNx+97qHyhN0Q7Ti
	3ERyTkOoMdLDJFoEInjCOsnAOkNKvzkxvzab6OPNiWIxbn1EYpTTNnM3GQ4Tnm7WDTsZfe+T4Eb
	2RI6NAKw9YtgrjKZY1qfZuqDBHbB+CYcJnUjAjSuVB7pj18NBWOtvPrEbrr5q/LV1yuHhcB14DI
	Edg3ShQkc+fboblO5wje6Skng/mxFMqfLD7ps6M7Kw5IGDh0wmM6xEClXIyTA/VsST/EHPCndHU
	IZ0U=
X-Google-Smtp-Source: AGHT+IEwx4nwwBhH/hNxoUVwvTs3X2bARut2TDi7HRPmGCV4tokc0LBHgVVevC+PQZA8tTr6XyTnNa7XyeNocxVrSx4=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr73269955ad.3.1760909167598; Sun, 19 Oct 2025
 14:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:55 +0200
X-Gm-Features: AS18NWDjBjMG5pR4bntjwqt3T7EHDFAllndAmj435I7b4c65f3XvqG9PcKa-Qb8
Message-ID: <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 11/16] rust: opp: fix broken rustdoc link
To: Tamir Duberstein <tamird@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Correct the spelling of "CString" to make the link work.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

It is private, but it is good to have this done so that eventually we
can potentially enable a runtime toggle for private docs.

However, this is independent of the series, so I would suggest that
Viresh et al. apply it independently.

Fixes: ce32e2d47ce6 ("rust: opp: Add abstractions for the
configuration options")

Cheers,
Miguel
