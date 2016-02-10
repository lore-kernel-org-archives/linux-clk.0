Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]:43388 "EHLO
	cgate.sperl.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752274AbcBJRmv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2016 12:42:51 -0500
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: serial: clk: bcm2835: Strange effects when using aux-uart in console
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <56BB719B.8070007@i2se.com>
Date: Wed, 10 Feb 2016 18:42:53 +0100
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>,
	Eric Anholt <eric@anholt.net>
Message-Id: <3C1ABADD-C0B2-430A-99B3-EAF9B56D0A49@martin.sperl.org>
References: <A5F427B7-9B78-4892-9722-69418C4D0C10@martin.sperl.org> <56BB719B.8070007@i2se.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


> On 10.02.2016, at 18:21, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> 
> Hi,
>> Maybe someone has gotten any idea?
> 
> this sounds like an issue i had with the compute module here:
> 
> http://permalink.gmane.org/gmane.linux.kernel.rpi/2197
> 
This one was fixed - if I remember correctly.

> Unfortunately i don't have the cm anymore.
> 
> Maybe you can try this downstream patch:
> 
> https://github.com/raspberrypi/linux/commit/09041f7ccbd1cde792edae91c41266886d5d1382
> 
I wonder if it is really interrupts that are the root cause
to mee it looks like a clock problem - especially as it actually
impacts the PL011 driver and not the aux driver…

And initializing the other way (pl011 is console, aux as tty)
works without any issues - so it HAS to do with accessing the
PL011 or the clock framework.

Martin

