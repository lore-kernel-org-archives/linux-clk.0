Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46752C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 15:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbhLHPsc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:48:32 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:40691 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhLHPsc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 10:48:32 -0500
Received: from localhost.localdomain ([87.166.17.165]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MUXlG-1n3kX70mm0-00QTkp; Wed, 08 Dec 2021 16:44:53 +0100
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org, renner@efe-gmbh.de
Subject: [PATCH v2 0/2] clk: si5351: Add phase offset for clock output
Date:   Wed,  8 Dec 2021 16:44:40 +0100
Message-Id: <20211208154440.72087-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6UNAKkwdaxNIDxYRTMJHPTjMCd0Hn5kleY5QSOgYt7KkDli14RW
 ikaU1PGjpNpDEzo2SFM/D0UIdDefpk5XJqy2UkhRPEF/jG82GCdbVdeqLyDjG2PVHaz+Sfi
 pJAmV2n5W66T39aTjA0TcPIouhevuvcJGtXuhlWURrpmCAfS7DPkvZTWzusorUc5obrQ30O
 8el96Jp92SuZW0L90gtJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rtwi4w+ds4A=:vNf0l6zQlG/DeAurniYGwO
 qXWhXggaPVCuxm3zAC7ChZwukAdzTL1JT6LPMLIL2irCsh+ePizMYsRTXv6zzO0ryxk5Fyb/B
 ke2ulA9+EUZD0bXt49x+mCjUtgiY1tbkF/0GIYnEzYyKxfiD+hru0kkkKBXuCOcMiCGmSBXxx
 78hola/Vag33pjKkVMvimXQ2uy/z92LNrYLI0sljx9fo3nrXzyHQbcNbHLcEswV/hWzN8m5jc
 g26O7M4rT59g9n0CeRcbNz9BUcckPpTSbkKOgSeW97UbgBA/9dww3uNs+vugn4ypD9mSX6lVg
 lrrvl9VKGmtgceNOFa38kLvFWzXptPx4hDPchsL5ZZlD7Z8iTCclfeLIovDIxS6d3bvEmBnXp
 TidtFKJuKvSVIyVzg9EHixfN5UTzUpG9EjRc8qeQAm8R06VxRLN4dZEjw4DvtXMACOuHOS/1p
 JQSudK1YTPEM0p0LJFkF0bM6ZZt3nuLPu3tYmN8vJnt8ELN++ro/DJidLKtJ52u3WkeWILuBl
 JRbOw6JxuiMNTCnGLwMQtZgIjQ5mpoCqYyxWT15TQCLBCeG9Ot9bYf9NncZRxMCWfXwUaQROT
 mLl0xB4DxcELVXlRKsFnfEeZJahj2tazIdfTWHduibjhziV9qeZ2+V+ZXwLF7ZBACut0MzEXl
 RKEklrrjYyK30PrU7elBKQs1rll2BobmFXctc2ldkrXK4TJLQ6R3CryWbMI/06+1vusY=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds a phase offset feature to the SI5351 clock
outputs. This is necessary to generate differential clocks or
arbitrary phase shifts with respect to other clock outputs.

Patch 1 adds the DT documentation to configure the phase offset.

Patch 2 implements the phase offset feature by adding *_set_phase()
functions to the multisynth and clockout stages.

Tested on a Xilinx Zynq (ARM Cortex-A9) board with Si5351A-B-GT for
several frequencies and phase offsets.

Changes in v2:
  - Use vendor-specific DT property silabs,clock-phase

Jens Renner (2):
  clk: si5351: Add DT property for phase offset
  clk: si5351: Add clock output phase offset

 .../bindings/clock/silabs,si5351.txt          |  10 +-
 drivers/clk/clk-si5351.c                      | 234 +++++++++++++++++-
 drivers/clk/clk-si5351.h                      |   1 +
 include/linux/platform_data/si5351.h          |   2 +
 4 files changed, 243 insertions(+), 4 deletions(-)

-- 
2.30.2

