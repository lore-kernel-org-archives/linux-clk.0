Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D462A95E
	for <linux-clk@vger.kernel.org>; Sun,  4 Jan 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493838; cv=none; b=sXIHgWziRTVxalwNFh//yaLise4scAVhHVC5v2i5NKtYDwIB02UnT+NksNA3ixLF/BiN6HdxiOu7OmFeO0GJDQUKfagmfXEp/bzqZ5i+secI0WfcwoiNhZAhU8/+5svWbUrociZSkNPrUNQK7wSEucZjFXUpwVs352gNRQ4ueDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493838; c=relaxed/simple;
	bh=DlvFdaYcgS6BsgkwyRXsWgdKt6YfqaxoNOvxoPmtE6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0TvK6VT1r0OJAJhGE4JID7YIMUnCugidYu6dG6nJqYv6Ni5GJAWu5nyJd+CRGDbI7PV7AYhxYJrruYu49tXdP9TbJm9xGdHB36XhrdyWLwICqm9RzodFcbSu6WpS+FtGHt9Ju/zwQt8OvDFFQW458obGSm6WpEuhDRK0w2E4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA+vT6AY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA+vT6AY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-598f8136a24so14598767e87.3
        for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 18:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493834; x=1768098634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAb7Y2d/CNC20RUajmwVdxtej01XI7Qcxiae7kFT2aQ=;
        b=cA+vT6AYhzBC77qF88JJdxCwEfxL5qFToNEO6XBylCHDZa2hdv7Rw1fXqEiFjN+5xa
         rXmwOzVWsJ1Us+ubewRN2c2YgO7aBTr9AREprNQ09SHcS5ceFvhmMF6bh3PeiQSAMZ3Y
         6fwJm4wIihCyYkOvLPdIBov5R6cmq8KOMrI1LWVnQTV/Cf6H+kj0pyROtR3M4wDshw1Q
         N+Doa14PMza3ed0YQjX8ueJETt3fLfOJSIEov8oPchPEuojHXoW8+k0AoauMOtSKt7+S
         g1Kdb1jczAo84ft99NWQQJXf2hZp906naJ6+sxW6SoznE6NtOD6XcofhD/dKsrD5lpYF
         2+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493834; x=1768098634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAb7Y2d/CNC20RUajmwVdxtej01XI7Qcxiae7kFT2aQ=;
        b=xNN7vJ6br90n/DegH6zLBT/AckKtr/aNau2omXSzqZloVBHuAs2Jxn7hXb7inPwkiW
         PLQIODhNxdzXdRGAO502MIit4xAWbBLzaypDZ/n3VJUDGJwb+I3EVVNskYeexZ5CGdRR
         TLjrt6e+TSZ8AlwWEhkANyMNJ0mBKYMqDKfWxsjXsCxaUQRQJdxZ1Fo9FSF8kK724jaa
         +b3gYAYoEkPwzXnIiZiYKywuiNiYXgbEZVv/shEiwXk4f9/lKT9DHxDqm6wlF7YjAMSj
         SB2b6jeZSNX5Ivc9lptcW4lv3cL14BX9jqt2ibDwBROSfN2PX+eWAftUH40gIgmLdTme
         t3zw==
X-Gm-Message-State: AOJu0YxVKH2guXfUgDxKekYNCYEBPMI11f0r7p9mOFi4NBWfJoxildCN
	QRSgOdlb0j0EXJe8crS+N6bc61C5N8UBfGCMlwAMd9ek5xn8ithqSBZoCODRMbhT7lT+xIja6Y4
	R7MPPtXdpBJxBtRzEumXP5c2QBFazq94=
X-Gm-Gg: AY/fxX76K9LKV8H6Kqqd2rParKPgOYdhd+vtYJaRL2c9wSCt8uOZgz/6CD7QgSxmEbJ
	D5HduFfYQR+HV3PoM/+bbnuHtW/KHDyq8chYWo2QyQZwdD5F0H+TyeLZ+FJVXJzP1XSiq/r8g+Y
	OCMCnZxn5KtafxA2Ou76HE2KYP7cjcuMqEdUf+kk16xgllwlFOw+Bod+1JnqcloYFRVUfwfLhNL
	CIXCdC31DSo0SLbwFofZ2LLnDZHT5nS6ziGAMXRRMI97rDuwlZIxf2EMZii3Ez7BZWLVJ5SnVYq
	y7ZIIZ8UdCP1eG3U+6RrhMDL3fTUChsBXTjNmqiqIfK3do3xxf0JFHEZ45fvI80kqai25PgXqid
	CCT5tfdbjhQUIdJfr7klrcu/NTbKIVIAj5bkezfKdnA==
X-Google-Smtp-Source: AGHT+IEcHkXfCVSN9NSSZ24rasJq8edRgueT2UH4kaFUqTRZLzj4M5TZS5QUbg08PW1poxCCe9WkjMVLSCQi7hbJc8A=
X-Received: by 2002:a05:6512:3f26:b0:577:318a:a1c6 with SMTP id
 2adb3069b0e04-59a17d6521cmr13569645e87.23.1767493834050; Sat, 03 Jan 2026
 18:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
In-Reply-To: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:29:57 -0500
X-Gm-Features: AQt7F2r7n9Xs0cRif1ZHf3PmV71z-bkOeEDKkEDT7FB3UNkC76XgQQjhdM64nBE
Message-ID: <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
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

On Mon, Dec 22, 2025 at 7:17=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/clk.rs | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index c1cfaeaa36a2..68a0c2f4e318 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -104,13 +104,12 @@ mod common_clk {
>      /// The following example demonstrates how to obtain and configure a=
 clock for a device.
>      ///
>      /// ```
> -    /// use kernel::c_str;
>      /// use kernel::clk::{Clk, Hertz};
>      /// use kernel::device::Device;
>      /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D Clk::get(dev, Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D Clk::get(dev, Some(c"apb_clk"))?;
>      ///
>      ///     clk.prepare_enable()?;
>      ///
> @@ -272,13 +271,12 @@ fn drop(&mut self) {
>      /// device. The code functions correctly whether or not the clock is=
 available.
>      ///
>      /// ```
> -    /// use kernel::c_str;
>      /// use kernel::clk::{OptionalClk, Hertz};
>      /// use kernel::device::Device;
>      /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D OptionalClk::get(dev, Some(c"apb_clk"))?;
>      ///
>      ///     clk.prepare_enable()?;
>      ///
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-clk-122a1428b919
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Stephen could you please have a look?

Cheers.
Tamir
