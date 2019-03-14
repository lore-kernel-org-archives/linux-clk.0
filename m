Return-Path: <SRS0=Z7Th=RR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33CFC43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 10:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A83962064A
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 10:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="gWcgCsSw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfCNKS4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:18:56 -0400
Received: from mout.gmx.net ([212.227.17.20]:60433 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727281AbfCNKS4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Mar 2019 06:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1552558727;
        bh=MUtwv8sh+35U8CFGxY4MaoDXm1iD9MVvVE0ZolcZNY4=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=gWcgCsSw28ZYN8ia24LHFSC+kkK/iJSUXUNMbpFr+IENWiPZphOHSMfuu0jQ5XgDx
         qnMbs/AGK9FSKKzTKgQGDph4uTOj0JKaUz+nNlqorm5BIjRvKaw4je5S1Zd/7gYJD3
         P5EiMIm5pYXg833h+Wlma4fi1q2CDYsSyqmZC9Ww=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MQNFY-1hThpz2vyG-00TjFZ; Thu, 14
 Mar 2019 11:18:47 +0100
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Subject: clk: x86: Stop marking clocks as CLK_IS_CRITICAL is causing
 non-working hardware.
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <e6e11d5c-988a-aef4-cb8c-9e3bef254b87@gmx.ch>
Date:   Thu, 14 Mar 2019 11:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:wYURcmuB6nTtXpy8Bv61eXcy042MPd0MkwjFh3TYBo4To5wn6aP
 X+8YtbjFxMN57rlUKVWcOX19oggPXZIZbA4ePuI657mJoQjlXHdLDRQeO1SRPDWRc/hbNgv
 iUeMvhiy4/m8t68taJN8ch/ebjFNNWvbqOz9N1b8Ya/w8nifEB9R990Rfvh4JTGKXO37oTl
 PAV3sNRKNu6hTEqgaCDzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fEel+8FmGGQ=:68vNPCYtG3lP8AK237M4r/
 P5yREJ2zFprF4qpH8ZtCzBKpakD3Eptf+uVnsH5vEfN8ak1RmbJ/T7KOuliCE0PV17ZnbByty
 nCP3a45qa0iCK6LRZETkVJBMqn0G/CfhbuWN5ba/6wBFhMutaBZAB05ne6PWgNIRihWaAXo8c
 WlNRIEGelnakVXlzr+wI8myeNRnOulySux+SbahefcE22mRoH1snpOElMmRhE9a9ObQEMWL6k
 CnL994ayL7bf/z+df/ZOtZcWlGlDhVFzg39g9uDOU2DawcwvyFqZlp484KUvr+4EDqOwGtAAx
 Zix/EiidUw/1LhSIkII+CEAFgQ/zMv64tiuiHmDmtfUNRotJTuV75bzuy5OF7vXFxrYgoJ/Fa
 K3nXNMwS+p69kSIxvJb7FEuM79yRFB8PuX6ZTMmo0+Gl5JUr8o+u8JlEj5c/9KUYIoXQcywpi
 Hpw21H8oueAuDcL5giTl8wYbTnidzMerCOohU6ix3fsw8/JRf7cuD8JoUGkdrOsXN6W2LMKQa
 MrlUpt90IHQiIsC78zVYnn9fxmIySDNLuOsVaZOg6sktLslZTY4yV219TG5mpoWHFz/O1Uzt6
 rVqrC6bYHtMzR4tuXb7b+21xxU77ZeZ6FZVy2LoP+blLioxrQkQsICUIqD0LcHr0Gl81iZE7l
 aJUhT6pKdUcIyLxD9wvQAv+M8WYDTxD2G7vitAZ/s6TcH0ApcGV+NV2PJmVsi62Ff+DPHuZ0A
 rP4U4wxNb5YN02il1/LtVsl038d9tEl0Sp62MkmzEwGBeSJVDgigWywP9d1HcEd1W9T8x84gh
 2VDfdNxZa8u8c6ykzFTzhkTUtBtGziDSa//h16CtZy3mb0kZMxLrGS6rSi8uVk/q1iKYo9X94
 jYZxiaEOwFoHyq0lFmV9ZuCSQiq25PQRJRWITrWZO7BGVCUJ2fbuaUuYr5iP7iehqn3Iooh9S
 7SF3DEx42oQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

I have a x86 (Bay Trail) based hardware, where pmc_plt_clk0 is used to
drive some external hardware (USB HSIC chip attached to the SoC's xHCI
root port).

Since commit 88659387b9d509ee4bb8f0b0fe9ce2ff00988b46, the pmc_plt_clk0
is unconditionally gated off, resulting in a non-working HSIC chip and
all the USB devices behind it.

What is the proper way to fix this regression:
- revert this commit?
- implement some kind of "quirk" in the clk-pmc-atom driver?
- ???


Thanks
