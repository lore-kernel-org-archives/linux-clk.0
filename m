Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn3nam01on0112.outbound.protection.outlook.com ([104.47.33.112]:54102
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726926AbeIFSfz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Sep 2018 14:35:55 -0400
From: "Spruyt, Randy" <Randy.Spruyt@christiedigital.com>
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: getting a PHC reference in a kernel module?
Date: Thu, 6 Sep 2018 14:00:07 +0000
Message-ID: <BC3A5CD34524E4468CEC38A99142631601AD938581@cktexmb01.cds.int>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I'm new to kernel driver development, so I hope you bear with me on the question. 

I'd like to timestamp an IRQ event in a kernel moudle using a PTP synchronized clock (e.g. the PHC from eth0 = /dev/ptp0). E.g. a GPIO pin goes high, I'd like to keep track of when this happened. Low latency is important. One option is to use getnstimeofday() and have phc2sys synchronize /dev/ptp0 with the system  clock. 

This seems to work but I feel like there is a more direct way to just query the PHC clock e.g. using struct ptp_clock* and gettime64(). The question is how to get this pointer, find_driver()? Or something else?

If this is the wrong way to go about this, by all means, I'm open to suggestions.

Randy
