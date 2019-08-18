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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E445CC3A59E
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC1C921773
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Y8k0y5+e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfHRQYX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 12:24:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:44627 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbfHRQYX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Aug 2019 12:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566145452;
        bh=UFpVfFUO4Wlq/HWE/2I9HA5xmIrtUaebTGvddy1P0q8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Y8k0y5+eI+7SjTRo+iO37aYwPmSlfwXlL1VtQOhwZf6FuSKqH2uciByxECOCbUVS6
         +2iUaYAro4pqs6aantmc1UTe8OlyNDtr8XcsI2c3AhneKtdaR4o0qB2foMAqflf/hW
         1+8WsmUrQ3560u2HhPPOv1FqdAPr2hfrM56JRn/o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MEWkb-1i1FW10jlZ-00Fixn; Sun, 18 Aug 2019 18:24:12 +0200
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
Subject: [PATCH 1/4] dt-bindings: bcm2835-cprman: Add bcm2711 support
Date:   Sun, 18 Aug 2019 18:23:41 +0200
Message-Id: <1566145424-3186-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:gnkiswwseTiTeANk59dd9ZoAA9yGcxHHPjQPV7dmNUTqLgCPnA/
 QjEzwwdun1wm7VT6Ep6sk+5uw0Pg1HnX4FSpK8bHOIP1X2PbOa8bpi4zUdMeXlGGe271Qhi
 rk8I9F34lhmw6LQV7clwqk9tpA9bHYoT2cX7GQqseWWK0HKRz7FdGkRvzv6P2OTMMnpGpWD
 r1/IzZi8AvkeHaEgVWiOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UijD47CAtM8=:C7qltEQQx2JJ4xyKn6Iuyi
 ieYvc7wo7Cwf7D07w/SEkVvM8VxI18JQiBnjpgHXPr7KL9/+jf/6m/QqP16PSq0PVV2myVKrI
 yO4pAGF77wkoh5yZNUDiJyXqndRYv1OloGnowOXe1KPeo810YhvyqF7YNVXMRi3SlJaxLxMo3
 gjPCIQuejcEZkVvu5L+kcCpp0DbZsWy/toNRwN1eOKYLYoTbHmDw5zkcYUjS+6cRzISRWQ0So
 PAVZZ2DhvwLJd0w0ZKnL6RPe0VoiYZKFEZQUXu/mT3/v2f2QrC83oyh0/fwktxBEV+AMWrw4c
 Q2g0mV5HUHBO60Cc7WFvEVNjTuEL1BMhFcSdbMwy8sKSQdguH2iE6d03Hq79JbEcT6qwUgYtx
 eFNMahycGlrnZVFMZqLjInLUyFHT/im5XSYvdaTrD1Z2Ao39MxbqvFbnYoAcGyrFtP5JVwbBW
 9gDgi36pf+PDZDZ8GdRoYgUY0TQPj1uuSmKMF2r8T9xcMnAJ494mGWZ4Q94CURAYWK3zA3vQR
 ZyJs89P/JRCMGA0XLCpNOeMA8Qgv8uxJFVRGLzMhY4Ne02HP8HQC98aQStYL+jwWOyPaA/kKa
 HH6KfhYMXV6BcCc1wEKMbCzg+Wo6au2mtqSN6szicJ8OiGG62GmNbeicCKlCJAKJ4XI1PU2Bt
 Esz8Y7R9Rj2o0QoKZKblf0DZIO0x9GMTkYDSD0qpbzfLvk5An0XxPrl8V4BDJd/EqbwgBY/Fp
 tRAn6G4Gjf1zWaNJkWv4JaRAyHwaKMoE3QEblHBCEGMdE5bfbkLiiY5igERFy4vCA709DHOHe
 svMycUTR6ZfQVyQqpidkrwEHF+sYQHHxIpuIF+g4WLxYIjZ6VM3RXVaqBL7PUiqznqrkfF8xH
 ikR+/yD9w1/PmGzR1zx80aaxG56mu6BVycVKKG3bXqpMopo2dZKOP8uAcuzsO7bpw0BIslGSJ
 Gee4gXeAciGUchA8SG4fWSzJQnGiXyHWozO9AD7LCexjy8AwKgrfg/R7mqa55pFtcGEcSzbED
 XA02wTqTMZ4gzDK5WvmMa4srTe6phxuT8zExWRkU0wrlmNisCC+SGIB21UqlODnh+4qkTvvJ0
 K/RMIdpbmzLEXr0v/Bej445ca1GNEMfvQp/8sjk1VtCrhkJT/nH/PsIbg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So we need an additional compatible.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
=2D--
 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt | 4 +++-
 include/dt-bindings/clock/bcm2835.h                             | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.t=
xt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
index dd906db..9e0b03a 100644
=2D-- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
@@ -12,7 +12,9 @@ clock generators, but a few (like the ARM or HDMI) will =
source from
 the PLL dividers directly.

 Required properties:
=2D- compatible:	Should be "brcm,bcm2835-cprman"
+- compatible:	should be one of the following,
+	"brcm,bcm2711-cprman"
+	"brcm,bcm2835-cprman"
 - #clock-cells:	Should be <1>. The permitted clock-specifier values can b=
e
 		  found in include/dt-bindings/clock/bcm2835.h
 - reg:		Specifies base physical address and size of the registers
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clo=
ck/bcm2835.h
index 2cec01f..b60c0343 100644
=2D-- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -58,3 +58,5 @@
 #define BCM2835_CLOCK_DSI1E		48
 #define BCM2835_CLOCK_DSI0P		49
 #define BCM2835_CLOCK_DSI1P		50
+
+#define BCM2711_CLOCK_EMMC2		51
=2D-
2.7.4

