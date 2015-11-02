Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:47327 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423AbbKBNYE (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2015 08:24:04 -0500
Message-ID: <1446470642.3442.54.camel@pengutronix.de>
Subject: Re: ML for reset controller sub-system?
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Mon, 02 Nov 2015 14:24:02 +0100
In-Reply-To: <CAK7LNARGbHqn9D3fDtN9xzwzFoYCur2qJUnnyRA4Q52D9XUVVA@mail.gmail.com>
References: <CAK7LNARGbHqn9D3fDtN9xzwzFoYCur2qJUnnyRA4Q52D9XUVVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Masahiro,

Am Montag, den 02.11.2015, 22:05 +0900 schrieb Masahiro Yamada:
> Hi Philipp,
> 
> 
> I searched for the reset controller entry in MAINTAINERS.
> 
> 
> RESET CONTROLLER FRAMEWORK
> M:      Philipp Zabel <p.zabel@pengutronix.de>
> S:      Maintained
> F:      drivers/reset/
> F:      Documentation/devicetree/bindings/reset/
> F:      include/dt-bindings/reset/
> F:      include/linux/reset.h
> F:      include/linux/reset-controller.h
> 
> 
> Nothing is mentioned which mailing list
> reset controller patches should be sent to.
> 
> Please advise me.

There is no special reset-controller mailing list. Due to the low amount
of patches until now, I'm just using linux-kernel@vger.kernel.org.
scripts/get_maintainer.pl should give you the right list for existing
drivers.

For new drivers consider adding the SoC/architecture specific mailing
list to --cc, especially when coordination between reset and other
drivers is needed during bringup. If new device tree bindings are added,
always include devicetree@vger.kernel.org.

best regards
Philipp

