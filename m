Return-Path: <chunkeey@gmail.com>
Return-Path: <chunkeey@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	David Brown <david.brown@linaro.org>,
	Andy Gross <andy.gross@linaro.org>,
	Mathias Kresin <dev@kresin.me>
Subject: [PATCH] clk: fix apss cpu overclocking and crash
Date: Tue, 13 Mar 2018 17:29:15 +0100
Message-Id: <20180313162915.18307-1-chunkeey@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

There's an interaction issue between the clk changes:"
clk: qcom: ipq4019: Add the apss cpu pll divider clock node
clk: qcom: ipq4019: remove fixed clocks and add pll clocks
" and the cpufreq-dt.

cpufreq-dt is now spamming the kernel-log with the following:

[ 1099.190658] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP
for freq 761142857 (-34)

or worse:

|[    4.995284] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 716800 KHz
|[    4.996223] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP for freq 716800000 (-34)
|[    5.003530] cpu cpu0: dev_pm_opp_set_rate: failed to find OPP for freq 716000000 (-34)
|[    5.012174] cpufreq: __target_index: Failed to change cpu frequency: -34
|[    5.020102] ------------[ cut here ]------------
|[    5.026922] Kernel BUG at c05adfa0 [verbose debug info unavailable]
|[    5.031526] Internal error: Oops - BUG: 0 [#1] SMP ARM
|[    5.037514] Modules linked in:
|[    5.042723] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.14.18 #0
|[    5.045759] Hardware name: Generic DT based system
|[    5.051925] task: c7828000 task.stack: c7826000
|[    5.056530] PC is at cpufreq_online+0x380/0x5cc
|[    5.060953] LR is at __wake_up_common_lock+0x6c/0x84
|[    5.065466] pc : [<c05adfa0>]    lr : [<c0343488>]    psr: a0000013
|[    5.070674] sp : c7827d60  ip : c64d83e0  fp : c64d83b4
|[    5.076662] r10: 00000004  r9 : c0d42c5c  r8 : 00000001
|[    5.081872] r7 : c0e5a0b4  r6 : 00000000  r5 : 00000000  r4 : c64d8300
|[    5.087082] r3 : 00000000  r2 : 00000001  r1 : 60000013  r0 : ffffffde
|[    5.093682] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
|[    5.100191] Control: 10c5387d  Table: 8020406a  DAC: 00000051
|[    5.107393] Process swapper/0 (pid: 1, stack limit = 0xc7826210)
|[    5.113124] Stack: (0xc7827d60 to 0xc7828000)
|[    5.119205] 7d60: 00000000 c06bd6f0 c0e03d48 c64d8304 00000009 00000000 c0e16cc0 c0e5a0b4
|[...]
|[    5.286668] [<c05adfa0>] (cpufreq_online) from [<c05ae250>] (cpufreq_add_dev+0x54/0x7c)
|[    5.294820] [<c05ae250>] (cpufreq_add_dev) from [<c0523c98>] (subsys_interface_register+0x9c/0xc8)
|[    5.302633] [<c0523c98>] (subsys_interface_register) from [<c05ad3d8>] (cpufreq_register_driver+0x100/0x1ec)
|[    5.311661] [<c05ad3d8>] (cpufreq_register_driver) from [<c05b07f8>] (dt_cpufreq_probe+0xc0/0xf8)
|[    5.321646] [<c05b07f8>] (dt_cpufreq_probe) from [<c05264f4>] (platform_drv_probe+0x38/0x6c)
|[    5.330412] [<c05264f4>] (platform_drv_probe) from [<c0524ff4>] (driver_probe_device+0x130/0x284)
|[    5.338919] [<c0524ff4>] (driver_probe_device) from [<c0523a4c>] (bus_for_each_drv+0x80/0x90)
|[    5.347684] [<c0523a4c>] (bus_for_each_drv) from [<c0524e4c>] (__device_attach+0x70/0xc4)
|[    5.356192] [<c0524e4c>] (__device_attach) from [<c0524500>] (bus_probe_device+0x28/0x80)
|[    5.364348] [<c0524500>] (bus_probe_device) from [<c0522b90>] (device_add+0x2ac/0x4fc)
|[    5.372509] [<c0522b90>] (device_add) from [<c052635c>] (platform_device_add+0x130/0x1c0)
|[    5.380323] [<c052635c>] (platform_device_add) from [<c0526b20>] (platform_device_register_full+0xa4/0xf4)
|[    5.388576] [<c0526b20>] (platform_device_register_full) from [<c0916644>] (cpufreq_dt_platdev_init+0xb0/0xd4)
|[    5.398124] [<c0916644>] (cpufreq_dt_platdev_init) from [<c0301994>] (do_one_initcall+0xb4/0x170)

This only happens on certain devices like the Compex WPJ428
and AVM FritzBox!4040. However, other devices like the Asus
RT-AC58U and Meraki MR33 work just fine.

The issue stem from the fact that all higher CPU-Clocks
are achieved by switching the clock-parent to the P_DDRPLLAPSS
(ddrpllapss). Which is set by Qualcomm's proprietary bootcode
as part of the DDR calibration.

For example, the FB4040 uses 256 MiB Nanya NT5CC128M16IP clocked
at round 533 MHz. ddrpllsdcc is set to 190285714 Hz which is a
result of the gcc_apss_ddrpll_vco's reg 0x2e020 = 0x026f0032.
this translates to fdbdiv = 111, refclkdiv = 2. with parent_rate = 48 MHz
(XO) and the formula in clk_fepll_vco_calc_rate():
rate = ((parent_rate / refclkdiv) * 2 * fdbkdiv) / fixed_div
     = ((48000000 / 2) * 2 * 111) / 28
     = 190285714 Hz

(fixed_div = 28 according to the gcc_apss_sdcc_clk struct)

whereas the 128 MiB Nanya NT5CC64M16GP-DI in the ASUS RT-AC58U is
clocked at a slightly higher 537 MHz. ddrpllsdcc = 192000000 Hz.
the gcc_apss_ddrpll_vco's reg 0x2e020 is 0x00270032.
this is equal to fdbdiv = 112, refclkdiv = 2, fixed_div = 28, with
parent_rate = 48 MHz (XO) and the formula in clk_fepll_vco_calc_rate():
rate = ((parent_rate / refclkdiv) * 2 * fdbkdiv) / fixed_div
     = ((48000000 / 2) * 2 * 112) / 28
     = 192000000 Hz

This patch attempts to fix the issue by modifying
clk_cpu_div_round_rate(), clk_cpu_div_set_rate(), clk_cpu_div_recalc_rate()
to use a new qcom_find_freq_close() function, which returns the closest
matching frequency, instead of the next higher. This way, the SoC in
the FB4040 (with its max clock speed of 710.4 MHz) will no longer
try to overclock to 761 MHz. And it will also prevent the crash since
the clk_cpu_div_recalc_rate() now always returns the closest rate within
the frequency table. This will also make it possible for the opp-code
to take a fast-path through dev_pm_opp_set_rate():
<https://elixir.bootlin.com/linux/v4.16-rc5/source/drivers/opp/core.c#L669>
Since the rate returned by clk_get_rate() will now always match.

Fixes: d83dcacea18 ("clk: qcom: ipq4019: Add the apss cpu pll divider clock node")
Cc: Mathias Kresin <dev@kresin.me>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
Note:

The register reads were obtained by performing:
'cat /sys/kernel/debug/regmap/1800000.clock-controller/registers | grep 2e020'
on both devices.

As an alternative, it would also be possible to fix this by setting the
gcc_apss_ddrpll_vco to 0x027f0032. (No idea if this is a good idea though,
since it messes with the DDR - and 0x027f0032 is not universal as the MR33
for example uses 0x02700031).

Or calculate the DDR related frequencies in the tables ftbl_gcc_apps_clk,
ftbl_apss_ddr_pll and ftbl_gcc_sdcc1_apps_clk based on the gcc_apss_ddrpll_vco
setting.

... So what will it be? (And please keep me in the CC.)
---
 drivers/clk/qcom/gcc-ipq4019.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 46cb256b4aa2..e5fb159500b4 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1253,6 +1253,29 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
 	.reg = 0x2f020,
 };
 
+
+const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
+						unsigned long rate)
+{
+	const struct freq_tbl *last = NULL;
+
+	for ( ; f->freq; f++) {
+		if (rate == f->freq)
+			return f;
+
+		if (f->freq > rate) {
+			if (!last ||
+			    (f->freq - rate) < (rate - last->freq))
+				return f;
+			else
+				return last;
+		}
+		last = f;
+	}
+
+	return last;
+}
+
 /*
  * Round rate function for APSS CPU PLL Clock divider.
  * It looks up the frequency table and returns the next higher frequency
@@ -1265,7 +1288,7 @@ static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
@@ -1288,7 +1311,7 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mask;
 	int ret;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
@@ -1315,6 +1338,7 @@ static unsigned long
 clk_cpu_div_recalc_rate(struct clk_hw *hw,
 			unsigned long parent_rate)
 {
+	const struct freq_tbl *f;
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	u32 cdiv, pre_div;
 	u64 rate;
@@ -1335,7 +1359,11 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 	rate = clk_fepll_vco_calc_rate(pll, parent_rate) * 2;
 	do_div(rate, pre_div);
 
-	return rate;
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
+	if (!f)
+		return rate;
+
+	return f->freq;
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-- 
2.16.2
