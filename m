Return-Path: <ben@smart-cactus.org>
From: Ben Gamari <ben@smart-cactus.org>
To: Thomas Abraham <thomas.ab@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Anand Moon <linux.amoon@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	b.zolnierkie@samsung.com
Subject: [PATCH v5 0/12] cpufreq: Add support for Exynos 5800, 5420, and 5422
Date: Wed,  2 Dec 2015 22:19:15 +0100
Message-Id: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
List-ID: <linux-clk.vger.kernel.org>


This patch series adds cpufreq support for the Exynos 5800, 5420, and 5422
SOCs. In particular, it adds support for operating-points-v2 bindings to the
arm-big-little cpufreq driver and updates the above-mentioned SOCs' devicetrees
to take advantage of this support. There are also a couple of patches improving
the clarify of the arm-big-little implementation. It is built on a set posted
by Bartlomiej Zolnierkiewicz in April 2015.

The most signficant change from the original series is porting to the
operating-points-v2 devicetree bindings. The series has been tested by me on
and Odroid XU4 and by Javier Martinez Canillas on a Peach Pit.

Cheers,

- Ben
