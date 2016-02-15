Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:58353 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753322AbcBON7e (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 15 Feb 2016 08:59:34 -0500
Subject: Allwinner A64 MMC support
To: Hans de Goede <hdegoede@redhat.com>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
 <56BE29A1.3060107@redhat.com> <56C1A590.6030500@arm.com>
 <56C1C7BB.1040602@redhat.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	=?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	Rob Herring <rob.herring@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
From: Andre Przywara <andre.przywara@arm.com>
Message-ID: <56C1D9C0.6020601@arm.com>
Date: Mon, 15 Feb 2016 13:59:28 +0000
MIME-Version: 1.0
In-Reply-To: <56C1C7BB.1040602@redhat.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Hans,

....

> 
> p.s.
> 
> I love the work you've been doing on the A64, I've not had a chance
> to try it out yet though. Have you made any progress with getting
> the mmc slot to work ?  If not maybe I can make some time I've
> prior experience in bringing up the mmc slot on other Allwinner SoCs

Thanks for that!

So we made some progress on the weekend (with the help of #linux-sunxi):
1) The regulator node was stupidly put by me into a separate child node
without putting address and size cells into. So I just moved it into
/soc directly now and that seems to fixed the missing regulator.
2) The reset node is a allwinner,sun6i-a31-ahb1-reset, which does not
get registered automatically, but by an explicit call from mach-sunxi/.
I wonder why we do this (yes, I saw that comment, but still...) and if
it would work with a normal MODULE_DEVICE_TABLE() declaration.
There is and will be no equivalent to the mach- directory on arm64.
3) As Jens pointed out, the MMC IP block isn't really compatible.
Changing the clocks is easy (done already), but we need to come up with
code to cover the new phase setting registers in the A64 MMC register block.

Interestingly somehow hacking this (pretending it is compatible) seems
to work, though I got reports from people about mysterious kernel
crashes, so I'm inclined to leave MMC out of the first patch series.

So if you could take a look at the new registers (starting at offset
0x140) and work out what we actually need to do here, that would be
great. I have no real clue about what they actually do and how they
relate to the current output and sample clock phase.
To me it looks like we might get away with just triggering the automatic
calibration and the hardware does the rest for us - keep your fingers
crossed ;-)

Cheers,
Andre.
