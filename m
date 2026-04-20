Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2AB377EDA;
	Mon, 20 Apr 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678010; cv=none; b=V/0c9OYtLTAom3loCoOgNykkujeJ7xOIum+IgfuLvzg84U5VHjJ8/wBEkLYygI3qns+IJVjVJRHxlPRO6U160ImFLY8NwHpjbZmdgV1te/IzhFuLqRG2uUMIuRPACvGUwtggENlVSDd1IQ/hVDsN0KA3syiP3Zj9OENx3X+UFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678010; c=relaxed/simple;
	bh=QVFxE6C8tjYvzbq5SIz9ADzbmv9mVzXYZ8nVrdP/Y7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xa6WQe63EjPVgMXYkVeMCwHchXa2zRUOfwIQQ6XNjeuN/hYx21vXV4L2vaPtkaDKU7Ciq4ayFICQrJ4f1D3ge/InDLTQ9MIPKqFWVk2LVonVFwlW2euK0g4lOiyRjiyUJFxOKdNJsORsA7lKNA5eEL1zjp98Sh3uAuV1KASePrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgD3DaFT9OVpJi0TAA--.20924S2;
	Mon, 20 Apr 2026 17:39:43 +0800 (CST)
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
Subject: [PATCH v2 0/3] Add driver support for ESWIN EIC7700 HSP clock and reset generator
Date: Mon, 20 Apr 2026 17:39:29 +0800
Message-Id: <20260420093929.1895-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgD3DaFT9OVpJi0TAA--.20924S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF18tFW7Cw1DCw4xur47CFg_yoWrZFy8pF
	W7WF95Jr1UXrWxuan7ta10vFW3Jan3JFyakan7Ja4xZwsIyFyDJr40ka45AF9rZ34fX345
	G3W2q345uFyUAFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTR
	GNt4DUUUU
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

This patch depends on ESWIN EIC7700 clock controller patch [1], [2] and [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=8add6d87dc69c0620c7e60bdc6be6b3b0092d9fa
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=cd44f127c1d42833a32ba0a0965255ee6184f8c1
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=858f6273cf003e97c817903a07d8001b483fe40b

Updates:
  Changes in v2:
  - bindings:
    - Remove "hsp_" from clock-names.
    - Replace "eswin,eic7700-clock.yaml" and "eswin,eic7700-hspcrg.yaml" with
      "eswin,eic7700*".
    - Replace "eswin,eic7700-clock.h" and "eswin,eic7700-hspcrg.h" with
      "eswin,eic7700*".
  - clock driver:
    - Use guard(spinlock_irqsave)(gate->lock) instead of spin_lock_irqsave()
      and remove spin_unlock_irqrestore().
    - Remove the newline in function hsp_clk_gate_is_enabled().
    - Use struct clk_init_data init = {}.
    - Replace 'static struct clk_parent_data' with
      'static const struct clk_parent_data'.
    - Change '.fw_name' to '.index', because the function
      eswin_clk_register_fixed_factor() uses .index.
    - Improve the formatting.
    - Create the regmap in the clock driver and remove (__force void*)data->base.
      The reset driver uses dev_get_regmap() to get the regmap from the clock.
    - Move 'const struct regmap_config eic7700_hsp_regmap_config' from reset
      driver to clock driver.
    - The USB clock gate (hsp_clk_gate_endisable) and the reset driver both
      perform read-modify-write cycles on registers 0x800 and 0x900. Use
      custom regmap lock callbacks so that regmap operations hold data->lock
      with IRQs disabled, the same lock the clock gate path uses, preventing
      concurrent RMW races on those shared registers.
  - reset driver:
    - Remove 'depends on COMMON_CLK_EIC7700_HSP' and 'default COMMON_CLK_EIC7700_HSP'.
    - Use regmap_assign_bits() in assert and deassert functions.
    - Remove eic7700_hsp_reset_reset().
    - The clock driver creates the regmap, and the reset driver uses dev_get_regmap().
    - Remove the setting of_reset_n_cells.

  - Link to v1: https://lore.kernel.org/all/20260403093459.612-1-dongxuyang@eswincomputing.com/

Xuyang Dong (3):
  dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
  clk: eswin: Add eic7700 HSP clock driver
  reset: eswin: Add eic7700 HSP reset driver

 .../bindings/clock/eswin,eic7700-hspcrg.yaml  |  63 +++
 MAINTAINERS                                   |   5 +-
 drivers/clk/eswin/Kconfig                     |  12 +
 drivers/clk/eswin/Makefile                    |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c           | 385 ++++++++++++++++++
 drivers/reset/Kconfig                         |  11 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700-hsp.c             | 118 ++++++
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  |  33 ++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  |  21 +
 10 files changed, 648 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

--
2.43.0

