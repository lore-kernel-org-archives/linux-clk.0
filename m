Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86937372B30
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670906; cv=pass; b=MXtuIErkqMRwovlCwu4z1wWYfhWdEPOC9ZPelamVBuhoRLIex/Oh1SeKBipcpZ+qVFPLPIRSK90/oKmMwkGVDmnVDp9Lxa9gC9mYaKR6h3pt23cePWcqMq1nzUQbubK55c3nzBzs3vOatNmK7RHrFuXI7b1ksYRwWMJJNrVcBRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670906; c=relaxed/simple;
	bh=krVsIGyFSy81p8naF8azvPw/6lhfe/mjHtmVK3Ej4Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVNOHm9cokg41ijqDn3kjKdeeb4uRu1y5qh2v/7+a0P/n+jhUYb0NFmq6cGzmv0YFSHDVfdTdmhZ39e9ni6IYyEvkR5nOsnFucXoADesh0VlRc8Hzdv8qrw14KW9pPQ8x70vZymmsj2pB1L7xryrG/NZLco3x3Hzr2WXOEahVBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=V073e0xj; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="V073e0xj"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HC5tOqcEOO2h2Sdyxk8M1xH/nqYlQmmp4owBkWQ4MQo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769670841;
 b=W5gCEislpDUyoNmLy+5x1omua+nRNoO+sKrw1CXFwrxSSENdtqt5BFR2dsswJDKucz77Geok
 ktXvcU6Lf6A9S1cblB+c8NKzAkA55yCwYuZTfTqpirnF/nnwtlYZZqLM3TiSxgfL2dp5qjEjHgK
 hHZUNAajZzgVJj/TKgoZqWhbzs0JHqz+5tgmnAfnplr7fs667qDBneLFxoWn/8PlpT/fG4pFSo/
 xBhsOgq3esXDTYRrzqO6p8vC1jNnQ2izPQr09SBfqPOjbQ3nL14etCdxs+LgKOmdPIOx/LQnIg8
 rNnREHQbYGIgUo5N65Pi+GrU6hwCqFDj6mv6VqT/sCQpQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769670841;
 b=ACWZEZnrijKdJX83/I7u2xWv+jX4H4FJnW9SMQXeHUQfkamkZlakdYRr3bPuwQz92LXSQU8K
 MYCh6EVJAvvjsddLOb+SHwFIkN6pqTlKGWJGZvZgY0OyDdbCHlqf7GHpuUhPmnWuv2fI/5ts05q
 FGNEXsURCWkQFNPC4z63XZHFXU+ma6ggleVR/Q5K7egIvAsF/NKC2Mz3PKUxi43ocpS48ARD7yO
 hXletJ5J0/dT/eGSexzXYc1VrESIptph5kazHqbr7xiBSvcmQfYitZy0GaeQa3otip3cN5k9Qio
 lUDRQXcPXrrUDHofQSHoeh/ACq625hRhbE/oSAnD1/amg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 29 Jan 2026 08:14:01 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4DB15A0742;
	Thu, 29 Jan 2026 08:13:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Fix a __clk_core_init parental issue
Date: Thu, 29 Jan 2026 08:13:06 +0100
Message-ID: <2257247.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a4f87b4b-efce-4c8c-a523-69949935a096@sirena.org.uk>
References:
 <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
 <a4f87b4b-efce-4c8c-a523-69949935a096@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f1r3C4Tbbz2nHsK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b08f8c8389cf73d149848fbafa2d3aef
X-cloud-security:scantime:2.067
DKIM-Signature: a=rsa-sha256;
 bh=HC5tOqcEOO2h2Sdyxk8M1xH/nqYlQmmp4owBkWQ4MQo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769670840; v=1;
 b=V073e0xjjmtnBKb21iu548jycMerjTJgnvQjnfxpRpZo0WXxbQ73N+3cIfT+jAz6bBU8rh+W
 0NOTpAXrGK53XSV2eeuB5VD0HF/Gy2NwN3Pu0/oIsrrYE5PPv8iZ5cm/toxB8Q+Lzho+D2luEiP
 s8Rm7F5U/6ETETL2/dJsg8uEd9507/WRTggbU+5+cB6fk1azKxbpRp/JxcJSkyDiJMqd44+1/Fr
 9bFhMOK3Lzp2SaXe/MlTBQViR9NVrmCfYzUvuMqPW61nivgsJcfKHRepvmq4lHGZqQgidmHAutb
 UxNHl4YEcpfbGeTPULESE6F2e6TFH4GD1L4lVik4yKDBQ==

Am Mittwoch, 28. Januar 2026, 21:17:09 CET schrieb Mark Brown:
> On Wed, Jan 28, 2026 at 07:38:49PM +0100, Nicolas Frattaroli wrote:
> > Mark and Alexander, please test to see if these patches resolve the
> > issues on your boards.
> >=20
> > I expect the first patch to completely fix the problem on the Avenger96
> > (STM32MP1) board.
>=20
> This gets further but still fails on Avenger96, looks like we've got
> more clocks need work:
>=20
> [    0.513739] __clk_core_init: enabling parent pll3_q for spi1_k
> [    0.519521] __clk_core_init: disabling parent pll3_q for spi1_k
> [    0.525489] __clk_core_init: enabling parent pll3_q for spi2_k
> [    0.531311] __clk_core_init: disabling parent pll3_q for spi2_k
> [    0.537275] __clk_core_init: enabling parent pll3_q for spi3_k
> [    0.543101] __clk_core_init: disabling parent pll3_q for spi3_k
> [    0.549066] __clk_core_init: enabling parent ck_hsi for spi4_k
> [    0.554894] __clk_core_init: disabling parent ck=EF=BF=BD
> U-Boot SPL 2023.07.02-dh-stm32mp1-dhcor-avenger96-20230727.02 (Jul 11 202=
3 - 15:20:44 +0000)
>=20
>    https://lava.sirena.org.uk/scheduler/job/2413747#L593
>=20

I also got more clocks in the list, but it still hangs eventually:
[    1.453206] __clk_core_init: enabling parent audio_pll1_out for clkout1_=
sel
[    1.458095] __clk_core_init: disabling parent audio_pll1_out for clkout1=
_sel
[    1.464684] __clk_core_init: enabling parent audio_pll1_out for clkout2_=
sel
[    1.472174] __clk_core_init: disabling parent audio_pll1_out for clkout2=
_sel
[    1.478784] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_d=
iv
[    1.485679] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_=
div
[    1.492675] __clk_core_init: enabling parent sys_pll2_200m for m7_core
[    1.499233] __clk_core_init: disabling parent sys_pll2_200m for m7_core
[    1.505888] __clk_core_init: enabling parent osc_24m for ml_core
[    1.511924] __clk_core_init: disabling parent osc_24m for ml_core
[    1.518050] __clk_core_init: enabling parent osc_24m for gpu3d_core
[    1.524344] __clk_core_init: disabling parent osc_24m for gpu3d_core
[    1.530738] __clk_core_init: enabling parent osc_24m for gpu3d_shader_co=
re
[    1.537646] __clk_core_init: disabling parent osc_24m for gpu3d_shader_c=
ore
[    1.544655] __clk_core_init: enabling parent osc_24m for gpu2d_core
[    1.550945] __clk_core_init: disabling parent osc_24m for gpu2d_core
[    1.557341] __clk_core_init: enabling parent osc_24m for audio_axi
[    1.563551] __clk_core_init: disabling parent osc_24m for audio_axi
[    1.569863] __clk_core_init: enabling parent sys_pll1_800m for hsio_axi
[    1.576507] __clk_core_init: disabling parent sys_pll1_800m for hsio_axi

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


