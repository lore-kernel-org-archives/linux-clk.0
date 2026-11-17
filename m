Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927960;
	b=kdHnoNdjo7m92+08/VrppWAR83FjSR59+SkGZ+IVSjFC2fXcLJWKJtw4JDcoq2OFcvFp
	 xGO75md7V5LuUCAw2RWJ2eLjYCoEXZmn52uEVYwTNy1GckbNKaOBgETLWLkzu3bCT1q3G
	 TJplUhRZyhn9bLnIafyXDPO3eHc5mNLXtohA/0Jzos/rcl+7x6uOXYP0/DgaKgseKnbPk
	 ML4wqJy++UDktkBoCZP4HFf+szCMswvIRNLtWP7cuSuyegi6N2S9JVpisXTb9LhekDe3U
	 AQL2CAEfxshM03K0mtoo1NiAWyu+85awyWyowz/75d2cyvQoUeNm1ybIzxjtKrO46Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927960;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5b0QuGyGn00iquG3GN4oGFLLZstNYi2XAOf3W9cavpk=;
	b=M9vAJm20+eJVr6WlYFCdULxuqaELeSOK/JeUU/y1sIIGkUCVXDftMGBKIfHKes8DIQkV
	 LMvOaA5ppZK1U+ZCvmnv4i/YJS+aJ+nic/7pczwNEfR8RjWUl9pqF3p4y8RDC1bzY2cMO
	 2DukpcJdMt5auDVy8A25IsB0xbmxaE1UxClkJ0RFkrI8i48Vvkx5+UfXNwxC2mFzzP9qO
	 eYgDq4UXUn4IH+Yljekq7bJQQmFKZRu0XxzbqH1tf3AU33EH5ZXHstRoygJfJ2EWi4bbr
	 iuGsN/69x+xZ51FwcsgnPmFacjyrowpu7U7CQunAkapF1f0ewjOz4mdvjURmC5JHHQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsg.is;
	spf=pass smtp.mailfrom=dsg.is;
	dkim=pass header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=PY7W5ypb;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB34606A31C;
	Tue, 17 Nov 2026 15:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=PY7W5ypb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsg.is;
	s=protonmail2; t=1794927955; x=1795187155;
	bh=5b0QuGyGn00iquG3GN4oGFLLZstNYi2XAOf3W9cavpk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PY7W5ypb51Qeu9Jp1QItZvU2vuzQ/0LifSx0ug2QdYeHSajnIYceALMkQZGbmStUS
	 PJJn7BwAAphIZV27vPxFxl2ZzW/06d6VzNslzG4iIsSyL/NatGm8IWelEyBHxBk3VL
	 l5mas65PYpFs5ixFpjkSga1Av8Z3k6l4ESNt7YhU3j9Bl5M41tjACQv0IFMJhzmHYk
	 +nCpxCcgbDKf6nrONRJoN8vwFV12iJj6qFx9GYrwgpy2eDQJR2d7/uNjPlbfUlhF0Y
	 ZBxIivfddmra7PcMI+6m/S+N0I5lQiR/Amgr/vUMzPLPE3Q4/jTuMkW9z/3zIoCiFs
	 +bN8DLLfh3rwg==
Date: Tue, 17 Nov 2026 15:05:49 +0000
To: Jie Luo <jie.luo@oss.qualcomm.com>
From: =?utf-8?Q?Dav=C3=AD=C3=B0_Steinn_Geirsson?= <david@dsg.is>
Cc: George Moussalem <george.moussalem@outlook.com>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and resets
Message-ID: <pYqXqvnKWNe70XfoCIw5qXcD5To1lzTA1BYdwXz72HfWGIGQZN6IENgVQxGr7Z0ueVHYs_kl6W5q18m70V1jj2F_nInBNewja7Ui7ks38es=@dsg.is>
In-Reply-To: <b586f418-a8e0-4502-9372-ed15d559305d@oss.qualcomm.com>
References: <20261112155801.610730-1-david@dsg.is> <LV2PR19MB7970413DF8BA90E631C5D6CD349D7C2@LV2PR19MB797041.namprd19.prod.outlook.com> <b586f418-a8e0-4502-9372-ed15d559305d@oss.qualcomm.com>
Feedback-ID: 186389362:user:proton
X-Pm-Message-ID: 8bc7e68a41cd7f9a3925ee1d95a91dc30e40e998
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





On Tuesday, November 17th, 2026 at 3:44 AM, Jie Luo <jie.luo@oss.qualcomm.c=
om> wrote:

>=20
>=20
> On 11/16/2026 7:41 PM, George Moussalem wrote:
> > On 11/12/26 19:57, Dav=C3=AD=C3=B0 Steinn Geirsson wrote:
> >> The GCC has a block reset (BCR) and an AHB clock branch for each of th=
e
> >> two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
> >> controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
> >> 0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driv=
er
> >> maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
> >> the second, so each MDIO node gets the clock and reset of the other
> >> controller.
> >>
> >> ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
> >> does not enable mdio1, clk_disable_unused() gates 0x58014 and the
> >> controller at 0x88000 stops responding. Its registers then read back a
> >> stale bus value, so MDIO reads return garbage instead of failing.
> >>
> >> Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
> >> mdio0 and nothing on mdio1:
> >> - Gating 0x58004 leaves the 0x88000 controller working and every
> >>   0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
> >> - Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
> >>   the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
> >>   and halts the 0x58014 branch.
> >>
> >> Swap the clock and reset offsets so that each ID controls the
> >> controller it is named after. No in-tree DT uses the MDIO resets.
> >
> > confirmed working on Linksys MX2000 and MR5500. Both devices don't have
> > the internal GE PHY on mdio0 wired up. With mdio1 enabled and mdio0
> > disabled, ethernet comes up.
> >
> > Adding Luo Jie: I think this patch can be reverted because not all
> > boards use the internal GE PHY and its LDO needs not be enabled for
> > ethernet functionality on externally connected PHYs or switches
> > controlled by mdio1
> > -
> > https://lore.kernel.org/all/20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629=
c7bb05c44@oss.qualcomm.com/
> >
> > Tested-by: George Moussalem <george.moussalem@outlook.com>
> >
>=20
> Thanks for testing on the MX2000 and MR5500.
>=20
> All of the Qualcomm RDP boards have the internal GE PHY, so it makes
> sense to keep it enabled by default. A board that doesn't use the
> internal GE PHY can disable it in its own board DTS, as you already
> did for the MX2000 and MR5500:
>=20
> =09&mdio0 {
> =09=09status =3D "disabled";
> =09};
>=20
> >>
> >> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) dri=
ver for IPQ5018")
> >> Signed-off-by: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>
> >> ---
> >>
> >> Tested and confirmed working on the Ubiquiti U6 Pro with both
> >> OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.
> >>
> >> A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
> >> bug has bitten people before:
> >> https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/d=
ts/ipq5018-archer-ax55-v1.dts#L273-L279
> >> That workaround should become unnecessary with this patch, though I
> >> do not have the right hardware to confirm that.
> >>
> >> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq=
5018.c
> >> index 37ccdc44a8..bf1a4745d1 100644
> >> --- a/drivers/clk/qcom/gcc-ipq5018.c
> >> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> >> @@ -1969,28 +1969,28 @@
> >>  };
> >>
> >>  static struct clk_branch gcc_mdio0_ahb_clk =3D {
> >> +=09.halt_reg =3D 0x58014,
> >> +=09.clkr =3D {
> >> +=09=09.enable_reg =3D 0x58014,
> >> +=09=09.enable_mask =3D BIT(0),
> >> +=09=09.hw.init =3D &(struct clk_init_data) {
> >> +=09=09=09.name =3D "gcc_mdioi0_ahb_clk",
> >> +=09=09=09.parent_hws =3D (const struct clk_hw *[]) {
> >> +=09=09=09=09&pcnoc_clk_src.hw,
> >> +=09=09=09},
> >> +=09=09=09.num_parents =3D 1,
> >> +=09=09=09.flags =3D CLK_SET_RATE_PARENT,
> >> +=09=09=09.ops =3D &clk_branch2_ops,
> >> +=09=09},
> >> +=09},
> >> +};
> >> +
> >> +static struct clk_branch gcc_mdio1_ahb_clk =3D {
> >>  =09.halt_reg =3D 0x58004,
> >>  =09.clkr =3D {
> >>  =09=09.enable_reg =3D 0x58004,
> >>  =09=09.enable_mask =3D BIT(0),
> >>  =09=09.hw.init =3D &(struct clk_init_data) {
> >> -=09=09=09.name =3D "gcc_mdioi0_ahb_clk",
> >> -=09=09=09.parent_hws =3D (const struct clk_hw *[]) {
> >> -=09=09=09=09&pcnoc_clk_src.hw,
> >> -=09=09=09},
> >> -=09=09=09.num_parents =3D 1,
> >> -=09=09=09.flags =3D CLK_SET_RATE_PARENT,
> >> -=09=09=09.ops =3D &clk_branch2_ops,
> >> -=09=09},
> >> -=09},
> >> -};
> >> -
> >> -static struct clk_branch gcc_mdio1_ahb_clk =3D {
> >> -=09.halt_reg =3D 0x58014,
> >> -=09.clkr =3D {
> >> -=09=09.enable_reg =3D 0x58014,
> >> -=09=09.enable_mask =3D BIT(0),
> >> -=09=09.hw.init =3D &(struct clk_init_data) {
> >>  =09=09=09.name =3D "gcc_mdio1_ahb_clk",
> >>  =09=09=09.parent_hws =3D (const struct clk_hw *[]) {
> >>  =09=09=09=09&pcnoc_clk_src.hw,
> >> @@ -3585,8 +3585,8 @@
> >>  =09[GCC_GMAC1_SYS_ARES] =3D { 0x68438, 1 },
> >>  =09[GCC_IMEM_BCR] =3D { 0x0e000, 0 },
> >>  =09[GCC_LPASS_BCR] =3D { 0x2e000, 0 },
> >> -=09[GCC_MDIO0_BCR] =3D { 0x58000, 0 },
> >> -=09[GCC_MDIO1_BCR] =3D { 0x58010, 0 },
> >> +=09[GCC_MDIO0_BCR] =3D { 0x58010, 0 },
> >> +=09[GCC_MDIO1_BCR] =3D { 0x58000, 0 },
> >>  =09[GCC_MPM_BCR] =3D { 0x2c000, 0 },
> >>  =09[GCC_PCIE0_BCR] =3D { 0x75004, 0 },
> >>  =09[GCC_PCIE0_LINK_DOWN_BCR] =3D { 0x750a8, 0 },
>=20
> The GCC driver is correct here. GCC_MDIO0_AHB_CLK (0x58004) and
> GCC_MDIO1_AHB_CLK (0x58014), along with the matching BCRs, follow the
> IPQ5018 hardware register definitions. What is wrong is the clock
> assignment in ipq5018.dtsi: the MDIO controller at 0x88000 is clocked
> by GCC_MDIO1_AHB_CLK, and the controller at 0x90000 is clocked by
> GCC_MDIO0_AHB_CLK.
>=20
>=20
> Please drop this change and fix the DTS instead, for example:

Understood, will do. I'll be traveling for a conference the rest of the wee=
k, so I'll prepare and submit the v2 sometime next week. If George or someo=
ne else wants to submit before then, that's also fine by me. :)

Thanks,
Dav=C3=AD=C3=B0


>=20
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -220,7 +220,7 @@ mdio0: mdio@88000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>=20
> -                       clocks =3D <&gcc GCC_MDIO0_AHB_CLK>;
> +                       clocks =3D <&gcc GCC_MDIO1_AHB_CLK>;
>                         clock-names =3D "gcc_mdio_ahb_clk";
>                         clock-frequency =3D <6250000>;
>=20
> @@ -243,7 +243,7 @@ mdio1: mdio@90000 {
>                         pinctrl-0 =3D <&mdio_pins>;
>                         pinctrl-names =3D "default";
>=20
> -                       clocks =3D <&gcc GCC_MDIO1_AHB_CLK>;
> +                       clocks =3D <&gcc GCC_MDIO0_AHB_CLK>;
>                         clock-names =3D "gcc_mdio_ahb_clk";
>=20
>                         status =3D "disabled";
> 
