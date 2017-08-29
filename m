Return-Path: <zhoubb@lemote.com>
From: Binbin Zhou <zhoubb@lemote.com>
To: Ralf Baechle <ralf@linux-mips.org>,
	James Hogan <james.hogan@imgtec.com>
Cc: John Crispin <john@phrozen.org>,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	Kelvin Cheung <keguang.zhang@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	=?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6?= <Yeking@Red54.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-mips@linux-mips.org,
	linux-clk@vger.kernel.org,
	Binbin Zhou <zhoubb@lemote.com>,
	HuaCai Chen <chenhc@lemote.com>
Subject: [PATCH RESEND v8 1/9] MIPS: Loongson: Merge PRID macro for Loongson-1A/1B/1C
Date: Tue, 29 Aug 2017 16:38:38 +0800
Message-Id: <1503995926-17125-2-git-send-email-zhoubb@lemote.com>
In-Reply-To: <1503995926-17125-1-git-send-email-zhoubb@lemote.com>
References: <1503995926-17125-1-git-send-email-zhoubb@lemote.com>
List-ID: <linux-clk.vger.kernel.org>

The Loongson-1 series CPUs(1A/1B/1C) share the same PRID macro.

Signed-off-by: Binbin Zhou <zhoubb@lemote.com>
Signed-off-by: HuaCai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/cpu.h         | 3 +--
 arch/mips/kernel/cpu-probe.c        | 4 +++-
 arch/mips/loongson32/common/setup.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 3069359..71c624d 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -240,8 +240,7 @@
 #define PRID_REV_VR4181A	0x0070	/* Same as VR4122 */
 #define PRID_REV_VR4130		0x0080
 #define PRID_REV_34K_V1_0_2	0x0022
-#define PRID_REV_LOONGSON1B	0x0020
-#define PRID_REV_LOONGSON1C	0x0020	/* Same as Loongson-1B */
+#define PRID_REV_LOONGSON1ABC	0x0020
 #define PRID_REV_LOONGSON2E	0x0002
 #define PRID_REV_LOONGSON2F	0x0003
 #define PRID_REV_LOONGSON3A_R1	0x0005
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 353ade2..25f729c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1513,8 +1513,10 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_LOONGSON1;
 
 		switch (c->processor_id & PRID_REV_MASK) {
-		case PRID_REV_LOONGSON1B:
+		case PRID_REV_LOONGSON1ABC:
+#ifdef CONFIG_CPU_LOONGSON1B
 			__cpu_name[cpu] = "Loongson 1B";
+#endif
 			break;
 		}
 
diff --git a/arch/mips/loongson32/common/setup.c b/arch/mips/loongson32/common/setup.c
index 1640744..c8e8b3e 100644
--- a/arch/mips/loongson32/common/setup.c
+++ b/arch/mips/loongson32/common/setup.c
@@ -21,7 +21,7 @@ const char *get_system_type(void)
 	unsigned int processor_id = (&current_cpu_data)->processor_id;
 
 	switch (processor_id & PRID_REV_MASK) {
-	case PRID_REV_LOONGSON1B:
+	case PRID_REV_LOONGSON1ABC:
 #if defined(CONFIG_LOONGSON1_LS1B)
 		return "LOONGSON LS1B";
 #elif defined(CONFIG_LOONGSON1_LS1C)
-- 
2.9.4
