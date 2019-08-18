Return-Path: <SRS0=w6Q+=WO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D7C3A59F
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33EEF21773
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="VJQRqdVG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfHRQYW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 12:24:22 -0400
Received: from mout.gmx.net ([212.227.15.18]:52027 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbfHRQYW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Aug 2019 12:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566145453;
        bh=IM5UxVrBLP5hF/1d1ZFHRD2GqKmi/z5awy9hXKawSn0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=VJQRqdVGHgbBsll1Q6/ZxhVx4LMhKHwxogARlRTqPT6fvTAQNtl9wsNYetEmiH/rP
         P7i0TWzXvcbhTSA6O4JRjfY3w0i6OIddUJ0hs3jwU3P2XW9g1Nm1EFD+t2e9lBCMSu
         K7FTt0AS+IR514jkzbxSDcpyfK+09lPuIqIjZ/TQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LiDrv-1idL9r45ul-00nOkz; Sun, 18 Aug 2019 18:24:13 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/4] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
Date:   Sun, 18 Aug 2019 18:23:43 +0200
Message-Id: <1566145424-3186-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:3ix2WU/9XnteCrpqo9GRNBYCbCi4Wfo4+blR26+ik5fMozdrR6M
 IghvLQO/EwpzWfdg9kKXg2hsd3BK+ZoToDC0ZpJYldJ/xLjeZ8BJSK/nK+oDAJHpWo56YW9
 RyrSQLY7JZsEIzW6TnBFCZ+ZUbiYE8Iqdzd2YiiagIiwCRWHF1k/yYMT7X6bcjZ9Cs0Xapz
 yjF5mlpWix3xuvMimQqhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7CXaunGzrZ4=:Egj7MudH8uxFdxWABY4fA7
 AhhP/oquYGzDWVx+MzIW4sjt96cAt6IvJ3v4lge5brB2XY7Ongklh7dktv1BuA/wu6Q4Yex2u
 5Clq1mLb5PgyEsltJsKbHG95mPSrYsJ/RJ4q6wJnQbkFuTC4Dk6z7VHrxwWxgQe2eNTKBCDGQ
 1/znipapwh8wa1Y7xV8Lzj7AlEff5F5ppEenvc2wBQrVu7xu/DT4x/xIlD5RSJIa4BbMPRKFG
 Kj8svd7XsWFuN07ec3HTjJdHS7L0ujKbaBiJjGPFXeB2nzU3ezLDxpUrYeUNyJ6etLiPxN0gH
 8dUwxwSFh7V0DmX5VImGLn/jpg6+YlJuLxbvXf08ibSykNOAFGeiQ14SPup58kMmJUZzuCnlh
 W/aJgX9sCa00zFf0Y94rC2I52A5werh6PA27/uaYv4t3X6yoa1wERQvMT/6BGCX6x5v0AEB/q
 DCKr0GSzdK1eGx0m5W+/3fJDGdd9jTGZetIN1QZ21qIlglk3/DWuMKVU6KoVi5v2bYy6u5uCm
 uimyNWu4oWYmzDOwvVcWKMkE+I7OTpmQ4rVdSks/7ZWbTpzHNxtFbF+ykBl3jafWOMxyGIZd+
 sAJiVT/SJFlnVbp/prsxSCyVzoKBptsf7sEhMuAdGdK15+VynrayO2ECwMNxJwyxNbFQQDmki
 EuiNKmZb3SgOsEYKOgW6SUK/AUScx3m01PPOeOu0AXDUXJpNS1cYDBM5YkB2extJVjvdIwIJv
 qukGm+WDAuEpg0KKhzJMOHDDiyhDwmRhQMrujiRAmCWsjcmqH7L9wD32riu+36gicJhl8pq7B
 50py9QA+fCH1LJ3i0t1frOtfxP/iyxU6kXxA1MxGk0llcpvIf8RF+9FdzLcwr0tifXyIaXauw
 l1WwUFsmsoOLfboAc4A7Bp9ngxMr2rINpcmOBwHWd0sI6k5s4YhxT2xpaqAAPIDsr3uHSDOLD
 MUjasn8zBVqjG8CQEtZL4IsT8WtpLOfw0Nu2lVNP4tfioL1v3QcnUKxFJuyGj9OtTXsAh4Qec
 ausLzF9H5JHYpmXeA0hRST2CW8roj2efbega2zkd/AN4QbMN0vSxdPIZCjb8F9IYGS3tljA9m
 s/nuGA0lXG5Sw+MEc2zHRo5VFJtYdt6kgnL0Ep9sFPrFxt22Q/kSzx6BmwgbL9yTr3nMFDOtz
 aeqxQNKqE742PAxTNWkJo49/geXMtnJ1UlIQxykMOYbPNNOQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So add a new compatible and register this clock only for BCM2711.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 21cd952..fdf672a 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -114,6 +114,8 @@
 #define CM_AVEODIV		0x1bc
 #define CM_EMMCCTL		0x1c0
 #define CM_EMMCDIV		0x1c4
+#define CM_EMMC2CTL		0x1d0
+#define CM_EMMC2DIV		0x1d4

 /* General bits for the CM_*CTL regs */
 # define CM_ENABLE			BIT(4)
@@ -290,7 +292,8 @@
 #define BCM2835_MAX_FB_RATE	1750000000u

 #define SOC_BCM2835		BIT(0)
-#define SOC_ALL			(SOC_BCM2835)
+#define SOC_BCM2711		BIT(1)
+#define SOC_ALL			(SOC_BCM2835 | SOC_BCM2711)

 /*
  * Names of clocks used within the driver that need to be replaced
@@ -2003,6 +2006,16 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 39),

+	/* EMMC2 clock (only available for BCM2711) */
+	[BCM2711_CLOCK_EMMC2]	=3D REGISTER_PER_CLK(
+		SOC_BCM2711,
+		.name =3D "emmc2",
+		.ctl_reg =3D CM_EMMC2CTL,
+		.div_reg =3D CM_EMMC2DIV,
+		.int_bits =3D 4,
+		.frac_bits =3D 8,
+		.tcnt_mux =3D 42),
+
 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
 		SOC_ALL,
@@ -2238,8 +2251,13 @@ static const struct cprman_plat_data cprman_bcm2835=
_plat_data =3D {
 	.soc =3D SOC_BCM2835,
 };

+static const struct cprman_plat_data cprman_bcm2711_plat_data =3D {
+	.soc =3D SOC_BCM2711,
+};
+
 static const struct of_device_id bcm2835_clk_of_match[] =3D {
 	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D &cprman_bcm2835_plat_=
data },
+	{ .compatible =3D "brcm,bcm2711-cprman", .data =3D &cprman_bcm2711_plat_=
data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

