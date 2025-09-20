Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8041306486
	for <linux-clk@vger.kernel.org>; Sat, 20 Sep 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758388358; cv=none; b=Gm1/V6qD4aFIomHrHqbr5ycWRtRFWQANZwTH7FdlBupBt5Lvu7PfpT/w4n5EEZyb2gheBEZnUeDX/Y2XKPwM63udLB4YlCs7uACcR1B/ur30SK2V5NbcAEY7oxBERt8hELOs8EltOGejs+2lpZFnvFmLl5gZB2d0/amzshzGBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758388358; c=relaxed/simple;
	bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgAoXJifoRBW+LJeCiXTLiMczIz3bA43AejSyS6g090cjA6yw2onvaOGAMnThnHPOHvOWXmEiKslteEZs7C1DeYENxl4Zl7lsmPKL0hDPwEa8cfBmXcW8xWtX3629I+y/eMlwqtjZigpw6bvufY6j8fCz9mFIRGXDTXXqSqY0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3IVZQezj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3IVZQezj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so1404132f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 20 Sep 2025 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758388353; x=1758993153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
        b=3IVZQezjkGRGY6jnZJUt2i+7WB3R0jDFvJ7S3CpqjSTX0Go0KM4dgBQaC5qeaLM7SZ
         MZBOmRWse7OxHunxwEPMleKziE8OpjqcsTBIFIxckSMSeiGfl8VsnlNDRedpN4cWYrcM
         63JobxUMPd9Ef2Fl/w8VvBA+lm3xJVXO9cueYXQLd9IEFQ6K/HM6axlSV5PG3+/7zabB
         lHRSh2NHXozM1z4/MIpktKncf6rHZ8cHoZT2+HSXtMLajrVoOvztL1PBd51XkXNQs6EP
         46qB+neSN+QgJ07PjdIAEdajmKfXNbjW4FNJT5ulbl+YMeoogNGxYcy/T1WSFKEGZsq1
         tLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758388353; x=1758993153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj1Ep/MJST8CACxWAubynz7i+zMqcF8h49oVjFnLgOM=;
        b=ZKm5h2XZF+YUOCLz16tkhx3H0O/twpGL1pFEbMeTrg/yARpx2mp5+WjlIxqxVXLLPf
         Q5CEkxPe+WTLcLfrInNPHa0sYBESMOGddckmMau4kBYc2mWWmwCVzK/kfyRQdPMQtaAP
         cO+h9ZVK/8kxy9BC6QIBBgn96loXRxBfkoIp1oIeL6IoFgVF7TWd08VNG+07cKirxrBS
         So1Zrg25Uue2ifqZEEWo2CUVpOBaOFtq53HTa5m9AWmipBGhHPOJnzvAY0lh1q+EfLmX
         UOf8XFIfYJejK+Nt3ncvRBdNsBxplSS6KlVBaStDjrxV70RkQozE+koptHRPbCkknaV2
         unqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE2606pKq+9jbFlWmh/OS9UTcpaVEWjy5SQOMZYrv7MTmyXWbHy8GMtOwjQNm6+Efr4Wz0g56G8xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFmYA0wQmdO/zax27BnsqGiN0dcmVh1YZ0UsbEyPXde8bKtp42
	lo5d1OqJl29luEj+5iHC+OJnOCYiZEKAahNTNzuS0Lvbz/prdrR+0zLO07lzdwkQ6zEFVy3lQud
	xY0pBrsHcEeI6xxIaeHJvne3jm0BssDph87kkRii8
X-Gm-Gg: ASbGncv64g36uG1G2dUHdx1OvYDzq+xxcCUNUH++fAYV7pcSu+moRTZt/ZH+Q/Nc6Kv
	BvXcM9xVE9xdQFfpuCmmMhs76Pm5a8v2JKY5puF58scB62D9eXP1MlJ/dLw+1BTD4FA7r/EBaa0
	6W9csWEKLPVXObu5sh7gD07qCaQCHA92pxibxVjhikUgb+nqeY4hfmr3KD+T1amacgUZ3H0jC7U
	Wn5Mg8=
X-Google-Smtp-Source: AGHT+IF+4bGibPipIgcJxYKVfn8BssHq8357Z0KdCsFz2M+fcQoYEotuvWkwJadILn9AOtmYWB0Q/o9Ht+aVSBuXwCM=
X-Received: by 2002:a05:6000:2c03:b0:3ee:2ae2:3f35 with SMTP id
 ffacd0b85a97d-3ee7bad118cmr5460258f8f.6.1758388352843; Sat, 20 Sep 2025
 10:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-clk-type-state-v2-0-1b97c11bb631@collabora.com>
 <20250910-clk-type-state-v2-1-1b97c11bb631@collabora.com> <aMG6JVMcMxVuX7De@tardis-2.local>
 <3D936C1B-FBA9-4964-859C-84BB665BBE3B@collabora.com> <175834480479.4354.6269916774389395049@lazor>
In-Reply-To: <175834480479.4354.6269916774389395049@lazor>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 20 Sep 2025 19:12:17 +0200
X-Gm-Features: AS18NWDvOSD7Ew9WoF-qENluBOtHGPEWpUP8mLuio2luAr2ur7aLvfUzGRJxJH0
Message-ID: <CAH5fLgib2a7UK0cYqy1cM6h_OZDMWf+JX+KpXXCJNTZchyfP5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
To: Stephen Boyd <sboyd@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 7:06=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Daniel Almeida (2025-09-10 11:47:30)
> > Hi Boqun,
> >
> > > On 10 Sep 2025, at 14:49, Boqun Feng <boqun.feng@gmail.com> wrote:
> > >
> > > On Wed, Sep 10, 2025 at 02:28:27PM -0300, Daniel Almeida wrote:
> > >> From: Alice Ryhl <aliceryhl@google.com>
> > >>
> > >> These traits are required for drivers to embed the Clk type in their=
 own
> > >> data structures because driver data structures are usually required =
to
> > >> be Send. See e.g. [1] for the kind of workaround that drivers curren=
tly
> > >> need due to lacking this annotation.
> > >>
> > >> Link: https://lore.kernel.org/rust-for-linux/20250812-tyr-v2-1-9e0f3=
dc9da95@collabora.com/ [1]
> > >> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > >> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > >> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > >> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > >
> > > This tag list looks a bit weird to me. Why is there a SoB from you
> > > before Alice's SoB? At least for the usage I'm familiar with, outside
> > > the case of Co-developed-bys, multiple SoBs is used for recording how
> > > the patches are routed. For example, if I have a patch that has my So=
B
> > > and I send it to you, you queue in your tree and then send out to oth=
er
> > > maintainers for merging, in general you would put your SoB after mine=
 in
> > > that case. But I don't think that's case here? Alice's patch has only
> > > her SoB:
> > >
> > > https://lore.kernel.org/rust-for-linux/20250904-clk-send-sync-v1-1-48=
d023320eb8@google.com/
> > >
> > > What's the intention of the SoB tag here?
> > >
> > > Otherwise the patch looks good to me. If we get the tag list resolved=
,
> > > feel free to add:
> > >
> > > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > >
> > > Regards,
> > > Boqun
> > >
> >
> > You have to include your SOB when submitting patches from others.
> >
> > This is something I tend to forget often, so I made sure it was there. =
The
> > order may be indeed off though.
>
> Yes the order is wrong. The first SoB should be the commit author.

One optoin is to just land the original patch:
https://lore.kernel.org/all/20250904-clk-send-sync-v1-1-48d023320eb8@google=
.com/

Alice
