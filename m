Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.lysator.liu.se ([130.236.254.3]:42400 "EHLO
	mail.lysator.liu.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754956AbcDMXWz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2016 19:22:55 -0400
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id BD31740015
	for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2016 01:15:30 +0200 (CEST)
Received: from [192.168.0.125] (217-210-101-82-no95.business.telia.com [217.210.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 869E940011
	for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2016 01:15:29 +0200 (CEST)
To: linux-clk@vger.kernel.org
From: Peter Rosin <peda@lysator.liu.se>
Subject: Programming a clock in the device tree
Message-ID: <570ED310.3020604@lysator.liu.se>
Date: Thu, 14 Apr 2016 01:15:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi!

I'm trying to connect (in a device tree) a programmable clock
to a device that does not expect the clock to need any
programming.

I can hack this and add a clk_set_rate at the appropriate point
in the driver for the clk consumer, but I was expecting to see
some way of just adding a device tree node to get this done for
me.

It just feels wrong to add this hack to the driver as the
programmable clock might be needed for more than one device and
the decisions by one driver might conflict with other needs (the
driver in question can use a variety of clock rates, so the rate
it should request is policy not belonging in a driver).

Adding a device tree frequency property to the driver in question
is also a possibility, but that would need code duplication for
other clock consumers as well, when someone wants to use those
drivers in the way I'm now trying to use this driver.

I.e. I expected to see a driver, just like the fixed clock
driver, but that programs a parent clock instead of just
representing a fixed oscillator. Is there such a thing? If not,
what is it that I'm not seeing? Because I just can't believe that
I'm the first person to need this...

Cheers,
Peter
