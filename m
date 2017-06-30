Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:56072 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdF3G5N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2017 02:57:13 -0400
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@free-electrons.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Nadav Haklai <nadavh@marvell.com>,
        Kostya Porotchkin <kostap@marvell.com>,
        Neta Zur Hershkovits <neta@marvell.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Omri Itach <omrii@marvell.com>,
        Shadi Ammouri <shadi@marvell.com>
Subject: [GIT PULL] Update binding documentation for CP110 and AP806
Date: Fri, 30 Jun 2017 08:57:10 +0200
Message-ID: <87h8yyvu7t.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Hi Stephen,

As seen on Tuesday this is the pull request for the remaining binding
documentation which depends on the documentation already applied in your
tree.

Thanks for taking care of it,

Gregory

The following changes since commit 7e5b11afecc0f558c5a6723970770f92f2529d4e:

  dt-bindings: ap806: introduce a new binding (2017-06-01 12:02:01 +0900)

are available in the git repository at:

  git://git.infradead.org/linux-mvebu.git binding-doc-cp110-ap806

for you to fetch changes up to 1fa67c675f6477ceb670f087a6f6739f7b3cb099:

  gpio: dt-bindings: Add documentation for gpio controllers on Armada 7K/8K (2017-06-27 09:07:17 +0200)

----------------------------------------------------------------
Gregory CLEMENT (6):
      dt-bindings: cp110: do not depend anymore of the *-clock-output-names
      dt-bindings: cp110: introduce a new binding
      dt-bindings: cp110: add sdio clock to cp-110 system controller
      pinctrl: dt-bindings: add documentation for AP806 pin controllers
      pinctrl: dt-bindings: add documentation for CP110 pin controllers
      gpio: dt-bindings: Add documentation for gpio controllers on Armada 7K/8K

 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt  |  73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt                      |  24 +++++++++++++++++-------
 3 files changed, 208 insertions(+), 33 deletions(-)

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
