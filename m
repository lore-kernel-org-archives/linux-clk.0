Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513689;
	b=qVRkFgTiImXg4VbCqCnLjmfaVX3V73OZSLADtYo3JXawnYOeRlx4h+5Csn6t7fxkztnW
	 HhY7z06r0TWr3gW/TDbsfsNpcOGRv+YEgdqNeqhfvkksPtGFh7ilMfeU7VvasYzloUjSO
	 3YZJCxgFv8LAgVkV7zAJMOEr+pHz9GRZG07aZQaV1odLc3pd10N7nOdhoZ8/G03Q76WeX
	 WA6FNqCDFMVvWfDTpTTN1JM2KpN0N5dbrKl/o3hjBAAUw/lt2e/NgMgMJOu76eKD7DeCQ
	 P2mbFW7f4cZkTMWBY9WOsPoWkBNMciwgEd1CPcN5dUACwXCYrJgyW3oIKvSYiWgS5JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513689;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=d6DaKHdaojEjeUyebY43orfnn2MYkANFL6lWDhdElGI=;
	b=aHXy7nofzmzf2CWNXOc5ZGssRy72qsA6g7AhdBkwAGJDa3ShrpySqjwgKX3HwXKnH2T1
	 I4LaHB8orVtgyR48H85QKt8gw2t8y1WF5TFNJGSYy9MjqZ/I/Xr0l+QfVKE2GMgb46b2d
	 zXsIB1N1H2Cyj3YhbH16IW/tZNBB85mt/shWsK2uQ2fSf1gCJa0QDBYRovOiVxKxLYW3z
	 i540IWt62f7pyEUn5X4EkkqjEM9bpBtEiWEGwxCHShwCiGTU42250UjV6bAOM5E0vkxH4
	 vx+UIfqsX6dT/0NXH5M0NMcZ+LhcvlZxvSpx4OLsVqKa1ydARRBzB0vYWnpTmqLHsqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fAxyb7vm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B552606B704;
	Tue, 24 Nov 2026 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B552606B704
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fAxyb7vm
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C07472020DC;
	Tue, 24 Nov 2026 10:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795513683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6DaKHdaojEjeUyebY43orfnn2MYkANFL6lWDhdElGI=;
	b=fAxyb7vmCadkahPPTPSFgFAP4NUEywyc+e4cnVblhGTvavGWlA+L0IvjRL21f0ohSXbKcj
	jwmI0jmBF0dqeQhIIxiLCCmxjr2pr6QiJ3D0tphiHOT7bXeJBDAtoyNYWwrpfPxo7Z5TBq
	s7KAIt+w4HutiHZo4GT1w8YKr2wT/6ZrjxTI0GhkzJoR45tpbSOC85aYQGOJ3ZPLwpzpBQ
	pyxxkFXOQ9xJXcyQpP/rcJv4QZ7+NubFAwNwn+PRVsVilErr/iEYpueYejfRKOY/1lrg+m
	cuzLWy5MLNppIJnG3tMCUf1tZsHge72S/lOlg+i4wjJhIDBFIRm++9ul4W8o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795513683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6DaKHdaojEjeUyebY43orfnn2MYkANFL6lWDhdElGI=;
	b=eZaIgAI7dIOiBn5mRsTegayS+3l51NWaPgEn0pU92fclcOvbJ31gOvmncHHXe1Jd3/AVWm
	w927NCyMIYJCLbk5inKRHboCfdJQ9m0jdNahJSsMPY3Jrf/q0DdRAMkDhP0NizFnVKKiQV
	b5OtlHM3mfK0Ja1yDOwRswuizBuQk9E/ke0gD7kjiBbty1R8br7K0C+2wcIYsdPrqb9We5
	IOBuEnfIcbyOmTsMeg0oW2U/5LBhkidM6r1PcjO9bF4GIV7LetvIjdJGxz765pMJNZ2sKh
	m6FfxLdXBH+bWbaLXI+wSVNptUHxPGg9K1hNCagjAjw+QV46vuN0W6LrzCM13Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795513683; a=rsa-sha256;
	cv=none;
	b=NR7+rirICfaIY/R1UUt+SMs00eQ+ok1Jb2RRUHGZ5OAQFQM/w0uaFpcqv97bYevrjEiuRk
	ogklv2C/OO0NVu8dNkH2yyRjfCIPgam9YZCC7nP+owGZ3OGLHUjWyB1WQul9rGwl1DLdNW
	Lpax3CeUIr1uH+UDIpzn4RQrcJ8m6d+GKQxyo2aMKtJgkvpJXbx93Wru2PUJTuZ6CkU8h0
	ue1qyOgBVjuwaPRxqTyJnowHVl4mAoxawzGgP0Z3TJGdioT68zxJa+/wgjPlIcfmmGsOa9
	IuCSAJ/OHi4qN5vWB9nCAXHIjMuGWjAqugr8GOCqVYQ3nt5IJeQnsU75evpEpQ==
Message-ID: <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: filipp.dunsky@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Date: Tue, 24 Nov 2026 10:48:03 +0100
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
	 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
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

On Di, 2026-11-24 at 00:50 +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>=20
> Register PCIe gates and controller resets through the early global
> provider. Add the network engine composite reset using the same syscon
> regmap, with the existing 1 us/1000 us readback polling and partial-domai=
n
> status error from the posted NE reset driver. Keep the PCIe reset pulse
> delays and all provider-registration failure cleanup. NE pulse reset
> remains unsupported; the Ethernet consumer needs assert/deassert/status.
>=20
> Both independent consumers can use this common provider without a
> PCIe-host dependency or a resource-less network reset child.
>=20
> AI assistance: Codex prepared this draft from the posted CS7542 series.
>=20
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/clk/Kconfig      |   7 +-
>  drivers/clk/clk-cs7542.c | 211 +++++++++++++++++++++++++++++++++++++++++=
+-----
>  2 files changed, 195 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 47b5265fe..cba07bed3 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -59,13 +59,16 @@ config LMK04832
>  	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
> =20
>  config COMMON_CLK_CS7542
> -	bool "Cortina Systems CS7542 strap-selected clocks"
> +	bool "Cortina Systems CS7542 global clocks and resets"
>  	depends on OF && HAS_IOMEM
>  	select MFD_SYSCON
> +	select RESET_CONTROLLER
>  	help
>  	  Read the boot straps of the CS7542 global control block to provide
>  	  its APB, CPU and AXI clocks. This driver does not change PLLs or
> -	  dividers. It is built in because the APB clock is needed by timers.
> +	  dividers. It also provides the three PCIe clock gates and resets,
> +	  and the exclusive network engine and DMA-LSO/SSP reset domain.
> +	  It is built in because the APB clock is needed by timers.
> =20
>  config COMMON_CLK_APPLE_NCO
>  	tristate "Clock driver for Apple SoC NCOs"
> diff --git a/drivers/clk/clk-cs7542.c b/drivers/clk/clk-cs7542.c
> index 4e6c1e98a..17b7109a9 100644
> --- a/drivers/clk/clk-cs7542.c
> +++ b/drivers/clk/clk-cs7542.c
[...]
> @@ -33,14 +38,142 @@ static const char * const cs7542_clock_names[] =3D {
>  	[CS7542_CLK_APB] =3D "cs7542-apb",
>  	[CS7542_CLK_CPU] =3D "cs7542-cpu",
>  	[CS7542_CLK_AXI] =3D "cs7542-axi",
> +	[CS7542_CLK_PCIE0] =3D "cs7542-pcie0",
> +	[CS7542_CLK_PCIE1] =3D "cs7542-pcie1",
> +	[CS7542_CLK_PCIE2] =3D "cs7542-pcie2",
> +};
> +
> +#define CS7542_PORTS	3
> +#define CS7542_NUM_RESETS	4
> +/* NI, FE, TM, SCH, QM, DMA-LSO/SSP, NI XRAM; never reset SDRAM (bit 4).=
 */
> +#define CS7542_NE_RESET_MASK	(GENMASK(3, 0) | BIT(5) | BIT(16) | BIT(17)=
)

So these are multiple separate resets merged into one logical reset
control? Does the hardware require them to be set with the same write
access?

> +#define GLOBAL_RESET	0x04
> +#define GLOBAL_CONFIG	0x10
> +
[...]
> +static int cs7542_gate_is_prepared(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate =3D container_of(hw, struct cs7542_gate, hw);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(gate->map, GLOBAL_CONFIG, &value);
> +	return ret ? ret : !!(value & gate->mask);

Consider using regmap_test_bits() here.

> +}
> +
> +static const struct clk_ops cs7542_gate_ops =3D {
> +	.prepare =3D cs7542_gate_prepare,
> +	.unprepare =3D cs7542_gate_unprepare,
> +	.is_prepared =3D cs7542_gate_is_prepared,
> +};
> +
> +static int cs7542_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct cs7542_control *ctl =3D container_of(rcdev, struct cs7542_contro=
l, rcdev);
> +	unsigned int value;
> +	u32 mask, target;
> +	int ret;
> +
> +	if (id >=3D CS7542_NUM_RESETS)
> +		return -EINVAL;

This is superfluous, fwnode_reset_simple_xlate() already checked this
before creating the reset control.

> +	mask =3D id =3D=3D CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id)=
;
> +	target =3D assert ? mask : 0;
> +	ret =3D regmap_update_bits(ctl->map, GLOBAL_RESET, mask, target);
> +	if (ret || id !=3D CS7542_RESET_NE)
> +		return ret;
> +	return regmap_read_poll_timeout(ctl->map, GLOBAL_RESET, value,
> +				       (value & mask) =3D=3D target, 1, 1000);
> +}
> +
> +static int cs7542_reset_assert(struct reset_controller_dev *rcdev, unsig=
ned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, true);
> +}
> +
> +static int cs7542_reset_deassert(struct reset_controller_dev *rcdev, uns=
igned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, false);
> +}
> +
> +static int cs7542_reset_status(struct reset_controller_dev *rcdev, unsig=
ned long id)
> +{
> +	struct cs7542_control *ctl =3D container_of(rcdev, struct cs7542_contro=
l, rcdev);
> +	unsigned int value;
> +	u32 mask;
> +	int ret;
> +
> +	if (id >=3D CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	mask =3D id =3D=3D CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id)=
;
> +	ret =3D regmap_read(ctl->map, GLOBAL_RESET, &value);
> +	if (ret)
> +		return ret;
> +	value &=3D mask;
> +	if (id =3D=3D CS7542_RESET_NE && value && value !=3D mask)
> +		return -EIO;

Is this a sign that maybe these should be separate controls?

> +	return !!value;
> +}
> +
> +static int cs7542_reset_pulse(struct reset_controller_dev *rcdev, unsign=
ed long id)
> +{
> +	int ret;
> +
> +	if (id >=3D CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	if (id =3D=3D CS7542_RESET_NE)
> +		return -EOPNOTSUPP;
> +
> +	ret =3D cs7542_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	ret =3D cs7542_reset_deassert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	return 0;
> +}

Please drop this and let the PCIe driver call
reset_control_assert/deassert() itself.

reset_control_reset() is for (compatibilty with) self-clearing resets.

regards
Philipp
