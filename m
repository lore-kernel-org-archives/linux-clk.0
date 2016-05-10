Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:56204 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750991AbcEJE5x (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2016 00:57:53 -0400
Subject: [PATCH 1/2] cpufreq: rcar: Add support for R8A7795 SoC
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <5731664D.1030909@rvc.renesas.com> <573169CD.8050607@rvc.renesas.com>
CC: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <57316A4E.7040100@rvc.renesas.com>
Date: Tue, 10 May 2016 11:57:50 +0700
MIME-Version: 1.0
In-Reply-To: <573169CD.8050607@rvc.renesas.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

After the commit "a399dc9fc50 cpufreq: shmobile: Use generic platdev
driver", will use cpufreq-dt-platdev driver to enable cpufreq-dt support.
Hence, follow the implementation to support new R8A7795 SoC.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c 
b/drivers/cpufreq/cpufreq-dt-platdev.c
index ac4a0ba..32f6dda 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -53,6 +53,7 @@ static const struct of_device_id machines[] 
__initconst = {
  	{ .compatible = "renesas,r8a7791", },
  	{ .compatible = "renesas,r8a7793", },
  	{ .compatible = "renesas,r8a7794", },
+	{ .compatible = "renesas,r8a7795", },
  	{ .compatible = "renesas,sh73a0", },

  	{ .compatible = "rockchip,rk2928", },
-- 
1.9.1

