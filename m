Return-Path: <jdelvare@suse.de>
Date: Wed, 11 Jan 2017 13:41:46 +0100
From: Jean Delvare <jdelvare@suse.de>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Erin Lo
 <erin.lo@mediatek.com>, "Stephen Boyd" <sboyd@codeaurora.org>, Shunli Wang
 <shunli.wang@mediatek.com>, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170111134146.36878e01@endymion>
In-Reply-To: <1484099788.26901.8.camel@mtksdaap41>
References: <20170109113621.31d384c9@endymion>
	<c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
	<20170110130300.167d215b@endymion>
	<1484099788.26901.8.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi James,

On Wed, 11 Jan 2017 09:56:28 +0800, James Liao wrote:
> On Tue, 2017-01-10 at 13:03 +0100, Jean Delvare wrote:
> > What about MT8135 and MT8173, are they 32-bit SoCs as well?
> 
> MT8135 is a 32-bit SoC and MT8173 is a 64-bit SoC.

OK, so would the following change make sense?

---
 drivers/clk/mediatek/Kconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542344083 +0100
+++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-11 13:40:21.965890913 +0100
@@ -52,16 +52,16 @@ config COMMON_CLK_MT2701_BDPSYS
 
 config COMMON_CLK_MT8135
 	bool "Clock driver for Mediatek MT8135"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default y
 	---help---
 	  This driver supports Mediatek MT8135 clocks.
 
 config COMMON_CLK_MT8173
 	bool "Clock driver for Mediatek MT8173"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default y
 	---help---
 	  This driver supports Mediatek MT8173 clocks.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
