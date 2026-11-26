Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686149;
	b=F1qQPnjQgxVTzS/80OJAJHUz0Qj9TsoErzpr6lXI42fdxvXXfvo77JlPDrbqUT5tZUBK
	 TfnQuw0bXNwlFN7QMfLnmbiUOFDOKQWaSlQOj3daoSbrws2Sf/P2vcOGhJCiaGUUseNeg
	 CIzg9cNNRu+LFQdZgjGF8LnQh2JUtW2yjbncg9mrL0yvsILNuhUQpWnEBLOuHXMkaXF3N
	 YGdaNooIRXYLumR2woiNjCpGTGC/pQB4V6FV0K1HC5YZ018hrrwj+l3BMMu9tgHQcQvwf
	 UxhaRF2+2G+Dm8eCMsXeT3vp6zKdCAi/m5KazKEmyi+DTMrPKYuFDXoQ8ITUcZlH3Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686149;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0rasQBT9o9rNgelEjBt6NiFeFY0ARPWtWWDxp9ttzOs=;
	b=WCha4FALiJZzRE5MLFbzPCq1xzYqpq+UqAN/ZgSIy/SZBNwVVCAwyyLFOGNcv3JGGGt8
	 32lAJUtfGn5f2IvP1AF1lzzPytQUZZbv9wnZfYurLUirSOrmyQEQU55P18LvOJ0pllA/a
	 9xCfBY7Edp8A/GVOwVCrOYOEaFzfwQPJX9o9i+KxevhHB9j/6GwJEEHuvvYD6h6A1Lm9q
	 mLXtBjz2mbqK2v2m0wjt8CBz45aSiodXdeZppo1ZqrXAd6D8zdbKD318yxREPv+6wUwyw
	 Wmp6ToOeVA5NAcmqw2wKwXZQNkLiRdaUVyUDQCKSO/ayHNaVVxn/lXgPJCCH6xOMwJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Asqz6pu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD48606A31E;
	Thu, 26 Nov 2026 09:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Asqz6pu2
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 40F742007F9;
	Thu, 26 Nov 2026 10:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795686146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rasQBT9o9rNgelEjBt6NiFeFY0ARPWtWWDxp9ttzOs=;
	b=Asqz6pu2/htdPlCLCe92qDIaPszxnIFVFcQepq6D9vq5LmgwYn1IRb6sjDdVHnjNvXT4Th
	4lxEa867dru0441J2QWYEvaKk/Ch/FOXqrN6g6W/d3UvInXSDOvXS/7HhPVn9AAR35UVYK
	pcPhjAsiknUAAzNtKGA883fjrowMB2TS5ZhvWj8m8jecPVAmC8HXaz6tb0dFDsPYVgjPOy
	UBFpgivf/OROj0xwYnHyzMz7sHC4qJEIM1X5XoTI2W3rRK/YESkPMqKYJSS96BCwlfreTb
	NL5e57B+wabDNeS81Vmwnq9gXD8TJyathwJuGrcfl0YDwjfw04mV5sFhFEQa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795686146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rasQBT9o9rNgelEjBt6NiFeFY0ARPWtWWDxp9ttzOs=;
	b=SpcukA+S47QnkuyenAPZyURmkrFLcNezRlbMAASnzrLfBkBLysKnDrdYU3ORQih3OTPcGq
	pS8ZcvCgyLNF5aYNNe1SExujbjVaXuxW8L/vxQKc+9Ze7WTHHoRNRsEV1p/GJB7f3uey+5
	r5XDOO576Sqe/9e3Urb+dhK6NZNtdjAWRyF16/GjT35pCrSGUOZ7yXwFA7r39+n20dpuZs
	C7Q96t1cjhaoaOioVI6uOm6KaMz9ygFplw/UGehEnC3G2GCIx9T9+y2SPsoXKGsuOK3374
	yXSV/we0jDh/PydFIzeEWI5btbxP7839G98rfJMMA476wYZ8TelKfniESu2pDg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795686146; a=rsa-sha256;
	cv=none;
	b=V5yBHuckXzB379SzM1jWCjlXii0PY5KxetW+MlvSdvboLltKFux2RbhegITItvaGl0W++c
	z1AnpDuE7f3/0AhibBnliF08uDwqYdA6Ie99/NuFqsgwJG4d7xkE0v0lM2RTdk+IaO4Bix
	MxBTVCuA9trL4Lk8S3xNCzDRVg2pd3RBy3CJP+JvEM62aAiFVBCLUi6umv7N4nDNIuI87I
	3PjFMoQDl1pGHkh55sy2LykV91T1wk4P24LS7Af1x8oFFt8SvDfZ8gL4JIIRCEAKQa2msV
	uAC5tDv1aQydugWG2wq6C12QrN2yU+R9Sor/JAWuqYmfkP7oYkpjXU+XWlRaoQ==
Message-ID: <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, 	jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, 	andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
	lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
	alexandre.torgue@foss.st.com, marex@nabladev.com, 
	changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:42:26 +0100
In-Reply-To: <20261125202141.1288493-3-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
	 <20261125202141.1288493-3-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
> Define a new platform driver that manages clocks and resets implemented
> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon be)
> used are defined to be controllable.  There are also 13 resets that can
> be asserted or deasserted, but support for some of these is omitted as
> well.
>=20
> Two registers manage the state of the clocks, and two others manage
> the state of the resets.  All four registers are found in a region
> mapped for MMIO.  The region is provided via a BAR on one of the PCI
> functions embedded in the TC9564 SoC.
>=20
> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
> state should never be changed (and a warning is issued if changing their
> state is attempted).
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Fixed problems/garbage in the patch header
>     - The Kconfig option now depends on RESET_CONTROLLER, and can now
>       be enabled if COMPILE_TEST is enabled
>     - The generic gate clock controller code is now used rather than
>       implementing a custom one
>     - The PLL and internal fixed clocks IDs are no longer available
>       outside "clk-tc9564.c"
>     - The PLL is initialialized, followed by all fixed rate clocks,
>       followed by the gate clocks, to ensure each clock's parent is
>       initialized before the clock is
>     - Updating the reset registers (read/modify/write) is now protected
>       by a spinlock
>     - "Unnecessary newlines" have been removed
>=20
>  MAINTAINERS              |   1 +
>  drivers/clk/Kconfig      |   9 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 467 insertions(+)
>  create mode 100644 drivers/clk/clk-tc9564.c
>=20
[...]
> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 0000000000000..306781e2f7b4f
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,456 @@
[...]
> +
> +static int reset_update(struct reset_controller_dev *rcdev,
> +			unsigned long id, bool assert)
> +{
> +	const struct reset_init *reset;
> +	struct tc9564_clock *clock;
> +	unsigned long flags;
> +	void __iomem *reg;
> +	u32 mask;
> +	u32 val;
> +
> +	/* Warn on any attempt to change state of a critical reset */
> +	if (WARN_ON(id =3D=3D RESET_I2C) || WARN_ON(id =3D=3D RESET_PCIE))
> +		return 0;

Can't this be checked at reset_control_get() time (in fwnode_xlate) so
that critical reset controls aren't given out to consumers in the first
place?

> +
> +	clock =3D dev_get_drvdata(rcdev->dev);
> +	reset =3D &reset_init[id];
> +	reg =3D clock->ioaddr + reset->offset;
> +	mask =3D BIT(reset->bit);
> +
> +	spin_lock_irqsave(&clock->lock, flags);

Consider using guard(spinlock).


regards
Philipp
