Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3E35CB81
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525801; cv=pass; b=h9RQt9tEd8idHksd9MqLw5napCYkI74W86jMzUs12chpmA7PYwhN52lCzwjQDnAI4ouf4GFqDakReRqsVNafpr42n2E0A6jVrGDAeU96IQBcUYx1RqL+eNs3icSxS2+UFFELaNh4ZV+SkT2Ukt9ytEt7ZprEmKcg6faKcaKYZvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525801; c=relaxed/simple;
	bh=K5D44knLTrOhtj/OI+qMe0vr7jncUSszg0HQNob44sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ie/bhNigS8UEvwMNWB7CEoQW37wh1zdbQHun0ZiseuV2zYjJR7z25hZNtOgLa1cI/C9S91599DoJ60VdCcuhnDz7v1VmojpzR0ed8q41vvvu6i0PUffCUv7J5piWyDn0qtgJGtOvO/voBhhBZQjSUHMuP2noER1oNWvdfls1Vxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UyUsH77Z; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UyUsH77Z"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769525779;
 b=i5Vs3t3u8FD45c7DiIRA4ktXg6fFgQJs3QQJlY5UH+92jzHFVqbBhHq9O0lsBzIM7ejj3rf0
 9Rxj1JUpTqrsK9gdprPyq0CSAE03OZO3QKe8z81rK7JzNhzaphgpiuFWt2nEUWLfzTa1eT0kZxW
 cPTi1+3peGhhfZ4h8ecmLmSkcGh8Q4rdTwHgqev1DfJ1XzPM5JFmgWwXteEjtbviQRyx/YTQ0n7
 zRCVCuPwlysh6KbvgXzVZOeBm4P0dSkGbVCQ8CcrfP8ZFRpD8Th09+enWeke3BlR3kC+6MligLr
 Fv8xL7q3yz2h7F/E89CyoUzgEWkRIGOKTK7wZpOcT7XGw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769525779;
 b=pHaxbErRIoncCyM1i9FTbgBN0bSLqB2gl/NLQKGOp9NCRPXrEBy6z+ZVqJ2TaFfVU3GETEpQ
 mjKOTBI3uYeBpobO3re9v0HmSLTxdwaZ6CzHDHfgGBimJnTu1Jlygt0lAS2XQv6xrjU3Fmcs3Y6
 PTq0NwuViUCQx8MnMPq17RzZhAhwsDAdJvkSt/GXfHLC+6IX12tog2nbLAoTMYipYILx28MTONp
 IuSWz1aYEVeKtaqI9GzCqMSCeQ4EK7B8NqgA7Pb1N6MOrVQpSxb3IzoLI8AWpT6bbnwKgUhFEAP
 msX0ikGZHvhvuKDMe/SXq7Q98fQlJitXruL7bzwe3br1Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 27 Jan 2026 15:56:18 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9FBF6CC0A1D;
	Tue, 27 Jan 2026 15:56:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E__R=2E__A=2E?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject:
 Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Tue, 27 Jan 2026 15:55:29 +0100
Message-ID: <6239343.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <176913273374.4027.10690199843699119944@lazor>
References:
 <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
 <176913273374.4027.10690199843699119944@lazor>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f0pPf56qSz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:488e984b4919a202955d5ac62586d299
X-cloud-security:scantime:1.885
DKIM-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769525778; v=1;
 b=UyUsH77ZOqLIgnG9R1gR+V41xsvOksmsQWnyBPqUWfI1GOLXOPeEBnKDaXqYp5mTbxZN8waz
 v8Bc0SSAB3Gs1TI144JYfDd2NHkKShxOtgQHukhMjEjo8mIztNqoDvlmu05JoCTAr4PsueNxd30
 +w3UztCTM/MZWuqZffkA2NGUyduXUw9reLJb7PytIeMnF2RSnd6FmTHB3k26hVF7/F60Qsz6KKb
 YrGwnTu0IYADUMhMIjTpTwAAsZefNfkumqUgKQSUvR5v1Q97zKestkq2YB0J0ogqGoPKbs8JJ1l
 FDNRHAbwJB/jxiMAooifoFYl53Gvz7hjkbbDziI3UWWdQ==

Hello,

Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
> >=20
> > Add parent enables/disables where the recalc_rate op is called directly.
> >=20
> > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents =
enable (part 2)")
> > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents =
enable (part 1)")
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
>=20
> Applied to clk-next

Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
Last lines on bootlog (earlycon is necessary)
> [    1.175639] Initialise system trusted keyrings
> [    1.178907] workingset: timestamp_bits=3D42 max_order=3D19 bucket_orde=
r=3D0
> [    1.185822] NFS: Registering the id_resolver key type
> [    1.190295] Key type id_resolver registered
> [    1.194473] Key type id_legacy registered
> [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Registering.=
=2E.
> [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> [    1.274689] Key type asymmetric registered
> [    1.275939] Asymmetric key parser 'x509' registered
> [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 242) [    1.288278] io scheduler mq-deadline registered
> [    1.292840] io scheduler kyber registered
> [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs

Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the problem.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


