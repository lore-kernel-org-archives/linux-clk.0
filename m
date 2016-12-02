Return-Path: <ping.bai@nxp.com>
From: Bai Ping <ping.bai@nxp.com>
To: <shawnguo@kernel.org>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <linus.walleij@linaro.org>
CC: <kernel@pengutronix.de>, <fabio.estevam@nxp.com>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <p.zabel@pengutronix.de>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ping.bai@nxp.com>
Subject: [PATCH 02/11] driver: clocksource: add gpt timer for imx6sll
Date: Fri, 2 Dec 2016 14:39:25 +0800
Message-ID: <1480660774-25055-3-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1480660774-25055-1-git-send-email-ping.bai@nxp.com>
References: <1480660774-25055-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: ping.bai@nxp.com
List-ID: <linux-clk.vger.kernel.org>

Add gpt timer support for i.MX6SLL.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clocksource/timer-imx-gpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index f595460..f71822d 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -556,4 +556,5 @@ static int __init imx6dl_timer_init_dt(struct device_node *np)
 CLOCKSOURCE_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt);
+CLOCKSOURCE_OF_DECLARE(imx6sll_timer, "fsl,imx6sll-gpt", imx6dl_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);
-- 
1.9.1
