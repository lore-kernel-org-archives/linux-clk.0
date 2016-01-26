Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:47397 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932135AbcAZIXg (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2016 03:23:36 -0500
Subject: Re: Bits that affect several muxes
To: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <daniel-gl@gmx.net>
References: <20160122233737.GA15679@minime.bse>
CC: <linux-clk@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <56A72CB7.7050707@mentor.com>
Date: Tue, 26 Jan 2016 10:22:15 +0200
MIME-Version: 1.0
In-Reply-To: <20160122233737.GA15679@minime.bse>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Daniel,

On 23.01.2016 01:37, Daniel Glöckner wrote:
> Hi,
> 
> today at work I just realized that the i.MX6 clock tree is not correctly
> modeled wrt. PLL bypassing since bypassing the PLL also bypasses all PFD
> post dividers. I've seen this before on the jz4730 where disabling the
> PLL also sets several clocks to the same source.

could you please give a more detailed example for iMX6 (particular clock
names, registers, bit fields from the Reference Manual)?

> Maybe I haven't dug deep enough into the mail archive, but I couldn't
> find any information on how to handle cases like these. Can this be
> modeled with the existing clock primitives?

I believe I met something similar (one bit control, which changes several
muxes or gates), and practically I found that in read-only muxes case this
can be handled by registering several such muxes with the same hardware
controls (same mux register, bit shift and mask) but different list of
parents, which are specific to every particular mux. And CCF is not yet
ready to correctly process clk_set_parent() calls on such kind of muxes.

Best wishes,
Vladimir

