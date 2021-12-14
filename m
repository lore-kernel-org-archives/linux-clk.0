Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA25C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbhLNMCz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:02:55 -0500
Received: from mail-4322.protonmail.ch ([185.70.43.22]:12561 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhLNMCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:02:54 -0500
Date:   Tue, 14 Dec 2021 12:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639483372;
        bh=U5buFUK5Mrq+BJQZ9Bg33X3EObx6Uh4DS3xHR8++K/E=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
        b=ThZn4iRHhepA5UrWd8rE1707sNNHwwvF2HQ07HXFMQqaxDTpJNWvvOFc13lGEEunx
         weUZL4JEU3pehE+QCZEkoE9Vtg4MTdmJ1UEwY+NK7brLQbuqvcN4lcxSmPgdE4Qpz3
         yOBUFkQYjiKXBN4y7r8Vjl46g7datbUxC5EaMbcNwwnCaE5vA99JP0z2wRxMFchl5E
         tCss9diO7cRKKkP3+b5Bztw8TPsnD8ummh9ssom/jGE5GVsv96kMZS7JjXyAghin5n
         SjMJBxHnjOAnjXhgDJhVzZLW0OGMUVDXoSHvtyNuAsfEKRl278O0J1hC8na8Jtc9TI
         0jcTnhE5sZeqg==
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev,
        =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: [PATCH 0/2] Support for Apple SoCs' NCO blocks
Message-ID: <20211214120213.15649-1-povik@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

I am submitting a common clock driver for Numerically Controlled Oscillator=
 (NCO)
blocks on recent Apple ARM64 SoCs. The NCO driver will be used for audio
support on these platforms which is work-in-progress.

I suppose the only noteworthy thing is the blocks divide an input clock
with a clock cycle counter in part implemented as a LFSR. For that reason
the driver upfront calculates a table of LFSR states to be able to program
the dividers.

Best,
Martin

Martin Povi=C5=A1er (2):
  dt-bindings: clock: Add Apple NCO
  clk: clk-apple-nco: Add driver for Apple NCO

 .../devicetree/bindings/clock/apple,nco.yaml  |  70 ++++
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-apple-nco.c                   | 299 ++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.yaml
 create mode 100644 drivers/clk/clk-apple-nco.c

--
2.33.0


