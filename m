Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13377C3A59F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 18:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0D4920850
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 18:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Akbbu/9F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbfHZSQk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Aug 2019 14:16:40 -0400
Received: from mout.gmx.net ([212.227.15.18]:60161 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbfHZSQk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Aug 2019 14:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566843391;
        bh=h5jpdKxZIiD9o/50aODwHYkl6iOB10hAvW70rawnmp4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Akbbu/9FHpNoFkkDFOFdwDOPf5d9DkjAcatsn+qPY79p+Wj5b0I/6HHlSwq3LJ3Z+
         oUP711tc/dfephK7p3MBoPcx5GQn9YJ70nFMy9CCgdcYGcb4q9pP+uOPFkk5efFqK4
         pS0mxtssvPlakZ1sBe84/yMD3QRqFO4hbXk720zs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1hkExN0aZy-00JMgH; Mon, 26
 Aug 2019 20:16:31 +0200
Subject: Re: [PATCH 0/4] clk: bcm2835: Add bcm2711 support
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <af92fd53-1e3b-0022-e402-74c18bb1a859@gmx.net>
Date:   Mon, 26 Aug 2019 20:16:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:xIGOkNqPDlsXOVFEAf7jgF2yGsKmOdhvcEb9HxLUpUEOXi74bfG
 C731O8zXEiQHb+eFy7J6uFTtVDwnhaAozU9RUy8QRlyNNLHHYte3s2WpAMrFeCikmV8laGl
 icA5DVYmnTMM/U44QpGw5UTeEzwswoEDTCX91S/kMyuWV+eF2lwmDdLHaAoWorFJhdv2MtC
 au9+7dA+pjtYwEYIprE6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OOFnXBWIyUM=:dxXAX/nX38US5dzdyINotZ
 e4uGzpllJ24ruJR2O7F3syGnTXO7YPhju/cyp+iHpA0GixxthVrIkfnAhMW8jMhpjTfMivRMN
 +cX+kAM6WVWUX9SDfgf/vHHSewq5zompuXWUVaJ4YDLqEcTOs+TDWRHQFf9DUxrp9x68dQHgi
 rxTnBpc1TKwvt6MOkxh0VhvlwrqdtfOej612I8XSu1aiq+i2ZIJ4PGvjsDEVgOlF2KeDB8sF9
 LyBSlMkyBj4lA8J3NoIach237pZLQ7bJijetarRRlkbrHNIG2cfhlLdZpZi9VQS6sb7EjALyf
 GfF5Lr6U6gQB32nkrI26KfTTdcReQmHqONBxlgzPwY43ALbTBHfXwP/i1E6XwAFfHqAEEkH5e
 aZa59UpHmc9jRlZ4jDisW7qKh9o40QH+1L+hygL1E4dt1/5jBe6x6hF3GfR89Ryjx5IfZRMvH
 4DWA3bI/dpp6qyRm1oQlbtj/iUU/6LCcL8i8duWEat1V5tH3wJJP3W045hcTWubr2XRVZpy9y
 8WkF6FA11vNXDcBz5WOjsJVTvOoSW6+0dKs27TfFiFHhLXnyEQbQ/DTaHT44hCDwtAoALtdJh
 c9voUSfH/mM9/J7/xkaIaKYtjBfFQswYh499EpAQcucY7o5oEHIpWbasPY6Z+FO+DIBhF6RNI
 AXZhqePseiRJ4DeL4p4n/0Di8O6mRWsTLFF1/w7nHzxwgAqXCFvTPWhbH3qp+u1hdxJQto8Li
 Z+VeTuGHKkqSiFk+VFDBCXES5ggzU1AzqQVtg0WHv9KU7WBo6ZemRpG6+XXh6zysICnuyRO7y
 /iucqvh1E6HzWED8Gpbem2fT2LCBi/pW2L6yLLL4cB0mqhO9KOM68mAj9b6nxIaoXK0z1YTmc
 KUils31UxQWa8YAPYIlB0BibOSsU8WEFIHm0fbRRXM1kaYe+SQaC/fBuUt2QbkYfeawWoe2rx
 xa42jOXl6pw2M6S6uV0zW7wGVWDr61t0S48RtdxgxtolPxCTbf3HgwZAo3o1p96r/sosHvdsa
 AGxScpwCqzi7KLjGkMl5LZue2VjxFM8pz6FQX7rhxIXKL21lT4A77LBo+qlSQGky7v4IqUaRM
 lW/fB7t3K0scWLUZMEswTVsY72ZsS4QLJ1FzMUjKeAb2NhYPgpvktbNPoRXlmNlSoEsGgM3I9
 RBjK5W58ySIW2CikB1FpBrdLz8szCawBeTcbcr8/swvncxJg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Am 18.08.19 um 18:23 schrieb Stefan Wahren:
> This series has been split out of the recent Raspberry Pi 4 support
> series [1]. There are no functional changes, just an explaining commit
> for marking PLLD_PER as critical as request by Stephen Boyd.
>
> [1] - https://marc.info/?l=3Dlinux-arm-kernel&m=3D156571347332483
>
> Stefan Wahren (4):
>   dt-bindings: bcm2835-cprman: Add bcm2711 support
>   clk: bcm2835: Introduce SoC specific clock registration
>   clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
>   clk: bcm2835: Mark PLLD_PER as CRITICAL
>
>  .../bindings/clock/brcm,bcm2835-cprman.txt         |   4 +-
>  drivers/clk/bcm/clk-bcm2835.c                      | 138 ++++++++++++++++=
> ++---
>  include/dt-bindings/clock/bcm2835.h                |   2 +
>  3 files changed, 125 insertions(+), 19 deletions(-)
>
> =2D-
> 2.7.4
>
gentle ping ...
