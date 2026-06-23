Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53D346E72;
	Tue, 23 Jun 2026 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216348; cv=none; b=knsrsLquhlVmxkuaDRLGHGHEJq8m0dPv8XCwr2GVeNWNN9TRbCjcJlY8zOp8xKEytTxncq1sI1uR0o9DJHhDZ7thxNSwD+w97V1uhyBAjkwgyXVbvnm6O/7M/4ucDOhyKeyQ0zwJtcUqL37AubpP670NipTlNmLjQDzZBuli2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216348; c=relaxed/simple;
	bh=6lbg6AaqtKEutDs0eSpPEvNPjxYMi2g/xgsvJmXmS2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyFQQ9j11kO/Tpnjc6Cv+YVmB8KY0Tn7VW6zVcQJ8ff79USJHxbOQldp5gVeoPL216kpzo2NVGixU/88BVFlwRqTxrUUTSPNRTeoLLsH7goHR0Y/nyuiK/8iWyW+nAh0cj5e1C/3kD8RwOC6dabpDz2DeqZrcGdV8oaVEBDLh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Z0YHtJuX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Z0YHtJuX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=o4EIKtwqCpFYeGsPVo3VJsOw6XGIUVKYtVjsD1vfNPQ=; b=Z0YHtJuX+qACxhtxk/vftzSUaj
	UM8/L5b4xqfa+3aSxlqpgzQR+QksSUSpU7fUaq6S5lZ792SCoCSrR7qzTzXvkN5Mk5ztsrIs/49Px
	Juse7vo4GKfIVzsnuZM0bw9MWr81n9/g8snHTryED/kL8S3YxgywuZnhGzzV59kjUPRcSdCzRl/Zz
	srQznHQSyF4zFReqMKdMG/lMYgaMVCZW/O7wDj0Kb5MX3SMGeZa2n3/L9gpCQJiJ4OGAP41jC4OL0
	DYlxg6sHZUwjzr0Ptr8PbEwr3EqSEa/iohWG57J73D1ByMb1xNUjibdGfSrbLC+NdTfmG4Fz4kz/3
	QMML1KOQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniele Briguglio <hello@superkali.me>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject:
 Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK
 output to IO
Date: Tue, 23 Jun 2026 14:05:15 +0200
Message-ID: <2100447.PIDvDuAF1L@diego>
In-Reply-To: <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com>
References:
 <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Diederick,

Am Dienstag, 23. Juni 2026, 13:10:49 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
> [Resending it against v4 which wasn't present in my INBOX, but was the
> version accepted and used in my kernel]
>=20
> On Tue Jun 23, 2026 at 1:08 PM CEST, Daniele Briguglio wrote:
> > The I2S MCLK outputs on RK3588 are gated by bits in the SYS_GRF
> > register SOC_CON6 (offset 0x318). These gates control whether the
> > internal CRU MCLK signals reach the external IO pins connected to
> > audio codecs.
> >
> > The kernel should explicitly manage these gates so that audio
> > functionality does not depend on bootloader register state. This is
> > analogous to what was done for RK3576 SAI MCLK outputs [1].
> >
> > Register the SYS_GRF as an auxiliary GRF with grf_type_sys using
> > rockchip_clk_add_grf(), and add GATE_GRF entries for all four I2S
> > MCLK output gates:
> >
> >   - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
> >   - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
> >   - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
> >   - I2S3_2CH_MCLKOUT_TO_IO (bit 7)
> >
> > Board DTS files that need MCLK on an IO pin can reference these
> > clocks, e.g.:
> >
> >     clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> >
> > Tested on the Youyeetoo YY3588 (RK3588) with an ES8388 codec on I2S0.
>=20
> Doesn't this break audio on a lot of RK3588 based boards?
> I have a kernel with this patch set and since then analog audio on my Nan=
oPC-T6
> LTS and my WIP NanoPC-T6 Plus stopped working.
> Until I did s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ in my dts[i] files.
>=20
> And I wouldn't be surprised if the same thing applies to other RK3588 bas=
ed
> boards? The same dtb file with a 7.1 kernel, without this patch set, work=
s.

can you check if adding CLK_IGNORE_UNUSED [0] changes the situation for you?

What I assume is happening is that when the clocks were not declared they w=
ere
just left running, while now the kernel turns of unused (but defined) clock=
s.


[0] example in
https://elixir.bootlin.com/linux/v7.1.1/source/drivers/clk/rockchip/clk-rk3=
588.c#L865



