Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 1/9] pinctrl: sunxi: refactor irq related register function
 to have desc
Date: Fri, 16 Mar 2018 22:02:07 +0800
Message-Id: <20180316140215.28663-2-icenowy@aosc.io>
In-Reply-To: <20180316140215.28663-1-icenowy@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

As the new H6 SoC has holes in the IRQ registers, refactor the IRQ
related register function for getting the full pinctrl desc structure.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v4:
- Adjusted parameter sequence.

Patch introduced in v3.

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 22 ++++++++++------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 26 ++++++++++++++++++--------
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 341312d66512..af7264654151 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -835,7 +835,7 @@ static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_cfg_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_cfg_reg(pctl->desc, d->hwirq);
 	u8 index = sunxi_irq_cfg_offset(d->hwirq);
 	unsigned long flags;
 	u32 regval;
@@ -882,8 +882,7 @@ static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 status_reg = sunxi_irq_status_reg(d->hwirq,
-					      pctl->desc->irq_bank_base);
+	u32 status_reg = sunxi_irq_status_reg(pctl->desc, d->hwirq);
 	u8 status_idx = sunxi_irq_status_offset(d->hwirq);
 
 	/* Clear the IRQ */
@@ -893,7 +892,7 @@ static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_ctrl_reg(pctl->desc, d->hwirq);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -910,7 +909,7 @@ static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 static void sunxi_pinctrl_irq_unmask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_ctrl_reg(pctl->desc, d->hwirq);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -1002,7 +1001,7 @@ static void sunxi_pinctrl_irq_handler(struct irq_desc *desc)
 	if (bank == pctl->desc->irq_banks)
 		return;
 
-	reg = sunxi_irq_status_reg_from_bank(bank, pctl->desc->irq_bank_base);
+	reg = sunxi_irq_status_reg_from_bank(pctl->desc, bank);
 	val = readl(pctl->membase + reg);
 
 	if (val) {
@@ -1234,8 +1233,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 
 		writel(src | div << 4,
 		       pctl->membase +
-		       sunxi_irq_debounce_reg_from_bank(i,
-							pctl->desc->irq_bank_base));
+		       sunxi_irq_debounce_reg_from_bank(pctl->desc, i));
 	}
 
 	return 0;
@@ -1410,11 +1408,11 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 
 	for (i = 0; i < pctl->desc->irq_banks; i++) {
 		/* Mask and clear all IRQs before registering a handler */
-		writel(0, pctl->membase + sunxi_irq_ctrl_reg_from_bank(i,
-						pctl->desc->irq_bank_base));
+		writel(0, pctl->membase +
+			  sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
 		writel(0xffffffff,
-		       pctl->membase + sunxi_irq_status_reg_from_bank(i,
-						pctl->desc->irq_bank_base));
+		       pctl->membase +
+		       sunxi_irq_status_reg_from_bank(pctl->desc, i));
 
 		irq_set_chained_handler_and_data(pctl->irq[i],
 						 sunxi_pinctrl_irq_handler,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 11b128f54ed2..a13bd57d880d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -263,8 +263,10 @@ static inline u32 sunxi_pull_offset(u16 pin)
 	return pin_num * PULL_PINS_BITS;
 }
 
-static inline u32 sunxi_irq_cfg_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl_desc *desc,
+				    u16 irq)
 {
+	unsigned bank_base = desc->irq_bank_base;
 	u8 bank = irq / IRQ_PER_BANK;
 	u8 reg = (irq % IRQ_PER_BANK) / IRQ_CFG_IRQ_PER_REG * 0x04;
 
@@ -277,16 +279,19 @@ static inline u32 sunxi_irq_cfg_offset(u16 irq)
 	return irq_num * IRQ_CFG_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_ctrl_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_ctrl_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_CTRL_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_ctrl_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_ctrl_reg(const struct sunxi_pinctrl_desc *desc,
+				     u16 irq)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_ctrl_reg_from_bank(bank, bank_base);
+	return sunxi_irq_ctrl_reg_from_bank(desc, bank);
 }
 
 static inline u32 sunxi_irq_ctrl_offset(u16 irq)
@@ -295,21 +300,26 @@ static inline u32 sunxi_irq_ctrl_offset(u16 irq)
 	return irq_num * IRQ_CTRL_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_debounce_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_debounce_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_DEBOUNCE_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_status_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_status_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_STATUS_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_status_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_status_reg(const struct sunxi_pinctrl_desc *desc,
+				       u16 irq)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_status_reg_from_bank(bank, bank_base);
+	return sunxi_irq_status_reg_from_bank(desc, bank);
 }
 
 static inline u32 sunxi_irq_status_offset(u16 irq)
-- 
2.15.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
