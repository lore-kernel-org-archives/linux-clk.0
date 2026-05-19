Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55B93DD87F;
	Tue, 19 May 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178514; cv=none; b=PrxyFeEo6ZNhJrtyL4+CZDq10dbgbpXbfMJ9YEb4x1qCNHzctLClNoLfOQ10cFGsDtkn1DVjTJcybpu+cbQLz509dkAX88dp/WtaOUtkZVkGGV3j13ptrZ0BYIyAvLy4kag7goJhCgfUR3Fnt7coZDjiaHDcFcfnK3pWVyQCkrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178514; c=relaxed/simple;
	bh=p0JJ3zONhx4U6NLm4HDeRG2U2IZtj1r4oOI8sbOIJKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RzbeQpR1e0qnRtR4xJvznLDGx7s7l+DhzRUCZ+eUfWVoPTlo+V3y5N4CFlBHxuW+RFJqqWkXV8Fkm0SuuSFUsngjq5o7JjEaQWrguXavM/VTo6PASs9lwTGcBJSZm5uwWGofK9FNb3H7dre6yhjPrOtj52/sYzhK6gnNrxjvYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgBXbaDtGwxqFa0aAA--.20072S2;
	Tue, 19 May 2026 16:14:38 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	benoit.monin@bootlin.com,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH v6 0/3] Add driver support for ESWIN EIC7700 HSP clock and reset generator
Date: Tue, 19 May 2026 16:14:31 +0800
Message-Id: <20260519081431.1424-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgBXbaDtGwxqFa0aAA--.20072S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw17Zr1UtrWUWFyDuFyxAFb_yoWxZw43pF
	WxGF93Gr1DZrWI9rs7ta4I9FyfJa1xJFy5Cws7Ja47Zws0yryUCr40ka45AFWDZwn3Xr4U
	J3W7ta409FWjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjgxUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add support for the ESWIN EIC7700 HSP (high-speed peripherals). The drivers
provide basic functionality to manage and control the clock and reset
signals for EIC7700 HSP, including mmc, USB, ethernet, SATA and DMAC.

The clock and reset registers are mapped to overlapping I/O address ranges.
This causes a resource conflict when two drivers attempt to request the
same region. Use the auxiliary device framework: the main driver
allocates the shared register region and passes it to auxiliary
devices, avoiding resource contention and duplicate remapping.

Features:
Implements support for the ESWIN EIC7700 HSP clock and reset controller.
Provide API to manage clock and reset signals for the EIC7700 HSP.

Supported chips:
ESWIN EIC7700 series SoC.

Test:
Test this patch on the Sifive HiFive Premier P550 (which used the EIC7700
SoC), include USB and other peripherals. All the drivers of these modules
use the clock module and reset module.

Updates:
  Changes in v6:
  - Clock driver:
    - Add 'select REGMAP_MMIO' for Kconfig entry (Sashiko review of v5).
  - Reset driver:
    - Add <linux/module.h> (Sashiko review of v5).

  - Link to v5: https://lore.kernel.org/all/20260514114212.903-1-dongxuyang@eswincomputing.com/

  Changes in v5:
  - Clock driver:
    - Add check for regmap_read().
    - Add "Reviewed-by: Brian Masney <bmasney@redhat.com>".

  - Link to v4: https://lore.kernel.org/all/20260512020432.671-1-dongxuyang@eswincomputing.com/

  Changes in v4:
  - Clock driver:
    - Remove "Reviewed-by: Benoît Monin <benoit.monin@bootlin.com>" and
      "Reviewed-by: Brian Masney <bmasney@redhat.com>", because the clock
      driver has been updated.
    - Remove inclusion of io.h.
    - Add struct regmap to eic7700_hsp_clk_gate.
      Replace 'void __iomem *reg' with 'unsigned int reg'.
      Replace 'void __iomem *ref_reg' with 'unsigned int ref_reg'.
      Replace long with int for 'offset' and 'ref_offset'.
      Remove 'spinlock_t *lock'.
      Apply the same changes to hsp_clk_register_gate().
    - Remove the structure eic7700_hsp_regmap_lock, and the functions
      eic7700_hsp_regmap_lock() and eic7700_hsp_regmap_unlock().
    - Remove the 'guard(spinlock_irqsave)(gate->lock)' in
      hsp_clk_gate_endisable().
    - Replace readl() and writel() with regmap_assign_bits() in
      hsp_clk_gate_endisable().
    - Change the parameter enable from int to bool.
    - Replace readl() with regmap_read() in hsp_clk_gate_is_enabled().
    - Remove the lock_ctx variable.
    - Move eic7700_hsp_regmap_config from inside the probe function to global
      scope.
      Remove '.lock', '.unlock' and 'lock_arg'.
      Add '.fast_io = true' and '.use_raw_spinlock = true'.
  - Reset driver:
    - Add "Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>" for reset.
    - Drop the temporary variable, just return regmap_assign_bits(...) directly.
    - Replace -EINVAL with -ENODEV for dev_get_regmap() check.
    - Drop the '_dt'.

  - Link to v3: https://lore.kernel.org/all/20260423090904.2108-1-dongxuyang@eswincomputing.com/

  Changes in v3:
  - Bindings:
    - Added "Acked-by: Conor Dooley <conor.dooley@microchip.com>" for bindings.
  - Clock driver:
    - Remove 'gate_flags'.
    - Add __acquires for eic7700_hsp_regmap_lock() and add __releases for
      eic7700_hsp_regmap_unlock().
    - Move writel(USB_REF_XTAL24M, gate->ref_reg) into enable. Because this
      is only used for USB gate clock on the enable path. And modify the
      comments.
    - Simplify to: 'return !!(readl(gate->reg) & BIT(gate->bit_idx));'.
    - Drop const from eic7700_hsp_regmap_config.
    - Declare eic7700_hsp_regmap_config as a regular variable at the top.

  - Link to v2: https://lore.kernel.org/all/20260420093929.1895-1-dongxuyang@eswincomputing.com/

  Changes in v2:
  - Bindings:
    - Remove "hsp_" from clock-names.
    - Replace "eswin,eic7700-clock.yaml" and "eswin,eic7700-hspcrg.yaml" with
      "eswin,eic7700*".
    - Replace "eswin,eic7700-clock.h" and "eswin,eic7700-hspcrg.h" with
      "eswin,eic7700*".
  - Clock driver:
    - Use guard(spinlock_irqsave)(gate->lock) instead of spin_lock_irqsave()
      and remove spin_unlock_irqrestore().
    - Remove the newline in function hsp_clk_gate_is_enabled().
    - Use struct clk_init_data init = {}.
    - Replace 'static struct clk_parent_data' with
      'static const struct clk_parent_data'.
    - Change '.fw_name' to '.index', because the function
      eswin_clk_register_fixed_factor() uses .index.
    - The structures of clocks should use static struct. When registering a clock,
      the 'hw' field in the structure will be assigned.
    - Remove __force.
    - Create the regmap in the clock driver and remove (__force void*)data->base.
      The reset driver uses dev_get_regmap() to get the regmap from the clock.
    - Move 'const struct regmap_config eic7700_hsp_regmap_config' from reset
      driver to clock driver.
    - The USB clock gate (hsp_clk_gate_endisable) and the reset driver both
      perform read-modify-write cycles on registers 0x800 and 0x900. Use
      custom regmap lock callbacks so that regmap operations hold data->lock
      with IRQs disabled, the same lock the clock gate path uses, preventing
      concurrent RMW races on those shared registers.
    - Change to 'ret = eswin_clk_register_fixed_factor(dev, eic7700_hsp_factor_clks,'.
      The next line will be over 80 characters and under 100 characters.
  - Reset driver:
    - Remove 'depends on COMMON_CLK_EIC7700_HSP' and 'default COMMON_CLK_EIC7700_HSP'.
    - Use regmap_assign_bits() in assert and deassert functions.
    - Remove eic7700_hsp_reset_reset().
    - The clock driver creates the regmap, and the reset driver uses dev_get_regmap().
    - Remove of_reset_n_cells.

  - Link to v1: https://lore.kernel.org/all/20260403093459.612-1-dongxuyang@eswincomputing.com/

Xuyang Dong (3):
  dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
  clk: eswin: Add eic7700 HSP clock driver
  reset: eswin: Add eic7700 HSP reset driver

 .../bindings/clock/eswin,eic7700-hspcrg.yaml  |  63 ++++
 MAINTAINERS                                   |   5 +-
 drivers/clk/eswin/Kconfig                     |  13 +
 drivers/clk/eswin/Makefile                    |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c           | 341 ++++++++++++++++++
 drivers/reset/Kconfig                         |  11 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700-hsp.c             | 113 ++++++
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  |  33 ++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  |  21 ++
 10 files changed, 600 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

--
2.34.1

