Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:35145 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965286AbdEXJDQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 May 2017 05:03:16 -0400
Received: by mail-it0-f43.google.com with SMTP id c15so34570027ith.0
        for <linux-clk@vger.kernel.org>; Wed, 24 May 2017 02:03:16 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 May 2017 11:03:14 +0200
Message-ID: <CACRpkdYVqQ4qyraofQO3sLUV=NjBn48a9sX-k+O9ASSaBY7pyA@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates, take one
To: "arm@kernel.org" <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi ARM SoC folks,

this is a first pull request of DTS updates to the Gemini architecture.

It tries to follow the merge strategy to merge DTS files with numeral
and then patch in macros after -rc1.

The combines clock+reset DT bindings are part of the pull request,
but the macros and drivers are merged by the subsystem maintainers
for clock and reset respectively.

I will likely submit more Gemini DTS pulls based on this one as drivers
trickle in: ATA/SATA, DMA and maybe Hans' USB work come to mind.
But let's create a firm base for it all first.

Please pull it into ARM SoC!

Yours,
Linus Walleij


The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/gemini-v4.13-dts-1

for you to fetch changes up to 664ed4e283926d753e876a1347b7729135a3f6b8:

  ARM: dts: Add clocks to the Gemini SoC (2017-05-24 10:50:22 +0200)

----------------------------------------------------------------
This is a first set of Gemini DTS patches for the v4.13 cycle.

This adds the reset and clock lines to the Gemini core DTS SoC.

These bindings have been ACKed by the DT maintainer Rob.

The reset driver is going to be merged by the reset maintainer.
The clock driver is going to be merged by the clock maintainers.
Each of these have their macro defines coming with them, split
off as separate patches.

A post-rc1 patch will be sumbitted for switching the numerical
values to the defined macros in line with the ARM SoC DT header
merge strategy.

----------------------------------------------------------------
Linus Walleij (3):
      dt-bindings: Augment Gemini for clocks, resets
      ARM: dts: Add the Gemini reset controller
      ARM: dts: Add clocks to the Gemini SoC

 Documentation/devicetree/bindings/arm/gemini.txt | 24 +++++++++++++++++++-
 arch/arm/boot/dts/gemini.dtsi                    | 29 +++++++++++++++++++++---
 2 files changed, 49 insertions(+), 4 deletions(-)
