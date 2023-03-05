Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474CDC61DA4
	for <linux-clk@archiver.kernel.org>; Sun,  5 Mar 2023 22:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjCEWQj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Mar 2023 17:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCEWQi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Mar 2023 17:16:38 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0531992
        for <linux-clk@vger.kernel.org>; Sun,  5 Mar 2023 14:16:36 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N2BQM-1qaRC82h1K-013cQj; Sun, 05 Mar 2023 23:16:18 +0100
Message-ID: <3ceda169-de1b-2c1f-9ee8-bc8fdb547433@i2se.com>
Date:   Sun, 5 Mar 2023 23:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michael Heimpold <mhei@heimpold.de>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Subject: imx6ul: Recent enet refclock changes breaks custom i.mx6ull board
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Lpjy4rrfrpGhL5tT8b86UbsZIxMhzqsnhmYO7Os/JXk9ufGEYeo
 zZS7Xnw8osZtxjCVBlirvs1VBtG10goXB9p1/fjwUSh33/zP6mqbUCqPrFPrt61SAqufydR
 p8k6lDdWGr5NdQ1gT9paz2GXKFBE/zLtgcaT/ohQ3j7Q+J4oFi49EfjMiNkL6HV2e/U357a
 ib2IG2BMo59no3cbNHKIg==
UI-OutboundReport: notjunk:1;M01:P0:xshUyO2MIcE=;KeuZmFrfEnER5d3FE4MpfEYwKkc
 zA/Vq1D75LKSDb8mYHHEB3DrY7nmgoxfMXXETdPKxX/jWe3WPIecgdmmdOXl1NqD5drxb8xGj
 lSJYZo1L/0s+TcHRTc/6GoruyaKwxGCpnSrc23Ovmwr0UIL2k345Wt9yq/2I3z6l6CBPhMV9Q
 qkvAWQ2NKrQyDvh4ZQa5GFQgL+hSVDtjJb+vZtrhc88CFVwedtMFIA2QxYxkMRH4Pkam5oJ71
 D3YEl/YZTYNPAj23Xxbb11Q1cjhW8cHiJpJDXmmT9dwkJLzdQHr7plzddx/no2CSGPhwARhsV
 V6xwD+q2HkfpVcHO1hVbTc4iBugUxlPU7+oaOjmGmdWGA/QbgrkfJER+4bLlPHZ2+zQc51Odh
 P4vx58Uvnyd6wUrqgKAJIqqwBiPSKwWkjlQj9vYhyvgfqd3iV4EfL8iVWS/p6Z9wbVDoTcs0z
 AIW+XBFOQ93hoS855G2zklB29022G+M49m3aKRPie+iufuu+/4bwtmREiyBYKw/O+Axwyc0S/
 Laz91D2C1+gsi25BuHE2oz0jSYIb8mfgfePbQi1ZfBp1aViBoW/DmYBtJqImhsqIcVGBQsA3N
 7zWY2LzZTeoB8hbWK/0ABYIAsEhcsnMApt0ZQ57FbWWEh/xLZuSpbB4ePSnitt+umovlYvU6H
 o3B1F3TtBH2eGepKD9geKC3PDllFUtikyThD13QSyg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

we planned to submit our custom i.MX6ULL board [1] to mainline after 
release of Linux 6.3-rc1, but the recent enet refclock changes breaks 
our Ethernet phy:

[    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)

...

[   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: 
phy_poll_reset failed: -110
[   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy

I narrow down the PHY issue to this first bad commit:

5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")

The clock issues seems to be cause by the following commit. If i revert 
5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.

Maybe this helps for further analyse:

--- clk_summary.good    2023-03-05 22:41:52.607392458 +0100
+++ clk_summary.bad    2023-03-05 22:41:52.587391697 +0100
@@ -46,12 +46,13 @@
               usbphy2                  0        0        0 
480000000          0     0  50000         N
      pll6                              1        1        0 
500000000          0     0  50000         Y
         pll6_bypass                    1        1        0 
500000000          0     0  50000         Y
-          pll6_enet                   2        2        0 
500000000          0     0  50000         Y
-             enet_ptp_ref             1        1        0 
25000000          0     0  50000         Y
-                enet_ptp              1        1        0 
25000000          0     0  50000         Y
+          pll6_enet                   1        1        0 
500000000          0     0  50000         Y
+             enet_ptp_ref             0        0        0 
25000000          0     0  50000         Y
+                enet_ptp              0        0        0 
25000000          0     0  50000         N
               enet2_ref                0        0        0 
50000000          0     0  50000         Y
-                enet_ref_125m         0        0        0 
50000000          0     0  50000         N
-             enet_ref                 3        3        0 
50000000          0     0  50000         Y
+                enet2_ref_125m        0        0        0 
50000000          0     0  50000         N
+             enet1_ref                1        1        0 
50000000          0     0  50000         Y
+                enet1_ref_125m        0        0        0 
50000000          0     0  50000         N
      pll5                              0        0        0 
296600000          0     0  50000         Y
         pll5_bypass                    0        0        0 
296600000          0     0  50000         Y
            pll5_video                  0        0        0 
296600000          0     0  50000         N
@@ -137,19 +138,19 @@
                  step                  0        0        0 
528000000          0     0  50000         Y
               periph_pre               1        1        0 
528000000          0     0  50000         Y
                  periph                3        3        0 
528000000          0     0  50000         Y
-                   ahb                9        9        0 
132000000          0     0  50000         Y
+                   ahb                8        8        0 
132000000          0     0  50000         Y
                        sdma            4        1        0 
132000000          0     0  50000         Y
                        rom             1        1        0 
132000000          0     0  50000         Y
                        esai_mem        0        0        0 
132000000          0     0  50000         N
                        esai_ipg        0        0        0 
132000000          0     0  50000         N
                        aips_tz3        1        1        0 
132000000          0     0  50000         Y
-                      enet_ahb        1        1        0 
132000000          0     0  50000         Y
+                      enet_ahb        0        0        0 
132000000          0     0  50000         N
                        dcp             1        1        0 
132000000          0     0  50000         Y
                        asrc_mem        0        0        0 
132000000          0     0  50000         N
                        asrc_ipg        0        0        0 
132000000          0     0  50000         N
                        aips_tz2        1        1        0 
132000000          0     0  50000         Y
                        aips_tz1        1        1        0 
132000000          0     0  50000         Y
-                      ipg            15       13        0 
66000000          0     0  50000         Y
+                      ipg            14       12        0 
66000000          0     0  50000         Y
                           wdog3        0        0        0 
66000000          0     0  50000         N
                           uart8_ipg       0        0        0 
66000000          0     0  50000         N
                           usboh3       0        0        0 
66000000          0     0  50000         N
@@ -180,7 +181,7 @@
                           uart2_ipg       0        0        0 
66000000          0     0  50000         N
                           can2_ipg       0        0        0 
66000000          0     0  50000         N
                           can1_ipg       0        0        0 
66000000          0     0  50000         N
-                         enet         1        1        0 
66000000          0     0  50000         Y
+                         enet         0        0        0 
66000000          0     0  50000         N
                     axi_sel            1        1        0 
528000000          0     0  50000         Y
                        axi_podf        2        2        0 
264000000          0     0  50000         Y
                           axi          1        1        0 
264000000          0     0  50000         Y

[1] - 
https://github.com/chargebyte/linux/commit/5f47f1b029d34391a4b24d4a30105f517126363e#diff-a3def31334aa0f3b641ed5b21a60b462a9cbdda064e7276770be22d9860f2ae7R137


