Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAD2C43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 02:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90647217F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 02:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=boxcast-com.20150623.gappssmtp.com header.i=@boxcast-com.20150623.gappssmtp.com header.b="mrerOjCG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfADCgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 21:36:01 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:41400 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfADCgA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 21:36:00 -0500
Received: by mail-ua1-f45.google.com with SMTP id z24so11580985ual.8
        for <linux-clk@vger.kernel.org>; Thu, 03 Jan 2019 18:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boxcast-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=bbC7oRZCzWf6WJN2vGz1+TIq9q8OHX1LTDGp2RVV4h0=;
        b=mrerOjCGHyyukE/jFkX1XmIoUCK0W9Y07XIxnDOowL2qDPV6acyQ6Q+uyQDBjXjMGM
         E1tNq0cpc1Pl12tbi4n2eXfE3BE5Q2WVSPG8JTmaJFaBexD5bNxf/1/ogcCvBPxFnotO
         is4als+JPLZW8iTRfpuOt94RHQ8/46sKyFSNenGB4nZY4eYQvmcxo2p09CONLeM67XlM
         uf45I2UStOXOkNWWGnv/fSas10/tdD6NuPEVRSPlxKlB0fjNalex9pcftrtXmqBF9hVc
         5FJ5WBoXlQjRQNdSSVsDFK5gXW+Dn85GRXu9zXx0ir32IkUikgolSMrm8L3XPZMyc1w5
         pQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bbC7oRZCzWf6WJN2vGz1+TIq9q8OHX1LTDGp2RVV4h0=;
        b=gM87RjNFQDxGNWC/7RlQDgBth8mYRRwRdyG4x2hZxdLlwBqhsbvNB60gep+NlPZZHc
         HHlBlIxieSMY1QcQ2FUj2rUmNWLKp9SdiWPdxruwsP73XDxSztPevZ9KaFIuzSLX04TC
         gAj5mAjg0HtRJjXkE60zIlD33NrMJ9tTEmi+ZQBTRXTpiKPhhKpnLQ7j2mNwM2bfYdkL
         JHVW+zJPsdSaIKsChOiCwsZneeo6LZiExqJrP6ptP8t2Zhld6tGjmfAp0fFqtTp0NfaV
         5F/qBhoQFUkw2Y2yZKhu1qHqAToRbnVtPcvIoHXxmKDg3HlRMf1eZh067SX2UCQ0yByd
         WoGw==
X-Gm-Message-State: AJcUukffFXw76lvavdzgSgtqcAThyzOMMWBMIEWQRhieqpYx2cT3efJ4
        8qxW+nUvLR7wdiznKmo+TNNbep42lOZcCN2Qf8iK1Y/RenA=
X-Google-Smtp-Source: ALg8bN4dt/5XOPMW/T5dqnoa7vMy5f2NiBmOOxC3UDYgxId8qwcp7aTyZbj/83zE9RCxy2fDLQs5DoCr2X8I9Q/JJk0=
X-Received: by 2002:ab0:2482:: with SMTP id i2mr6898021uan.82.1546569359075;
 Thu, 03 Jan 2019 18:35:59 -0800 (PST)
MIME-Version: 1.0
From:   Jonny Hall <jonny.hall@boxcast.com>
Date:   Thu, 3 Jan 2019 21:35:47 -0500
Message-ID: <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com>
Subject: Informing common clock framework driver of externally-derived base
 clock frequency
To:     linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I've been tasked with writing a driver for the Silabs si5342
programmable jitter attenuator / clock multiplier. Looking at existing
common clock framework drivers for similar parts (such as
clk-si5351.c), most of this is relatively straightforward -- it's a
composite device, with multiplexers that can select a parent clock,
and fractional-N dividers that support the set_rate and round_rate
functions. However, in all the examples I've seen, the ultimate parent
/ root clock source is specified in the device tree as a fixed
frequency -- a crystal / oscillator / other known-at-design-time
frequency source. However, in my application, the input frequency of
the si5342 is not known in advance, is derived from an external
source, and can change during runtime. The si5342 will need to be
(re)configured during operation with the frequency of this root clock
source in order to properly lock onto it and generate the correct
output frequencies -- it cannot independently determine the input
frequency, only "locked" / "unlocked" state.  The application software
(other drivers and usermode application code) will know the input
clock rate.  I've though of a couple ways to do this:

-Implement the root clock source as an "imaginary" divider where the
set_rate call actually configures the input dividers of the si5342.
This approach seems to abuse the common clock framework, as I'm not
actually *setting* the rate, I'm *informing* the driver of a rate that
was determined independently.

-Have my si5342 driver create a /dev/si5342 file or something in /sys/
where userspace functions can write the frequency to a file to inform
the driver. This approach seems dirty in that it's using two different
methods (common clock framework and device nodes) to access the same
hardware.

-Something else involving adding an inform_rate function to the common
clock framework to support clock sources derived from external,
variable rate sources -- this sounds beyond my skillset, and
potentially expanding the scope of the common clock framework beyond
what is intended.

Any thoughts on what approach would be the "best" in terms of working,
keeping with the spirit of the common clock framework, and not
breaking things?

Thanks,
  -Jonny
