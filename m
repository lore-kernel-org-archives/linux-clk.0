Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E1285C88
	for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815507; cv=none; b=L3u5pKD7vKLbsdtvIaqJINXe9Q/wUojvtAW3aXleM0yRG55WJc6jLlMfbfhCXKxUa0J0hzGBz6cHaM70xRAa8Yeobp8Gx54ClNYcuk0n7PD7186JjHFym3Gb7sBCMYvvUTgcnqcoIugWDxcpuA/M9/iih7tUqhBPjIqPtO2kFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815507; c=relaxed/simple;
	bh=rnUc1sSIJcJcXtlU0rQc91rWE99Qu6t+C8m+svSvM9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puK3vkZthAPFs88T77zN6n0luLYTYratSVQEPvxcVkE9DlL+UvvNoK0bzCJTWk/LVqAypzelTkPh+SNK57jN3HoruoMnCi2retB9oDADFYGmwbf+b5hFzQRps8ButufirdfGSrhJhqr0FrKGZGLkDhtFoGvoIJZu8t5lVzUYvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWwYi6s3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWwYi6s3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26816246a0aso4728555ad.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760815505; x=1761420305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
        b=IWwYi6s3kuZG/HtWI4MzpdPGLv4d8Bfcn+qXg3YsCAJEr1QKzKvTGjiRQOdS/DQ6DP
         Y8fr4SVEQM6tnr35g77FE8TRgg5K2PYEEdg9HIONLygZlMDawxU3NigbPW3k+OP+wdAX
         p+RL+AdNcPN++TuGYbszNv8guqVo3p+IJHzSFOheikGp+wvxHC9YGodWGWMCuNiFQyF0
         lrFKjCEXeBB56WnBrAiqRo+TEE4IlNb0HSwwcDRdBld7LAccjJwp6Gt9TETzQOBw8cBJ
         mXKIEF0M0odkj1R/YCfAK98yUptWeiaPIRZWw7LLzFnaqdaEvwU0L50N+CZJqNyHJ4EX
         3h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760815505; x=1761420305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
        b=rqUbUfZa0iuoAPGjLbXYz8LnIM8r982SkdEd8HpSHFrukbWYxcmNKprZ5fXNRCkJtd
         RiMRVFC5lEkecDGDfcEdK5iTnNx2SpcJhfs5vJi0KyNtncyqoDK17UnQJu0FJHNwPDrJ
         Qg4tzp21rfiegF3oYnttAauIUzlCMNqKP2NvX+sv51QXOmFsUO0SpiYFHV2MBx/HDwlh
         /7J22mDHg5FKx6JpVaizR9ofs0VcynjyyGar0shYe98Ri9HxHUcvj//s1GeeaPNmx/c6
         IgvOjmjpjB7ok7zAgIQs4N/iKAKv1Jqph4sRVo+10/QTYtqF/nzlIBTCieO4kacrE/nP
         JRaw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5mS3J2ELbFHOkGk5VjnUPLpAVCXDH70m8A9dfCMoNYpB9FDzTS9dV0c/YYfBi21wLhRbtFDot/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22x4hd4/d9Wsv5s0qCmS09mREQ30sF8j8agMX8l4XlDUEIJsv
	GAN9zp6VKfnSk25f8k31rBv2NGl3uQ9uO0J6JO1bOEc1UboYPlVKbkrEeRF8VFSeJB3S/hF9FQm
	L4Ud37aCzdIxMJL+jtyeUPus6liAH47Q=
X-Gm-Gg: ASbGnctfzA/TMG4YobAPE09QUFCBzawJggCJsxCajuk1Dxj2Fbi7leAK3OBbWkoDtYw
	Rzi+SpQ2ZDKyQkp33e3jPLG9PM5L92THrFZqV7+hImBF88OgNh126T7+Zq8rNsEWXr2p6KdC4rz
	Z4BAixFXra4Jfz2HVYaZy9CVz7J4Pnzs07UDAMh0YPX2vyrVnx8LFuOKGQXU0tUp6gVTku7ehfd
	LOPlbGuAVdYf30Hqcd/LrTZdJEfAbo6xL2QLPA4gt/vL1RILg0p+zmogAhjkXC0oO5KCTgsrLBf
	pEZAa/KZsGJDwq/lcYYXreU1Q1HaWOV6UM4GL+ORJUMP2Vxg5N6gpWn8O/1bSygyRxpGT9RJ1sY
	WTgE=
X-Google-Smtp-Source: AGHT+IFynbxdq4PbDoeu2y7E7pruyAv8MSoOFKgcS5qR5uKUe2l/9/1aikoejnUdjk1VE9ieyNLSjxDynifGmomPS5w=
X-Received: by 2002:a17:902:f550:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-290c9cfec04mr58829965ad.4.1760815505098; Sat, 18 Oct 2025
 12:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Oct 2025 21:24:52 +0200
X-Gm-Features: AS18NWDWZ6CTzqAcsRkSpKjdzes4UGFhB9PPk5gEXsERGZ6zM8JBbanNnhdHiYY
Message-ID: <CANiq72n8m0JKjJMZ8Nk8B=GG5kcsSuc2YKp4=r2XJJgREoZZkw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 00/16] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@kernel.org>
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
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
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
	Tamir Duberstein <tamird@gmail.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:16=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> This series is intended to be taken through rust-next. The final patch
> in the series requires some other subsystems' `Acked-by`s:
> - drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
>   look?
> - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
> - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for trying the kernel.org account -- it seems it worked!

No more throttling to deal with anymore :)

Cheers,
Miguel
