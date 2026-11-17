Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950295;
	b=vjLfkGPN25qoJwOlnuDmeF9vHObvnPlt6haRBB7Gh4ti1wtTeLWQm2Ts+5+RXZTvTMR5
	 grbSQJ0PN4zN98I63TWfJFV8oDXcyk37fnRZ2fNAd3jWOX0xXQF7MuTgILR4WI7JF4CzE
	 IOgLfcq4Elfm66902yHccUNYg44wFtloHt5irg1orD7Lk4fkco4GXNt5myj686RVZxxT6
	 N8a3JIQ8alnZbuhBeY79NyyOlOS59Yg9rvdIUEpkxCqAKd/9dKMlcNQkhsec7hPqbOQ5t
	 F+UtaCwBTwA/OWj54XW3Vf+RBZ16MBkQs9e3EOJ47xM/7W48ZLBcobbW5r1CIXiyq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950295;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=92a5QTE9bIytS0D2KgcmY1YbSMRJpUe/xEcnpBP3gnM=;
	b=FwDt7IWLt6QVyKBP0NFjuz7uumSi/mQJI2sQatSgXq3zReNqR5Dw9aRpsmUV1gUrIRqM
	 vT/rJZ66YzQhzQvFTt+ju33nY8cvVs3Y7OgU8+vr450jMuw4uRcQzO7lZn1OTdPbbATaH
	 Kv+dQZHmtw7zEbmxINwOXI2YU36A02bkydsrl3t98wvSX6FrDuyJ33CQJ5Bqb+fI5SPtY
	 4Q3t9HSH0GVpTHbAW4pFfL/oViW3GDKv+Kq1vozkNpdP49jFZGho4YbaNE++cmVvFrIlP
	 O/Vz7e4X8S4EpExu1y196zfB3pCIXbsanTiaiv/NKb3EEdkcWvI12mzzwbLIA6l74oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVurTKnv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4BA606A31C;
	Tue, 17 Nov 2026 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVurTKnv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1531F000C4;
	Tue, 17 Nov 2026 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950295;
	bh=92a5QTE9bIytS0D2KgcmY1YbSMRJpUe/xEcnpBP3gnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVurTKnvVD9ETD9zGwONbuxAzdB5qgMqmJBQP/lfCm9kOIQXPLG+5UNNuOcoUdjJc
	 z0V1F38orcdia04E3Lhb8SFUY9Q/KbbTxxD+gX1EAY22o/IKuQWRhckn7kZFAsTlqQ
	 bD9LPOHkeaLr9eJoXnRqzVPPX2a2INXDb3qbD7YDLNGg52DZjxH64Sj6z8pj9yZaHu
	 AMMKlWUy/BapBla21mCmOBuJHUfn3ojaeR/0JwkKiOecT0exdDq7YmVf2092bMgXpV
	 wcOAUgUihfPAL0DgT5h/GKQTyGhyJXWqWMYf61ng7m7eXJ1nG7HJHDF9NIf1VwDy9w
	 1GhL0K91O2Msw==
Message-ID: <sashiko-outbox-219683@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117205951.140146-3-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-3-frederic.mahe@cirad.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 21:18:14 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: spacemit: k1: missing Fixes trailer for pll1_aud_245p7
  critical clock fix
--

commit 83873cc8722c58b6ef8102ec78a68b9664559a72
Author: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>

> clk: spacemit: k1: Keep pll1_aud_245p7 enabled
>
> Accesses to the RCPU2 block (0xc0888000) hang once pll1_aud_245p7 is
> gated: the CPU stops responding, even to NMIs. Nothing claims this
> clock in mainline, so clk_disable_unused() turns it off at boot, and
> probing an RCPU2 PWM afterwards hangs the board. The RCPU2 clock and
> reset registers live in the same block.
>
> Mark it critical, as was done for the K3 RCPU clock.
>
> Tested on a BPI-F3: without this, probing an RCPU2 PWM hangs the
> board; with it, no hang, also with no PWM in use.
>
> Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>

[Severity: Low]
Since this fixes a hardware hang when clk_disable_unused() gates
pll1_aud_245p7, should this include a Fixes tag?

  Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 So=
C")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117205951.1401=
46-1-frederic.mahe@cirad.fr?part=3D2
