Return-Path: <Jiada_Wang@mentor.com>
From: Jiada Wang <jiada_wang@mentor.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <joshua_frkuska@mentor.com>,
	<vladimir_zapolskiy@mentor.com>, <jiada_wang@mentor.com>
Subject: [PATCH v3] clk: move check of CLK_SET_RATE_GATE flag to clk_propagate_rate_change()
Date: Tue, 23 Aug 2016 17:10:57 +0900
Message-ID: <1471939858-20925-1-git-send-email-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

v3:
- updated commit message
- only check CLK_SET_RATE_GATE flag in case of 'PRE_RATE_CHANGE' event
- continue propagate rate change, even when there is error in clk_propagate_rate_change()

v2:
- changed to return clk_core *core, instead of NULL

Jiada Wang (1):
  clk: move check of CLK_SET_RATE_GATE flag to
    clk_propagate_rate_change()

 drivers/clk/clk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.4.5
