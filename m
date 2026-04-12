Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9B286D5D;
	Sun, 12 Apr 2026 00:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954271; cv=none; b=s4VylTxeNU3Vu3m93aQcralgdefiTyfqvdbF+tmxM8zLJ4vWga+7d0MNRvMrMPT6rMbbBiHd2cMTr+EbwxUaCFkqEONf9AeFzdEpRdcEZxJPs4q0env/UkSwRTphdAXYefR92ejLyM7r/9nuWr8B++NhRzKPpVO0Z5ecsuOvEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954271; c=relaxed/simple;
	bh=PdcIosiJDA2sS1NbSleStad0hAsL0HIJrvjMgjXuH+k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RBzusP3i6xTxY/TY1ft3tHebnQ55RpCRl820ke4X72DUdLcmKe86X3GSgogq4hYHPIHZLs3rBxmm1lVUgMJEYK+eOcqKmhdBTl0PSwte0/iRpuhJi5g9+nouJmrFuL4Xy5FxdyMqS/oNe9RWp4bKPUZ5ox6sSUbMC1YdqbvWay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/nqcPXv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/nqcPXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DB1C116C6;
	Sun, 12 Apr 2026 00:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775954271;
	bh=PdcIosiJDA2sS1NbSleStad0hAsL0HIJrvjMgjXuH+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B/nqcPXv84judwDORYiL7bOAJTQhg0f/YJOkRyloQXLuk2vFI2TD6aii77liJBfPq
	 fygPmZUhVDmb2RT++gKg9SDMMxfqVEQYyQRRFbx/7DPmIvaJiDkMVIH/N7S+Ik9cvh
	 umm6F8B8NYZ4/uUWYbTpEM8ZEhvfiDkbZos8vLb/mCd5HHyWC44N/Me7YB8ZgsRQJA
	 7rWjTNWojCHnhxlWvNrxuLRhpXyMKroeYVI0/ImQLO7Ou8QiqPqG/5hfnCLiZqF6ob
	 0vKsoL8axqac6O4D2mmmRYsWrDw238mo9hK3Usu5WZwH87P9UaKyJFIIYxxjY5xasx
	 xQ+c7J6lqIODw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409002952.319668-6-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com> <20260409002952.319668-6-marex@nabladev.com>
Subject: Re: [PATCH v6 6/6] clk: fsl-sai: Add MCLK generation support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, Michael Walle <mwalle@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marex@nabladev.com>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 17:37:49 -0700
Message-ID: <177595426925.5403.12044764762847365451@lazor>
User-Agent: alot/0.12

Quoting Marek Vasut (2026-04-08 17:29:06)
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells =3D <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells =3D <0>, the driver behaves as before, i.e.
> always returns BCLK.
>=20
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
>=20
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
>=20
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
>=20
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Applied to clk-next
