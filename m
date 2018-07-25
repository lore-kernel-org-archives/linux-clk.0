Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 John Crispin <john@phrozen.org>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180723142314.1183-1-john@phrozen.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Christian Lamparter <chunkeey@googlemail.com>,
 Christian Lamparter <chunkeey@gmail.com>, John Crispin <john@phrozen.org>
References: <20180723142314.1183-1-john@phrozen.org>
Message-ID: <153256230312.48062.3889968337420324100@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: fix apss cpu overclocking
Date: Wed, 25 Jul 2018 16:45:03 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting John Crispin (2018-07-23 07:23:14)
> From: Christian Lamparter <chunkeey@googlemail.com>
> =

> There's an interaction issue between the clk changes:"
> clk: qcom: ipq4019: Add the apss cpu pll divider clock node
> clk: qcom: ipq4019: remove fixed clocks and add pll clocks
> " and the cpufreq-dt.
> =

> cpufreq-dt is now spamming the kernel-log with the following:
> =

> [ 1099.190658] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP
> for freq 761142857 (-34)
> =

> This only happens on certain devices like the Compex WPJ428
> and AVM FritzBox!4040. However, other devices like the Asus
> RT-AC58U and Meraki MR33 work just fine.
> =

> The issue stem from the fact that all higher CPU-Clocks
> are achieved by switching the clock-parent to the P_DDRPLLAPSS
> (ddrpllapss). Which is set by Qualcomm's proprietary bootcode
> as part of the DDR calibration.
> =

> For example, the FB4040 uses 256 MiB Nanya NT5CC128M16IP clocked
> at round 533 MHz (ddrpllsdcc =3D 190285714 Hz).
> =

> whereas the 128 MiB Nanya NT5CC64M16GP-DI in the ASUS RT-AC58U is
> clocked at a slightly higher 537 MHz ( ddrpllsdcc =3D 192000000 Hz).
> =

> This patch attempts to fix the issue by modifying
> clk_cpu_div_round_rate(), clk_cpu_div_set_rate(), clk_cpu_div_recalc_rate=
()
> to use a new qcom_find_freq_close() function, which returns the closest
> matching frequency, instead of the next higher. This way, the SoC in
> the FB4040 (with its max clock speed of 710.4 MHz) will no longer
> try to overclock to 761 MHz.
> =

> Fixes: d83dcacea18 ("clk: qcom: ipq4019: Add the apss cpu pll divider clo=
ck node")
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Why can't you specify the right frequency in the OPP tables?
