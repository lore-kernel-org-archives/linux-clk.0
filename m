Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
Subject: [RFC PATCH 0/2] clk: new APIs to handle all available clocks
Date: Tue, 23 Jan 2018 20:50:39 +0800
Message-ID: <1516711841-25234-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-fbdev@vger.kernel.org,
 hdegoede@redhat.com, aisheng.dong@codeaurora.org, b.zolnierkie@samsung.com,
 sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This RFC patch series is a continue of discussion from here,
https://patchwork.kernel.org/patch/9986293/
that some users may want to handle all available clocks from device
tree without need to know the detailed clock information likes clock
numbers and names. This is useful in writing some generic drivers to
handle clock part.

Dong Aisheng (2):
  clk: add new APIs to operate on all available clocks
  video: simplefb: switch to use clk_bulk API to simplify clock
    operations

 drivers/clk/clk-bulk.c         | 64 ++++++++++++++++++++++++++++++++++++++
 drivers/video/fbdev/simplefb.c | 70 ++++++++----------------------------------
 include/linux/clk.h            | 61 +++++++++++++++++++++++++++++++++++-
 3 files changed, 137 insertions(+), 58 deletions(-)

-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
