Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF1734D907;
	Thu, 23 Apr 2026 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935372; cv=none; b=fe+6D+JzJfPHnEDwC+CaGTqtXzIRc7/t9ZFyplK+MuSM5gfJZzXDhNnyLYPoscHV+GExCWcrNSB25CEXhoSRaLvsRb1kl+cVpMrb0fQwrn3evM9TH/y2HrQSTHg8d3VVwV3i+jXvkf4R5HRjNYhb6wQhpUqb3Q7jpuajsRhHp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935372; c=relaxed/simple;
	bh=Ns8dbRJs5FRrA60axp+t9uYgSDDS+Jk/SJ1IFmAX6v0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rFMUsLhTWyIAeXSNQdjH/VLRKrEMLWzdxmcP4/qJMhW1PTacYn2W6YuG4lEWyEHOQc0qRf8frBYq6u8FOrmG9/R/6Ieje+nXeLYPugbmg697wj+zTuXTC6Fql5g+VBH7ZetPpa5CYxGpwfI677DIK9QqqpjjQ/NaeOD3nsAVHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgDX7aC24elpovoTAA--.23702S2;
	Thu, 23 Apr 2026 17:09:12 +0800 (CST)
From: Xuyang Dong <dongxuyang@eswincomputing.com>
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
Subject: [PATCH v3 0/3] Add driver support for ESWIN EIC7700 HSP clock and reset generator
Date: Thu, 23 Apr 2026 17:09:04 +0800
Message-Id: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDX7aC24elpovoTAA--.23702S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw17Zr1UtF18CFW3tr48Crg_yoW7Aw1xpF
	Z8WF93Gr1UXrWxuan7t3WIvFZxJa13JFyakws7J3W7ZanIyFyUJF40ka45AFZrZr1fX3y5
	J3W7tryF9FyUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb_Ma5UUUUU==
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

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

This patch depends on ESWIN EIC7700 clock controller patch [1], [2] and [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=8add6d87dc69c0620c7e60bdc6be6b3b0092d9fa
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=cd44f127c1d42833a32ba0a0965255ee6184f8c1
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=858f6273cf003e97c817903a07d8001b483fe40b

Updates:
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
    - Dropping const will cause a warning when checked with checkpatch.pl.

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

 .../bindings/clock/eswin,eic7700-hspcrg.yaml  |  63 +++
 MAINTAINERS                                   |   5 +-
 drivers/clk/eswin/Kconfig                     |  12 +
 drivers/clk/eswin/Makefile                    |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c           | 384 ++++++++++++++++++
 drivers/reset/Kconfig                         |  11 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700-hsp.c             | 118 ++++++
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  |  33 ++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  |  21 +
 10 files changed, 647 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

--
2.34.1

