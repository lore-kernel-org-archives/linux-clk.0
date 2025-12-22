Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF402F83BB;
	Mon, 22 Dec 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414061; cv=pass; b=aIPRWWMgUrbeu30+AYKMZzQX79Kr1EpAa+Lz4hiujzrPjDxqMiOhJ7Q1wCzRbCQ3LIiQI2xTQhB7M7QVbr38KJYobrTXlf2KZaZ5OTulEDFZiEGAi/RcePpds4Md8pU9u70puAT+H2voFNjMlJhNmby+9HWWmTVNkIi58sLGip8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414061; c=relaxed/simple;
	bh=BbygIyVTraM7seyE8f3XaSchAG5rEnhJaq45mNFxxFA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=U1IS2r1ozSEfFkf+lEMunZSDpfkbKjWU8gK9FAmTpaLZOB7XzQlkfcbwZyzCrmiVnw1A7Yqzvv3YxelNjO3cM6GVl1TarpWQwEz8i8SH8wU8fIVDnkOB4PeiWzaNpEVC3HwEMx/JSkryXsjD9hH2l4qdMu1al1NdH133WmkNBos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FL3+901w; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FL3+901w"
ARC-Seal: i=1; a=rsa-sha256; t=1766414043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EQE30NkZyNDsbgrePhBGe3CRfaoI961G02uluRHnxQ7nf95/QNuzlNUKq8Gn9NzjvWNGO0dtWMbLCZ6+hwDyTOCLtMBt4bOYZD6gA8xn+hpxC5wIyeVbMp+vox/SKZ46Ch+Y3yFd8gS0hy6TkbFOEMTtoOcIhAHri2/Uj4GkWdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766414043; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=avAWDCCJZHmdro2RzMgiznhC0Y9VFamywQRYOE3W28o=; 
	b=GPujciV8KNEwx1ayZ5XFpE4ouFVQSg2StTomP0fj1g4PsrSdGUxnbqItlvGyADeEbQc4gk0Fc93c5JnPHV1fVYLH03FRFFXPLJSJYekeNGCprR0qFs5qt6t9yAPUg7mTZ2jgpSYv6WFAuI5aDWcEnByWKQZSEqR9qsfVTze/heY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766414043;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=avAWDCCJZHmdro2RzMgiznhC0Y9VFamywQRYOE3W28o=;
	b=FL3+901wlWctlOqe8wCO66HovxKkV5u4qCRcR91xnKtO40swZ0g+JVCUHFfSSHce
	C/WNkq/HYOfEksJXeZQvV7q9TrNJY7Q0Z/vtnFWW0pkeayvmiP06Q1RVpKK9TSrPAPm
	N2lCJ+PfRMdnki4SFKRoxaZHQK6i+wGWx7yzCrCs=
Received: by mx.zohomail.com with SMTPS id 1766414040944178.93574651737333;
	Mon, 22 Dec 2025 06:34:00 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
Date: Mon, 22 Dec 2025 11:33:43 -0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7DE7379-7F5A-437A-A518-FCF90824CDB0@collabora.com>
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:16, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> rust/kernel/clk.rs | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index c1cfaeaa36a2..68a0c2f4e318 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -104,13 +104,12 @@ mod common_clk {
>     /// The following example demonstrates how to obtain and configure =
a clock for a device.
>     ///
>     /// ```
> -    /// use kernel::c_str;
>     /// use kernel::clk::{Clk, Hertz};
>     /// use kernel::device::Device;
>     /// use kernel::error::Result;
>     ///
>     /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D Clk::get(dev, Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D Clk::get(dev, Some(c"apb_clk"))?;
>     ///
>     ///     clk.prepare_enable()?;
>     ///
> @@ -272,13 +271,12 @@ fn drop(&mut self) {
>     /// device. The code functions correctly whether or not the clock =
is available.
>     ///
>     /// ```
> -    /// use kernel::c_str;
>     /// use kernel::clk::{OptionalClk, Hertz};
>     /// use kernel::device::Device;
>     /// use kernel::error::Result;
>     ///
>     /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D OptionalClk::get(dev, =
Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D OptionalClk::get(dev, Some(c"apb_clk"))?;
>     ///
>     ///     clk.prepare_enable()?;
>     ///
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-clk-122a1428b919
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

