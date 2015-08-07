Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 7 Aug 2015 15:28:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Pawel Moll <pawel.moll@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>
Subject: Re: [PATCH 1/3] clk: versatile: Switch to assigned clock parents
Message-ID: <20150807222823.GB16477@codeaurora.org>
References: <55BBB2FC.9030102@codeaurora.org>
 <1438386285-5070-1-git-send-email-sboyd@codeaurora.org>
 <1438386285-5070-2-git-send-email-sboyd@codeaurora.org>
 <1438610480.2142.14.camel@arm.com>
 <55BFAB11.7080600@codeaurora.org>
 <1438770574.2142.80.camel@arm.com>
 <55C24E56.3020004@codeaurora.org>
 <1438873513.2142.95.camel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438873513.2142.95.camel@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/06, Pawel Moll wrote:
> On Wed, 2015-08-05 at 18:56 +0100, Stephen Boyd wrote:
> > On 08/05/2015 03:29 AM, Pawel Moll wrote:
> > >
> > > Right, that's probably my fault. The sp810 nodes appeared in the VE
> > > trees very early (in terms of the "DT era"), when we weren't so strict
> > > about documentation. So far, it would be fairly simple, something like
> > > the text below - feel free to take it, mend it, extend it with your
> > > changes and include in the series:
> > >
> > > Thanks!
> > 
> > Great! Can you please provide your signed-off-by? 
> 
> Sure. 

Thanks! I've put that patch before my series and squashed this into patch 1/3.

----8<----
diff --git a/Documentation/devicetree/bindings/arm/sp810.txt b/Documentation/devicetree/bindings/arm/sp810.txt
index 440ee0892a4d..6808fb5dee40 100644
--- a/Documentation/devicetree/bindings/arm/sp810.txt
+++ b/Documentation/devicetree/bindings/arm/sp810.txt
@@ -24,12 +24,23 @@ Required properties:
 - clock-output-names: from the common clock bindings;
 		should be: "timerclken0", "timerclken1", "timerclken2", "timerclken3"
 
+- assigned-clocks: from the common clock binding;
+		should be: clock specifier for each output clock of this
+		provider node
+
+- assigned-clock-parents: from the common clock binding;
+		should be: clock specifier of input clock listed in clocks
+		property with the highest frequency
+
 Example:
-	sysctl@020000 {
+	v2m_sysctl: sysctl@020000 {
 		compatible = "arm,sp810", "arm,primecell";
 		reg = <0x020000 0x1000>;
 		clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&smbclk>;
 		clock-names = "refclk", "timclk", "apb_pclk";
 		#clock-cells = <1>;
 		clock-output-names = "timerclken0", "timerclken1", "timerclken2", "timerclken3";
+		assigned-clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
+		assigned-clock-parents = <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
+
 	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
