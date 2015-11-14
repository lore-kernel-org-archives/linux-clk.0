Return-Path: <ysato@users.sourceforge.jp>
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] h8300: Replace read/write to ioread/write
Date: Sat, 14 Nov 2015 20:49:16 +0900
Message-Id: <1447501756-31668-1-git-send-email-ysato@users.sourceforge.jp>
In-Reply-To: <1447079782-26027-1-git-send-email-daniel.lezcano@linaro.org>
References: <1447079782-26027-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

read[bwl] and write[bwl] is only little-endian I/O.
But h8300's peripheral of big-endian. So use ioread/write.

And h8300 specific __raw_read/write is same of generic.
It can remove.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/h8300/include/asm/io.h          | 45 ++++--------------------------------
 arch/h8300/kernel/setup.c            |  9 ++++----
 drivers/clk/h8300/clk-h8s2678.c      |  6 ++---
 drivers/clocksource/h8300_timer16.c  | 35 +++++++++++++---------------
 drivers/clocksource/h8300_timer8.c   | 19 ++++++++-------
 drivers/clocksource/h8300_tpu.c      | 18 +++++++--------
 drivers/irqchip/irq-renesas-h8300h.c |  4 ++--
 drivers/irqchip/irq-renesas-h8s.c    | 19 +++++++--------
 8 files changed, 60 insertions(+), 95 deletions(-)

diff --git a/arch/h8300/include/asm/io.h b/arch/h8300/include/asm/io.h
index 2d15508..976e51d 100644
--- a/arch/h8300/include/asm/io.h
+++ b/arch/h8300/include/asm/io.h
@@ -4,57 +4,20 @@
 #ifdef __KERNEL__
 
 /* H8/300 internal I/O functions */
-
-#define __raw_readb __raw_readb
-static inline u8 __raw_readb(const volatile void __iomem *addr)
-{
-	return *(volatile u8 *)addr;
-}
-
-#define __raw_readw __raw_readw
-static inline u16 __raw_readw(const volatile void __iomem *addr)
-{
-	return *(volatile u16 *)addr;
-}
-
-#define __raw_readl __raw_readl
-static inline u32  __raw_readl(const volatile void __iomem *addr)
-{
-	return *(volatile u32 *)addr;
-}
-
-#define __raw_writeb __raw_writeb
-static inline void __raw_writeb(u8 b, const volatile void __iomem *addr)
-{
-	*(volatile u8 *)addr = b;
-}
-
-#define __raw_writew __raw_writew
-static inline void __raw_writew(u16 b, const volatile void __iomem *addr)
-{
-	*(volatile u16 *)addr = b;
-}
-
-#define __raw_writel __raw_writel
-static inline void __raw_writel(u32 b, const volatile void __iomem *addr)
-{
-	*(volatile u32 *)addr = b;
-}
-
 static inline void ctrl_bclr(int b, void __iomem *addr)
 {
 	if (__builtin_constant_p(b))
-		__asm__("bclr %1,%0" : : "WU"(addr), "i"(b));
+		__asm__("bclr %1,%0" : "+WU"(*((u8 *)addr)): "i"(b));
 	else
-		__asm__("bclr %w1,%0" : : "WU"(addr), "r"(b));
+		__asm__("bclr %w1,%0" : "+WU"(*((u8 *)addr)): "r"(b));
 }
 
 static inline void ctrl_bset(int b, void __iomem *addr)
 {
 	if (__builtin_constant_p(b))
-		__asm__("bset %1,%0" : : "WU"(addr), "i"(b));
+		__asm__("bset %1,%0" : "+WU"(*((u8 *)addr)): "i"(b));
 	else
-		__asm__("bset %w1,%0" : : "WU"(addr), "r"(b));
+		__asm__("bset %w1,%0" : "+WU"(*((u8 *)addr)): "r"(b));
 }
 
 #include <asm-generic/io.h>
diff --git a/arch/h8300/kernel/setup.c b/arch/h8300/kernel/setup.c
index 68a7714..e523d0a 100644
--- a/arch/h8300/kernel/setup.c
+++ b/arch/h8300/kernel/setup.c
@@ -206,14 +206,14 @@ device_initcall(device_probe);
 #define get_wait(base, addr) ({		\
 	int baddr;			\
 	baddr = ((addr) / 0x200000 * 2);			     \
-	w *= (readw((base) + 2) & (3 << baddr)) + 1;		     \
+	w *= (ioread16be((base) + 4) & (3 << baddr)) + 1;	     \
 	})
 #endif
 #if defined(CONFIG_CPU_H8S)
 #define get_wait(base, addr) ({		\
 	int baddr;			\
 	baddr = ((addr) / 0x200000 * 16);			     \
-	w *= (readl((base) + 2) & (7 << baddr)) + 1;	\
+	w *= (ioread32be((base) + 4) & (7 << baddr)) + 1;	\
 	})
 #endif
 
@@ -227,8 +227,8 @@ static __init int access_timing(void)
 
 	bsc = of_find_compatible_node(NULL, NULL, "renesas,h8300-bsc");
 	base = of_iomap(bsc, 0);
-	w = (readb(base + 0) & bit)?2:1;
-	if (readb(base + 1) & bit)
+	w = (ioread8(base + 2) & bit) ? 2 : 1;
+	if (ioread8(base + 3) & bit)
 		w *= get_wait(base, addr);
 	else
 		w *= 2;
@@ -252,4 +252,5 @@ void __init calibrate_delay(void)
 void __init time_init(void)
 {
 	of_clk_init(NULL);
+	clocksource_probe();
 }
diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 6cf38dc..2f89f35 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -27,7 +27,7 @@ static unsigned long pll_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct pll_clock *pll_clock = to_pll_clock(hw);
-	int mul = 1 << (readb(pll_clock->pllcr) & 3);
+	int mul = 1 << (ioread8(pll_clock->pllcr) & 3);
 
 	return parent_rate * mul;
 }
@@ -64,10 +64,10 @@ static int pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	pll = ((rate / parent_rate) / 2) & 0x03;
 	spin_lock_irqsave(&clklock, flags);
-	val = readb(pll_clock->sckcr);
+	val = ioread8(pll_clock->sckcr);
 	val |= 0x08;
 	writeb(val, pll_clock->sckcr);
-	val = readb(pll_clock->pllcr);
+	val = ioread8(pll_clock->pllcr);
 	val &= ~0x03;
 	val |= pll;
 	writeb(val, pll_clock->pllcr);
diff --git a/drivers/clocksource/h8300_timer16.c b/drivers/clocksource/h8300_timer16.c
index fc14a3f..5b35224 100644
--- a/drivers/clocksource/h8300_timer16.c
+++ b/drivers/clocksource/h8300_timer16.c
@@ -14,7 +14,6 @@
 #include <linux/of_irq.h>
 
 #define TSTR	0
-#define TISRA	4
 #define TISRC	6
 
 #define TCR	0
@@ -38,15 +37,15 @@ static unsigned long timer16_get_counter(struct timer16_priv *p)
 	unsigned long v1, v2, v3;
 	int o1, o2;
 
-	o1 = readb(p->mapcommon + TISRC) & p->ovf;
+	o1 = ioread8(p->mapcommon + TISRC) & p->ovf;
 
 	/* Make sure the timer value is stable. Stolen from acpi_pm.c */
 	do {
 		o2 = o1;
-		v1 = readw(p->mapbase + TCNT);
-		v2 = readw(p->mapbase + TCNT);
-		v3 = readw(p->mapbase + TCNT);
-		o1 = readb(p->mapcommon + TISRC) & p->ovf;
+		v1 = ioread16be(p->mapbase + TCNT);
+		v2 = ioread16be(p->mapbase + TCNT);
+		v3 = ioread16be(p->mapbase + TCNT);
+		o1 = ioread8(p->mapcommon + TISRC) & p->ovf;
 	} while (unlikely((o1 != o2) || (v1 > v2 && v1 < v3)
 			  || (v2 > v3 && v2 < v1) || (v3 > v1 && v3 < v2)));
 
@@ -59,8 +58,7 @@ static irqreturn_t timer16_interrupt(int irq, void *dev_id)
 {
 	struct timer16_priv *p = (struct timer16_priv *)dev_id;
 
-	writeb(readb(p->mapcommon + TISRA) & ~p->imfa,
-		  p->mapcommon + TISRA);
+	ctrl_bclr(p->ovf, p->mapcommon + TISRC);
 	p->total_cycles += 0x10000;
 
 	return IRQ_HANDLED;
@@ -89,10 +87,10 @@ static int timer16_enable(struct clocksource *cs)
 	WARN_ON(p->cs_enabled);
 
 	p->total_cycles = 0;
-	writew(0x0000, p->mapbase + TCNT);
-	writeb(0x83, p->mapbase + TCR);
-	writeb(readb(p->mapcommon + TSTR) | p->enb,
-		  p->mapcommon + TSTR);
+	iowrite16be(0x0000, p->mapbase + TCNT);
+	iowrite8(0x83, p->mapbase + TCR);
+	ctrl_bset(p->ovie, p->mapcommon + TISRC);
+	ctrl_bset(p->enb, p->mapcommon + TSTR);
 
 	p->cs_enabled = true;
 	return 0;
@@ -103,9 +101,8 @@ static void timer16_disable(struct clocksource *cs)
 	struct timer16_priv *p = cs_to_priv(cs);
 
 	WARN_ON(!p->cs_enabled);
-
-	writeb(readb(p->mapcommon + TSTR) & ~p->enb,
-		  p->mapcommon + TSTR);
+	ctrl_bclr(p->ovie, p->mapcommon + TISRC);
+	ctrl_bclr(p->enb, p->mapcommon + TSTR);
 
 	p->cs_enabled = false;
 }
@@ -160,9 +157,9 @@ static void __init h8300_16timer_init(struct device_node *node)
 
 	timer16_priv.mapbase = base[REG_CH];
 	timer16_priv.mapcommon = base[REG_COMM];
-	timer16_priv.enb = 1 << ch;
-	timer16_priv.imfa = 1 << ch;
-	timer16_priv.imiea = 1 << (4 + ch);
+	timer16_priv.enb = ch;
+	timer16_priv.ovf = ch;
+	timer16_priv.ovie = 4 + ch;
 
 	ret = request_irq(irq, timer16_interrupt,
 			  IRQF_TIMER, timer16_priv.cs.name, &timer16_priv);
@@ -172,7 +169,7 @@ static void __init h8300_16timer_init(struct device_node *node)
 	}
 
 	clocksource_register_hz(&timer16_priv.cs,
-				clk_get_rate(timer16_priv.clk) / 8);
+				clk_get_rate(clk) / 8);
 	return;
 
 unmap_comm:
diff --git a/drivers/clocksource/h8300_timer8.c b/drivers/clocksource/h8300_timer8.c
index aa4b2a98..816a8c5 100644
--- a/drivers/clocksource/h8300_timer8.c
+++ b/drivers/clocksource/h8300_timer8.c
@@ -24,6 +24,8 @@
 #define TCORB	6
 #define _8TCNT	8
 
+#define CMIEA	6
+#define CMFA	6
 #define FLAG_STARTED (1 << 3)
 
 #define SCALE 64
@@ -67,10 +69,11 @@ static irqreturn_t timer8_interrupt(int irq, void *dev_id)
 	writew(p->tcora, p->mapbase + TCORA);
 
 	if (clockevent_state_oneshot(&p->ced))
-		writew(0x0000, p->mapbase + _8TCR);
+		iowrite16be(0x0000, p->mapbase + _8TCR);
 
 	p->ced.event_handler(&p->ced);
 
+	ctrl_bclr(CMFA, p->mapbase + _8TCSR);
 	return IRQ_HANDLED;
 }
 
@@ -82,18 +85,18 @@ static void timer8_set_next(struct timer8_priv *p, unsigned long delta)
 		pr_warn("delta out of range\n");
 	now = timer8_get_counter(p);
 	p->tcora = delta;
-	writeb(readb(p->mapbase + _8TCR) | 0x40, p->mapbase + _8TCR);
+	ctrl_bset(CMIEA, p->mapbase + _8TCR);
 	if (delta > now)
-		writew(delta, p->mapbase + TCORA);
+		iowrite16be(delta, p->mapbase + TCORA);
 	else
-		writew(now + 1, p->mapbase + TCORA);
+		iowrite16be(now + 1, p->mapbase + TCORA);
 }
 
 static int timer8_enable(struct timer8_priv *p)
 {
-	writew(0xffff, p->mapbase + TCORA);
-	writew(0x0000, p->mapbase + _8TCNT);
-	writew(0x0c02, p->mapbase + _8TCR);
+	iowrite16be(0xffff, p->mapbase + TCORA);
+	iowrite16be(0x0000, p->mapbase + _8TCNT);
+	iowrite16be(0x0c02, p->mapbase + _8TCR);
 
 	return 0;
 }
@@ -114,7 +117,7 @@ static int timer8_start(struct timer8_priv *p)
 
 static void timer8_stop(struct timer8_priv *p)
 {
-	writew(0x0000, p->mapbase + _8TCR);
+	iowrite16be(0x0000, p->mapbase + _8TCR);
 }
 
 static inline struct timer8_priv *ced_to_priv(struct clock_event_device *ced)
diff --git a/drivers/clocksource/h8300_tpu.c b/drivers/clocksource/h8300_tpu.c
index 91bf1992..e8e8381 100644
--- a/drivers/clocksource/h8300_tpu.c
+++ b/drivers/clocksource/h8300_tpu.c
@@ -31,8 +31,8 @@ static inline unsigned long read_tcnt32(struct tpu_priv *p)
 {
 	unsigned long tcnt;
 
-	tcnt = readw(p->mapbase1 + TCNT) << 16;
-	tcnt |= readw(p->mapbase2 + TCNT);
+	tcnt = ioread16be(p->mapbase1 + TCNT) << 16;
+	tcnt |= ioread16be(p->mapbase2 + TCNT);
 	return tcnt;
 }
 
@@ -41,7 +41,7 @@ static int tpu_get_counter(struct tpu_priv *p, unsigned long long *val)
 	unsigned long v1, v2, v3;
 	int o1, o2;
 
-	o1 = readb(p->mapbase1 + TSR) & 0x10;
+	o1 = ioread8(p->mapbase1 + TSR) & 0x10;
 
 	/* Make sure the timer value is stable. Stolen from acpi_pm.c */
 	do {
@@ -82,10 +82,10 @@ static int tpu_clocksource_enable(struct clocksource *cs)
 
 	WARN_ON(p->cs_enabled);
 
-	writew(0, p->mapbase1 + TCNT);
-	writew(0, p->mapbase2 + TCNT);
-	writeb(0x0f, p->mapbase1 + TCR);
-	writeb(0x03, p->mapbase2 + TCR);
+	iowrite16be(0, p->mapbase1 + TCNT);
+	iowrite16be(0, p->mapbase2 + TCNT);
+	iowrite8(0x0f, p->mapbase1 + TCR);
+	iowrite8(0x03, p->mapbase2 + TCR);
 
 	p->cs_enabled = true;
 	return 0;
@@ -97,8 +97,8 @@ static void tpu_clocksource_disable(struct clocksource *cs)
 
 	WARN_ON(!p->cs_enabled);
 
-	writeb(0, p->mapbase1 + TCR);
-	writeb(0, p->mapbase2 + TCR);
+	iowrite8(0, p->mapbase1 + TCR);
+	iowrite8(0, p->mapbase2 + TCR);
 	p->cs_enabled = false;
 }
 
diff --git a/drivers/irqchip/irq-renesas-h8300h.c b/drivers/irqchip/irq-renesas-h8300h.c
index c378768..9e57b73 100644
--- a/drivers/irqchip/irq-renesas-h8300h.c
+++ b/drivers/irqchip/irq-renesas-h8300h.c
@@ -81,8 +81,8 @@ static int __init h8300h_intc_of_init(struct device_node *intc,
 	BUG_ON(!intc_baseaddr);
 
 	/* All interrupt priority low */
-	writeb(0x00, IPR + 0);
-	writeb(0x00, IPR + 1);
+	iowrite8(0x00, IPR + 0);
+	iowrite8(0x00, IPR + 1);
 
 	domain = irq_domain_add_linear(intc, NR_IRQS, &irq_ops, NULL);
 	BUG_ON(!domain);
diff --git a/drivers/irqchip/irq-renesas-h8s.c b/drivers/irqchip/irq-renesas-h8s.c
index 8098ead..1f990cd 100644
--- a/drivers/irqchip/irq-renesas-h8s.c
+++ b/drivers/irqchip/irq-renesas-h8s.c
@@ -10,8 +10,9 @@
 #include <linux/of_irq.h>
 #include <asm/io.h>
 
-static void *intc_baseaddr;
-#define IPRA ((unsigned long)intc_baseaddr)
+static void __iomem *intc_baseaddr;
+#define IPRA (intc_baseaddr)
 
 static const unsigned char ipr_table[] = {
 	0x03, 0x02, 0x01, 0x00, 0x13, 0x12, 0x11, 0x10, /* 16 - 23 */
@@ -33,30 +33,30 @@ static const unsigned char ipr_table[] = {
 static void h8s_disable_irq(struct irq_data *data)
 {
 	int pos;
-	unsigned int addr;
+	void __iomem *addr;
 	unsigned short pri;
 	int irq = data->irq;
 
 	addr = IPRA + ((ipr_table[irq - 16] & 0xf0) >> 3);
 	pos = (ipr_table[irq - 16] & 0x0f) * 4;
 	pri = ~(0x000f << pos);
-	pri &= ctrl_inw(addr);
-	ctrl_outw(pri, addr);
+	pri &= ioread16be(addr);
+	iowrite16be(pri, addr);
 }
 
 static void h8s_enable_irq(struct irq_data *data)
 {
 	int pos;
-	unsigned int addr;
+	void __iomem *addr;
 	unsigned short pri;
 	int irq = data->irq;
 
 	addr = IPRA + ((ipr_table[irq - 16] & 0xf0) >> 3);
 	pos = (ipr_table[irq - 16] & 0x0f) * 4;
 	pri = ~(0x000f << pos);
-	pri &= ctrl_inw(addr);
+	pri &= ioread16be(addr);
 	pri |= 1 << pos;
-	ctrl_outw(pri, addr);
+	iowrite16be(pri, addr);
 }
 
 struct irq_chip h8s_irq_chip = {
@@ -90,7 +90,7 @@ static int __init h8s_intc_of_init(struct device_node *intc,
 	/* All interrupt priority is 0 (disable) */
 	/* IPRA to IPRK */
 	for (n = 0; n <= 'k' - 'a'; n++)
-		ctrl_outw(0x0000, IPRA + (n * 2));
+		iowrite16be(0x0000, IPRE + (n * 2));
 
 	domain = irq_domain_add_linear(intc, NR_IRQS, &irq_ops, NULL);
 	BUG_ON(!domain);
-- 
2.6.1
