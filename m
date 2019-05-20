Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D6EC04AAC
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 21:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E164216B7
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 21:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfETVLu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 17:11:50 -0400
Received: from anholt.net ([50.246.234.109]:59314 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfETVLu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 17:11:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 32FF310A3575;
        Mon, 20 May 2019 14:11:50 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Dx53HeSPU4mP; Mon, 20 May 2019 14:11:48 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 6C67210A356F;
        Mon, 20 May 2019 14:11:48 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id D85E32FE3AAE; Mon, 20 May 2019 16:11:47 -0500 (CDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: Is exporting __clk_notify() acceptable?
In-Reply-To: <155605928054.15276.8717660730583010316@swboyd.mtv.corp.google.com>
References: <79606818706359d32f34c7eb2523d6557747c262.camel@suse.de> <155605928054.15276.8717660730583010316@swboyd.mtv.corp.google.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Mon, 20 May 2019 14:11:45 -0700
Message-ID: <871s0szv8u.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Nicolas Saenz Julienne (2019-04-11 10:43:22)
>> Hi,
>> I'm working on implementing proper cpufreq support for Raspberry Pi and =
stumbled
>> upon an issue I'd like your opinion on:
>
> You may want to work with Eric. I think Eric has been looking at
> Raspberry Pi clk things from what I can recall.

Sorry for the delay, I've been busy with the switch to my new job.  I
haven't been doing much with the clocks recently, but hopefully I can
shed some light.

>> Note that cpufreq notifiers are not an option as they provide the CPU cl=
ock
>> change rates which are useless to the peripherals. Also note that the
>> peripherals need to know the clock rate change in advance.
>>=20
>
> How does it work today? Do the peripherals set clk rates under the
> assumption that the parent of the clk they're dealing with (I guess VPU
> clk?) isn't going to change rate?
>
> If that's right then I see two pitfalls. The first is that we probably
> want to maintain the frequency of those child clks when the VPU clk
> changes rate. The second is that we should integrate the VPU clk into
> the clk framework so that when it changes rate, the new frequency
> propagates down to the child clks. It could still use the firmware
> interface to change the VPU clk in the clk provider driver. I suppose
> cpufreq-dt could be layered on top of the VPU clk too so that it all
> just becomes a clk tree management problem.

Linux doesn't drive changing the VPU clock.  It's controlled by the
firmware's turbo/undervoltage/temperature management thread, and the
Foundation wants to keep it that way, unfortunately (that way all
devices have the same temperature management, rather than relying on the
OS's behavior).

We do expose the VPU (aka bus or core) clock in upstream Linux, but if
you try to read its rate you just get some sample.  Don't try
propagating a rate change through VPU clock, it will not go well (Linux
doesn't control all the leaf clocks, so it would just be flipping whose
clocks get screwed up by rate changes, and you'd be racing the
firmware's thread).

Right now in the downstream tree they set up the peripherals using the
best-case core clock, so things only get clocked down from there:

commit 6239f614fa5ac3893465f71738e031ee175be14b
Author: Phil Elwell <phil@raspberrypi.org>
Date:   Mon Mar 6 09:06:18 2017 +0000

    clk-bcm2835: Read max core clock from firmware
=20=20=20=20
    The VPU is responsible for managing the core clock, usually under
    direction from the bcm2835-cpufreq driver but not via the clk-bcm2835
    driver. Since the core frequency can change without warning, it is
    safer to report the maximum clock rate to users of the core clock -
    I2C, SPI and the mini UART - to err on the safe side when calculating
    clock divisors.
=20=20=20=20
    If the DT node for the clock driver includes a reference to the
    firmware node, use the firmware API to query the maximum core clock
    instead of reading the divider registers.
=20=20=20=20
    Prior to this patch, a "100KHz" I2C bus was sometimes clocked at about
    160KHz. In particular, switching to the 4.9 kernel was likely to break
    SenseHAT usage on a Pi3.
=20=20=20=20
    Signed-off-by: Phil Elwell <phil@raspberrypi.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzjGBIACgkQtdYpNtH8
nugMNxAAlxXDzOunGgcoVViFfLRJ5S4qghnMpl+Ik3THKYJAiscNfoo1PQ664ckc
Wxs8odaNmIEkuy8NnoSg9SsWqY2Xw4CXkn05T/DRra6KkTNgJ8X2YtDkWtkdxKk6
QYqEhdBDy4mYInelW4xP1vU74ry3ihTibignGdrJGuy4lZoNquUUGbBr3DxucR28
CT6+0pN0y5G64o6DwYB4GtzMyg0vAlXHNa0jyYZrnZMGdZIpgwsu4YqnGuvP/VYl
7NRp3ROJLuf7+R6c1+eVD4MGNNmgywcxRptx5rSVdIpulU2JXSOoZppUuhfU4DP8
KVBjbe5s+tz1cLvywO+zdmpeCj+ML6bL34DDn1ZIA2Ye5y9Hf5txeiE8nzwRyzS7
9Om+pudbBYDhKuWv7ZCC2yQ2Jst1XEF10jdQGfqwintUcs6XYEtHmoxgTWS7myfq
P8Do9BKMt51vYGVUcKB6uYthL9LIM26LGUfIeSDtqrqrUPRv98XpjOpPqetJYo36
AJuOpWKZw+NB0nFo9vlN1dcQ4aMc6Y1YlA5ZwFBaOUioVpzYlbC/R6QinrRdXH2D
E6lwuS0bHTPK26H9skfwMulCducNPYpG8y7GULopIBiC4lA2y7bcz5zeEISh7orB
O9cs4iBF93ahYp8C8UGyp/e5Plxil0LocQ0JLY7QVe1ReXagE6o=
=CAml
-----END PGP SIGNATURE-----
--=-=-=--
