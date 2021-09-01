Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B509C43216
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D77F61026
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243672AbhIAJhf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:37:35 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37086 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243689AbhIAJhf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 Sep 2021 05:37:35 -0400
Received: from hq-00021.holoplot.net (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 5D1BC32D16F;
        Wed,  1 Sep 2021 09:36:36 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 0/9] clk: cs2000-cp: add dynamic mode and more features
Date:   Wed,  1 Sep 2021 11:36:22 +0200
Message-Id: <20210901093631.1403278-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds support for dynamic mode, configurable clock
skip settings and a tranisition to regmap.

The most significant change is the additional support for dynamic mode.
Currently, the driver only supports static mode in which the (currently
mandatory) CLK_IN clock input is not used by the hardware.

Unlike v3 of this series, the patch stack now maintains full
compatibility with existing bindings. Rather than infering the mode of
operation through the presence of an optional clock, the driver now
parses a new DT property to enable the dynamic mode.

Thanks,
Daniel

Changelog:

v4 -> v5:
	* Fixed a regression for static mode configurations
	* Added Rob's Acked-by signatures

v3 -> v4:
	* Introduced cirrus,dynamic-mode in favor of making CLK_IN
	  optional


Daniel Mack (9):
  dt-bindings: clock: convert cs2000-cp bindings to yaml
  dt-bindings: clock: cs2000-cp: document aux-output-source
  dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
  dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
  clk: cs2000-cp: Make aux output function controllable
  clk: cs2000-cp: add support for dynamic mode
  clk: cs2000-cp: make clock skip setting configurable
  clk: cs2000-cp: freeze config during register fiddling
  clk: cs2000-cp: convert driver to regmap

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  91 +++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   |  22 --
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-cs2000-cp.c                   | 240 +++++++++++-------
 include/dt-bindings/clock/cirrus,cs2000-cp.h  |  14 +
 5 files changed, 261 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

-- 
2.31.1

