Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19201 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753144AbcDNLc1 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2016 07:32:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5M00KWJG20GX20@mailout2.w1.samsung.com> for
 linux-clk@vger.kernel.org; Thu, 14 Apr 2016 12:32:24 +0100 (BST)
Subject: Re: Programming a clock in the device tree
To: Peter Rosin <peda@lysator.liu.se>
References: <570ED310.3020604@lysator.liu.se>
Cc: linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <570F7FB4.9010504@samsung.com>
Date: Thu, 14 Apr 2016 13:32:04 +0200
MIME-version: 1.0
In-reply-to: <570ED310.3020604@lysator.liu.se>
Content-type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/14/2016 01:15 AM, Peter Rosin wrote:
> Hi!
> 
> I'm trying to connect (in a device tree) a programmable clock
> to a device that does not expect the clock to need any
> programming.
> 
> I can hack this and add a clk_set_rate at the appropriate point
> in the driver for the clk consumer, but I was expecting to see
> some way of just adding a device tree node to get this done for
> me.
> 
> It just feels wrong to add this hack to the driver as the
> programmable clock might be needed for more than one device and
> the decisions by one driver might conflict with other needs (the
> driver in question can use a variety of clock rates, so the rate
> it should request is policy not belonging in a driver).
> 
> Adding a device tree frequency property to the driver in question
> is also a possibility, but that would need code duplication for
> other clock consumers as well, when someone wants to use those
> drivers in the way I'm now trying to use this driver.
> 
> I.e. I expected to see a driver, just like the fixed clock
> driver, but that programs a parent clock instead of just
> representing a fixed oscillator. Is there such a thing? If not,
> what is it that I'm not seeing? Because I just can't believe that
> I'm the first person to need this...

How about using assigned-{clocks, clock-parents, clock-rates}
properties in the clock provider node? Wouldn't it help in your
case? Documentation can be found in Documentation/devicetree/
bindings/clock/clock-bindings.txt


-- 
Regards,
Sylwester
