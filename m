Return-Path: <SRS0=fX0Q=WL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6095C31E40
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 09:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A62E2206C1
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 09:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfHOJvD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Aug 2019 05:51:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45403 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730780AbfHOJvD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Aug 2019 05:51:03 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hyCPL-0007XN-CW; Thu, 15 Aug 2019 11:50:59 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hyCPL-0003xr-17; Thu, 15 Aug 2019 11:50:59 +0200
Date:   Thu, 15 Aug 2019 11:50:59 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: clk: Make example a bit clearer
Message-ID: <20190815095059.ljqznve6pvqqfl57@pengutronix.de>
References: <20190815074604.5416-1-uwe@kleine-koenig.org>
 <1870872.EFtpEp3zHr@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1870872.EFtpEp3zHr@ada>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Aug 15, 2019 at 10:37:54AM +0200, Alexander Dahl wrote:
> Hello Uwe,
> 
> thanks for your effort on improving this. See below.
> 
> Am Donnerstag, 15. August 2019, 09:46:04 CEST schrieb Uwe Kleine-König:
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Previously the example used <&pll 2> in two places which made it harder
> > than necessary to understand why this clock gets the parent of
> > <&clkcon 0>.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/clock/clock-bindings.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
> > b646bbcf7f92..30aa63a2eecb 100644
> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -154,11 +154,11 @@ set to 0, or can be omitted if it is not followed by
> > any non-zero entry. clock-names = "baud", "register";
> > 
> >          assigned-clocks = <&clkcon 0>, <&pll 2>;
> > -        assigned-clock-parents = <&pll 2>;
> > +        assigned-clock-parents = <&pll 1>;
> >          assigned-clock-rates = <0>, <460800>;
> >      };
> > 
> > -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0>
> > and +In this example the <&pll 1> clock is set as parent of clock <&clkcon
> > 0> and the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> > 
> >  Configuring a clock's parent and rate through the device node that consumes
> 
> With your change the assigned-clock-parent is a clock also listed with the 
> clocks a few lines above, don't know if that's less puzzling?
> 
> Let me repeat for the audience here (I initially asked on #armlinux IRC 
> channel), what I did not understand, maybe someone else has an idea how to 
> better explain it.
> 
> First: I'm experimenting on a SAMA5D27-SOM1-EK board and want to use one of 
> the PCKx to output on some easy accessible pin (to see the signal on a scope). 
> On our real hardware that clock will be input for another IC on the board 
> connected to the EBI external memory interface. I wrote a dummy driver to 
> prepare/enable that clock, nothing sophisticated. The dts nodes working now 
> are these:
> 
> 	ahb {
>         ebi: ebi@10000000 {                                                                                                                                                                    
>             status = "okay";                                                                                                                                                                   
>                                                                                                                                                                                                
>             dummy_fpga: dummy-fpga@2 {                                                                                                                                                         
>                 compatible = "thorsis,dummy-fpga";                                                                                                                                             
>                 pinctrl-names = "default";                                                                                                                                                     
>                 pinctrl-0 = <&pinctrl_dummy_fpga_default>;                                                                                                                                     
>                 status = "okay";                                                                                                                                                               
>                 reg = <0x2 0x0 0x10000>;                                                                                                                                                       
>                 clocks = <&pck1>;                                                                                                                                                              
>                 assigned-clocks = <&prog1>;                                                                                                                                                    
>                 assigned-clock-parents = <&main>;                                                                                                                                              
>                 assigned-clock-rates = <6000000>;                                                                                                                                              
>                 /*                                                                                                                                                                             
>                 assigned-clock-parents = <&clk32k>;                                                                                                                                            
>                 assigned-clock-rates = <16384>;                                                                                                                                                
>                 */                                                                                                                                                                             
>                                                                                                                                                                                                
>                 atmel,smc-bus-width = <8>;                                                                                                                                                     
>                 atmel,smc-read-mode = "nrd";                                                                                                                                                   
>                 atmel,smc-write-mode = "nwe";                                                                                                                                                  
>                 atmel,smc-exnw-mode = "disabled";                                                                                                                                              
>                                                                                                                                                                                                
>                 atmel,smc-ncs-rd-setup-ns = <20>;                                                                                                                                              
>                 atmel,smc-nrd-setup-ns = <20>;                                                                                                                                                 
>                 atmel,smc-ncs-wr-setup-ns = <20>;                                                                                                                                              
>                 atmel,smc-nwe-setup-ns = <20>;                                                                                                                                                 
>                                                                                                                                                                                                
>                 atmel,smc-ncs-rd-pulse-ns = <40>;                                                                                                                                              
>                 atmel,smc-nrd-pulse-ns = <40>;                                                                                                                                                 
>                 atmel,smc-ncs-wr-pulse-ns = <40>;                                                                                                                                              
>                 atmel,smc-nwe-pulse-ns = <40>;                                                                                                                                                 
>                                                                                                                                                                                                
>                 atmel,smc-nwe-cycle-ns = <110>;                                                                                                                                                
>                 atmel,smc-nrd-cycle-ns = <110>;                                                                                                                                                
>                                                                                                                                                                                                
>                 atmel,smc-tdf-ns = <0>;                                                                                                                                                        
>             };                                                                                                                                                                                 
>         };                                                                                                                                                                                     
> 
> 		apb {
>             pinctrl@fc038000 {                                                                                                                                                                 
>                 pinctrl_dummy_fpga_default: dummy_fpga_default {                                                                                                                               
>                     pinmux = <PIN_PD6__PCK1>;                                                                                                                                                  
>                     bias-disable;                                                                                                                                                              
>                 };                                                                                                                                                                             
> 			};
> 		};
> 	};
> 
> The chain (desired) is like this: crystal -> mainck -> prog1 -> pck1 -> fpgack
> 
> You can choose slck, mainck, pllack, upllck, mck, or audiopllck (names from 
> sama5d2 series datasheet) as source clock for each channel of the programmable 
> clock controller. That controller is modelled as prog0, prog1, prog2 and pck0, 
> pck1, pck2 in dts.
> 
> Now the three puzzling things from the clock-bindings docs:
> 
> There are in fact three lists, assigned-clocks contains clocks you want to 
> assign parent or rate, those don't need to be the clocks your node uses, but 
> may be any clock higher up in the chain which affects your node. Right? That 
> in itself is puzzling. 
> 
> Beyond that: could I have added those properties to the nodes pck1 or prog1 as 
> well and which one would be the right node to choose?
> 
> The last hard to understand part from the example code (not the describing 
> text) is the linkage between those three lists. Each entry in assigned-clock-
> parents and assigned-clock-rates must correspond to the same index list member 
> of assigned-clocks, but you can omit entries in the back. Suggestion to 
> improve the example:
> 
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/
> Documentation/devicetree/bindings/clock/clock-bindings.txt
> index 2ec489eebe72..df098f73e901 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -159,7 +159,9 @@ set to 0, or can be omitted if it is not followed by any 
> non-zero entry.
>      };
>  
>  In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
> -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> +the <&pll 2> clock is assigned a frequency value of 460800 Hz. A parent
> +setting for <&pll 2> is omitted (end of list) and rate setting for <&clkcon 
> 0>
> +is skipped because set to <0>.

Maybe pick <&pll 3> instead of <&pll 1> in my patch and merge the two
changes? Or drop clocks and clock-names from the example because
otherwise unrelated clocks are modified which shouldn't be done. The
result is below.

Best regards
Uwe

---->8----
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Thu, 15 Aug 2019 11:48:25 +0200
Subject: [PATCH] dt-bindings: clk: Make example a bit clearer
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously the example used <&pll 2> in two places which made it harder
than necessary to understand why this clock gets the parent of
<&clkcon 0>. Also describe why <&pll 2> isn't reparented and <&clkcon 0>
gets no rate assigned.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../devicetree/bindings/clock/clock-bindings.txt     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index b646bbcf7f92..1d4942380918 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed by any non-zero entry.
         compatible = "fsl,imx-uart";
         reg = <0xa000 0x1000>;
         ...
-        clocks = <&osc 0>, <&pll 1>;
-        clock-names = "baud", "register";
+        clocks = ...
+        clock-names = ...
 
         assigned-clocks = <&clkcon 0>, <&pll 2>;
-        assigned-clock-parents = <&pll 2>;
+        assigned-clock-parents = <&pll 1>;
         assigned-clock-rates = <0>, <460800>;
     };
 
-In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
-the <&pll 2> clock is assigned a frequency value of 460800 Hz.
+In this example the <&pll 1> clock is set as parent of clock <&clkcon 0> and
+the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
+setting for <&pll 2> is omitted (end of list) and rate setting for <&clkcon 0>
+is skipped because set to <0>.
 
 Configuring a clock's parent and rate through the device node that consumes
 the clock can be done only for clocks that have a single user. Specifying
-- 
2.20.1

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
