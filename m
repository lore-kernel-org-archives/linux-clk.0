Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC196348860;
	Sat, 13 Jun 2026 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391305; cv=none; b=C1FJzP+EAhsbR7LxDvKLSGou34DNGS3rEWNaF63wUAEbunCFXcMrsz3z31FKPYHBCc9wLGl8+XYrs2P1ZbMVaz42HDpFxhxOj1MQOjl9fpHrEMivh/bL1BMhfOsHa3/UA+sWm66pWV65mNmS3JPfw1A1u/kIyuosFlpzDNn5JdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391305; c=relaxed/simple;
	bh=9AeznTkORLN6XW9vuJmDhO7OWaAaBqLg4kr78TEv9tc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XSKaOUYMPIyPyyNrqlrZ3VIWHLXbM7s2UrsCEeW2ZqnloItp3VJpPpErOzgXlLsEVIDA3F10T2g26GRkesFdMAPUZZ3BT20F/BKeTPpBkgAugbO8YQ8PMZGXhoESirCa2UEZstUgILNbEZShTBID7sI4YWubESEWdnQ9voQInMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD3qfZaY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD3qfZaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662951F000E9;
	Sat, 13 Jun 2026 22:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391304;
	bh=n2FhzrzvdqAzy0gU8lhh7x/LXxPE1LPhGr06xqqGpPo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=FD3qfZaYPeCDOtbqEM7kkl0l2E2nrpDxQyEo8fzwz2OQqK3STca9WA3GRYiPuHpbL
	 TolfMJthikoK1qNdzYPYNL+ovmsLgD4B4OCOKOQVv2uDfRfj5DnxiENnELpCbCod/f
	 AseFfzPW1lz9OTfT1kj+oBCF2D/LI+toNZfC9kfro8kMIcmeusdw+bvUDS/6ODeoUW
	 +vwL4X3KLHgonvXjFaqF8ft3eKw7cksN7gkcaSPP4dmBg/R+uZdGf6QWM0tjhzBrvG
	 bN8ZJU+ypUkgrgVcJcVmZsowpRyL4rF0lddUYlnMjaPvbqoziyxjwQctji3FHNJ1Hf
	 Cb9Xp9ESkJtow==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260604030907.dhppbxwyfnnoeitz@dumpling>
References: <20260604030907.dhppbxwyfnnoeitz@dumpling>
Subject: Re: [GIT PULL] clk: ti: sci: TI updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>
Date: Sat, 13 Jun 2026 14:51:50 -0700
Message-ID: <178138751088.819343.10697672744094606693@localhost.localdomain>
User-Agent: alot/0.12

Quoting Nishanth Menon (2026-06-03 20:09:07)
> Hi Stephen, Mike,
>=20
> We have a couple of minor patches lying around for some time that
> was'nt getting in, so took advice Brian made.. Here is the PR.
> I have cross checked this on top of next-20260602, applies clean,
> passes the build static checks and functions on all the TI K3
> platforms I have access to. Thanks in advance for pulling..
>=20
> Please Pull:
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-sci-clk-for-v7.2
>=20
> for you to fetch changes up to 2b0123e4a9257fa2933d13d1bca9ac36467efac1:
>=20
>   clk: keystone: sci-clk: fix application of sizeof to pointer (2026-06-0=
3 21:46:01 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
