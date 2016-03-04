Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from utopia.booyaka.com ([74.50.51.50]:41454 "EHLO
	utopia.booyaka.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759058AbcCDQcX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2016 11:32:23 -0500
Date: Fri, 4 Mar 2016 16:32:22 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
cc: Tony Lindgren <tony@atomide.com>, t-kristo@ti.com, vigneshr@ti.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ARM: OMAP2+: DRA7: Add hwmod entries for PWMSS
In-Reply-To: <56D97E51.5050602@ti.com>
Message-ID: <alpine.DEB.2.02.1603041632030.3980@utopia.booyaka.com>
References: <1456439796-28546-1-git-send-email-fcooper@ti.com> <1456439796-28546-3-git-send-email-fcooper@ti.com> <20160301181109.GB13417@atomide.com> <alpine.DEB.2.02.1603011858510.14948@utopia.booyaka.com> <20160301205043.GA4469@atomide.com>
 <56D71331.5020702@ti.com> <56D8EDF4.9070904@ti.com> <alpine.DEB.2.02.1603040553010.3980@utopia.booyaka.com> <56D97E51.5050602@ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 4 Mar 2016, Franklin S Cooper Jr. wrote:

> So what you want to happen
> is already happening in the driver. So I don't believe
> simple-bus is needed.

OK great, even better!

- Paul
