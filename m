Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:50093 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932265AbcAVXhm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 22 Jan 2016 18:37:42 -0500
Received: from minime.bse ([77.20.40.102]) by mail.gmx.com (mrgmx001) with
 ESMTPSA (Nemesis) id 0MKYLf-1aNaDc3Lz5-001yOV for
 <linux-clk@vger.kernel.org>; Sat, 23 Jan 2016 00:37:39 +0100
Date: Sat, 23 Jan 2016 00:37:37 +0100
From: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <daniel-gl@gmx.net>
To: linux-clk@vger.kernel.org
Subject: Bits that affect several muxes
Message-ID: <20160122233737.GA15679@minime.bse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

today at work I just realized that the i.MX6 clock tree is not correctly
modeled wrt. PLL bypassing since bypassing the PLL also bypasses all PFD
post dividers. I've seen this before on the jz4730 where disabling the
PLL also sets several clocks to the same source.

Maybe I haven't dug deep enough into the mail archive, but I couldn't
find any information on how to handle cases like these. Can this be
modeled with the existing clock primitives?

Best regards,

  Daniel
