Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299094;
	b=DE7TewCilr/RWW/hZhaVXZcBgXxhqOxJWJY0HonuFrlWll6FNeOt0A1ezyRNLA7sql8g
	 YjiK4AK6aH2jQSr7Cljyf7bON8mlMKpfsPmBw41T6YsgLl8FX2XnAb2CN/iYeIUCy0Kdr
	 rWhZnLe9ZAYyZ2M3a1OLUHAJ6nScy5zkMsQ3tS4Ian4YkLbuZjqUTPPJVmMs12juhyhju
	 mWsHCvTVG2YDiwjdoCtuUMaETd97HiMKK1pk5ElOYekpZRT7syIBdlmatd65VTf7xlwad
	 +mDnZtGtmXe3IVWwtxJ61i9iQ5LS5jzm+h9suC43nrymXfDkwzai7CV64q1RA5h7llg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299094;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7kdDEhlACU1V35D4EJ/f2hAlA3Gmsn/c7hB8vqRAijo=;
	b=bx+pDiWsbxl8KcqHo6kXdANchLeuxJ+Klpn7LojSiEEHf7JdzR3jbRoXTBsvMJL8hDJS
	 liQR3PNiHyu37Gj72W/alp2GKzlB/GKI2u0+L5CN5cVhR8KqoNrqwF3z6mzURY/u/Xxyo
	 GUGu8LJxKGeIMvsGgdhZwU5Jkpw71UffS7Vj5RoGY3WO/D/AFkLEVVyTAkKFcUnFy8/n+
	 AcTpDcOtzesxB5StxHysuCJUsLnkYQGdWzn30uYHXHd0Iq9rSWD1zfACm2MDRC35CzPXe
	 HTbEzFClqe7bQCc1w2FmG9u9v8ch9bUxpt2ykBR68ABO2mkAWkJslk8LxKuvtPxJW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inhKIseY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3073606A31F;
	Thu, 29 Oct 2026 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inhKIseY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17821F01825;
	Thu, 29 Oct 2026 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793299093;
	bh=7kdDEhlACU1V35D4EJ/f2hAlA3Gmsn/c7hB8vqRAijo=;
	h=From:To:Cc:Subject:Date;
	b=inhKIseYegeLNX5EBTXrNHEchFBPY1qfltpkwBe8hBQ/zaqSbpz5uCxxAgooNOWKS
	 C0OqBCT5SGQpsP9JUQwp5ZaxFdMPRdLsdYG29czAEkuHUA0DMqWSC5NhGkLBXWPF0Q
	 da5XQ6LVvOgLSxF2G3ZbvrpVGb44BhGdEpn3GwsYBJrzB6V7tHhJiWWaxeDXSFqEve
	 4XDdkRqwEKIJ0Z0JjRvoD/3YKNdFjU5Wn7vEfeUgxE4JRkBMQC/Q0x7xAN09oWY1s1
	 AfNPJc6q8YNV7sCzB3fw4d6WQMCUAgqwAFS7w/+Wic5+lS3HKVlhqH8k6IQWFGwPZ5
	 cf5sLrCcnc/ew==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Thu, 29 Oct 2026 11:38:10 -0700
Message-ID: <20261029183811.347902-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit c4a545d3e428e9600d670fa8a08098b7bc82d5ec:

  dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules (2026-10-02 21:17:31 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 0d9678b125d8315d62de1261bee67c7e6f21457e:

  Merge branches 'clk-renesas', 'clk-samsung', 'clk-starfive', 'clk-tenstorrent' and 'clk-pile' into clk-next (2026-10-26 19:48:58 -0400)

----------------------------------------------------------------
Here's the clk changes for the merge window which is dominated in the diffstat
by Qualcomm churning out new SoCs that need clk drivers. Looking beyond the
sheer amount of lines of mostly data there we have a clk nexus DT binding
change in the core clk framework and a driver core patch to add a subsys driver
macro. The clock nexus support is useful for devices that map clks internally
or for connectors on a board that route clock signals to another board. I
suspect the use of this will expand in the future, so we have unit tests to
make sure it doesn't break. The driver core change adds subsys_driver() and
subsys_platform_driver() so we can register early drivers without open-coding
that all (module_platform_driver() is at device initcall level so it isn't be
used).

Beyond the core framework bits we have lots of changes all over the tree to
initialize 'struct clk_init_data'. The potential risk here is that someone
forgets to initialize all the members of that structure and either the clk
flags cause weird behavior later on or the parents are pointing at junk and the
clk is orphaned forever. The patches just initialize the thing with zeroes to
be safe. Longer term we should probably move this struct out of 'struct clk_hw'
and pass it during clk registration time. That's a much bigger change and would
require restructuring entire drivers that rely on the pointer being there.

Finally, we have the usual fixes like calculation updates for dividers,
handling error paths during clk registration, or fixing clk data now that
drivers are using them. Those patches are dwarfed by the amount of new SoC
support and only affect those SoCs and the consumers of those clks. Overall I'm
more concerned the clk_init_data patches are going to expose some latent bugs
that we didn't notice before because something was relying on clks being
orphaned and now they're not.

Core:
 - subsys_driver() / subsys_platform_driver() macros
 - Clock nexus DT binding support (with KUnit tests)
 - Spread-spectrum configuration validation
 - Fully initialize struct clk_init_data across many drivers

New Drivers:
 - Anlogic DR1V90 CRU
 - ZTE zx297520v3 top, matrix, and LSP clocks
 - Samsung Exynos5515 and ACPM driver extended to Exynos850.
 - Qualcomm Eliza camera, camera-BIST, GPU, and video clks
 - Qualcomm Hawi / Maili camera and GPU controllers
 - Qualcomm Kuno global, RPMh
 - Qualcomm MSM8952 global, RPM
 - Qualcomm Nord camera/video clocks, EMAC interconnect, PHY resets
 - Qualcomm IPQ5210 / IPQ9650 network clocks
 - i.MX93 350 MHz fractional-N GP-PLL for display
 - i.MX pll14xx spread-spectrum clock generation
 - Amlogic A9 SCMI clock controller
 - Allwinner single-divider "update bit" support
 - EN7523 Serdes port selection

----------------------------------------------------------------
Aamir Ahmed (3):
      clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws
      clk: tenstorrent: Assign .num before accessing .hws
      clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws

Abel Vesa (80):
      MAINTAINERS: add Abel as reviewer for Qualcomm clocks drivers
      clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
      dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
      dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
      dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
      dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
      dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
      clk: qcom: gcc-eliza: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
      clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
      clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
      clk: qcom: gcc-sc7280: Tie the CX power domain to controller
      clk: qcom: gcc-sdx75: Tie the CX power domain to controller
      clk: qcom: gcc-sm4450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
      clk: qcom: gcc-ipq5424: Fix TME reset register offsets
      clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
      clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register offset
      clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
      clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
      clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: gcc-qcs615: Use common clock controller probe data
      clk: qcom: gcc-qcs8300: Use common clock controller probe data
      clk: qcom: gcc-sa8775p: Use common clock controller probe data
      clk: qcom: gcc-sar2130p: Use common clock controller probe data
      clk: qcom: gcc-sc7180: Use common clock controller probe data
      clk: qcom: gcc-sc7280: Use common clock controller probe data
      clk: qcom: gcc-sc8280xp: Use common clock controller probe data
      clk: qcom: gcc-sdx55: Use common clock controller probe data
      clk: qcom: gcc-sdx65: Use common clock controller probe data
      clk: qcom: gcc-sdx75: Use common clock controller probe data
      clk: qcom: gcc-sm4450: Use common clock controller probe data
      clk: qcom: gcc-sm7150: Use common clock controller probe data
      clk: qcom: gcc-sm8250: Use common clock controller probe data
      clk: qcom: gcc-sm8350: Use common clock controller probe data
      clk: qcom: gcc-sm8450: Use common clock controller probe data
      clk: qcom: gcc-sm8550: Use common clock controller probe data
      clk: qcom: gcc-sm8650: Use common clock controller probe data
      clk: qcom: gcc-sm8750: Use common clock controller probe data
      clk: qcom: gcc-x1e80100: Use common clock controller probe data
      clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
      clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
      clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks

Aiden Isik (3):
      dt-bindings: clock: Add Exynos5515 SoC
      clk: samsung: clk-pll: Add support for pll_309
      clk: samsung: Introduce Exynos5515 clock driver

Alastair D'Silva (1):
      clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock

Alexey Klimov (2):
      clk: samsung: acpm: introduce driver data for SoC-specific clocks
      clk: samsung: acpm: add Exynos850 support

AngeloGioacchino Del Regno (1):
      MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer

Anirudh Srinivasan (1):
      clk: tenstorrent: Fix refcount leak on shared gate clk enable failure

Ayman Chaudhry (1):
      clk: renesas: Add support for RZ/G2M v3.0

Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY reset
      clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset

Benoît Monin (2):
      clk: eyeq: Use devm_platform_ioremap_resource()
      clk: eyeq: Add mobileye,eyeq6h-central-olb compatible

Bhargav Joshi (5):
      dt-bindings: clock: ti,da850-pll: Convert to DT schema
      dt-bindings: clock: ti,dra7-atl-clock: convert to DT schema
      dt-bindings: clock: ti,dra7-atl: convert to dt-schema
      dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
      dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Biju Das (13):
      clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
      clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
      clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
      clk: renesas: rzg2l: Add support for divider flags
      clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with 4:7 duty cycle
      clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
      clk: renesas: r9a08g046: Sort macro definitions alphabetically
      clk: renesas: r9a08g046: Add MIPI DSI and LCDC clock/reset entries
      clk: renesas: r9a08g046: Add clock and reset entries for LVDS
      clk: renesas: r9a08g046: Add PCIe clocks and reset
      clk: renesas: r9a08g046: Propagate clk rate for ETH TX mux clocks
      clk: renesas: r9a08g046: Add CANFD clocks and resets
      clk: renesas: r9a08g046: Add TSU and ADC1 clocks and resets

Bill Wendling (1):
      clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr

Bjorn Andersson (10):
      Merge branch '20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260805-qcs8300-tsc-clks-v1-1-e7a5101ed479@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com' into HEAD
      Merge branch '20260921-msm8952-initial-support-v3-1-b96fd3fe298b@mainlining.org' into clk-for-7.4
      Merge branch '20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com' into clk-for-7.4

Brian Masney (14):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()
      Merge tag 'renesas-clk-for-v7.4-tag1' into clk-renesas
      Merge tag 'renesas-clk-for-v7.4-tag2' into clk-renesas
      Merge tag 'clk-starfive-jhb100-plus-soc-header' into clk-starfive
      Merge tag 'samsung-clk-7.4' into clk-samsung
      Merge tag 'tenstorrent-clk-for-v7.4' into clk-tenstorrent
      Merge tag 'sunxi-clk-for-7.4' into clk-allwinner
      Merge tag 'clk-microchip-7.4' into clk-microchip
      Merge tag 'clk-imx-7.4' into clk-imx
      Merge branches 'clk-allwinner', 'clk-amlogic', 'clk-imx', 'clk-microchip' and 'clk-qcom' into clk-next
      Merge branches 'clk-renesas', 'clk-samsung', 'clk-starfive', 'clk-tenstorrent' and 'clk-pile' into clk-next

Christian Marangi (2):
      dt-bindings: clock: airoha: Add PHY binding for Serdes port
      clk: en7523: Add support for selecting the Serdes port in SCU

Dario Binacchi (2):
      clk: validate spread spectrum configuration
      clk: imx: pll14xx: support spread spectrum clock generation

Dongfang Zhao (1):
      clk: qcom: Add support for Hawi GPUCC

Drew Fustini (Tenstorrent) (1):
      MAINTAINERS: Update RISC-V Tenstorrent SoC entry

Eduard Bostina (1):
      dt-bindings: clock: Convert TI Palmas Clock to DT schema

Erikas Bitovtas (1):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled

Esteban Urrutia (3):
      clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring

Francesco Dolcini (1):
      clk: clk-gpio: do not blame the DT property on probe deferral

Gabor Juhos (1):
      clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical

Gabriel Fernandez (1):
      clk: stm32: fix clock array size for STM32MP21

Geert Uytterhoeven (52):
      clk: aspeed: Make sure clk_init_data is fully initialized
      clk: at91: Make sure clk_init_data is fully initialized
      clk: bcm: iproc: Make sure clk_init_data is fully initialized
      clk: berlin: Make sure clk_init_data is fully initialized
      clk: cdce925: Make sure clk_init_data is fully initialized
      clk: clk-axi-clkgen: Make sure clk_init_data is fully initialized
      clk: cs2000-cp: Make sure clk_init_data is fully initialized
      clk: davinci: Make sure clk_init_data is fully initialized
      clk: fractional-divider: Make sure clk_init_data is fully initialized
      clk: gemini: Make sure clk_init_data is fully initialized
      clk: highbank: Make sure clk_init_data is fully initialized
      clk: hisilicon: Make sure clk_init_data is fully initialized
      clk: imx: Make sure clk_init_data is fully initialized
      clk: ingenic: Make sure clk_init_data is fully initialized
      clk: keystone: Make sure clk_init_data is fully initialized
      clk: lmk04832: Make sure clk_init_data is fully initialized
      clk: mediatek: Make sure clk_init_data is fully initialized
      clk: milbeaut: Make sure clk_init_data is fully initialized
      clk: mmp: Make sure clk_init_data is fully initialized
      clk: mvebu: Make sure clk_init_data is fully initialized
      clk: mxs: Make sure clk_init_data is fully initialized
      clk: nomadik: Make sure clk_init_data is fully initialized
      clk: npcm7xx: Make sure clk_init_data is fully initialized
      clk: nxp: Make sure clk_init_data is fully initialized
      clk: pistachio: Make sure clk_init_data is fully initialized
      clk: pwm: Make sure clk_init_data is fully initialized
      clk: rockchip: Make sure clk_init_data is fully initialized
      clk: samsung: Make sure clk_init_data is fully initialized
      clk: scpi: Make sure clk_init_data is fully initialized
      clk: silabs: Make sure clk_init_data is fully initialized
      clk: socfpga: Make sure clk_init_data is fully initialized
      clk: spear: Make sure clk_init_data is fully initialized
      clk: stm32: Make sure clk_init_data is fully initialized
      clk: st: Make sure clk_init_data is fully initialized
      clk: sunxi: Make sure clk_init_data is fully initialized
      clk: tegra: Make sure clk_init_data is fully initialized
      clk: uniphier: Make sure clk_init_data is fully initialized
      clk: ux500: Make sure clk_init_data is fully initialized
      clk: versatile: Make sure clk_init_data is fully initialized
      clk: vt8500: Make sure clk_init_data is fully initialized
      clk: x86: Make sure clk_init_data is fully initialized
      clk: xgene: Make sure clk_init_data is fully initialized
      clk: xilinx: Make sure clk_init_data is fully initialized
      clk: zynqmp: Make sure clk_init_data is fully initialized
      clk: renesas: Make sure clk_init_data is fully initialized
      clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops
      clk: renesas: rcar-gen3: Use FIELD_GET()
      clk: rs9: Add clock index range check to rs9_of_clk_get()
      clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
      Merge tag 'renesas-r8a774a3-dt-binding-defs-tag1' into renesas-clk-for-v7.4
      clk: renesas: rzg2l: Fix internal clock names
      clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc()

Georgios Androutsopoulos (1):
      rust: clk: document overflow panics in `Hertz` constructors

Hardeep Sharma (4):
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      clk: qcom: Add Global Clock Controller driver for Kuno

Hemanth Selam (1):
      clk: tegra: fix typos in comments

Imran Shaik (2):
      dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets

Jagadeesh Kona (6):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
      clk: qcom: Fix camera rivian PLL configuration settings
      clk: qcom: Add support for camera clock controller on Maili

Jerome Brunet (6):
      clk: renesas: Clean-up simple provider misuse of the consumer API
      clk: fix self-consuming provider module pinning
      clk: ti: clean-up simple provider misuse of the consumer API
      Merge tag 'clk-meson-v7.4-1' of https://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'qcom-clk-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      clk: cdce925: Size the PLL child name buffer for any int

Jian Hu (1):
      dt-bindings: clock: Add Amlogic A9 SCMI clock controller

John Madieu (2):
      clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
      clk: renesas: rzv2h: Convert to clk_hw based provider API

Junhui Liu (10):
      clk: sunxi-ng: div: Add feature support to M clock macro
      clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
      clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
      clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
      clk: correct clk_div_mask() return value for width == 32
      dt-bindings: clock: add Anlogic DR1V90 CRU
      clk: anlogic: add cru support for Anlogic DR1V90 SoC
      reset: anlogic: add support for Anlogic DR1V90 resets
      MAINTAINERS: Add Anlogic DR1V90 CRU driver entry
      dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional

Karl Mehltretter (2):
      clk: mediatek: reset: Fix device registration kernel-doc
      clk: aspeed: ast2700: select AUXILIARY_BUS

Kathiravan Thirumoorthy (4):
      clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks

Konrad Dybcio (4):
      clk: qcom: gcc-x1e80100: Don't poll the status bit of GCC_USB4_n_SYS_CLK
      clk: qcom: rcg2: Initialize shared floor clock state
      clk: qcom: rcg2: Propagate force-enable status errors
      clk: qcom: rcg2: Clear force enable after rate failure

Krzysztof Kozlowski (1):
      dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375

Kuninori Morimoto (2):
      clk: renesas: rcar-gen4: Tidy up DEF_GEN4_Z()
      clk: renesas: r8a779g0: Add ZG clocks

Lad Prabhakar (1):
      clk: renesas: r9a09g077: Register SYSC regmap

Linkai Gong (1):
      clk: imx: composite-93: return timeout from gate enable

Lucas Tanure (2):
      clk: meson: t7: keep the memory fabric clocks running
      clk: meson: t7: don't mark sys_ampipe_nand as critical

Luo Jie (10):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
      clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210

Matthias Goergens (1):
      MAINTAINERS: name the clk/linux clk-next branch

Michal Wilczynski (1):
      clk: starfive: jh7110-vout: Allow pixel clock rate propagation

Mikhail Vaniulin (1):
      clk: imx: fracn-gppll: Add 350 MHz support

Miquel Raynal (5):
      clk: nuvoton: ma35d1: Keep the clock count in the driver
      dt-bindings: clock: ma35d1: Document the missing crystal inputs
      dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
      dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks

Miquel Raynal (Schneider Electric) (7):
      dt-bindings: clock: Introduce nexus nodes
      clk: tests: Add clk_parse_clkspec() Kunit testing
      clk: tests: Add Kunit testing for of_clk_get_parent_name()
      clk: Improve a couple of comments
      clk: Use the generic OF phandle parsing in only one place
      clk: Add support for clock nexus dt bindings
      clk: tests: Add Kunit testing for nexus nodes

Muzaffer Kadir (3):
      dt-bindings: clock: qcom: Add MSM8952 global clock controller
      clk: qcom: Add global clock controller driver for MSM8952
      dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible

Myeonghun Pak (1):
      clk: ti: adpll: unregister OF clock provider on remove

Peijie Shao (1):
      clk: clocking-wizard: Fix overflow in clockout0 divisor calculation

Peng Fan (1):
      clk: tenstorrent: use regmap_assign_bits() for conditional set/clear

Pengpeng Hou (4):
      clk: s2mps11: Propagate OF provider registration failures
      clk: si521xx: correct the SI52147 OF output enable map
      clk: milbeaut: Return divider update timeouts
      clk: si5351: fail prepare when PLL reset times out

Qiang Yu (2):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper

Ricardo Ribalda (1):
      clk: mediatek: Add missing depend for COMMON_CLK_MT8173

Rob Herring (Arm) (1):
      dt-bindings: clock: Convert HiSilicon clocks to DT schema

Rosen Penev (7):
      clk: davinci: add COMPILE_TEST support
      clk: nuvoton: build with any architecture
      clk: actions: owl-pll: cast delay to unsigned long for udelay()
      clk: pistachio: Use flexible array for clock table
      clk: mmp: allow COMPILE_TEST builds
      clk: mmp2-audio: add missing PM_CLK dependency
      clk: tegra: bpmp: remove kcalloc

Shawn Guo (1):
      clk: qcom: Sort Nord clock driver entries in Kconfig

Sivansh Gupta (1):
      clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate

Slavin Liu (1):
      clk: starfive: jh7110: reject oscillator lookup errors

Sreeshankar K (2):
      dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
      clk: qcom: rpmh: Add SM7250 rpmh clocks

Srinivas Kandagatla (1):
      clk: qcom: fix SM6115 lpasscc register offset

Stefan Dösinger (9):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks

Taniya Das (9):
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
      clk: qcom: videocc-glymur: Add video clock controller support for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord
      clk: qcom: gcc: Fix GPLL enable register offset for Nord SoC
      dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
      clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

Triet Hoang (2):
      drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      clk: raspberrypi: Handle cpufreq device registration failure

Vivek Aknurwar (1):
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

Wentao Liang (4):
      clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
      clk: starfive: jh7110-isp: fix refcount leak in jh7110_ispcrg_probe()
      clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()

Wolfram Sang (1):
      clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS

Yury Norov (1):
      clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()

bui duc phuc (4):
      clk: si521xx: restore cache_only on regcache_sync() failure in resume
      clk: rs9: restore cache_only on regcache_sync() failure in resume
      clk: versaclock5: restore cache_only on regcache_sync() failure in resume
      clk: lmk04832: Handle reset GPIO lookup errors

hanzhijian (1):
      clk: mstar: msc313-mpll: fix off-by-one in clock array allocation

 .../bindings/clock/airoha,en7523-scu.yaml          |   24 +-
 .../bindings/clock/anlogic,dr1v90-cru.yaml         |   62 +
 .../bindings/clock/clk-palmas-clk32kg-clocks.txt   |   35 -
 .../bindings/clock/clock-nexus-node.yaml           |   30 +
 .../devicetree/bindings/clock/hi3660-clock.txt     |   47 -
 .../devicetree/bindings/clock/hi3670-clock.txt     |   43 -
 .../devicetree/bindings/clock/hi6220-clock.txt     |   52 -
 .../bindings/clock/hisilicon,clocks.yaml           |   51 +
 .../bindings/clock/hisilicon,hi6220-stub-clk.yaml  |   49 +
 .../bindings/clock/nuvoton,ma35d1-clk.yaml         |   16 +-
 .../bindings/clock/qcom,gcc-msm8952.yaml           |   65 +
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    6 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    7 +
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |   80 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    1 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   23 +-
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |    7 +
 .../bindings/clock/qcom,qcs8300-gcc.yaml           |    7 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    5 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |    7 +
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |    7 +
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |   53 -
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   47 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |    7 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 -
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |    7 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    7 +
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         |  114 +
 .../bindings/clock/samsung,exynos5515-cmu.yaml     |  145 +
 .../bindings/clock/ti,palmas-clk32kg.yaml          |   56 +
 .../devicetree/bindings/clock/ti/adpll.txt         |   39 -
 .../devicetree/bindings/clock/ti/davinci/pll.txt   |   96 -
 .../bindings/clock/ti/davinci/ti,da850-pll.yaml    |  164 +
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |   94 -
 .../devicetree/bindings/clock/ti/fapll.txt         |   31 -
 .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    |   88 +
 .../bindings/clock/ti/ti,dm816-fapll-clock.yaml    |   71 +
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       |   38 +
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  |  100 +
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 +
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 +
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 +
 MAINTAINERS                                        |   35 +-
 drivers/clk/Kconfig                                |   15 +-
 drivers/clk/Makefile                               |    9 +-
 drivers/clk/actions/owl-composite.h                |    1 -
 drivers/clk/actions/owl-fixed-factor.h             |    2 -
 drivers/clk/actions/owl-pll.c                      |    2 +-
 drivers/clk/anlogic/Kconfig                        |   21 +
 drivers/clk/anlogic/Makefile                       |    7 +
 drivers/clk/anlogic/cru-dr1v90.c                   |  192 ++
 drivers/clk/anlogic/cru_dr1.c                      |  226 ++
 drivers/clk/anlogic/cru_dr1.h                      |  117 +
 drivers/clk/aspeed/Kconfig                         |    1 +
 drivers/clk/aspeed/clk-aspeed.c                    |    2 +-
 drivers/clk/aspeed/clk-ast2600.c                   |    2 +-
 drivers/clk/aspeed/clk-ast2700.c                   |    2 +-
 drivers/clk/at91/clk-audio-pll.c                   |    4 +-
 drivers/clk/at91/clk-h32mx.c                       |    2 +-
 drivers/clk/at91/clk-main.c                        |    4 +-
 drivers/clk/at91/clk-pll.c                         |    2 +-
 drivers/clk/at91/clk-plldiv.c                      |    2 +-
 drivers/clk/at91/clk-slow.c                        |    2 +-
 drivers/clk/at91/clk-smd.c                         |    2 +-
 drivers/clk/at91/clk-usb.c                         |    6 +-
 drivers/clk/at91/sckc.c                            |    2 +-
 drivers/clk/bcm/clk-iproc-armpll.c                 |    2 +-
 drivers/clk/bcm/clk-iproc-asiu.c                   |    2 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |    2 +-
 drivers/clk/bcm/clk-raspberrypi.c                  |    2 +
 drivers/clk/berlin/berlin2-avpll.c                 |    4 +-
 drivers/clk/berlin/berlin2-pll.c                   |    2 +-
 drivers/clk/clk-axi-clkgen.c                       |    2 +-
 drivers/clk/clk-cdce925.c                          |   11 +-
 drivers/clk/clk-conf.c                             |   12 +-
 drivers/clk/clk-cs2000-cp.c                        |    2 +-
 drivers/clk/clk-en7523.c                           |  218 +-
 drivers/clk/clk-eyeq.c                             |   31 +-
 drivers/clk/clk-fractional-divider.c               |    2 +-
 drivers/clk/clk-gemini.c                           |    2 +-
 drivers/clk/clk-gpio.c                             |    2 +-
 drivers/clk/clk-highbank.c                         |    2 +-
 drivers/clk/clk-lmk04832.c                         |    9 +-
 drivers/clk/clk-milbeaut.c                         |   14 +-
 drivers/clk/clk-nomadik.c                          |    4 +-
 drivers/clk/clk-npcm7xx.c                          |    2 +-
 drivers/clk/clk-pwm.c                              |    2 +-
 drivers/clk/clk-renesas-pcie.c                     |   43 +-
 drivers/clk/clk-s2mps11.c                          |   12 +-
 drivers/clk/clk-scpi.c                             |    2 +-
 drivers/clk/clk-si514.c                            |    2 +-
 drivers/clk/clk-si521xx.c                          |   45 +-
 drivers/clk/clk-si5341.c                           |    2 +-
 drivers/clk/clk-si5351.c                           |   20 +-
 drivers/clk/clk-si544.c                            |    2 +-
 drivers/clk/clk-si570.c                            |    2 +-
 drivers/clk/clk-stm32f4.c                          |    4 +-
 drivers/clk/clk-stm32h7.c                          |    2 +-
 drivers/clk/clk-versaclock5.c                      |   12 +-
 drivers/clk/clk-vt8500.c                           |    4 +-
 drivers/clk/clk-xgene.c                            |    6 +-
 drivers/clk/clk.c                                  |   75 +-
 drivers/clk/clk.h                                  |    5 +-
 drivers/clk/clk_kunit_helpers.c                    |   31 +
 drivers/clk/clk_test.c                             |  151 +-
 drivers/clk/clkdev.c                               |    4 +-
 drivers/clk/davinci/Kconfig                        |   10 +
 drivers/clk/davinci/Makefile                       |    8 +-
 drivers/clk/davinci/da8xx-cfgchip.c                |    4 +-
 drivers/clk/davinci/pll.c                          |    2 +-
 drivers/clk/davinci/psc.c                          |    2 +-
 drivers/clk/hisilicon/clk-hi3559a.c                |    2 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |    2 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c            |    2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c             |    2 +-
 drivers/clk/hisilicon/clk-hix5hd2.c                |    2 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c          |    2 +-
 drivers/clk/hisilicon/clkgate-separated.c          |    2 +-
 drivers/clk/imx/clk-busy.c                         |    4 +-
 drivers/clk/imx/clk-composite-93.c                 |   11 +-
 drivers/clk/imx/clk-cpu.c                          |    2 +-
 drivers/clk/imx/clk-divider-gate.c                 |    2 +-
 drivers/clk/imx/clk-fixup-div.c                    |    2 +-
 drivers/clk/imx/clk-fixup-mux.c                    |    2 +-
 drivers/clk/imx/clk-frac-pll.c                     |    2 +-
 drivers/clk/imx/clk-fracn-gppll.c                  |    3 +-
 drivers/clk/imx/clk-gate-93.c                      |    2 +-
 drivers/clk/imx/clk-gate-exclusive.c               |    2 +-
 drivers/clk/imx/clk-gate2.c                        |    2 +-
 drivers/clk/imx/clk-lpcg-scu.c                     |    2 +-
 drivers/clk/imx/clk-pfd.c                          |    2 +-
 drivers/clk/imx/clk-pfdv2.c                        |    2 +-
 drivers/clk/imx/clk-pll14xx.c                      |  105 +-
 drivers/clk/imx/clk-pllv1.c                        |    2 +-
 drivers/clk/imx/clk-pllv2.c                        |    2 +-
 drivers/clk/imx/clk-pllv3.c                        |    2 +-
 drivers/clk/imx/clk-pllv4.c                        |    2 +-
 drivers/clk/imx/clk-scu.c                          |    4 +-
 drivers/clk/imx/clk-sscg-pll.c                     |    2 +-
 drivers/clk/imx/clk.c                              |   15 +-
 drivers/clk/ingenic/cgu.c                          |    2 +-
 drivers/clk/keystone/gate.c                        |    2 +-
 drivers/clk/keystone/pll.c                         |    2 +-
 drivers/clk/keystone/syscon-clk.c                  |    2 +-
 drivers/clk/kunit_clk_assigned_rates.h             |    4 +-
 drivers/clk/kunit_clk_parse_clkspec.dtso           |   31 +
 drivers/clk/mediatek/Kconfig                       |    1 +
 drivers/clk/mediatek/clk-cpumux.c                  |    2 +-
 drivers/clk/mediatek/reset.h                       |    6 +-
 drivers/clk/meson/t7-peripherals.c                 |   11 +-
 drivers/clk/mmp/Kconfig                            |    5 +
 drivers/clk/mmp/clk-apbc.c                         |    2 +-
 drivers/clk/mmp/clk-apmu.c                         |    2 +-
 drivers/clk/mmp/clk-frac.c                         |    2 +-
 drivers/clk/mmp/clk-gate.c                         |    2 +-
 drivers/clk/mmp/clk-mix.c                          |    2 +-
 drivers/clk/mmp/clk-pll.c                          |    2 +-
 drivers/clk/mstar/clk-msc313-mpll.c                |    2 +-
 drivers/clk/mvebu/ap-cpu-clk.c                     |    6 +-
 drivers/clk/mvebu/clk-corediv.c                    |    2 +-
 drivers/clk/mvebu/clk-cpu.c                        |    2 +-
 drivers/clk/mxs/clk-div.c                          |    2 +-
 drivers/clk/mxs/clk-frac.c                         |    2 +-
 drivers/clk/mxs/clk-pll.c                          |    2 +-
 drivers/clk/mxs/clk-ref.c                          |    2 +-
 drivers/clk/nuvoton/clk-ma35d1.c                   |    7 +-
 drivers/clk/nxp/clk-lpc18xx-creg.c                 |    2 +-
 drivers/clk/pistachio/clk-pll.c                    |    2 +-
 drivers/clk/pistachio/clk.c                        |   15 +-
 drivers/clk/pistachio/clk.h                        |    1 +
 drivers/clk/qcom/Kconfig                           |  149 +-
 drivers/clk/qcom/Makefile                          |    9 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 +++
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    7 +
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |    7 +
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++
 drivers/clk/qcom/camcc-glymur.c                    |    7 +
 drivers/clk/qcom/camcc-hawi.c                      | 3152 +++++++++++++++++
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++
 drivers/clk/qcom/camcc-sa8775p.c                   |   36 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |   13 +-
 drivers/clk/qcom/camcc-sm7150.c                    |   13 +-
 drivers/clk/qcom/camcc-sm8150.c                    |   13 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |    9 +
 drivers/clk/qcom/clk-rcg2.c                        |   35 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
 drivers/clk/qcom/clk-regmap-divider.h              |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   44 +
 drivers/clk/qcom/dispcc-sc7280.c                   |   13 +-
 drivers/clk/qcom/dispcc-sc8280xp.c                 |   18 +-
 drivers/clk/qcom/dispcc-sm4450.c                   |   15 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm7150.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8250.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |   40 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |   19 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |   27 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 |   15 +-
 drivers/clk/qcom/dispcc1-sa8775p.c                 |   15 +-
 drivers/clk/qcom/gcc-eliza.c                       |   13 +-
 drivers/clk/qcom/gcc-glymur.c                      |   81 +-
 drivers/clk/qcom/gcc-hawi.c                        |   12 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |   10 +
 drivers/clk/qcom/gcc-ipq5210.c                     |    1 +
 drivers/clk/qcom/gcc-ipq5332.c                     |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq9650.c                     |   22 +
 drivers/clk/qcom/gcc-kaanapali.c                   |   13 +-
 drivers/clk/qcom/gcc-kuno.c                        | 1473 ++++++++
 drivers/clk/qcom/gcc-milos.c                       |   12 +-
 drivers/clk/qcom/gcc-msm8939.c                     |    4 +
 drivers/clk/qcom/gcc-msm8952.c                     | 3548 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   12 +-
 drivers/clk/qcom/gcc-qcm2290.c                     |   12 +-
 drivers/clk/qcom/gcc-qcs615.c                      |   69 +-
 drivers/clk/qcom/gcc-qcs8300.c                     |  167 +-
 drivers/clk/qcom/gcc-qdu1000.c                     |   12 +-
 drivers/clk/qcom/gcc-sa8775p.c                     |   56 +-
 drivers/clk/qcom/gcc-sar2130p.c                    |   58 +-
 drivers/clk/qcom/gcc-sc7180.c                      |   60 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   67 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   47 +-
 drivers/clk/qcom/gcc-sdx55.c                       |   43 +-
 drivers/clk/qcom/gcc-sdx65.c                       |   43 +-
 drivers/clk/qcom/gcc-sdx75.c                       |   44 +-
 drivers/clk/qcom/gcc-shikra.c                      |   12 +-
 drivers/clk/qcom/gcc-sm4450.c                      |   77 +-
 drivers/clk/qcom/gcc-sm6115.c                      |   12 +-
 drivers/clk/qcom/gcc-sm6125.c                      |   12 +-
 drivers/clk/qcom/gcc-sm6375.c                      |   12 +-
 drivers/clk/qcom/gcc-sm7150.c                      |   72 +-
 drivers/clk/qcom/gcc-sm8150.c                      |   12 +-
 drivers/clk/qcom/gcc-sm8250.c                      |   69 +-
 drivers/clk/qcom/gcc-sm8350.c                      |   65 +-
 drivers/clk/qcom/gcc-sm8450.c                      |   64 +-
 drivers/clk/qcom/gcc-sm8550.c                      |   70 +-
 drivers/clk/qcom/gcc-sm8650.c                      |   72 +-
 drivers/clk/qcom/gcc-sm8750.c                      |   89 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   80 +-
 drivers/clk/qcom/gpucc-eliza.c                     |  606 ++++
 drivers/clk/qcom/gpucc-hawi.c                      |  477 +++
 drivers/clk/qcom/gpucc-sar2130p.c                  |   13 +-
 drivers/clk/qcom/gpucc-sc7280.c                    |   22 +-
 drivers/clk/qcom/gpucc-sc8280xp.c                  |   15 +-
 drivers/clk/qcom/gpucc-sm4450.c                    |   17 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |   15 +-
 drivers/clk/qcom/gpucc-x1e80100.c                  |   13 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |   17 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     |  538 ++-
 drivers/clk/qcom/lpasscc-sc7280.c                  |   12 +-
 drivers/clk/qcom/lpasscc-sdm845.c                  |   12 +-
 drivers/clk/qcom/lpasscc-sm6115.c                  |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |   31 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |    3 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    4 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    2 +-
 drivers/clk/qcom/negcc-nord.c                      |    5 +-
 drivers/clk/qcom/nwgcc-nord.c                      |    5 +-
 drivers/clk/qcom/segcc-nord.c                      |   40 +-
 drivers/clk/qcom/tcsrcc-eliza.c                    |   12 +-
 drivers/clk/qcom/tcsrcc-glymur.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-kaanapali.c                |   12 +-
 drivers/clk/qcom/tcsrcc-sm8550.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-sm8650.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-sm8750.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |  347 +-
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 drivers/clk/qcom/videocc-glymur.c                  |   38 +
 drivers/clk/qcom/videocc-sa8775p.c                 |   17 +-
 drivers/clk/qcom/videocc-sm6350.c                  |   13 +-
 drivers/clk/qcom/videocc-sm7150.c                  |   13 +-
 drivers/clk/qcom/videocc-sm8250.c                  |   15 +-
 drivers/clk/qcom/videocc-sm8350.c                  |   31 +-
 drivers/clk/qcom/videocc-sm8750.c                  |   12 +-
 drivers/clk/renesas/Kconfig                        |    7 +
 drivers/clk/renesas/Makefile                       |    1 +
 drivers/clk/renesas/r8a774a3-cpg-mssr.c            |  168 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |    6 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |    4 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |    4 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |    8 +-
 drivers/clk/renesas/r8a78000-cpg.c                 |    3 +
 drivers/clk/renesas/r9a06g032-clocks.c             |   10 +-
 drivers/clk/renesas/r9a07g043-cpg.c                |   12 +-
 drivers/clk/renesas/r9a07g044-cpg.c                |   12 +-
 drivers/clk/renesas/r9a08g045-cpg.c                |    6 +-
 drivers/clk/renesas/r9a08g046-cpg.c                |  117 +-
 drivers/clk/renesas/r9a09g077-cpg.c                |  142 +
 drivers/clk/renesas/rcar-gen3-cpg.c                |   15 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    3 +-
 drivers/clk/renesas/rcar-gen4-cpg.c                |   25 +-
 drivers/clk/renesas/rcar-gen4-cpg.h                |   14 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   16 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    2 +
 drivers/clk/renesas/rzg2l-cpg.c                    |  561 +++-
 drivers/clk/renesas/rzg2l-cpg.h                    |   51 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |  171 +-
 drivers/clk/rockchip/clk-cpu.c                     |    2 +-
 drivers/clk/rockchip/clk-ddr.c                     |    2 +-
 drivers/clk/rockchip/clk-gate-grf.c                |    2 +-
 drivers/clk/rockchip/clk-inverter.c                |    2 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |    2 +-
 drivers/clk/rockchip/clk-muxgrf.c                  |    2 +-
 drivers/clk/rockchip/clk-pll.c                     |    2 +-
 drivers/clk/rockchip/clk.c                         |    2 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-acpm.c                     |   61 +-
 drivers/clk/samsung/clk-cpu.c                      |    2 +-
 drivers/clk/samsung/clk-exynos-clkout.c            |    8 +-
 drivers/clk/samsung/clk-exynos5515.c               | 1484 ++++++++
 drivers/clk/samsung/clk-pll.c                      |    3 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/clk/socfpga/clk-gate-a10.c                 |    2 +-
 drivers/clk/socfpga/clk-gate-s10.c                 |    6 +-
 drivers/clk/socfpga/clk-gate.c                     |    2 +-
 drivers/clk/socfpga/clk-periph-a10.c               |    2 +-
 drivers/clk/socfpga/clk-periph-s10.c               |    8 +-
 drivers/clk/socfpga/clk-periph.c                   |    2 +-
 drivers/clk/socfpga/clk-pll-a10.c                  |    2 +-
 drivers/clk/socfpga/clk-pll-s10.c                  |    8 +-
 drivers/clk/socfpga/clk-pll.c                      |    2 +-
 drivers/clk/spear/clk-aux-synth.c                  |    2 +-
 drivers/clk/spear/clk-frac-synth.c                 |    2 +-
 drivers/clk/spear/clk-gpt-synth.c                  |    2 +-
 drivers/clk/spear/clk-vco-pll.c                    |    2 +-
 drivers/clk/st/clk-flexgen.c                       |    2 +-
 drivers/clk/st/clkgen-fsyn.c                       |    4 +-
 drivers/clk/st/clkgen-pll.c                        |    2 +-
 drivers/clk/starfive/clk-starfive-jh7110-isp.c     |    2 +-
 drivers/clk/starfive/clk-starfive-jh7110-sys.c     |    3 +
 drivers/clk/starfive/clk-starfive-jh7110-vout.c    |    6 +-
 drivers/clk/stm32/clk-stm32mp1.c                   |    4 +-
 drivers/clk/stm32/clk-stm32mp21.c                  |    4 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c           |   37 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c             |  128 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |    2 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |   18 +-
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c             |    2 +-
 drivers/clk/tegra/clk-audio-sync.c                 |    2 +-
 drivers/clk/tegra/clk-bpmp.c                       |   12 +-
 drivers/clk/tegra/clk-divider.c                    |    2 +-
 drivers/clk/tegra/clk-periph-fixed.c               |    2 +-
 drivers/clk/tegra/clk-periph-gate.c                |    2 +-
 drivers/clk/tegra/clk-periph.c                     |    2 +-
 drivers/clk/tegra/clk-pll-out.c                    |    2 +-
 drivers/clk/tegra/clk-pll.c                        |    2 +-
 drivers/clk/tegra/clk-sdmmc-mux.c                  |    2 +-
 drivers/clk/tegra/clk-super.c                      |    4 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           |    2 +-
 drivers/clk/tegra/clk-tegra124-emc.c               |    2 +-
 drivers/clk/tegra/clk-tegra20-emc.c                |    2 +-
 drivers/clk/tegra/clk-tegra210-emc.c               |    2 +-
 drivers/clk/tegra/clk.h                            |    2 +-
 drivers/clk/tenstorrent/atlantis-prcm.c            |   35 +-
 drivers/clk/ti/adpll.c                             |    1 +
 drivers/clk/ti/clockdomain.c                       |    2 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c        |    2 +-
 drivers/clk/uniphier/clk-uniphier-fixed-factor.c   |    2 +-
 drivers/clk/uniphier/clk-uniphier-fixed-rate.c     |    2 +-
 drivers/clk/uniphier/clk-uniphier-gate.c           |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c            |    2 +-
 drivers/clk/ux500/clk-prcc.c                       |    2 +-
 drivers/clk/ux500/clk-prcmu.c                      |    4 +-
 drivers/clk/ux500/clk-sysctrl.c                    |    2 +-
 drivers/clk/versatile/clk-icst.c                   |    6 +-
 drivers/clk/versatile/clk-sp810.c                  |    2 +-
 drivers/clk/versatile/clk-vexpress-osc.c           |    2 +-
 drivers/clk/x86/clk-pmc-atom.c                     |    2 +-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c         |   18 +-
 drivers/clk/xilinx/xlnx_vcu.c                      |    2 +-
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 ++
 drivers/clk/zte/clk-zx.c                           |  192 ++
 drivers/clk/zte/clk-zx.h                           |  137 +
 drivers/clk/zte/clk-zx297520v3.c                   | 1657 +++++++++
 drivers/clk/zte/pll-zx.c                           |  576 ++++
 drivers/clk/zynqmp/clk-gate-zynqmp.c               |    2 +-
 drivers/clk/zynqmp/clk-mux-zynqmp.c                |    2 +-
 drivers/clk/zynqmp/divider.c                       |    2 +-
 drivers/clk/zynqmp/pll.c                           |    2 +-
 drivers/reset/Kconfig                              |   10 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-dr1v90.c                       |  140 +
 include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |   46 +
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h     |    3 +-
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 +
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 include/dt-bindings/clock/qcom,gcc-msm8952.h       |  215 ++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 +
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |   47 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |   30 +
 include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 +
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 +
 include/dt-bindings/clock/qcom,nord-negcc.h        |    1 +
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
 include/dt-bindings/clock/qcom,nord-segcc.h        |    2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |    6 +
 .../dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h  |   59 +
 include/dt-bindings/clock/samsung,exynos5515-cmu.h |  191 ++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  154 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   28 +
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |   41 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 include/dt-bindings/soc/airoha,scu-ssr.h           |   11 +
 include/kunit/clk.h                                |    2 +
 include/linux/clk-provider.h                       |   25 +-
 include/linux/clk/tegra.h                          |    2 +-
 include/linux/clk/ti.h                             |    2 +-
 include/linux/device/driver.h                      |   31 +
 include/linux/platform_device.h                    |   30 +
 rust/kernel/clk.rs                                 |   15 +
 428 files changed, 28794 insertions(+), 2659 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/hi3660-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/hi3670-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8952.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos5515-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/adpll.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/fapll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 create mode 100644 drivers/clk/anlogic/Kconfig
 create mode 100644 drivers/clk/anlogic/Makefile
 create mode 100644 drivers/clk/anlogic/cru-dr1v90.c
 create mode 100644 drivers/clk/anlogic/cru_dr1.c
 create mode 100644 drivers/clk/anlogic/cru_dr1.h
 create mode 100644 drivers/clk/davinci/Kconfig
 create mode 100644 drivers/clk/kunit_clk_parse_clkspec.dtso
 create mode 100644 drivers/clk/qcom/cambistmclkcc-eliza.c
 create mode 100644 drivers/clk/qcom/camcc-eliza.c
 create mode 100644 drivers/clk/qcom/camcc-hawi.c
 create mode 100644 drivers/clk/qcom/camcc-nord.c
 create mode 100644 drivers/clk/qcom/gcc-kuno.c
 create mode 100644 drivers/clk/qcom/gcc-msm8952.c
 create mode 100644 drivers/clk/qcom/gpucc-eliza.c
 create mode 100644 drivers/clk/qcom/gpucc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-eliza.c
 create mode 100644 drivers/clk/renesas/r8a774a3-cpg-mssr.c
 create mode 100644 drivers/clk/samsung/clk-exynos5515.c
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-regmap.c
 create mode 100644 drivers/clk/zte/clk-zx.c
 create mode 100644 drivers/clk/zte/clk-zx.h
 create mode 100644 drivers/clk/zte/clk-zx297520v3.c
 create mode 100644 drivers/clk/zte/pll-zx.c
 create mode 100644 drivers/reset/reset-dr1v90.c
 create mode 100644 include/dt-bindings/clock/amlogic,a9-scmi-clkc.h
 create mode 100644 include/dt-bindings/clock/anlogic,dr1v90-cru.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8952.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,kuno-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-camcc.h
 create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos5515-cmu.h
 create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9650.h
 create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 create mode 100644 include/dt-bindings/reset/anlogic,dr1v90-cru.h
 create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
