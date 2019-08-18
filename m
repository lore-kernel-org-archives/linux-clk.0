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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E11C3A589
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 083A7206DF
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="BE9iF8C9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfHRQYW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 12:24:22 -0400
Received: from mout.gmx.net ([212.227.15.18]:57915 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbfHRQYW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Aug 2019 12:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566145453;
        bh=CzdbVQq8IrILnm9Q22KWEYU789AoTBUeM4pr8EHs4B0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BE9iF8C9awFP40knspDwDKei8JkqD7bb9v5Gi76ncS8K5jBzRguKhTSnq8tlqV+/x
         MwuCbxOZ47MpMMglpq9dybmhqtl4OZ86/UsZGS+/ZUpghSjnA3/r6lF2PwWD+EQRfA
         JpCiMyy6mD80XCggcJmH/vNZ4CR9MgEBRPC7W1U8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LikE1-1iXL961U8j-00cwDf; Sun, 18 Aug 2019 18:24:13 +0200
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
Subject: [PATCH 4/4] clk: bcm2835: Mark PLLD_PER as CRITICAL
Date:   Sun, 18 Aug 2019 18:23:44 +0200
Message-Id: <1566145424-3186-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Y5KnN3P4dN6rJKtSRnxV6bmbDrsIR6RJHsGa2SS5ZGPEIdDjLld
 m9M0ggJUPJlABn8hfTzpFBgFqiYKPW5JlB5RGi+IvwChqvpw7psC09DRv2MM+TDMNATZCE3
 G4l1+YDGPkAM574T8IeaN/7Vdauxv9c2tqnK5l0dpWv3V8n2W2AV4q4FoKZvvePl5g6afXY
 itREXpAZkk6eV5xJwAMpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6nY4L7DJmR8=:qhqpx98PZ0Yv7ARb0iDSAf
 h2jl3qUYO/BYr+H/YYgmWcwtz1Iz6YTHj0jSXT4ri44f5vZsuYU5nCMsgzxakTYnSUnOCayXi
 3jghAzsIWTwYXFfFmv+KKDhQMlTkBL0dleN9e5c34P4eVhPMNdtmfzZgjpQjPuj6O37VWU9Hl
 8om56VkzvFVkHwRuugO/4+roZQLgg9QGexvtS7xsBcbm7MpltLKKqJ8KaVCNHFYAPSPWAt9Bk
 UxdjgujtrotUVTeWuKcKzSpwf9dVde15sXHtUKoHvBKWwLSypkxsKXU503ykjrD2peGxhWXz4
 tVH6Dslruvn59VAL6MycATISgVL8EeMM/gERlOOh9MfF/yapVaUMXE14oxixsE4VrooWeOo/z
 6fTILJZC9dssUEU8SzbvlH93OlGAjnePFjk+B2CJ7RSHX8NiJbWbOlFhEA7FU4RVL3eJZw6zY
 5EQxckN9iUNzqv3Is1zhKJSWpQU951FYleYSo9KcB9jo6ZgXeHuGCEwIXCTsRdHZokZQ36dBZ
 DeAHtkuGuWNPhFiDn9bgNllVmoW6IyOI5TeIpPgcloH9aqsBJzn6F1i6U1cjRsiw6ba19FN8z
 AuJ9LWblHpgFsVZzY/1nDUloY6BUNlkYunlUHOf7sjP1PyDUMO7dNvW7+I6D6UgaGvV3RWfvy
 74zmGfI780eyqA1BxJlcxkoWv6slxYY12jDw+85ItsYkf3CMo6J9seVW5Ge9em1Jy6FeQdNix
 8zrITqCH+HiADIMXbpFoi70etb9NwIQ+z+t+ykhfBsi7eQV+B6uRdpOQl1Xfrd7jdo7tagYgK
 sJRGuyvumkKICNyaLyKC8h2SSbUdbyfaTDUE9x4qTYGDKU9n3WMyBusU0ekXAAjtGIXVEDJKl
 sgb5yn2VmWSd1dskSnkynpVsZQLu4rYs+Y2ntcByXXamfzfrTT3wpHL7Pi/rcI2dZOMXhXbG4
 wSIl5eRxC42HjYGdgaQuKW1Im6z+T7JJaAKffe+varrIARFWFURLxj67BdT0Swiz28P0kmriK
 Ugte/8SCJsdJzDsvIPmhrLnHWQVHOcrrbXzi1CpF9xqZNQ8XxbtH6vhEJeCBJoHw5kqcsFVCm
 Ddp+Cw6a5hIaMTqsZpo1VXc2xV+pE+ryXSCqVf8J1NQNtTXbNySvuJB4X3bYGpnoBLaqbzyfC
 O0zwjoIsF8nN/La0J/60/xCWk455dDKt9r2EjdfFCO25se2g==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The VPU firmware assume that the PLLD_PER isn't modified by the ARM core.
Otherwise this could cause firmware lookups. So mark the clock as critical
to avoid this.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fdf672a..802e488 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1776,6 +1776,11 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
 		.hold_mask =3D CM_PLLD_HOLDCORE,
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
+	/*
+	 * VPU firmware assumes that PLLD_PER isn't disabled by the ARM core.
+	 * Otherwise this could cause firmware lookups. That's why we mark
+	 * it as critical.
+	 */
 	[BCM2835_PLLD_PER]	=3D REGISTER_PLL_DIV(
 		SOC_ALL,
 		.name =3D "plld_per",
@@ -1785,7 +1790,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.load_mask =3D CM_PLLD_LOADPER,
 		.hold_mask =3D CM_PLLD_HOLDPER,
 		.fixed_divider =3D 1,
-		.flags =3D CLK_SET_RATE_PARENT),
+		.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_DSI0]	=3D REGISTER_PLL_DIV(
 		SOC_ALL,
 		.name =3D "plld_dsi0",
=2D-
2.7.4

