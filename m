Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209E02192F5
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909145; cv=none; b=dz+UG+Jwzt2ixiyvckepKBhGnEVcv1x8wbV0VpiMp9e9eQSPoIpqNrSEIPxN7+fcRZ1H9j5izM8r1y2I0eP6CVC2WdErEVeoyV2LpP18KFGWFPrjaTt1QOS0mI3FXD7pdoVFQIu42LaqKEL+u4QDzOWMuHMHjWIn/aKmFW+zaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909145; c=relaxed/simple;
	bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwqxMoI1DHHI8feCna2p4evKmq+nKBiZQUBCSLw6IiASzntB2HClHWUK4d0j2ml/dBNRR7yKMQnnHyXuEdIXcBOPtwW13eWGwplOiDEzncIT5GTTSZOZMPoB3gBFS7xc9HkMHqY7YnZkaWYmFzhFkLwtDuAD8Y9Yz7Jii6pkzLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFVKCsLj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFVKCsLj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2699ef1b4e3so6332015ad.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909143; x=1761513943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=iFVKCsLjZ9ItLLugnc3NOyWgR6LdhMQj/lhUoAGx54ScPjkNeKQ2UAHsHjOHAamQ2/
         xDrS4i3MmZ7dAf4jogvQ02XjPPAkf7FBRZUEFrnlDrNc1OceGpdauhfN3WWMOffyFOsn
         cW1K4sWbbT3wXOvP2fMOi73RSK4EW28qGP3jA4JYKg2Iaa3pJSk4L/CktLp3YJW7Gf5G
         fiorgLY3lsDB+31e2mVDFbj582klczwsIdfO0ZH7AD/vCsTqeOB2KpwBHq+RgR1GDo6z
         ya5WTV98cFuVNieBV2HztSxbHvIKViXB7T0g3CN1L9Hn9vf3NGmZUNBGqagWjha9IEZc
         UrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909143; x=1761513943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=mr1qqqBLdYzGdUY0kRP7ozsjExPCw6r771dn6wCVzVZoaVMCtn60f//eIT2UXMsgrn
         xmXm4GrXBZEnL7y75i7wyvCdSgpJe7msRIlExTCy6h+yMehKo4cQAGbY7B0u6mJuBfmC
         rhkWCs2RR7jiCDf8mC4s7idzW/PfVuKjbYNTEn/auyj7cuVxzntJSk4qBlsMuEll5V0H
         r6htC5X31eeV92qHdMx12jsp3RxDXb3gpG3lz9UXVFH79NRhSjnIwomQe/7ERdLgM7Le
         XVT2Ki6wU6RZ6MgG/rhwO1shWXtH8az2mtTff6ZMunl2m+dldqyJ4HWIexJBKPJU84/o
         Lj3g==
X-Forwarded-Encrypted: i=1; AJvYcCUVBluT6xlOidMwZFZADLbRRsXD4PhmaZWsCR9QSqqIjf6gwBQpo7dZ2DI/Z9jpyrLIcm5lWnJQIB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMzsn+0MQlGfgpTzQemrJvaF2aqjda9xnzuG98Yw3rS4f71jL
	JmVpzzDCX3GYNn1HOoCyF7OwR23QFkSwT0VfRrXy5OuPB42sBHc4Gpypz4ubIyKsjr7QGmNmhE5
	QkejKV1PmtFApsv8csnOvQQNpIInW/7k=
X-Gm-Gg: ASbGncv6cBmsMmda/12IzjgrqPe5VMqmfBc2AjaSJo4cOk0GU7PIwE/+Hw8Hc6snpoj
	wcYUBEspxVjqqCk+ijkyojTi4byRo6arZQagibNDA2kjoXplSjwoM1owIL5uO4eKR1mIdlVMONs
	DUnkQfIovThIfnnY0mgTSZk6tW/ldLOB4X+ufWDI54uo8CWBjWbXzh8DPtTPiH/Nx7XKI3AL4FB
	Q0TXypvBg5sN5mpHSJVWz8fpSP9bikwgL0bPBJsG0QTmpXItuKdjlk1G88zQBtMYROlEi7/tVz8
	hW7NH1BAr44JE7dkP3AaUEKJ3GGLQwtMjS88T7NZlwBI11nbEn8nG4zHzmfohGW21jBL1vy0q3y
	cYJMORdq39FZiGA==
X-Google-Smtp-Source: AGHT+IG+Xq8GXKfGoMwbFFQSVjc1IKmL7pMM4P5v7DRrKR2eAYMxLjwbrDpo8D26g74EqZuNpH1jVIwhs5ozgrDthtg=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr70983905ad.11.1760909143546; Sun, 19 Oct 2025
 14:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:28 +0200
X-Gm-Features: AS18NWD0bEVrj3eqcMBbtrKdDrdonGG9WGD9YJjG46fNVzfrXtIBr4GqiIVIqEs
Message-ID: <CANiq72=c3Zs+mecvDVJ=cyeinzezhGz7yqC9r6FG=Q4HAdb98Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
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
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Andreas et al.: I will apply this since it would be nice to try to get
the flag day patch in this series finally done -- please shout if you
have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
