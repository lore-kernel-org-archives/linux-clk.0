Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134835C1B1
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827154; cv=none; b=ksS7QD7djbjYsIyRtc8iNsWuDWreKe62BKX0WX9O0nLVPqmNhLK2EK2uB1jgljc4PfwhSrrhrZF1gPh892ve9lCwH9PzgZlqdwFvk2ll8wmeY/fp0Ay/xLb+M/PKnh7gdmmdtNQgx0KDRx5cUccbJppDeY+pi13tbXgD1QNAeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827154; c=relaxed/simple;
	bh=Y+vzfzwxV0X9I6ZUZ9qwoqvJfRIq2CCJXDS2bCFWcAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGRWxb/DSU3RRa8fQCkjC6xo91FOp22aJvKDZflwTJF1RjfM5WOh5LFMI6t5wIGVqsptxpbfDamXT17LT7kPHc9Hw8kcaSQCR6UjBU5sb9NroPwjyE5nnsju5zpUwkseBun87T0vCXJLu1xJB3mN9a/VH0ttQ0Z4KwyoTeqKcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQvxcYE2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQvxcYE2"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38305f05717so37334671fa.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827150; x=1769431950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft1ti+lcNR6y5zU/XvAAKrTqWQ0ka9nXreLNeXyu1sA=;
        b=YQvxcYE2QdoJO9ohCQcXU3tk/Srl4gHS/ScNi2GDn8ny6Q0rM2x+vu4uqbuI4/GO61
         q517yaGqwMsT1DjuKYc7NJIJgRNr5DqqXCIvajhixxeqPZ4oSh0vf6IzTUkLn8fFY6Gk
         9nDsqS2kniq1eNKRUaTf2BD2TwyWJlrayxI9oFdAaKCzlazHh0nlUqgbZG5iOYYLgB4X
         0mynM8aYC5pSutwIivJHAq7yMjRtz/tpfp+W1ZkeqV2z47EwMIrYQMC6+YZsfpNHIszn
         duIWoYjxQz4u3Fn1iTOW8QgLfCcYaQT87IQWSVbQ+QnRsF5muQ6CDP8SAX+E/6+S1G5e
         2Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827150; x=1769431950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ft1ti+lcNR6y5zU/XvAAKrTqWQ0ka9nXreLNeXyu1sA=;
        b=YgqG8l7144icy5Ye36fi5LPkI8h0jCNSxDTozqC1Mwgs54VuQJZFLlgGiRYZjTWuZ9
         pJkAvzOfrI1RjyaR9gRvxEfIJ+engxJNKS4owLlIl68Gy1Wz85hMP4ohvVgOaSAOJ/q/
         rCOBawQ+yZDHLLiS3lrtAyv+BFbARtOEk9StcOoIJPoU4qYsHrrClNN4LBj1wCMuKXut
         s7ZnxiDCGv402SK/3A0gIZYEXsy7RIbzaqqb0K/w23x2ZL1I5OOzYiNMuBYIPCAtsUi2
         XZwyhOQnVKuXLNcOXM+Il4KHjWKiZqglWBeuF57QeAcxipzU/neSB8QyXxtYw5b0479S
         CsDA==
X-Gm-Message-State: AOJu0YwvDOCaFrngaBzNW3bcQ0dHiTQ6y6ZFNgHBqQwSJKAjZvrvzCCF
	jJsd+s7dG6d5efm+Wh4zeW5uJGSMHCIe9xrtsNAD7vUkP4BLXkZzvat1DcLaVsjw7lGp/YYm4L/
	vXE8r6lHQYdXtM2AjCqPVd5knf96PGFk=
X-Gm-Gg: AY/fxX6n92cULbz6S2rdsr6sXrdPZ848/7hsZwmKM38V/QYjjuNVKzE/VWPH3Rm1dS1
	mYSVeqaZMUDGV8KvN93rozfhih0MS0W5DhQaU2Wc+cTr7fcTCgcxWItbi//Robppt7oKPY2GyKP
	zTaZru4XjD3rJ69ZCoO5yoQRSDgltQQfpfTuv1jbYzRvTWP9yf2Qt5ONeMLKb8nuBkO8J2U3E/1
	1sSit/6UTO2Wfs3iaT04hBVYAeejopS57gh/T197lRBG40xjkcbEkdnBZaqnBg/sj+H7NCS2ppu
	YDBVHIaKhCU1MyrIFSR3RREbhWiz3wMpttA2hkzz8dPx5bo5YD+kLGNMt7pXaUILhgUAjtVitID
	15WspFSjtSYjZPkjyEOBFaGcq+wBJb5wKmvEDCGPWS525pFavMc+4
X-Received: by 2002:a2e:bc88:0:b0:37b:8d78:e4bf with SMTP id
 38308e7fff4ca-38384335558mr36408681fa.43.1768827149433; Mon, 19 Jan 2026
 04:52:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com> <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 07:51:53 -0500
X-Gm-Features: AZwV_QgRogLIzoCwOASO5Jrp0CfBksLoemO-T3HosJSEe-KW0dyiqzYg-hWml10
Message-ID: <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 9:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Mon, Dec 22, 2025 at 7:17=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > From: Tamir Duberstein <tamird@gmail.com>
> >
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/clk.rs | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> > index c1cfaeaa36a2..68a0c2f4e318 100644
> > --- a/rust/kernel/clk.rs
> > +++ b/rust/kernel/clk.rs
> > @@ -104,13 +104,12 @@ mod common_clk {
> >      /// The following example demonstrates how to obtain and configure=
 a clock for a device.
> >      ///
> >      /// ```
> > -    /// use kernel::c_str;
> >      /// use kernel::clk::{Clk, Hertz};
> >      /// use kernel::device::Device;
> >      /// use kernel::error::Result;
> >      ///
> >      /// fn configure_clk(dev: &Device) -> Result {
> > -    ///     let clk =3D Clk::get(dev, Some(c_str!("apb_clk")))?;
> > +    ///     let clk =3D Clk::get(dev, Some(c"apb_clk"))?;
> >      ///
> >      ///     clk.prepare_enable()?;
> >      ///
> > @@ -272,13 +271,12 @@ fn drop(&mut self) {
> >      /// device. The code functions correctly whether or not the clock =
is available.
> >      ///
> >      /// ```
> > -    /// use kernel::c_str;
> >      /// use kernel::clk::{OptionalClk, Hertz};
> >      /// use kernel::device::Device;
> >      /// use kernel::error::Result;
> >      ///
> >      /// fn configure_clk(dev: &Device) -> Result {
> > -    ///     let clk =3D OptionalClk::get(dev, Some(c_str!("apb_clk")))=
?;
> > +    ///     let clk =3D OptionalClk::get(dev, Some(c"apb_clk"))?;
> >      ///
> >      ///     clk.prepare_enable()?;
> >      ///
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251222-cstr-clk-122a1428b919
> >
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> >
>
> @Stephen could you please have a look?
>
> Cheers.
> Tamir

Michael or Stephen: could you take this through clk or would you be ok
with it going through rust-next?
