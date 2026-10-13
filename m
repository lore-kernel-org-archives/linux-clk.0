Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A05522EE4
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911744; cv=none; b=EgFIEM8VHMoHETlXStG3dNf6OiOGcIAxtNBQc01NtnHFZn5M+RYWjEfLHkVd/klbgusgm+bscbLn45K9KEMqe/W4SwGe8tK6V9pXoW4wwOLwa/2qLGAolPbUeKttv9HpvwDmsDKeDqNJW3yTPtHTVC4oKxAzUlmryCnZbQRl654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911744; c=relaxed/simple;
	bh=HgHS3nItaSk2XKmXjoqy3mQDStbwsAiUxFSS2nOKTWk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jNGroQDulpYkAViIEezFqChpbgkXCfLjc/F84Xmr22r3u8WqjqnIzbHUokYc4vh6QhmPaG7GcYnlVggTb1gUWULATklUGAD2Usn52veRmTPdKu9NvWq5rINZNPLI+ajsg2t0FIFd/Yfofr5mI8ijFo1WrjlibCaCkKoSR3r2keM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX1Kapzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX1Kapzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A879A1F00893;
	Tue, 13 Oct 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791911743;
	bh=bN4RiUcBpF7GCOc9k2/wLqIH+Z/bMrbk3r/RI458mW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TX1Kapzpk0Q9Rdml9RrXlY8RmH7Kb0pThCRGXPtQdC9IL0DCKvZ4AS9aBEqepQpbI
	 5d3S9vbqszTfWq/RXcuS+CvAUZwHRL+GyUEf/glr6Bf2faIcymmbxSXqfuuQtgGZT8
	 R86TxOfWrGCEmE8aMRiEPYdgR49oV2Iebl264r4jk/UuNUPV/stS4dk0OYgxprilW4
	 jB5TFcrTwM9EUXU/urAIeHqJMnqLedq96jQ4aeJ9ruiSRjzYfMKp4O29th7EqtxGlf
	 +BOPK1vOg1Gk7+Ta499wrONHxu8kqPAFZ9vS8V0NRm/PS/ikXLoLBn1NdgJP8Wqqak
	 Jy1PXPXdSYwZA==
Message-ID: <sashiko-outbox-170200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] rust: clk: replace `OptionalClk` with
 `Clk::get_optional()`
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:15:42 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] rust: clk: missing #[inline] on get_optional() abstraction wrapper
--

commit 796077cfd7119a6144686ab76ca00413f2a3071b
Author: Daniel Almeida <daniel.almeida@collabora.com>
rust: clk: replace OptionalClk with Clk::get_optional()

This commit replaces the OptionalClk wrapper with a get_optional() method
on the Clk struct, as clk_get_optional() already returns a valid struct clk
pointer. The tyr driver is converted to use this new API.

> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index c73fe7c572511..1de2484df8cf5 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
[ ... ]
> @@ -175,6 +172,25 @@ pub fn get(dev: &Device, name: Option<&CStr>) -> Res=
ult<Self> {

[Severity: Low]
This problem wasn't introduced by this patch, but should this preexisting
function have an #[inline] attribute? According to the Rust subsystem
guidelines, small functions or functions forwarding to a C binding call in
abstraction crates should be annotated with #[inline].

>              })?))
>          }
> =20
> +        /// Behaves the same as [`Self::get`], except when there is no c=
lock
> +        /// producer. In this case, instead of returning [`ENOENT`], it =
returns
> +        /// a dummy [`Clk`].
> +        ///
> +        /// Equivalent to the kernel's [`clk_get_optional`] API.
> +        ///
> +        /// [`clk_get_optional`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_o=
ptional
> +        pub fn get_optional(dev: &Device, name: Option<&CStr>) -> Result=
<Self> {

[Severity: Low]
Should this new function also include the #[inline] attribute? Since it
primarily prepares arguments and forwards them to
bindings::clk_get_optional(), adding #[inline] would align it with the
subsystem guidelines for abstraction wrappers.

> +            let con_id =3D name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +            // SAFETY: It is safe to call [`clk_get_optional`] for a val=
id device pointer.
> +            //
> +            // INVARIANT: The reference-count is decremented when [`Clk`=
] goes out of scope.
> +            Ok(Self(from_err_ptr(unsafe {
> +                bindings::clk_get_optional(dev.as_raw(), con_id)
> +            })?))
> +        }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-clk-type-s=
tate-v6-0-a5e9977b3509@collabora.com?part=3D2
