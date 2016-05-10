Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:57569 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751047AbcEJEzp (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2016 00:55:45 -0400
Subject: [PATCH 0/2] cpufreq: rcar: Enable CPUFreq support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <5731664D.1030909@rvc.renesas.com>
CC: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <573169CD.8050607@rvc.renesas.com>
Date: Tue, 10 May 2016 11:55:41 +0700
MIME-Version: 1.0
In-Reply-To: <5731664D.1030909@rvc.renesas.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This series enables CPUFreq support in available R-Car Gen3 SoC.

It depends on 2 series below:
    [PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W
    [RFC 0/4] Add Z clock support

All comments are appreciated.

Khiem Nguyen (2):
   cpufreq: rcar: Add support for R8A7795 SoC
   cpufreq: rcar: Add support for R8A7796 SoC

  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
  1 file changed, 2 insertions(+)

-- 
1.9.1

