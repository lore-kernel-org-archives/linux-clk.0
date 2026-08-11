Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB51379C4F;
	Tue, 11 Aug 2026 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472244; cv=none; b=WEimjV5TRzsm2wTjQJKI55PsW/EnjRd0X9ZY4qsXfcAKFbTNZnOKH+xhSX3Kc9SxfVtwkG18INQ9WxamPAQ2aeC9QRp/UanSXiRPLnx87UtUM2r4VnYpSobjb+40ol898mtm5KrCMYc9z0j71q3Od7cWR9wP+TGjttF9CfFuvXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472244; c=relaxed/simple;
	bh=XMPzjAVOoCtYxlfU1GRd2Wmzy54SzTwMK11PIevce7k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dsZ5SpgGotEvGFZHkch22sjBJbuXinsUcHQGYA6fNBA1sgv3mIJgFZRKYXNO/F2syLaBudg0tDSBWlIr/ytu+cPw5RoGiFBt1av+zALGrd1gDFUz7vImidmqBuGd4ECxaWyYGBv1FcvJDktPWUBNVFghdxo4DrHWh+mqAA46KBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3E/H0u0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3E/H0u0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A91C1F000E9;
	Tue, 11 Aug 2026 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472243;
	bh=cq4yAgddgwMxze16Cx7rF1nhbwgu2c0MJTah2bwMsuQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=P3E/H0u0DWRHlz1e/KeGyULPwI0uH3SiPzzpcTV/R4Fnc4loR/S8hPqxlhRR3vaYJ
	 n23WZwN6TcHaTmzAYnm/VmshEvGybrTIoTDGAtHvYHxEofbn3tx4AXWlGafy0PWyEq
	 3/wMWDaNI3QChrfHPKbOt5B68aV2bYQykKIvmDmt7HqiRVeFNID4ZPTG15AJDNX4Zj
	 3rP049JG2dvGr2a0/h5yJhAU8JFPaFSKI2huN7xK2BFy2dWI8RkZhDiL9EkAfOr75d
	 C7+c9ZfbJ67LqD75JXWSxWVpJ4fMChuz9uYzjZaffgsWcBqdD2YQ0sa82OPxiRbXJo
	 mJH4xjTEmhH0g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260706203425-KYC2957292@kernel.org>
References: <20260706203425-KYC2957292@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: fixes for v7.2-1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Tue, 11 Aug 2026 11:17:21 -0700
Message-ID: <178647224123.5862.9538366108280919307@lazor>
User-Agent: alot/0.12

Quoting Yixun Lan (2026-07-06 13:35:51)
> Hi Stephen,
>=20
>    Please pull two small SpacemiT's clock fixes for v7.2
> First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
> reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
> Second patch fixes a system hang due to HDMA clock being shut off.
>    Thank you
>=20
> Yixun Lan
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tag=
s/spacemit-clk-fixes-for-7.2-1
>=20
> for you to fetch changes up to eb525edd48907795c0d4e498ff57ad168070b289:
>=20
>   clk: spacemit: k3: set hdma clock as critical (2026-07-06 19:45:17 +000=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
