Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B717BED0
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909132; cv=none; b=mD2jW/xH6Rm3IFkQEPbYoapaZ60J2BB0BYEUn6wlYV0uKd22IsB1iC9wdBaW2YlH9HG+a9XyagXKocDulWLjZyBVGuSMo3BlA8Wdcg+kmnfnpq90TQ6rf0Su6hKR6v5U//lQZbrDgFoFu8BbopsqaxCNzJRHDjye1SpToE/PLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909132; c=relaxed/simple;
	bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muTKMRUR29vmrwhrby47F4VjiG9yST51AheFe6VuaHhC+S8nU/Djw7bwntEWq7yRUngkE6qLKObHUoXcd17sZG+t2pvOOCDEeLmsp6oMZEXfiSFHDWI5qvN2+frs8Tc+Q1/tSCwNu170e9wi3V+B6nhCh8vI1wAxHgjenrGPvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFVHgf1e; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFVHgf1e"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27eca7297a7so4667945ad.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909129; x=1761513929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
        b=BFVHgf1eBxrRlVa4HQwtg+9JdGx+ckCck1jX46JQ5chJaRBSqsc6IKXoNvNltJhS5z
         SrqUVnX4pqzWiqNACvkDi1zVvk0GidVr9CkWudBq60rIZd3EAb5DXaA+0AHy7UMlu2IG
         fOjsqzm45BHLYsgMbYQvLre1c4z0LdXIonBIBz/gncQQg8glng0WpBLHu/TfVJFWVi2R
         N6nphsFpZ+PNw+cXdn0SfRcjuXCDssB1hHtfya3a4thXk9G7paDwq4vzO7Ul3foqBdju
         mPnqrYMM8J9oyfVNXdQhhChz/diK6X8qnWUsWRiaNkBcK76mIzKAYNBEDTup+TwJgR3A
         HOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909129; x=1761513929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
        b=wZBqm6KryvrubXmIdfdvp+z89+EeVTSy01u5k8TqYOAIaMb7+vt90UlgV+i3Ro959p
         MgCPRe+s5UDuKKQr+jVXdR9ostXjeRU8M87NadBAIcimXii3Y7mb++q579xa6mEcQooC
         Je0ASkSfla+bKxLP5pWis3fMogWULnjkRbKqxIFQjA4s/k1vtb8hkiMLkgYaQzX6xdI+
         Wke7D4jDC0ZDKv6UuFTFqR4Ast0QeyNuGw7wbMksPhyTsEcwIePmIXmMrGYAP+wKvuwy
         IdLTcqBFlBkQCSlXVp09L0TrYrGCWOtoA1YQGHa1XjjXa3H4ztAfU89VeHhSv/Zq9fKn
         2pfg==
X-Forwarded-Encrypted: i=1; AJvYcCX3kX87422RRUuMKCYWDTJuH55ukno8OGbzU1YGbLzGLaHT1dJbBpRsH1DD5JwQ2KzBA41cx9smP5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G0sz+IDOHmmuJZY/RZtJRfoFlx0yTkPxJTcBeQw8PomKBnJG
	xr8PKTh/zOob99hEQdCowoWJHkBIImTF1V1aTZwGfjLXQNMiRZ0bvk2tXNmJPIN5tu0li1Gi60p
	l1vbpZYVV6S7A7z5f4oegwsBl6safKko=
X-Gm-Gg: ASbGncvYUXC/bBNCghkl2g3VfqZCpR/WfDJZmf/bTyLmhZsycLJ5zz08pz68NsJ5J1k
	BEFM0rD1NKToUVZShTk/il8Ews9MmWTYMQbna85KeSDXPU5DbdIAWKmp+94+FfGyloiVKHjX3yQ
	Dyj81xw4wdfI1P3XwbNA8bc9euW2vIMJT/Nqg0411ChbFjppaV5jSLl+R6SJpnEJF20WVhg1pbG
	CuZChMGikmPpU35H7jFL1PI6Wkj0ZdNlpBSglMTtfF1xP4zUOYndwKft5coZjFKP/CFf4saC9jJ
	MTl8+iRND0K4IWqZ9qNEDk0QBP89asTdcDoARjDk9qBeNj1Uqooyf0Lma/YBd1TPWpNeF9xu9YB
	1X0YqQ3rHA9tYBQ==
X-Google-Smtp-Source: AGHT+IFkXmb/qgb/KgY8CoxXBFCqji+DioDep8k1ccK80l52uLY2VJCsOrEx4mXqL5zBbM0jkYzLAt9Oa8qgqgiQULk=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-290c9c9a8a7mr71999045ad.2.1760909129461; Sun, 19 Oct 2025
 14:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:16 +0200
X-Gm-Features: AS18NWDXrZ8O-3KwwwBOxfZWPwAGhp3HE5GT4mOk-9o3K1qGCus24KCpGnZzuZA
Message-ID: <CANiq72mpmO2fyfHmkipYZmirRg-x90Hi3Ly+2mriuGX96bOuew@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
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
	Breno Leitao <leitao@debian.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
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

Liam, Mark: I will apply this since it would be nice to try to get the
flag day patch in this series finally done -- please shout if you have
a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
