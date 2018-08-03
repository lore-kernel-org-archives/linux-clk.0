Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:56304 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbeHCFA2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Aug 2018 01:00:28 -0400
From: Songjun Wu <songjun.wu@linux.intel.com>
To: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Songjun Wu <songjun.wu@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Subject: [PATCH v2 12/18] serial: intel: Rename fpiclk to freqclk
Date: Fri,  3 Aug 2018 11:02:31 +0800
Message-Id: <20180803030237.3366-13-songjun.wu@linux.intel.com>
In-Reply-To: <20180803030237.3366-1-songjun.wu@linux.intel.com>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Rename fpiclk to freqclk.

Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
---

Changes in v2: None

 drivers/tty/serial/lantiq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
index 2e1b35b1cf4d..28086d52e980 100644
--- a/drivers/tty/serial/lantiq.c
+++ b/drivers/tty/serial/lantiq.c
@@ -106,7 +106,7 @@ static DEFINE_SPINLOCK(ltq_asc_lock);
 struct ltq_uart_port {
 	struct uart_port	port;
 	/* clock used to derive divider */
-	struct clk		*fpiclk;
+	struct clk		*freqclk;
 	/* clock gating of the ASC core */
 	struct clk		*clk;
 	unsigned int		tx_irq;
@@ -310,7 +310,7 @@ lqasc_startup(struct uart_port *port)
 
 	if (!IS_ERR(ltq_port->clk))
 		clk_enable(ltq_port->clk);
-	port->uartclk = clk_get_rate(ltq_port->fpiclk);
+	port->uartclk = clk_get_rate(ltq_port->freqclk);
 
 	asc_update_bits(ASCCLC_DISS | ASCCLC_RMCMASK, (1 << ASCCLC_RMCOFFSET),
 		port->membase + LTQ_ASC_CLC);
@@ -633,7 +633,7 @@ lqasc_console_setup(struct console *co, char *options)
 	if (!IS_ERR(ltq_port->clk))
 		clk_enable(ltq_port->clk);
 
-	port->uartclk = clk_get_rate(ltq_port->fpiclk);
+	port->uartclk = clk_get_rate(ltq_port->freqclk);
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
@@ -744,8 +744,8 @@ lqasc_probe(struct platform_device *pdev)
 	port->irq	= irqres[0].start;
 	port->mapbase	= mmres->start;
 
-	ltq_port->fpiclk = clk_get_fpi();
-	if (IS_ERR(ltq_port->fpiclk)) {
+	ltq_port->freqclk = clk_get_fpi();
+	if (IS_ERR(ltq_port->freqclk)) {
 		pr_err("failed to get fpi clk\n");
 		return -ENOENT;
 	}
-- 
2.11.0

