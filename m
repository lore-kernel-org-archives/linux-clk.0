Return-Path: <bhuvanchandra.dv@toradex.com>
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
To: <gregkh@linuxfoundation.org>
CC: <stefan@agner.ch>, <shawnguo@kernel.org>, <kernel@pengutronix.de>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <jslaby@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, Bhuvanchandra
 DV <bhuvanchandra.dv@toradex.com>
Subject: [PATCH RESEND v2 0/8] Improve Rx/Tx DMA implementation
Date: Tue, 19 Jul 2016 13:13:02 +0530
Message-ID: <20160719074310.16872-1-bhuvanchandra.dv@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: bhuvanchandra.dv@toradex.com
List-ID: <linux-clk.vger.kernel.org>

Drop the clock change patch from v2 patchset[1] since it is applied.

Changes since v1:
Split suspend/resume patch.

[1] https://lkml.org/lkml/2016/6/28/124

Bhuvanchandra DV (5):
  tty: serial: fsl_lpuart: Fix broken 8m/s1 support
  tty: serial: fsl_lpuart: Use cyclic DMA for Rx
  tty: serial: fsl_lpuart: Use scatter/gather DMA for Tx
  tty: serial: fsl_lpuart: Update suspend/resume for DMA mode
  tty: serial: fsl_lpuart: Add support for RS-485

Stefan Agner (3):
  tty: serial: fsl_lpuart: consider TX FIFO too in tx_empty
  tty: serial: fsl_lpuart: support suspend/resume
  tty: serial: fsl_lpuart: fix clearing of receive flag

 drivers/tty/serial/fsl_lpuart.c | 810 +++++++++++++++++++++++-----------------
 1 file changed, 476 insertions(+), 334 deletions(-)

-- 
2.9.0
