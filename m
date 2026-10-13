Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F65208C4
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911738; cv=none; b=jAIboMFp6odBoWp5E6ZaYN+wpJqJNEPO7AXZpeJj1WkcWpkVIV1QmByBefebr78tt8Ah1Sa+Hbu7oiVwRUB5rRR2ms9vjz7cnKGGT29f9pdx6PEo7QUOnYcriBlLx2MFT3a/IDvIE9d6xniv1IDrTZdwK4XO4gFQWmZllCp6Dwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911738; c=relaxed/simple;
	bh=RtKX7YyQZ9klLGIQT1nD6AhAtzyS0G+6hzvSYWK0CdI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p+IgJw3XWNU/fpVjZfkJJFPjKnGfirZBQ0VPUcFk1UNv6DA8yqXEv27bjB/LWncZPdjgiXdo+Aipyn3RTH80yV4wWdwvFgirRfXREG2TyBjeyLCnRdSzJgXz4ZXid1cjv6HZVBHqclQamtQVI7eorsSr8zZNiwAik0cwoGlo/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvL+kTim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvL+kTim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE21F00893;
	Tue, 13 Oct 2026 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791911737;
	bh=gFiG3pmlyYWOgpLysalFV7ZZWWqMTlC+ECsXtYMCvK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvL+kTimNWD2bxa2cG2Y+u3APh8/vf4sxWnaG6LKfgYkjnjsVb44mtM8Gr/SOFKHC
	 W6LZr9jF5TkpT26RDEgR4wbKXun07iHU9YCNud3XkS7iR4bqIQw0q/iFv+QN/aUCDO
	 05jrrSpHi1oxFefxxZ2hPqq7dIQMmf1dSUiAalQNevzLv+hu8LEgdxr7cJr3AIAlai
	 1kaF0T9YUYanbvz7hOwDLaxVev0JgQL3b8yZt1nnpAKarc3V+G8EZ+8k1c1eKQKt0z
	 Is7+/BUbOcFNweHFV+4cH4atM8+55R30oPxYx4Usk086OtsxPM6l6tyOpFINV3XiVB
	 2QPjwhbeovwsA==
Message-ID: <sashiko-outbox-170199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/7] rust: clk: use 'kernel vertical style' for
 imports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-clk-type-state-v6-1-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-1-a5e9977b3509@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:15:36 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] rust: clk: missing trailing // in vertical imports in doctests
--

commit d1e8fb84f14ee05c8bc2b0c2603a25f2c8d23a0f
Author: Daniel Almeida <daniel.almeida@collabora.com>

rust: clk: use 'kernel vertical style' for imports

This commit converts all imports in the clk module to use the kernel=20
vertical style. It also drops the Result import since it is provided=20
by the prelude.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports

> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index f04f5c4a03d64..c73fe7c572511 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs

[ ... ]

> @@ -119,9 +125,11 @@ mod common_clk {
>      /// The following example demonstrates how to obtain and configure a=
 clock for a device.
>      ///
>      /// ```
> -    /// use kernel::clk::{Clk, Hertz};
> +    /// use kernel::clk::{
> +    ///     Clk,
> +    ///     Hertz,
> +    /// };

[Severity: Low]
This isn't a bug, but should this vertical import have a trailing // empty
comment? According to Documentation/rust/coding-guidelines.rst, vertical
imports require a trailing // to prevent rustfmt from collapsing the lines.
It looks like the doc test for Clk::get is missing it here.

>      /// use kernel::device::Device;
> -    /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
>      ///     let clk =3D Clk::get(dev, Some(c"apb_clk"))?;

[ ... ]

> @@ -293,9 +301,11 @@ fn drop(&mut self) {
>      /// device. The code functions correctly whether or not the clock is=
 available.
>      ///
>      /// ```
> -    /// use kernel::clk::{OptionalClk, Hertz};
> +    /// use kernel::clk::{
> +    ///     Hertz,
> +    ///     OptionalClk,
> +    /// };

[Severity: Low]
Similarly, should the vertical import in the OptionalClk::get doc test also
include a trailing // comment to match the kernel vertical style guidelines?

>      /// use kernel::device::Device;
> -    /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
>      ///     let clk =3D OptionalClk::get(dev, Some(c"apb_clk"))?;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-clk-type-s=
tate-v6-0-a5e9977b3509@collabora.com?part=3D1
