Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35558364051
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612228; cv=pass; b=q63DaCL5I/89uRkQEVZO3t5qr9Zc8UNNZ/hKVTmpIl/JjQms7eflpAawNnRt4vAdyPKtzJcNdCYSWicJaLFcJ+jHuFOnU/oziguujAI2s3V08IdXO3u3OVzcd3XBoGvRU6AfkgjOqAlEnIE2b0fQO39YozO/cOb1skV/Qf5MM/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612228; c=relaxed/simple;
	bh=8gIX7OblAwnW0RbeSziylcMgrxsoDkHMTIyiMBiHlgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMIRTwUIDmqDoQFNbldKFjVR1MQlX/YpFTqS1MiwP6JwdSj60AE0XRbjU6Vs61uGZRNhXSEwimiDhWPBzsLqTQh9MsPzdXSVUkDOvSA7pK7VPFqg/uP9548bBDAXHesk039tgDW1Fe97kPXbBGn7kRKPx6g24K9SkGfWDAyZQJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=K4RFU6Lj; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="K4RFU6Lj"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=JCdegKDDMfDXAfXqsR2Uvxu0kBnW9fcc8iY6+4cJYno=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769612179;
 b=YMKvjTGpdEVluEjCQlXlOPvhH3yaCXMYMM/boD6e+clIqI+uZpHyX6VfSkwV9MjSts2tFExZ
 nZMt0lHUNVTB4c6DYqDNEj44EaKAVAZJnR+ShEd+UpgBAYEgz7UhzjFbtRKX5PSH/Ju9OqCgeKm
 TUUJ7IfPphdVuOaBIS9HfjfUFJQ5F3KHZ/JjBaaJE4q5eSpdMKRb5J1kNRp6uRq1AJC/D225zmj
 lZ9lOoXLMiKMC8LtwgWOe1sVW72/ohXiGkjqIEXf/cTLfHGXhuDtVk0pp3ud+mI3gS6egMCcBHj
 Xmf0fS6dLaIYUs9cQAI003MRFP/h1g2tMQEtIBFXQsDLQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769612179;
 b=coKwZTtNnfBQk9UsqsRF8A4qyVYE4hLRUwluJfFeUyZylGUD+MNecvPKegwsQc2XC80LSZQV
 A/unS2EZH0tnlq0cLc/+ZcHAt1cXMG9UTsz2UXg9Ioq9Ty2hk2Wrwv54uBQhwPoivD0LNp2mIpB
 yEk4qPxSz8hF1qe/5y8TxHe3zJ0T08V2WPKnt7dTU+UOe3ZsOz+LlGR7KUWP78nwTLcp/hPR58c
 sBmVdUMK1um8I2Wmw0fqcE6fh2pUIXVO1STQX2dHYOQ8wfO4pf/85v+/BZsO6GxzpityjsbEH1L
 fn7d38G/3n5y87L4WCCBPs2gMe61b4hda7IQywm7ji7nQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 28 Jan 2026 15:56:19 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 63D9FCC0E8A;
	Wed, 28 Jan 2026 15:56:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E__R=2E__A=2E?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 15:55:27 +0100
Message-ID: <2403222.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5791016.31r3eYUQgx@workhorse>
References:
 <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <6239343.lOV4Wx5bFT@steina-w> <5791016.31r3eYUQgx@workhorse>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4f1QM92RwJz4MM95
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:35114e83581fa19bd9a5fa78e3850a51
X-cloud-security:scantime:2.290
DKIM-Signature: a=rsa-sha256;
 bh=JCdegKDDMfDXAfXqsR2Uvxu0kBnW9fcc8iY6+4cJYno=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769612178; v=1;
 b=K4RFU6LjfIK/z7PB6lRmMSfCsDpheaXps4UsX++rO/mVbqfw97XYDCRk7A3ZkTWwuSg4+5/O
 9pJkpuXWVXNRVKqge4qBlr/cjYjuqkOu8hZrnh3v/NcmFV7Vy36HjZa3dL4+VD6x88lhLgOSkQa
 ldzECdYOqR3z9g6YCmgrsdhulLD1cpKtnlvwQWdWtRO5SU4B3TgvQzAVi0beKvAYZbJ0kOtvWFZ
 i4fvPVUYu8K7TAWab3ruhtNk1FotSmbdVAvyAbjsv9i4vbX6J7Jxk9AJNWKsO5Du1SJwsvvlvey
 re2gzCb3X9Ni0418wSET3tzyB5t74Qiq+XObpeZnY07Hw==

Hi Nicolas,

Am Mittwoch, 28. Januar 2026, 15:11:33 CET schrieb Nicolas Frattaroli:
> On Tuesday, 27 January 2026 15:55:29 Central European Standard Time Alexa=
nder Stein wrote:
> > Hello,
> >=20
> > Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> > > Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > > operations, such as setting the rate or switching parents. However,
> > > > another operation that can and often does touch actual hardware sta=
te is
> > > > recalc_rate, which may also be affected by such a dependency.
> > > >=20
> > > > Add parent enables/disables where the recalc_rate op is called dire=
ctly.
> > > >=20
> > > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires pare=
nts enable (part 2)")
> > > > Fixes: a4b3518d146f ("clk: core: support clocks which requires pare=
nts enable (part 1)")
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > > ---
> > >=20
> > > Applied to clk-next
> >=20
> > Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
> > Last lines on bootlog (earlycon is necessary)
> > > [    1.175639] Initialise system trusted keyrings
> > > [    1.178907] workingset: timestamp_bits=3D42 max_order=3D19 bucket_=
order=3D0
> > > [    1.185822] NFS: Registering the id_resolver key type
> > > [    1.190295] Key type id_resolver registered
> > > [    1.194473] Key type id_legacy registered
> > > [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Register=
ing...
> > > [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> > > Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> > > [    1.274689] Key type asymmetric registered
> > > [    1.275939] Asymmetric key parser 'x509' registered
> > > [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 load=
ed
> > > (major 242) [    1.288278] io scheduler mq-deadline registered
> > > [    1.292840] io scheduler kyber registered
> > > [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs
> >=20
> > Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the pro=
blem.
>=20
> Hi Alexander,
>=20
> sorry for breaking -next.
>=20
> Can you try the following patch to print which clock+parent is causing
> the hang on your platform?
>=20
> ---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1b0f9d567f48..fa1443517768 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,13 +1921,21 @@ static unsigned long clk_recalc(struct clk_core *=
core,
>  	unsigned long rate =3D parent_rate;
> =20
>  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> -		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +			pr_info("%s: enabling parent %s for %s\n", __func__,
> +				core->parent ? core->parent->name : "(null)",
> +				core->name);
>  			clk_core_prepare_enable(core->parent);
> +		}
> =20
>  		rate =3D core->ops->recalc_rate(core->hw, parent_rate);
> =20
> -		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +			pr_info("%s: disabling parent %s for %s\n", __func__,
> +				core->parent ? core->parent->name : "(null)",
> +				core->name);
>  			clk_core_disable_unprepare(core->parent);
> +		}
> =20
>  		clk_pm_runtime_put(core);
>  	}
> @@ -4038,8 +4046,12 @@ static int __clk_core_init(struct clk_core *core)
>  	 */
>  	clk_core_update_duty_cycle_nolock(core);
> =20
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +		pr_info("%s: enabling parent %s for %s\n", __func__,
> +			core->parent ? core->parent->name : "(null)",
> +			core->name);
>  		clk_core_prepare_enable(core->parent);
> +	}
> =20
>  	/*
>  	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
> @@ -4056,8 +4068,12 @@ static int __clk_core_init(struct clk_core *core)
>  		rate =3D 0;
>  	core->rate =3D core->req_rate =3D rate;
> =20
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +		pr_info("%s: disabling parent %s for %s\n", __func__,
> +			core->parent ? core->parent->name : "(null)",
> +			core->name);
>  		clk_core_disable_unprepare(core->parent);
> +	}
> =20
>  	/*
>  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> ---
>=20
> Thanks for reporting this.

thanks for the debugging patch. I'll respond to the other thread where
Mark is active as well.

Best regards,
Alexander

> Kind regards,
> Nicolas Frattaroli
>=20
> >=20
> > Best regards,
> > Alexander
> >=20
>=20
>=20
>=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


