Return-Path: <Alexey.Brodkin@synopsys.com>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
CC: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL Clock
Date: Fri, 22 Apr 2016 14:55:06 +0000
Message-ID: <1461336899.3205.11.camel@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
	 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
In-Reply-To: <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
Content-Type: text/plain; charset="utf-7"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Jose,

On Thu, 2016-04-21 at 18:19 +-0100, Jose Abreu wrote:
+AD4- Add device tree bindings for AXS10X I2S PLL Clock driver.
+AD4-=20
+AD4- Signed-off-by: Jose Abreu +ADw-joabreu+AEA-synopsys.com+AD4-
+AD4- ---
+AD4-=20
+AD4- Changes v5 -+AD4- v6:
+AD4- +ACo- Added 'clocks' field
+AD4-=20
+AD4- This patch was only introduced in v5.
+AD4-=20
+AD4- +AKA-arch/arc/boot/dts/axs10x+AF8-mb.dtsi +AHw- 13 +-+-+-+-+-+-+-+-+-=
+-+-+-+-
+AD4- +AKA-1 file changed, 13 insertions(+-)
+AD4-=20
+AD4- diff --git a/arch/arc/boot/dts/axs10x+AF8-mb.dtsi b/arch/arc/boot/dts=
/axs10x+AF8-mb.dtsi
+AD4- index ab5d570..5c6489e 100644
+AD4- --- a/arch/arc/boot/dts/axs10x+AF8-mb.dtsi
+AD4- +-+-+- b/arch/arc/boot/dts/axs10x+AF8-mb.dtsi
+AD4- +AEAAQA- -16,7 +-16,20 +AEAAQA-
+AD4- +AKA-		ranges +AD0- +ADw-0x00000000 0xe0000000 0x10000000+AD4AOw-
+AD4- +AKA-		interrupt-parent +AD0- +ADwAJg-mb+AF8-intc+AD4AOw-
+AD4- +AKA-
+AD4- +-		i2sclk: i2sclk+AEA-100a0 +AHs-
+AD4- +-			compatible +AD0- +ACI-snps,axs10x-i2s-pll-clock+ACIAOw-
+AD4- +-			reg +AD0- +ADw-0x100a0 0x10+AD4AOw-
+AD4- +-			clocks +AD0- +ADwAJg-i2spll+AF8-clk+AD4AOw-
+AD4- +-			+ACM-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +-		+AH0AOw-
+AD4- +-
+AD4- +AKA-		clocks +AHs-
+AD4- +-			i2spll+AF8-clk: i2spll+AF8-clk +AHs-
+AD4- +-				compatible +AD0- +ACI-fixed-clock+ACIAOw-
+AD4- +-				clock-frequency +AD0- +ADw-27000000+AD4AOw-
+AD4- +-				+ACM-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +-			+AH0AOw-
+AD4- +-
+AD4- +AKA-			i2cclk: i2cclk +AHs-
+AD4- +AKA-				compatible +AD0- +ACI-fixed-clock+ACIAOw-
+AD4- +AKA-				clock-frequency +AD0- +ADw-50000000+AD4AOw-

Acked-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4-=
