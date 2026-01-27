Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B537230BD5;
	Tue, 27 Jan 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533295; cv=none; b=hj18A3eUgUuUyBKnqou6xc4Br24x+3DSyHJWUXsKj9y0JzNQv7FVXCIi+35bNfgQIrhv3QoCYhoqFSsgP6WRobYUE/7Irxid+zXY8NJfRDpJHlRf71lazA14CIPk/pbwens8JNu9s9lnSnwIJ0FmytRI0kZ0xbuevHfuOiyK9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533295; c=relaxed/simple;
	bh=7q5ee84z+XHgtoQ7yin70aDr3gUkLYlhzUcimXEGxQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adrmAD82WphilvTeVhiFTkz4Cwn6wSl8lRwhuGJWW8Q2Un5vs5+pGumXLlQezMFX3zQ5asppmaqBlEJkI0qAC6WyyKStmWNxozTlhe3dnSLMNx2ybBgHjJi3lEgDy84/nEjvxTyA3xVS3LE0nqAZyWQoz4o9cw9iNbNKqz7NEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYSzG8oN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYSzG8oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE117C116C6;
	Tue, 27 Jan 2026 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769533295;
	bh=7q5ee84z+XHgtoQ7yin70aDr3gUkLYlhzUcimXEGxQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYSzG8oNKq7y87uDGkzmw48Irhlas9zSRZCD+RcID5Hmbg3lc0KYJemi7pGP5IVUw
	 GyoFGqpggFcWZr3W6o8S7zjqythTc1sDcejISHEDNpntzl6UHcSLRSymCHQrBG+UOe
	 S8NNSoQc0V7Hw1e1M7/IkKZwF0ntyHY6S0crF6qtRFVlunRG67Ea1DrgR8q1/nbBzN
	 QhE84hINMs3Km1qYhWygIJ/loukINrtdHONIYyI0uZPMfwhVtlrBP/vNYdXEy5H+cB
	 oh+b4yHdPEiIpo7Z6YfxqiQFh9nKLI+6a2nQ1eQeG7U3bKtjBJj9oBQWGAoKLJeKku
	 g9P4NR1ItKW2Q==
Date: Tue, 27 Jan 2026 17:01:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4q13lcztzbOrkIMw"
Content-Disposition: inline
In-Reply-To: <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
X-Cookie: Torque is cheap.


--4q13lcztzbOrkIMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.

I'm seeing boot regressions in -next on the Avenger96 which bisect to
this patch in -next.  The board resets during startup:

[    0.297034] /soc/display-controller@5a001000: Fixed dependency cycle(s) =
with /soc/bus@5c007000/i2c@5c002000/hdmi-transmitter@3d
[    0.307482] /soc/bus@5c007000/sai@4400b000/audio-controller@4400b004: Fi=
xed dependency cycle(s) with /soc/bus@5c007000/i2c@5c002000/hdmi-transmitte=
r@3d
[    0.321193] /soc/bus@5c007000/i2c@5c002000/hdmi-transmitter@3d: Fixed de=
pendency cycle(s) with /soc/bus@5c007000/sai@4400b000/audio-controller@4400=
b004
[    0.334454] /soc/bus@5c007000/i2c@5c002000/hdmi-transmitter@3d: Fixed de=
pendency cycle(s) with /soc/display-controller@5a001000
U-Boot SPL 2023.07.02-dh-stm32mp1-dhcor-avenger96-20230727.02 (Jul 11 2023 =
- 15:20:44 +0000)
Model: Arrow Electronics STM32MP15xx Avenger96 board

   https://lava.sirena.org.uk/scheduler/job/2409783

bisect log:

# bad: [615aad0f61e0c7a898184a394dc895c610100d4f] Add linux-next specific f=
iles for 20260126
# good: [50814c5ce8d8f6751fd49c818abeb8853f8be2df] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [702ce71d32f2c30b4f45b7c6b701d87583c58df8] ASoC: SDCA: Add NO_DIREC=
T_COMPLETE flag to class driver
# good: [d0ab89951197f0fc509a0cd732d830880e79c2d4] ASoC: cs35l56: Add KUnit=
 testing of cs35l56_set_fw_suffix()
# good: [7f428282fde34f06f3ab898b8a9081bf93a41f22] ALSA: hda: controllers: =
intel: add support for Nova Lake
# good: [cafadbf430f4b2f3ca4158de48ef6ba4d97fbf17] ASoC: renesas: rz-ssi: D=
rop goto label
# good: [00ca2dd431fa2acb07b3ecc6ce49fb9a0a4d72cb] ASoC: SOF: Intel: hda: R=
emove MODULE_SOFTDEP for snd-hda-codec-hdmi
# good: [3495a5df94a9ad7a8940bcb3ebfda58255f5b952] spi: dt-bindings: nxp,im=
x94-xspi: add nxp,imx952-xspi
# good: [a18467a50eddbd7c6548b53b25b68e5454ceb587] ASoC: realtek: fix missp=
elling of "minimum" in comments
# good: [c3608162a95a259c669cf9fdccf900782fa8d902] spi: xilinx: make irq op=
tional
# good: [3c5ddd56aa93048314c64533c21e731a44b0f067] ASoC: codecs: es8323: En=
able proper DAPM widgets for chip power
# good: [20c4701b75a3d6ce09d61e17125aefe77e7eb333] dt-bindings: regulator: =
mark regulator-suspend-microvolt as deprecated
# good: [37fbc1ab0f225d23f0839260a11375b4f1f7cf8c] spi: Drop duplicate devi=
ce_set_node() call
# good: [83ba6efa711fad83a0fbf02178ad64d3906d8d09] spi: rockchip: Use plain=
 request_irq()
# good: [4fbd3b2ec04dc6ef93090ec24733a5c5671fb71f] ASoC: soc-acpi-intel-ptl=
-match: use aggregated endpoint in ptl_rt722_l0_rt1320_l23
# good: [7a3d1b04d938f31e112fe09c0ffc1af830ba1f6d] ASoC: SDCA: Handle CONFI=
G_PM_SLEEP not being set
# good: [dccc66b0e92d48d9a1908a3ccb8142e0ee3381f5] regmap: Enable REGMAP wh=
en REGMAP_SLIMBUS is enabled
# good: [61d2a7699ab39d448f44919ef15c16187e6f70ec] ASoC: SDCA: Tidy up some=
 memory allocations
# good: [519d0a6b2ca5a891340b6c24a4c40545f518e1a8] ASoC: codecs: aw88261: u=
se dvdd-supply regulator
# good: [da7afdc79cba00f952df12cd579e44832d829c0a] ASoC: SDCA: Add lock to =
serialise the Function initialisation
# good: [8a98e7f55f975360975083166e21982ef307b8fd] ASoC: tlv320adcx140: add=
 channel sum control
# good: [10303b32519f52a5afd40593a507543143c8ec6a] dt-bindings: sound: goog=
le,goldfish-audio: Convert to DT schema
# good: [62b04225e99a5d1c71c5c73d2aa6618bc2c0738f] regulator: dt-bindings: =
rpi-panel: Mark 7" Raspberry Pi as GPIO controller
# good: [de9f1b1583aecb246b659effb03f2456604fab64] regulator: dt-bindings: =
mediatek,mt6331: Add missing ldo-vio28 vreg
# good: [a014c203b54d9013ad52ad8a531cf46e71028f2b] spi: fsi: Simplify with =
scoped for each OF child loop
# good: [e7c30ac379b429d439eb62ae1bb69720a6701e26] ASoC: amd: acp: soc-acpi=
: add is_device_rt712_vb() helper
# good: [09dc08b396c954820f119e1ab0c7d72333c18323] regulator: dummy, make d=
ummy_regulator_driver static
# good: [6be9ea62afedef0f976eb3dba4c117be0c1d3809] ASoC: codecs: rtq9128: A=
dd compatible changes for rtq9154
# good: [e590752119029d87ce46d725e11245a52d22e1fe] ASoC: wm8962: Don't repo=
rt a microphone if it's shorted to ground on plug
# good: [77157cb45c66bd652a08a360693fcced558c5ef9] ASoC: codecs: rt1320-sdw=
: convert to snd_soc_dapm_xxx()
# good: [b0fc1e7701940d12ea2c41f386aa552bc4cc3629] regulator: Add TPS65185 =
driver
# good: [8618271887ca10ac5108fe7e1d82ba8f1b152cf9] spi: spi-mem: Limit octa=
l DTR constraints to octal DTR situations
# good: [8672e4b51adfc57150f3862b1665faff0acf1bad] spi: dt-bindings: nxp,lp=
c3220-spi: Add DMA specific properties
# good: [fc6ceb7e4ea746e663ff8c5593e67ad8ccbee34a] ASoC: sof ipc4: Add sof_=
ipc4_widget_setup_msg_payload() and call it
# good: [83aee46dc2142eed2dc40b5cef0e9e08e14cac42] ASoC: SOF: ipc/ops: Use =
guard() for spinlocks
# good: [8d38423d9dea7353a8a54a3ab2e0d0aa04ed34d0] regulator: core: don't f=
ail regulator_register() with missing required supply
# good: [b9198ce5c6dfee19b9662dda95ba559af9cdf53f] ASoC: codecs: aw88261: A=
dd devicetree support
# good: [db4371d13f82fb12463fe053f4864980a2af2106] MAINTAINERS: Add entries=
 for the Axiado SPI DB controller
# good: [b6376dbed8e173f9571583b5d358b08ff394e864] spi: Simplify devm_spi_*=
_controller()
# good: [0cd9bf6a6d9a1861087236cc5c275b3bea83cfdd] ASoC: codecs: da7213: Mo=
ve comma operator at the end of the line
# good: [22a4776a9ce50aa47f602d28f53ba9d613a38f49] ASoC: codecs: es8375: re=
move unnecessary format check
# good: [75d208bddcca55ec31481420fbb4d6c9703ba195] spi: stm32: avoid __mayb=
e_unused and use pm_ptr
# good: [04b61513dfe40f80f0dcc795003637b510522b3c] ASoC: SDCA: Replace use =
of system_wq with system_dfl_wq
# good: [9bf0bd7bdea6c402007ffb784dd0c0f704aa2310] ASoC: nau8821: Sort #inc=
lude directives
# good: [96d337436fe0921177a6090aeb5bb214753654fc] spi: dt-bindings: at91: =
add microchip,lan9691-spi
# good: [52ddc0106c77ff0eacf07b309833ae6e6a4e8587] ASoC: es8328: Remove dup=
licate DAPM routes
# good: [211243b69533e968cc6f0259fb80ffee02fbe0ca] firmware: cs_dsp: test_b=
in: Add tests for offsets > 0xffff
# good: [420739112e95c9bb286b4e87875706925970abd3] ASoC: rt5575: Add the co=
dec driver for the ALC5575
# good: [4c5e6d5b31bc623d89185d551681ab91cfd037c9] ASoC: codecs: ES8389: Up=
date clock configuration
# good: [25abdc151a448a17d500ea9468ce32582c479faa] ASoC: rt1320: fix the re=
mainder calculation of r0 value
# good: [284853affe73fe1ca9786bd52b934eb9d420a942] ASoC: rt1320: fix size_t=
 format string
# good: [45e9066f3a487e9e26b842644364d045af054775] ASoC: Intel: avs: replac=
e strcmp with sysfs_streq
# good: [0f698d742f628d02ab2a222f8cf5f793443865d0] spi: bcm63xx-hsspi: add =
support for 1-2-2 read ops
# good: [b0655377aa5a410df02d89170c20141a1a5bbc28] rust: regulator: replace=
 `kernel::c_str!` with C-Strings
# good: [8db50f0fa43efe8799fd40b872dcdd39a90d7549] ASoC: rt1320: fix the wa=
rning the string may be truncated
# good: [99a3ef1e81cd1775bc1f8cc2ad188b1fc755d5cd] ASoC: SDCA: Add ASoC jac=
k hookup in class driver
# good: [4ab48cc63e15cb619d641d1edf9a15a0a98875b2] ASoC: qcom: audioreach: =
Constify function arguments
# good: [c6bca73d699cfe00d3419566fdb2a45e112f44b0] ASoC: rt1320: Fix retry =
checking in rt1320_rae_load()
# good: [a2a631830deb382a3d27b6f52b2d654a3e6bb427] ASoC: qcom: Constify APR=
/GPR result structs
# good: [32a708ba5db50cf928a1f1b2039ceef33de2c286] regulator: Add rt8092 su=
pport
# good: [b39ef93a2e5b5f4289a3486d8a94a09a1e6a4c67] spi: stm32: perform smal=
l transfer in polling mode
# good: [7a8447fc71a09000cee5a2372b6efde45735d2c8] ASoC: codecs: wcd939x-sd=
w: use devres for regmap allocation
# good: [2a28b5240f2b328495c6565d277f438dbc583d61] ASoC: SOF: ipc4-control:=
 Add support for generic bytes control
# good: [3622dc47a4b13e0ec86358c7b54a0b33bfcaa03c] ASoC: codec: rt286: Use =
devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
# good: [02e7af5b6423d2dbf82f852572f2fa8c00aafb19] ASoC: Intel: sof_rt5682:=
 add tas2563 speaker amp support
# good: [29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2] spi: add driver for NXP =
XSPI controller
# good: [9a6bc0a406608e2520f18d996483c9d2e4a9fb27] ASoC: codecs: ES8326: Ad=
d kcontrol for DRE
# good: [f764645cb85a8b8f58067289cdfed28f6c1cdf49] ASoC: codecs: tas2780: t=
idyup format check in tas2780_set_fmt()
# good: [7f7b350e4a65446f5d52ea8ae99e12eac8a972db] spi: stm32-qspi: Remove =
unneeded semicolon
# good: [1303c2903889b01d581083ed92e439e7544dd3e5] MAINTAINERS: Add MAINTAI=
NERS entry for the ATCSPI200 SPI controller driver
# good: [524ee559948d8d079b13466e70fa741f909699c0] ASoC: SOF: Intel: hda: O=
nly check SSP MCLK mask in case of IPC3
# good: [f25c7d709b93602ee9a08eba522808a18e1f5d56] ASoC: SOF: Intel: pci-nv=
l: Set on_demand_dsp_boot for NVL-S
# good: [f4acea9eef704607d1a950909ce3a52a770d6be2] spi: dt-bindings: st,stm=
32-spi: add 'power-domains' property
# good: [e39011184f23de3d04ca8e80b4df76c9047b4026] ASoC: SDCA: functions: F=
ix confusing cleanup.h syntax
# good: [fa08b566860bca8ebf9300090b85174c34de7ca5] spi: rzv2h-rspi: add sup=
port for DMA mode
# good: [03d281f384768610bf90697bce9e35d3d596de77] rust: regulator: add __r=
ust_helper to helpers
# good: [b884e34994ca41f7b7819f3c41b78ff494787b27] spi: spi-fsl-lpspi: conv=
ert min_t() to simple min()
# good: [124f6155f3d97b0e33f178c10a5138a42c8fd207] ASoC: renesas: rz-ssi: A=
dd support for 32 bits sample width
# good: [aa30193af8873b3ccfd70a4275336ab6cbd4e5e6] ASoC: Intel: catpt: Drop=
 superfluous space in PCM code
# good: [0bb160c92ad400c692984763996b758458adea17] ASoC: qcom: Minor readab=
ility improve with new lines
# good: [fee876b2ec75dcc18fdea154eae1f5bf14d82659] spi: stm32-qspi: Simplif=
y SMIE interrupt test
# good: [81acbdc51bbbec822a1525481f2f70677c47aee0] ASoC: sdw-mockup: Drop d=
ummy remove function
# good: [9e92c559d49d6fb903af17a31a469aac51b1766d] regulator: max77675: Add=
 MAX77675 regulator driver
# good: [ba9b28652c75b07383e267328f1759195d5430f7] spi: imx: enable DMA mod=
e for target operation
# good: [6c177775dcc5e70a64ddf4ee842c66af498f2c7c] Merge branch 'next/drive=
rs' into for-next
git bisect start '615aad0f61e0c7a898184a394dc895c610100d4f' '50814c5ce8d8f6=
751fd49c818abeb8853f8be2df' '702ce71d32f2c30b4f45b7c6b701d87583c58df8' 'd0a=
b89951197f0fc509a0cd732d830880e79c2d4' '7f428282fde34f06f3ab898b8a9081bf93a=
41f22' 'cafadbf430f4b2f3ca4158de48ef6ba4d97fbf17' '00ca2dd431fa2acb07b3ecc6=
ce49fb9a0a4d72cb' '3495a5df94a9ad7a8940bcb3ebfda58255f5b952' 'a18467a50eddb=
d7c6548b53b25b68e5454ceb587' 'c3608162a95a259c669cf9fdccf900782fa8d902' '3c=
5ddd56aa93048314c64533c21e731a44b0f067' '20c4701b75a3d6ce09d61e17125aefe77e=
7eb333' '37fbc1ab0f225d23f0839260a11375b4f1f7cf8c' '83ba6efa711fad83a0fbf02=
178ad64d3906d8d09' '4fbd3b2ec04dc6ef93090ec24733a5c5671fb71f' '7a3d1b04d938=
f31e112fe09c0ffc1af830ba1f6d' 'dccc66b0e92d48d9a1908a3ccb8142e0ee3381f5' '6=
1d2a7699ab39d448f44919ef15c16187e6f70ec' '519d0a6b2ca5a891340b6c24a4c40545f=
518e1a8' 'da7afdc79cba00f952df12cd579e44832d829c0a' '8a98e7f55f975360975083=
166e21982ef307b8fd' '10303b32519f52a5afd40593a507543143c8ec6a' '62b04225e99=
a5d1c71c5c73d2aa6618bc2c0738f' 'de9f1b1583aecb246b659effb03f2456604fab64' '=
a014c203b54d9013ad52ad8a531cf46e71028f2b' 'e7c30ac379b429d439eb62ae1bb69720=
a6701e26' '09dc08b396c954820f119e1ab0c7d72333c18323' '6be9ea62afedef0f976eb=
3dba4c117be0c1d3809' 'e590752119029d87ce46d725e11245a52d22e1fe' '77157cb45c=
66bd652a08a360693fcced558c5ef9' 'b0fc1e7701940d12ea2c41f386aa552bc4cc3629' =
'8618271887ca10ac5108fe7e1d82ba8f1b152cf9' '8672e4b51adfc57150f3862b1665faf=
f0acf1bad' 'fc6ceb7e4ea746e663ff8c5593e67ad8ccbee34a' '83aee46dc2142eed2dc4=
0b5cef0e9e08e14cac42' '8d38423d9dea7353a8a54a3ab2e0d0aa04ed34d0' 'b9198ce5c=
6dfee19b9662dda95ba559af9cdf53f' 'db4371d13f82fb12463fe053f4864980a2af2106'=
 'b6376dbed8e173f9571583b5d358b08ff394e864' '0cd9bf6a6d9a1861087236cc5c275b=
3bea83cfdd' '22a4776a9ce50aa47f602d28f53ba9d613a38f49' '75d208bddcca55ec314=
81420fbb4d6c9703ba195' '04b61513dfe40f80f0dcc795003637b510522b3c' '9bf0bd7b=
dea6c402007ffb784dd0c0f704aa2310' '96d337436fe0921177a6090aeb5bb214753654fc=
' '52ddc0106c77ff0eacf07b309833ae6e6a4e8587' '211243b69533e968cc6f0259fb80f=
fee02fbe0ca' '420739112e95c9bb286b4e87875706925970abd3' '4c5e6d5b31bc623d89=
185d551681ab91cfd037c9' '25abdc151a448a17d500ea9468ce32582c479faa' '284853a=
ffe73fe1ca9786bd52b934eb9d420a942' '45e9066f3a487e9e26b842644364d045af05477=
5' '0f698d742f628d02ab2a222f8cf5f793443865d0' 'b0655377aa5a410df02d89170c20=
141a1a5bbc28' '8db50f0fa43efe8799fd40b872dcdd39a90d7549' '99a3ef1e81cd1775b=
c1f8cc2ad188b1fc755d5cd' '4ab48cc63e15cb619d641d1edf9a15a0a98875b2' 'c6bca7=
3d699cfe00d3419566fdb2a45e112f44b0' 'a2a631830deb382a3d27b6f52b2d654a3e6bb4=
27' '32a708ba5db50cf928a1f1b2039ceef33de2c286' 'b39ef93a2e5b5f4289a3486d8a9=
4a09a1e6a4c67' '7a8447fc71a09000cee5a2372b6efde45735d2c8' '2a28b5240f2b3284=
95c6565d277f438dbc583d61' '3622dc47a4b13e0ec86358c7b54a0b33bfcaa03c' '02e7a=
f5b6423d2dbf82f852572f2fa8c00aafb19' '29c8c00d9f9db5fb659b6f05f9e8964afc13f=
3e2' '9a6bc0a406608e2520f18d996483c9d2e4a9fb27' 'f764645cb85a8b8f58067289cd=
fed28f6c1cdf49' '7f7b350e4a65446f5d52ea8ae99e12eac8a972db' '1303c2903889b01=
d581083ed92e439e7544dd3e5' '524ee559948d8d079b13466e70fa741f909699c0' 'f25c=
7d709b93602ee9a08eba522808a18e1f5d56' 'f4acea9eef704607d1a950909ce3a52a770d=
6be2' 'e39011184f23de3d04ca8e80b4df76c9047b4026' 'fa08b566860bca8ebf9300090=
b85174c34de7ca5' '03d281f384768610bf90697bce9e35d3d596de77' 'b884e34994ca41=
f7b7819f3c41b78ff494787b27' '124f6155f3d97b0e33f178c10a5138a42c8fd207' 'aa3=
0193af8873b3ccfd70a4275336ab6cbd4e5e6' '0bb160c92ad400c692984763996b758458a=
dea17' 'fee876b2ec75dcc18fdea154eae1f5bf14d82659' '81acbdc51bbbec822a152548=
1f2f70677c47aee0' '9e92c559d49d6fb903af17a31a469aac51b1766d' 'ba9b28652c75b=
07383e267328f1759195d5430f7' '6c177775dcc5e70a64ddf4ee842c66af498f2c7c'
# test job: [702ce71d32f2c30b4f45b7c6b701d87583c58df8] https://lava.sirena.=
org.uk/scheduler/job/2393428
# test job: [d0ab89951197f0fc509a0cd732d830880e79c2d4] https://lava.sirena.=
org.uk/scheduler/job/2392919
# test job: [7f428282fde34f06f3ab898b8a9081bf93a41f22] https://lava.sirena.=
org.uk/scheduler/job/2391339
# test job: [cafadbf430f4b2f3ca4158de48ef6ba4d97fbf17] https://lava.sirena.=
org.uk/scheduler/job/2389514
# test job: [00ca2dd431fa2acb07b3ecc6ce49fb9a0a4d72cb] https://lava.sirena.=
org.uk/scheduler/job/2389628
# test job: [3495a5df94a9ad7a8940bcb3ebfda58255f5b952] https://lava.sirena.=
org.uk/scheduler/job/2389353
# test job: [a18467a50eddbd7c6548b53b25b68e5454ceb587] https://lava.sirena.=
org.uk/scheduler/job/2386094
# test job: [c3608162a95a259c669cf9fdccf900782fa8d902] https://lava.sirena.=
org.uk/scheduler/job/2387959
# test job: [3c5ddd56aa93048314c64533c21e731a44b0f067] https://lava.sirena.=
org.uk/scheduler/job/2386640
# test job: [20c4701b75a3d6ce09d61e17125aefe77e7eb333] https://lava.sirena.=
org.uk/scheduler/job/2386301
# test job: [37fbc1ab0f225d23f0839260a11375b4f1f7cf8c] https://lava.sirena.=
org.uk/scheduler/job/2386363
# test job: [83ba6efa711fad83a0fbf02178ad64d3906d8d09] https://lava.sirena.=
org.uk/scheduler/job/2387001
# test job: [4fbd3b2ec04dc6ef93090ec24733a5c5671fb71f] https://lava.sirena.=
org.uk/scheduler/job/2386168
# test job: [7a3d1b04d938f31e112fe09c0ffc1af830ba1f6d] https://lava.sirena.=
org.uk/scheduler/job/2377308
# test job: [dccc66b0e92d48d9a1908a3ccb8142e0ee3381f5] https://lava.sirena.=
org.uk/scheduler/job/2377141
# test job: [61d2a7699ab39d448f44919ef15c16187e6f70ec] https://lava.sirena.=
org.uk/scheduler/job/2375730
# test job: [519d0a6b2ca5a891340b6c24a4c40545f518e1a8] https://lava.sirena.=
org.uk/scheduler/job/2372387
# test job: [da7afdc79cba00f952df12cd579e44832d829c0a] https://lava.sirena.=
org.uk/scheduler/job/2372298
# test job: [8a98e7f55f975360975083166e21982ef307b8fd] https://lava.sirena.=
org.uk/scheduler/job/2372505
# test job: [10303b32519f52a5afd40593a507543143c8ec6a] https://lava.sirena.=
org.uk/scheduler/job/2372322
# test job: [62b04225e99a5d1c71c5c73d2aa6618bc2c0738f] https://lava.sirena.=
org.uk/scheduler/job/2369376
# test job: [de9f1b1583aecb246b659effb03f2456604fab64] https://lava.sirena.=
org.uk/scheduler/job/2368867
# test job: [a014c203b54d9013ad52ad8a531cf46e71028f2b] https://lava.sirena.=
org.uk/scheduler/job/2368397
# test job: [e7c30ac379b429d439eb62ae1bb69720a6701e26] https://lava.sirena.=
org.uk/scheduler/job/2366032
# test job: [09dc08b396c954820f119e1ab0c7d72333c18323] https://lava.sirena.=
org.uk/scheduler/job/2365474
# test job: [6be9ea62afedef0f976eb3dba4c117be0c1d3809] https://lava.sirena.=
org.uk/scheduler/job/2365609
# test job: [e590752119029d87ce46d725e11245a52d22e1fe] https://lava.sirena.=
org.uk/scheduler/job/2364789
# test job: [77157cb45c66bd652a08a360693fcced558c5ef9] https://lava.sirena.=
org.uk/scheduler/job/2363794
# test job: [b0fc1e7701940d12ea2c41f386aa552bc4cc3629] https://lava.sirena.=
org.uk/scheduler/job/2364720
# test job: [8618271887ca10ac5108fe7e1d82ba8f1b152cf9] https://lava.sirena.=
org.uk/scheduler/job/2364881
# test job: [8672e4b51adfc57150f3862b1665faff0acf1bad] https://lava.sirena.=
org.uk/scheduler/job/2363802
# test job: [fc6ceb7e4ea746e663ff8c5593e67ad8ccbee34a] https://lava.sirena.=
org.uk/scheduler/job/2364433
# test job: [83aee46dc2142eed2dc40b5cef0e9e08e14cac42] https://lava.sirena.=
org.uk/scheduler/job/2363989
# test job: [8d38423d9dea7353a8a54a3ab2e0d0aa04ed34d0] https://lava.sirena.=
org.uk/scheduler/job/2354063
# test job: [b9198ce5c6dfee19b9662dda95ba559af9cdf53f] https://lava.sirena.=
org.uk/scheduler/job/2354856
# test job: [db4371d13f82fb12463fe053f4864980a2af2106] https://lava.sirena.=
org.uk/scheduler/job/2354230
# test job: [b6376dbed8e173f9571583b5d358b08ff394e864] https://lava.sirena.=
org.uk/scheduler/job/2349545
# test job: [0cd9bf6a6d9a1861087236cc5c275b3bea83cfdd] https://lava.sirena.=
org.uk/scheduler/job/2348802
# test job: [22a4776a9ce50aa47f602d28f53ba9d613a38f49] https://lava.sirena.=
org.uk/scheduler/job/2343130
# test job: [75d208bddcca55ec31481420fbb4d6c9703ba195] https://lava.sirena.=
org.uk/scheduler/job/2337394
# test job: [04b61513dfe40f80f0dcc795003637b510522b3c] https://lava.sirena.=
org.uk/scheduler/job/2337624
# test job: [9bf0bd7bdea6c402007ffb784dd0c0f704aa2310] https://lava.sirena.=
org.uk/scheduler/job/2330756
# test job: [96d337436fe0921177a6090aeb5bb214753654fc] https://lava.sirena.=
org.uk/scheduler/job/2330496
# test job: [52ddc0106c77ff0eacf07b309833ae6e6a4e8587] https://lava.sirena.=
org.uk/scheduler/job/2330490
# test job: [211243b69533e968cc6f0259fb80ffee02fbe0ca] https://lava.sirena.=
org.uk/scheduler/job/2330643
# test job: [420739112e95c9bb286b4e87875706925970abd3] https://lava.sirena.=
org.uk/scheduler/job/2330595
# test job: [4c5e6d5b31bc623d89185d551681ab91cfd037c9] https://lava.sirena.=
org.uk/scheduler/job/2330948
# test job: [25abdc151a448a17d500ea9468ce32582c479faa] https://lava.sirena.=
org.uk/scheduler/job/2307350
# test job: [284853affe73fe1ca9786bd52b934eb9d420a942] https://lava.sirena.=
org.uk/scheduler/job/2298066
# test job: [45e9066f3a487e9e26b842644364d045af054775] https://lava.sirena.=
org.uk/scheduler/job/2295621
# test job: [0f698d742f628d02ab2a222f8cf5f793443865d0] https://lava.sirena.=
org.uk/scheduler/job/2295231
# test job: [b0655377aa5a410df02d89170c20141a1a5bbc28] https://lava.sirena.=
org.uk/scheduler/job/2291689
# test job: [8db50f0fa43efe8799fd40b872dcdd39a90d7549] https://lava.sirena.=
org.uk/scheduler/job/2292502
# test job: [99a3ef1e81cd1775bc1f8cc2ad188b1fc755d5cd] https://lava.sirena.=
org.uk/scheduler/job/2290488
# test job: [4ab48cc63e15cb619d641d1edf9a15a0a98875b2] https://lava.sirena.=
org.uk/scheduler/job/2290397
# test job: [c6bca73d699cfe00d3419566fdb2a45e112f44b0] https://lava.sirena.=
org.uk/scheduler/job/2290128
# test job: [a2a631830deb382a3d27b6f52b2d654a3e6bb427] https://lava.sirena.=
org.uk/scheduler/job/2281785
# test job: [32a708ba5db50cf928a1f1b2039ceef33de2c286] https://lava.sirena.=
org.uk/scheduler/job/2279465
# test job: [b39ef93a2e5b5f4289a3486d8a94a09a1e6a4c67] https://lava.sirena.=
org.uk/scheduler/job/2269679
# test job: [7a8447fc71a09000cee5a2372b6efde45735d2c8] https://lava.sirena.=
org.uk/scheduler/job/2271774
# test job: [2a28b5240f2b328495c6565d277f438dbc583d61] https://lava.sirena.=
org.uk/scheduler/job/2266163
# test job: [3622dc47a4b13e0ec86358c7b54a0b33bfcaa03c] https://lava.sirena.=
org.uk/scheduler/job/2268465
# test job: [02e7af5b6423d2dbf82f852572f2fa8c00aafb19] https://lava.sirena.=
org.uk/scheduler/job/2263583
# test job: [29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2] https://lava.sirena.=
org.uk/scheduler/job/2263419
# test job: [9a6bc0a406608e2520f18d996483c9d2e4a9fb27] https://lava.sirena.=
org.uk/scheduler/job/2263708
# test job: [f764645cb85a8b8f58067289cdfed28f6c1cdf49] https://lava.sirena.=
org.uk/scheduler/job/2263393
# test job: [7f7b350e4a65446f5d52ea8ae99e12eac8a972db] https://lava.sirena.=
org.uk/scheduler/job/2263713
# test job: [1303c2903889b01d581083ed92e439e7544dd3e5] https://lava.sirena.=
org.uk/scheduler/job/2263162
# test job: [524ee559948d8d079b13466e70fa741f909699c0] https://lava.sirena.=
org.uk/scheduler/job/2243761
# test job: [f25c7d709b93602ee9a08eba522808a18e1f5d56] https://lava.sirena.=
org.uk/scheduler/job/2243682
# test job: [f4acea9eef704607d1a950909ce3a52a770d6be2] https://lava.sirena.=
org.uk/scheduler/job/2243493
# test job: [e39011184f23de3d04ca8e80b4df76c9047b4026] https://lava.sirena.=
org.uk/scheduler/job/2231781
# test job: [fa08b566860bca8ebf9300090b85174c34de7ca5] https://lava.sirena.=
org.uk/scheduler/job/2232081
# test job: [03d281f384768610bf90697bce9e35d3d596de77] https://lava.sirena.=
org.uk/scheduler/job/2231184
# test job: [b884e34994ca41f7b7819f3c41b78ff494787b27] https://lava.sirena.=
org.uk/scheduler/job/2231834
# test job: [124f6155f3d97b0e33f178c10a5138a42c8fd207] https://lava.sirena.=
org.uk/scheduler/job/2232196
# test job: [aa30193af8873b3ccfd70a4275336ab6cbd4e5e6] https://lava.sirena.=
org.uk/scheduler/job/2231987
# test job: [0bb160c92ad400c692984763996b758458adea17] https://lava.sirena.=
org.uk/scheduler/job/2232057
# test job: [fee876b2ec75dcc18fdea154eae1f5bf14d82659] https://lava.sirena.=
org.uk/scheduler/job/2231321
# test job: [81acbdc51bbbec822a1525481f2f70677c47aee0] https://lava.sirena.=
org.uk/scheduler/job/2231999
# test job: [9e92c559d49d6fb903af17a31a469aac51b1766d] https://lava.sirena.=
org.uk/scheduler/job/2231743
# test job: [ba9b28652c75b07383e267328f1759195d5430f7] https://lava.sirena.=
org.uk/scheduler/job/2231572
# test job: [6c177775dcc5e70a64ddf4ee842c66af498f2c7c] https://lava.sirena.=
org.uk/scheduler/job/2058633
# test job: [615aad0f61e0c7a898184a394dc895c610100d4f] https://lava.sirena.=
org.uk/scheduler/job/2407321
# bad: [615aad0f61e0c7a898184a394dc895c610100d4f] Add linux-next specific f=
iles for 20260126
git bisect bad 615aad0f61e0c7a898184a394dc895c610100d4f
# test job: [a85cfbd09f2d2f3bfab8fbe8246d0ae43a0c1628] https://lava.sirena.=
org.uk/scheduler/job/2407528
# bad: [a85cfbd09f2d2f3bfab8fbe8246d0ae43a0c1628] Merge branch 'master' of =
https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect bad a85cfbd09f2d2f3bfab8fbe8246d0ae43a0c1628
# test job: [75fe66db9e85a2fd9743f7598a2aaea9eb5fbfd7] https://lava.sirena.=
org.uk/scheduler/job/2407694
# bad: [75fe66db9e85a2fd9743f7598a2aaea9eb5fbfd7] Merge branch 'xtensa-for-=
next' of https://github.com/jcmvbkbc/linux-xtensa.git
git bisect bad 75fe66db9e85a2fd9743f7598a2aaea9eb5fbfd7
# test job: [0578997f52fb9a1b9adfc5fe5a95ceab4bb331d2] https://lava.sirena.=
org.uk/scheduler/job/2407737
# good: [0578997f52fb9a1b9adfc5fe5a95ceab4bb331d2] Merge branch 'soc_fsl' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux.git
git bisect good 0578997f52fb9a1b9adfc5fe5a95ceab4bb331d2
# test job: [5cd67271caee30972d751ab3763c3de4b1fa73d0] https://lava.sirena.=
org.uk/scheduler/job/2407794
# good: [5cd67271caee30972d751ab3763c3de4b1fa73d0] Merge branch 'next' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
git bisect good 5cd67271caee30972d751ab3763c3de4b1fa73d0
# test job: [039a29817a494720c25222b6daf104bf230583a7] https://lava.sirena.=
org.uk/scheduler/job/2407855
# good: [039a29817a494720c25222b6daf104bf230583a7] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
git bisect good 039a29817a494720c25222b6daf104bf230583a7
# test job: [a142a51e64a948a70e8bcd5810fca89cab6347a5] https://lava.sirena.=
org.uk/scheduler/job/2407950
# bad: [a142a51e64a948a70e8bcd5810fca89cab6347a5] Merge branch 'clk-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
git bisect bad a142a51e64a948a70e8bcd5810fca89cab6347a5
# test job: [f5b748e97c52c31ad73b3534dfd1905efe664cc1] https://lava.sirena.=
org.uk/scheduler/job/2408066
# bad: [f5b748e97c52c31ad73b3534dfd1905efe664cc1] Merge branch 'clk-mediate=
k' into clk-next
git bisect bad f5b748e97c52c31ad73b3534dfd1905efe664cc1
# test job: [df9e5d59dcebe3217f1f5925f51b6beeb780c9b7] https://lava.sirena.=
org.uk/scheduler/job/2408105
# good: [df9e5d59dcebe3217f1f5925f51b6beeb780c9b7] Merge branch 'clk-spacem=
it' into clk-next
git bisect good df9e5d59dcebe3217f1f5925f51b6beeb780c9b7
# test job: [e98a16bf3cc49397a0fd88fe48d24e5f5f885707] https://lava.sirena.=
org.uk/scheduler/job/2408143
# good: [e98a16bf3cc49397a0fd88fe48d24e5f5f885707] Merge branch 'clk-amlogi=
c' into clk-next
git bisect good e98a16bf3cc49397a0fd88fe48d24e5f5f885707
# test job: [e9955171948a226ee834a3092d71684acce84b65] https://lava.sirena.=
org.uk/scheduler/job/2408163
# good: [e9955171948a226ee834a3092d71684acce84b65] Merge branch 'clk-cleanu=
p' into clk-next
git bisect good e9955171948a226ee834a3092d71684acce84b65
# test job: [ecffd05839b32f17bde1f3701b68ab182a837b07] https://lava.sirena.=
org.uk/scheduler/job/2408248
# bad: [ecffd05839b32f17bde1f3701b68ab182a837b07] clk: mediatek: Pass devic=
e to clk_hw_register for PLLs
git bisect bad ecffd05839b32f17bde1f3701b68ab182a837b07
# test job: [a2ed1aed687a21738a6c8bd4043149c443298e88] https://lava.sirena.=
org.uk/scheduler/job/2408288
# good: [a2ed1aed687a21738a6c8bd4043149c443298e88] dt-bindings: clock: medi=
atek,mt7622-pciesys: Remove syscon compatible
git bisect good a2ed1aed687a21738a6c8bd4043149c443298e88
# test job: [c9ced38af56fe6411118c6bc6522eab80849326d] https://lava.sirena.=
org.uk/scheduler/job/2408615
# bad: [c9ced38af56fe6411118c6bc6522eab80849326d] clk: mediatek: Refactor p=
ll registration to pass device
git bisect bad c9ced38af56fe6411118c6bc6522eab80849326d
# test job: [669917676e93fca5ea3c66fc9539830312bec58e] https://lava.sirena.=
org.uk/scheduler/job/2409704
# bad: [669917676e93fca5ea3c66fc9539830312bec58e] clk: Respect CLK_OPS_PARE=
NT_ENABLE during recalc
git bisect bad 669917676e93fca5ea3c66fc9539830312bec58e
# first bad commit: [669917676e93fca5ea3c66fc9539830312bec58e] clk: Respect=
 CLK_OPS_PARENT_ENABLE during recalc

--4q13lcztzbOrkIMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml472gACgkQJNaLcl1U
h9AkTgf+PALQMGAOZF1TVIlSACrGRcy0ufTYT5393mGU8/1n9lqDnkM2xHrAT4Qw
SBgo4elXc3eWpPMPo4KYqnsV8OdZ+bCHfJKFBxJQo3q55b4wMrYSsT1p2kNMLXvR
qPrJKeYqRnySEGMNn8sh2zlsCoiZ7TiVjfh8g9nDkBgNB69vFH3X/ZsZHg9QnUA1
cQUx7uO7ro7wr9omKxyceyCF9Vfr3TlR3Rn8fHe9JWbggnYZ+CrjNtzxvPNsh52s
5begxyeapKQhT5dMlmtP7PtRKZbFVucB3DDlAmR9d1lDZkbsABrkrIHeirrnIb+v
mSIpSxjm07yu9wgUkbrR9BaMEBN7LQ==
=eR4f
-----END PGP SIGNATURE-----

--4q13lcztzbOrkIMw--
