Return-Path: <sumit.semwal@linaro.org>
MIME-Version: 1.0
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 8 Aug 2017 21:05:03 +0530
Message-ID: <CAO_48GHvyUD7vD1qJP=41Wt0nyeiyhoCpVSYL-v-jbU_dd1Sgw@mail.gmail.com>
Subject: Request for inclusion to stable-4.9
To: "# 3.4.x" <stable@vger.kernel.org>
Cc: Leo Yan <leo.yan@linaro.org>, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Greg,

Please consider commit

9a881bc55d7b: clk: Hi6220: enable stub clock driver for ARCH_HISI

for inclusion into stable-4.9; without this, Hikey's cpufreq driver
doesn't work, and the cpufreq kselftests fail on it accordingly.

Best regards,
Sumit.
