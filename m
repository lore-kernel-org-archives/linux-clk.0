Received: from mx-relay49-hz1.antispameurope.com (mx-relay49-hz1.antispameurope.com [94.100.132.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED33644BC
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.225
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612291; cv=pass; b=CdAoQbBrI85CMcH9EHocNWnMlhIgY8h6rv0AP8wEfaIDhoWjCdiA3j4Xvfs652RARsJXes6sirQSq/CY708ay4ACJt5tZkwgKf8lys13i9JWsD1dqsc4lX3JMRfbErgwZiEgr03UhijgenaVirXSVG0bahANDwt6bB9C6bqLm+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612291; c=relaxed/simple;
	bh=YBAIi7V/c3JHaAKdykP4Yq2lWyyXCj0OGyBjgzyQLtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTch3nGOMcbllJ42rZEcvUkQdMFOngUg75CX4DZBIEQJ7y76tBdUSPfM9iKkrfZWIB/urNX1Q51F5B4kJtj0enKq+9mHbXqkaU8HFsM/KjvkjIl7MEZjqyRgMnaQ4RBoJvkf7EjE8lMrQraliXjGGF2p+PHVnjX4st637zPaU28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LKErPGXs; arc=pass smtp.client-ip=94.100.132.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LKErPGXs"
ARC-Authentication-Results: i=1; mx-gate49-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ONpXfF3lQToQjK7rRSj7gTOlaNKqcczWPw9kZFHHahw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769612205;
 b=PFVHtB3N5G3e5IaUg7FCA6YDsn8KhI2SdQO1/U8FSjArPoH/o6Y2YlxARQzABGHfhEiOPW5S
 h1CP1hCR6u+R6d/Q7xsoQTSgSExdGZlg/njqsepQrGDZ8GouEQxH9lsclH7HEAATXN3rYg/EGmz
 y5Qd9QHOAh9uuPPC6mwquDCPZ8RW6CDaiQtnCKSo1dlX9//J1M1q92LAUtfhq+tGWedWrCcJV2i
 Cx7tHOA/I1oNP5TnqM2jRKVt19ay0KtM8rgOV1NND66/p9L8CxsqRqnHa/o1O8PS0C0v3N61gmc
 Qg8DehVlu8PkBS6buVtzbGNveieQnFc6+m/8TCVO946iQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769612205;
 b=d4I5YxpFuWU7N9zkb4BVqYnN1A75W/BJFG2e9Ood/4QiLsf5kC0Hw1wFMUlQs5sTK7XEBtbB
 j4gR+UsjtOYAu/evVoE1+QbM156U0uQXK9lfWckH0Jyv5E3afbM4vcX3YbFvu9BxtnpKxPYOpg8
 eOr+4WB3hsSfXYViOlXzNEiqDLgfBYEgxwC+ScUulQBuozOmAN+3Ie71Ex/Eo0qmeN5gMe0bB5H
 upNxK/W+XnULUgs46IOGBxUPhV0avLJR5cL4jRLgMG+LSED+NnkQX0za+2J4eqbAm9utCGQE9Nf
 bmFM6AjzckgfZ7wbej5T7CDEhL/OZsaFwW5SZoEx4zn5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz1.antispameurope.com;
 Wed, 28 Jan 2026 15:56:45 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1625ECC0CB8;
	Wed, 28 Jan 2026 15:56:31 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 15:55:54 +0100
Message-ID: <5050249.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References:
 <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz1.antispameurope.com with 4f1QMg6GcFz28ym5
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3cf64e51d346abca35efec810fea2612
X-cloud-security:scantime:1.873
DKIM-Signature: a=rsa-sha256;
 bh=ONpXfF3lQToQjK7rRSj7gTOlaNKqcczWPw9kZFHHahw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769612205; v=1;
 b=LKErPGXsuTRRg8pE0nqdyBvRrsczNiWbml4LUxgT6iXpy1klbn5/R8UjYWbk2oaO/U0UX+V+
 YWe+chYSsqvchKsegBBOC881KG1sxt3i0ASRZcBt2ihzxjusvmCbQL/qBLkEt4Zcno8YedWPCxv
 SOAPE8iKuzzOHsS696wUfPPYGZslHp7utWu/NwbGDyt8kBartS2vMhk9ydSYpED/YNhrumXNTRv
 +tjRKHvFBYQNgwGopqlAkfQEof4Xf1dpcZBukaVfC4w/KcOogWmcoWkqfvU9EZoL1YFE3cc3qRd
 T/HOKb5vQCCXi+GVpN9X9/EDzzd8Gug+bSFZOx9WhHi2A==

Hi everyone,

Am Mittwoch, 28. Januar 2026, 15:47:08 CET schrieb Mark Brown:
> On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 28 January 2026 00:14:29 Central European Standard Time M=
ark Brown wrote:
>=20
> > > Do you have a debugging patch we could run which would say which cloc=
ks
> > > are impacted?  I guess it's more of an issue for the platforms that g=
ive
> > > no output but for at least Avenger96 I was getting earlycon output.
>=20
> > Try this one
>=20
> For the Avenger96 that says:
>=20
> [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
>=20
> https://lava.sirena.org.uk/scheduler/job/2412562#L563
>=20

This is for TQMa8MPxL/MBa8MPxL:

[    1.452788] __clk_core_init: enabling parent audio_pll1_out for clkout1_=
sel
[    1.457677] __clk_core_init: disabling parent audio_pll1_out for clkout1=
_sel
[    1.464270] __clk_core_init: enabling parent audio_pll1_out for clkout2_=
sel
[    1.471760] __clk_core_init: disabling parent audio_pll1_out for clkout2=
_sel
[    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_d=
iv
[    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_=
div

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


