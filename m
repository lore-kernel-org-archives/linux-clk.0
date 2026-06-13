Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA139891D
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391307; cv=none; b=GPl1q996hFb4/P2UKwKYT5hVig1iyYzUhyB+NRN12E41YxEEcB+8tQrAr2c6Nt38b7ca/igHHomZpTXSqVuFvgrNmkTZo+1qq506SLpWvHUN63u6cgdcu4ZU+v5DtRLdyqXO5+SmZX7n2xQqPqaBKggkBO5qfLRtMNRLIpc7EqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391307; c=relaxed/simple;
	bh=TS+o1vSkqOBwyg9G2qb8kO7GHNogDPzM+OpeV+cIve8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=biCmycNpklJ9PF1CVQWt2IPrT25qvxnVUsCXnasjM1tq8f8RP4Okea6yEjJvM4SdBsYNCX2yH6OkpqHttCdIU6ko++gRwxZBShWQUD5lvMU2B0hDzwNGxYUKwMtjYvX7Vp9wsz2FJd4yvROMoeERxjQFKEhiq/gCumSOYoYvuaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9ip4fg5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9ip4fg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9141F000E9;
	Sat, 13 Jun 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391306;
	bh=BwqEUqZIHCYcI0ej/IpaqwrOyHSHksQI9CW0b3RsNBk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=R9ip4fg5VJR0IjDbCnnUMEoD9vvZtiSc64E4KxTCZYSBjeALgV8VVi7Ul6LXo0N6I
	 DZc/L4r3PCNIduUqXCLG+63el+4olLumLBiUI/+U2LAoMF6Z3bhM/EJj6MkHFoNENc
	 NPtfHbtkCNZneHrj5o6vJZxs5XZYZOjDv9itDowhEIjXQ442kvzaklykCwG2jvk2Kz
	 UxY+a0a7IT+1suvVzE1leYOP0dmEvxEZ3vQZet5qVH6auY9vBZIGahDUoqtbwH3IIm
	 OV14oTXkYTcO7q8ero/Xf1mBSvZodLaKz6YgU7MvqjcbqtxNK0xAUIURUlMqpnvqqF
	 l45olQejkmYZQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260602-latitude-unroasted-d88074ae2ebc@spud>
References: <20260602-latitude-unroasted-d88074ae2ebc@spud>
Subject: Re: [GIT PULL] canaan clk changes for 7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, conor@kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>, Xukai Wang <kingxukai@zohomail.com>, linux-riscv@lists.infradead.org
To: Conor Dooley <conor@kernel.org>
Date: Sat, 13 Jun 2026 14:52:11 -0700
Message-ID: <178138753189.819343.1420937117273276704@localhost.localdomain>
User-Agent: alot/0.12

Quoting Conor Dooley (2026-06-02 02:09:42)
> Hey Stephen,
>=20
> Please pull the addition of a new driver for the Canaan k230 SoC.
>=20
> It's been on the list for quite a while, with minimal feedback received
> on recent versions, so I figured I'd grab it and send a PR so that I can
> merge the rest of the SoC support for 7.2. It's been in linux-next for
> about two weeks with no issues that I am aware of.
>=20
> Thanks,
> Conor.
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-ca=
naan-7.2
>=20
> for you to fetch changes up to a7b7c7c6c01679efef0fd2f2ca1c5114f303e4f5:
>=20
>   clk: canaan: Add clock driver for Canaan K230 (2026-05-22 17:13:10 +010=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
