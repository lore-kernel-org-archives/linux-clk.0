Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mxout1.idt.com ([157.165.5.25]:52858 "EHLO mxout1.idt.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752342AbcHJWug convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Aug 2016 18:50:36 -0400
Received: from mail.idt.com (localhost [127.0.0.1])
	by mxout1.idt.com (8.13.1/8.13.1) with ESMTP id u7AMoZRq022926
	for <linux-clk@vger.kernel.org>; Wed, 10 Aug 2016 15:50:35 -0700
Received: from corpml3.corp.idt.com (corpml3.corp.idt.com [157.165.140.25])
	by mail.idt.com (8.13.8/8.13.8) with ESMTP id u7AMoYik003672
	for <linux-clk@vger.kernel.org>; Wed, 10 Aug 2016 15:50:35 -0700 (PDT)
Received: from corpmail2.na.ads.idt.com (corpimss2.corp.idt.com [157.165.141.30])
	by corpml3.corp.idt.com (8.11.7p1+Sun/8.11.7) with ESMTP id u7AMoYT24327
	for <linux-clk@vger.kernel.org>; Wed, 10 Aug 2016 15:50:34 -0700 (PDT)
From: "Cater, David" <David.Cater@idt.com>
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Unable to add my common clock framework driver to a Raspberry Pi
 device tree
Date: Wed, 10 Aug 2016 22:50:33 +0000
Message-ID: <9CB9E73754876847AB77809DF28B0A8C2A2E45@corpmail1.na.ads.idt.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I am trying to write a common clock framework driver for a clock that I have attached to my Raspberry PI 3 via I2C.  I have created a basic Hello World common clock framework driver, and I am trying to add it to the device tree.  As far as I can tell, the PI is not loading my driver (a printk message in the probe function doesn't appear in dmesg).

I have posted a full description of the issue here, including my code and device tree snippets:

http://stackoverflow.com/questions/38884498/hello-world-for-common-clock-framework-driver-on-raspberry-pi-3

Thanks,

David
