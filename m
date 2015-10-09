Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:38105 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753878AbbJIR6h (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 9 Oct 2015 13:58:37 -0400
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: kernel-janitors@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 0/2] delete unneeded of_node_put
Date: Fri,  9 Oct 2015 19:47:39 +0200
Message-Id: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

for_each_child_of_node performs an of_node_put on each iteration, so
putting an of_node_put before a continue results in a double put.

---

 var/julia/linuxcopy/drivers/clk/tegra/clk-emc.c         |    4 +---
 var/julia/linuxcopy/drivers/memory/tegra/mc.c           |    4 +---
 var/julia/linuxcopy/drivers/memory/tegra/tegra124-emc.c |    4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)
