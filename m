Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F3B396D34;
	Thu, 26 Feb 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096757; cv=none; b=jR8h8Xsn5saQigdJA26Xyfpjbf6h/0q7iFWmAmjNi1kP9HgWzHE5sR0V1n8lFku2mBx1K1qbzUEFMd+/mqbc5o/s9ptl0MWIbK5/qVNJnsjmO2W0QzjdVsQIQu/CfUg438nmMKDaDESBKzhCv12FDg0feTlkky6ZijgEg4ZHOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096757; c=relaxed/simple;
	bh=Vc8NrRbBLNW6EXEF9mV+MOIrYGXefvukpmpF0netPi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHKRANt/4wPinIKG2PFK4++yQ5LZrSo7lJVjkauDvUEhyfZAPC8WTJxXsKcqjcVxmwtht14FeyaNqmzSNiNyBmdZPAzw3az2ycMSOJgVnj34O2XSN2XFhaBqaztSzW3BgVkmU3jY8MlfZaM6U+EO6DDxJPKdfoNse461i5rgCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAnPaDgDKBpHLwDAA--.18033S2;
	Thu, 26 Feb 2026 17:05:38 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	ganboing@gmail.com,
	marcel@ziswiler.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v14 0/4] Add driver support for ESWIN eic700 SoC clock controller
Date: Thu, 26 Feb 2026 17:05:13 +0800
Message-Id: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAnPaDgDKBpHLwDAA--.18033S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGw48Ww4DXryktryrXw4Utwb_yoW8Jr45Ko
	Z7Gr4jqF40q3y5Cr92ywn3Cay3Wr92qr1fJayUCryDGasrXFs5G3WrCa43X34SyF18ZF1D
	tw12y397t3WxJFyfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYK7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRK1vVDUUUU
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

The link [1] provides the official documentation for the EIC7700. Section 3.2
covers the clock subsystem.

[1] https://www.sifive.com/document-file/eic7700x-datasheet

Updates:
  Change in v14:
  - Updated driver file
    - Change the error code returned from eswin_clk_init() from -EAGAIN
      to PTR_ERR(clk_data).
    - In eswin_clk_init(), replace NULL returns with appropriate error pointers:
      - Use ERR_PTR(-ENOMEM) for devm_kzalloc() failure.
      - Use ERR_PTR(-EINVAL) for devm_platform_ioremap_resource() failure
        and remove dev_err().
    - Add the CLK_IGNORE_UNUSED flag to gate clocks. When clk_ignore_unused
      is dropped during testing, these clocks should remain enabled.
    - Modify the frac calculation formula to:
      frac = (rate * 4 % parent_rate * (2^24)) / parent_rate
    - Add step-by-step calculation descriptions in eswin_calc_pll.
      Remove the tmp1 and temp2 variables, using only
      'rem = do_div(tmp, parent_rate)' to calculate frac.
      The previous calculation formula was overly complex.
    - Rename offset to reg in clock structures. Also, rename reg to ctrl_reg
      in the divider clock structure.
    - All lines are limited to 80 characters.
      In cases with long function call parameter lists, lines may extend to
      100 characters to preserve readability.
    - Drop linux/delay.h header file.
    - Add devm_clk_hw_register_divider_parent_data() to clk-provider.h (preparatory patch).
    - Replace clk_hw_register_divider_parent_data() with
      devm_clk_hw_register_divider_parent_data.

  - Link to v13: https://lore.kernel.org/all/20260214101421.228-1-dongxuyang@eswincomputing.com/

  Change in v13:
  - Updated driver file
    - Modify commit subject from "clock: eswin: ..." to "clk: eswin: ...".
    - Use parent rate to calculate PLL clock rate.
    - Use GENMASK() to define PLL mask macros and use FIELD_PREP() to simplify
      bitwise operations.
    - Remove shift and width references for pll enable, refdiv, fbdiv, frac and postdiv.
      (Use only the PLL macros to match the functionality)
    - Set postdiv1 and postdiv2 in clk_pll_set_rate function.

  - Link to v12: https://lore.kernel.org/all/20260213094112.115-1-dongxuyang@eswincomputing.com/

  Change in v12:
  - Updated driver file
    - Add CLK_MUX_ROUND_CLOSEST to the mux clocks since they need a more
      accurate clock frequency.
    - Change 'rem' from u64 to u32 for function 'eswin_calc_pll' and
      function 'clk_pll_recalc_rate'.
    - Change 'rate' from u64 to unsigned long for function 'clk_pll_recalc_rate'.
    - Fix build error with u64 divisor for function `clk_pll_set_rate'.
      Reported-by: kernel test robot <lkp@intel.com>
      Closes: https://lore.kernel.org/oe-kbuild-all/202602111424.mhTAakDX-lkp@intel.com/

  - Link to v11: https://lore.kernel.org/all/20260210095008.726-1-dongxuyang@eswincomputing.com/

  Change in v11:
  - Updated driver file
    - Add "Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77" tag.
    - Fix build error in function eswin_clk_register_clks.
      Reported-by: kernel test robot <lkp@intel.com>
      Closes: https://lore.kernel.org/oe-kbuild-all/202602060520.p4Hg35Ja-lkp@intel.com/

  - Link to v10: https://lore.kernel.org/all/20260205093322.1030-1-dongxuyang@eswincomputing.com/

  Changes in v10:
  - Updated driver file
    - Add a private clock divider API named 'eswin_register_clkdiv' to
      register divider clocks with private flag.
      Define 'ESWIN_PRIV_DIV_MIN_2' private flag for registering the clock
      dividers whose division ratio start from 2.
      Implement the private set_rate, recalc_rate, and determine_rate accordingly.
    - Add CLK_DIVIDER_ALLOW_ZERO flag to the clock dividers whose division
      ratio start from 0.
    - Replace CONFIG_ARCH_ESWIN with CONFIG_COMMON_CLK_ESWIN in the Makefile.
    - Modify the help description of COMMON_CLK_EIC7700.
    - Move register offset definitions from 'clk-eic7700.h' to 'clk-eic7700.c' and
      remove the 'clk-eic7700.h'. Remove '_CTRL' from the offset names.
    - Remove all unused headers.
    - Use devm_platform_ioremap_resource() instead of devm_of_iomap().
    - Export the functions from clk.c as symbols.
    - Use readl_poll_timeout().
    - Use 'clk_parent_data' and '.hw' instead of string parent names.
    - Rename the header file from clk.h to common.h.
    - Rename macros from EIC7700_* to ESWIN_* in common.h.
    - Add a new function, 'eswin_clk_register_clks', which can register
      divider, mux, gate, and fixed-factor clocks based on their types.
    - Add structure 'eswin_clk_info' to manage the clocks that need to be registered
      in a specific order.
    - Add macros 'ESWIN_*_TYPE' to define divider, mux, gate, and fixed-factor clocks
      with type. Add enum 'eswin_clk_type' for these types.
    - Remove 'eswin_clk_register_mux_tbl'. Use 'eswin_clk_register_mux' to register
      mux clocks with or without table.
    - Add xtal24m as the parent clock of the PLL.
    - Change 2025 to 2026 in all files.

  - Link to v9: https://lore.kernel.org/all/20251229105844.1089-1-dongxuyang@eswincomputing.com/

  Changes in v9:
  - Updated driver file
    - Checked return values of eswin_clk_register_*() in the probe function.
    - Removed binding IDs check from pll functions in clk.c, as these functions
      were exclusively used by pll clocks and did not require ID validation.
    - The PLL structure has been extended with max_rate and min_rate fields to
      explicitly define the frequency operating range of the PLL. These limits
      were now utilized by the clk_pll_determine_rate() function.
    - Removed __clk_lookup() in clk_pll_set_rate. Added clk_notifier support
      in clk-eic7700.c.
    - Added five previously missing clocks from [1].

  - Link to v8: https://lore.kernel.org/all/20251113013637.1109-1-dongxuyang@eswincomputing.com/

  Changes in v8:
  - Updated YAML file
    - Added "Acked-by: Troy Mitchell <troy.mitchell@linux.dev>"
  - Updated driver file
    - Changed Kconfig from bool to tristate.
  - Updated MAINTAINERS file
    - Added "ESWIN SOC SERIES CLOCK DRIVER"

  - Link to v7: https://lore.kernel.org/all/20251023071658.455-1-dongxuyang@eswincomputing.com/

  Changes in v7:
  - Updated YAML file
    - Added "Acked-by: Conor Dooley <conor.dooley@microchip.com>" for bindings.
  - Updated driver file
    - Added description for clk of eswin_calc_pll().
    - Added macro EIC7700_MUX_TBL to manage mux clock-tree.
    - Added eswin_clk_register_mux_tbl() to register mux clocks with
      discontinuous parent indexes.

  - Link to v6: https://lore.kernel.org/all/20251009092029.140-1-dongxuyang@eswincomputing.com/

  Changes in v6:
  - Removed config option patch dependency from cover letter, because the patch
    was applied.
  - Updated YAML file
    - Added an oscillator as the clock input, named xtal24m.
    - Added clocks property.
  - Updated driver file
    - Replaced fixed_rate_clk_xtal_24m with xtal24m.
    - Dropped fixed_rate_clk_xtal_24m from driver. Because clock xtal24m was
      registered by fixed-clock as oscillator.

  - Link to v5: https://lore.kernel.org/all/20250923084637.1223-1-dongxuyang@eswincomputing.com/

  Changes in v5:
  - Removed vendor prefix patch dependency from cover letter, because the patch
    was applied.
  - Updated YAML file
    - Placed the required after all properties.
    - Removed patternProperties. Also removed compatible of eswin,pll-clock,
      eswin,mux-clock, eswin,divider-clock and eswin,gate-clock as we have moved
      clock tree from DTS to Linux driver.
    - Removed the clock tree from DTS. Used clock-controller to manage all
      clock. Removed all child nodes in clock-controller.
    - Removed '#address-cells' and '#size-cells' properties, because the clock
      controller did not need to define these properties.
    - Removed eic7700-clocks.dtsi.
    - Added dt-bindings header for clock IDs. Because used the IDs to register
      clocks.
  - Updated driver file
    - Modified the commit for clock driver. Dropped indentation in commit.
    - Removed CLK_OF_DECLARE(). Used *clk_hw_register* to register clocks. Used
      devm_of_clk_add_hw_provider.
    - Dropped singletons.
    - Checked the value right after obtaining it.
    - Removed the definitions of macro frequency in clk.h like CLK_FREQ_24M.
    - Modified description of help in Kconfig.
    - Added COMPILE_TEST. Added COMMON_CLK_ESWIN for clk.o. And added
      "select COMMON_CLK_ESWIN" for clk-eic7700.c. Without COMMON_CLK_EIC7700,
      clk.c could not be compiled.
    - Used .determined_rate.
    - Added macro definitions of EIC7700_DIV, EIC7700_FIXED, EIC7700_FACTOR,
      EIC7700_MUX and EIC7700_PLL to manage clock tree.
    - Added clk-eic7700.h to place eic7700 SoC clock registers.
    - Removed refdiv_val and postdiv1_val from clk_pll_recalc_rate(). Because
      these values were unused.

  - Link to v4: https://lore.kernel.org/all/20250815093539.975-1-dongxuyang@eswincomputing.com/

  Changes in v4:
  - Updated YAML file
    - Changed name from cpu-default-frequency to cpu-default-freq-hz.
    - Dropped $ref of cpu-default-frequency.
    - Added cpu-default-frequency for required.
    - Removed cpu-default-frequency in updated file, because there was no
      need to add cpu-default-frequency.
    - Moved DIVIDER to DIV.
    - Arranged the IDs in order.
    - Dropped EIC7700_NR_CLKS.
    - Removed dt-bindings eswin,eic7700-clock.h. Because IDs was not used,
      and used clock device nodes.
    - According to the updated driver codes, the YAML has been updated.
  - Updated driver file
    - Remove undocumented parameters "cpu_no_boost_1_6ghz" and
      "cpu-default-frequency".
    - Modified the comment and used the correct Linux coding style.
    - Removed codes of voltage, because it was not the clock driver.
    - Updated the formula of clock frequency calculation. Removed the logic
      that only used register selection.
    - Used CLK_OF_DECLARE() to register clocks. Registered pll-clock,
      mux-clock, divider-clock, and gate-clock in clk-eic7700.c.
      The specific implementation of clock registration was in clk.c.
    - Added eic7700-clocks.dtsi.
    - Moved device information to DTS. Put all clocks' node in the
      eic7700-clocks.dtsi.

  - Link to v3: https://lore.kernel.org/all/20250624103212.287-1-dongxuyang@eswincomputing.com/

  Changes in v3:
  - Update example, drop child node and add '#clock-cells' to the parent
    node.
  - Change parent node from sys-crg to clock-controller for this yaml.
  - Drop "syscon", "simple-mfd" to clear warnings/errors by using "make
    dt_binding_check". And these are not necessary.
  - Add "cpu-default-frequency" definition in yaml for "undocumented ABI".
  - Drop Reviewed-by, this is misunderstanding. We have not received such
    an email.
  - Link to v2: https://lore.kernel.org/all/20250523090747.1830-1-dongxuyang@eswincomputing.com/

  Changes in v2:
  - Update example, drop child node.
  - Clear warnings/errors for using "make dt_binding_check".
  - Change to the correct format.
  - Drop some non-stanard code.
  - Use dev_err_probe() in probe functions.
  - Link to v1: https://lore.kernel.org/all/20250514002233.187-1-dongxuyang@eswincomputing.com/

Xuyang Dong (4):
  dt-bindings: clock: eswin: Documentation for eic7700 SoC
  clk: divider: Add devm_clk_hw_register_divider_parent_data
  clk: eswin: Add eic7700 clock driver
  MAINTAINERS: Add entry for ESWIN EIC7700 clock driver

 .../bindings/clock/eswin,eic7700-clock.yaml   |   46 +
 MAINTAINERS                                   |    8 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/eswin/Kconfig                     |   15 +
 drivers/clk/eswin/Makefile                    |    8 +
 drivers/clk/eswin/clk-eic7700.c               | 1376 +++++++++++++++++
 drivers/clk/eswin/clk.c                       |  588 +++++++
 drivers/clk/eswin/common.h                    |  340 ++++
 .../dt-bindings/clock/eswin,eic7700-clock.h   |  285 ++++
 include/linux/clk-provider.h                  |   20 +
 11 files changed, 2688 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/common.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h

--
2.34.1

