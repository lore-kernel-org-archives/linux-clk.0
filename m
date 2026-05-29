Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA96435C1A0;
	Fri, 29 May 2026 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780019386; cv=none; b=rYyWaXPuDg5NxQWnxanLl1zTNzV++loCWFcOkpyg98Yrtv1Y4CxYcc7QcaDsltzC3KTBzAlCDaFJrskRbj9bzoamVZbFlGk5kO3zzHNK84F2i4SfeaQx7+2MrsmCOgGfFPoVs/7wxZOkw6dnSSJKi6LZPIyZEhUSognG6mlLve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780019386; c=relaxed/simple;
	bh=/Hm339YY1NBNrlxSZRqBh9+cwhWlhCXjp+FB6+mfDWI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CIa7PjQyfFaZkX9LCk0hO8jx6A/oX2ohHFYWLyldnaqWsCd2W5ULskxIoDsyRYbjUlXI9NXhK+YsMZ3I6Eu5CsF+9JIpl58F6MG75MLN1iSwmbq+3+TcGiWMeXzOj9K8naBmj8Pz0gZwCpDGpuMFfe5FLV1n2gGcpWZ2mRc2Iss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8sUVeXi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8sUVeXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDB21F000E9;
	Fri, 29 May 2026 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780019384;
	bh=NDf8WJ5RMsJvsFHEl2hdSqU4QFSQBD8/mg75gI27P+0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=R8sUVeXiscfgYo+CT7jAzDh0UPG/qgeOp5/HFXi5suIspV6+lkmUb93d88dyOKkTo
	 rP7QSZ4D60IXpmH4hAkFlbWML8K0qJMXKCNila9Ti2wSywnWykqIGNf3shFRdUnGZQ
	 pzvn3JARojjQZxyM/N7xbCulyKg9TR/BX0PPWse3DtHg1zoehxao6bRefeJbHGjelZ
	 4ye+JR5M7qsJpdpo4+hN7xLd4lNRZFTM5k+YQm37tPmegiRL0XHNpDLKWavfvPhy6t
	 FJ9HQFCFFQRKW8L8Nyxq/aCjlvhIaiY+/HVxMSce1+07GRnOFZtfSQJPqkIzxln9ya
	 c4OQXL6NOV9Ug==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1779185560.git.geert+renesas@glider.be>
References: <cover.1779185560.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 28 May 2026 18:49:42 -0700
Message-ID: <178001938270.5961.12483564213462401204@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-05-19 03:36:18)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.2-tag1
>=20
> for you to fetch changes up to 4f42053949324867dc40d67829f18a01539e6322:
>=20
>   clk: renesas: r8a73a4: Add ZT/ZTR trace clocks (2026-05-15 11:30:51 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
