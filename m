Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DC3988EB
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391314; cv=none; b=NqBq9uI7nuoOu/T5RYv2ue7C/fI4MEXahv2BeXfiFjCL2f2QsZyEK8OHavAbnDeFX716hQbuTvUvxWT7FoCIXBGYmcNSNj6nnEt0nl25AzlMw6YmxE988Vx+VRoIro1jYPGS5CTAyLXNAzIeLFsd8CIyL/ewRTaDZlhT+MRaoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391314; c=relaxed/simple;
	bh=mEoqaFjwsvgzZQCj+Qzhz51D26Vry36FvXQlxIxbkDk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DcHXyAzAsH6oucEUURjnV3GE2z5FBXxRf9Pj3cOOue3Kh2ZRz0fKkvSu8Q9X2u151AxEU4dE2jymX4hv5qia74qQaTYS6t2sFDui3Pd89fx9pUjg9x9ONvjnQceFgzBVvFNVsHdVD0DDupJJ/Ovfsfv2Yxu45d3mZqgOz6aypTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGuO6ocO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGuO6ocO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBA91F000E9;
	Sat, 13 Jun 2026 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391313;
	bh=p4pP18fOAc+1/Sq6SOACvynFlZ1J+CXI3eRbYDQCw54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=eGuO6ocOUeYdmPyOssoRxbU3mad9NowcVNx5QJOSv1zYdr9E2XyeYfOySxbJFIimT
	 5YNCfqpzunYeaE/FB2+oq2RnZhraHAOcuwKlrha9yrlv6U6KvwvVCocIdlYx/axZHf
	 b3CWA1KfFSF6kQzEgjyElCmoa/WsSWwK9AyQKEHI5nhSQuTp93dCtiVXjWKSyjmAzK
	 oICLKUNXBMnQJsEcZcBmQMHUlatTPCzLHkS4MeMd8FSQgTSnhHdvpGAIi8SG6xCDfP
	 9/SsoO37Zzl394egy+GpvVcpX/gGPT2QHIIIkQDdO/22F77acFdRYCXiHzGFj5rbll
	 T/IK/ftGKrkOg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609074302.814617-1-claudiu.beznea@tuxon.dev>
References: <20260609074302.814617-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Sat, 13 Jun 2026 14:58:33 -0700
Message-ID: <178138791350.819343.6521312957120113501@localhost.localdomain>
User-Agent: alot/0.12

Quoting Claudiu Beznea (2026-06-09 00:43:02)
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-7.2
>=20
> for you to fetch changes up to 871cb269cd43b5d90f4e59d1458f8c09204759d4:
>=20
>   clk: at91: sama7d65: add peripheral clock for I3C (2026-05-25 22:53:10 =
+0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
