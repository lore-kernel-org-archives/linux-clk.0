Return-Path: <SRS0=gnDx=WJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5747FC32750
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 16:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1AB920844
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 16:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="DlHq/dgf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbfHMQVX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 12:21:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:58787 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728267AbfHMQVT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713263;
        bh=mk1t8axBSu7Iis10B+6pFBh8hZLr+xH3FZwDc1byKUc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DlHq/dgfHdubCcFkek5nvmD+0IXDcWxMBesB/Jm8s/xZyl771PE757O/MWlJ6IuFZ
         ZIdL3Vgxm4ME4Kr7+hCLDFs5C4/ISLxawzLRKn3ck3qjI/ZwOPHO+7C1cshCiwo+FA
         ie1dCFmx9v+2gEHAof2Mk40hEX23TaqzHGFZsCko=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Bk-1ibZFo47eA-00oGiA; Tue, 13 Aug 2019 18:21:03 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 13/13] MAINTAINERS: Add BCM2711 to BCM2835 ARCH
Date:   Tue, 13 Aug 2019 18:20:48 +0200
Message-Id: <1565713248-4906-14-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:cayvR/uheIWNxYHm5e3pr7PKq9+WmnbRouCP3lNLUJCKQ3k6XG0
 /WefPCwMSh9iL5GYsHo5zipRtHFrg/Y1etR0jeGC/jLrdXLKxpA3DomoG19bFJBzokBa8Eu
 pPTQdhQgLzzfaqmgAvjAhNxQxV3WaFRz5jwCJkvhn1VvTtjkoOFsTKrrcY3ZWvNfRwb6Rbx
 zB84wH6ALdi8C+jjW9K9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L0YbU3sLpSo=:OeI70LLcBh0CDJzTaHVBO1
 tjhK+J5B193bRTAVTtYaooTH1xXMikebb4tDhlJrME1FusXgayqOVnST3vq1FNTVtBFaV02J6
 pTJTCs8xKYjDdXoII0dBs0FpdQs/aI2zIRU5bdjLA422CV7+KMbeBBGzvkB5BkuoHxUZC/HSV
 Zd6fhYRY3lcItpE0dHAuoOWwnn+c9Faa4Xldm+9jGheU5/rwA8shxgiu6oCI/N7lBSUqmnYoG
 +n/YoGFfRCYc1MnQtQo4QWhoornVujNjol7Kn07h/iVzyEq2f1uUqdcFNw7JTirlBLwuXC0ON
 M++U0fiBdeEGzSK7Z5jDyeSBg8D+gMMYO+QT7RtuIHH0rGCiHfwzlOnnhxVIpZP+XbMfvYJq8
 MDtePnsKPXXgaaWzi3jnMobp0WM8vKA63XHkBmRxpnQE7htAXnu7qsTjYYidSjdyiQP7FThxe
 m3sKVd9OAO+s1fflgK9xpZRUOl7f3lENJplPHe43fdcJ1Ob7+FswR3vhlR1sdSUwwcz3f4Jsx
 J0K3/3Ib3ztoxYAeu3XmZjhfpv7OAN9KzR3D4KILqSuYB1enhW1yBH+h5/p/7SEyzRLqEhuYm
 tvjmjkNjsiQC/jOQAJPDeNJF8DcP18FAcy8BT+DPXXyqHPaeMBpPVk/h1pd0+EWjpRrgbgtIA
 l2SwlqcL9gj/4TeNKRz1zYxLcudkBiyQB3yWfm3d0TSley+fhQNoHCHv4ew4UKHbwEh/FM1zw
 qoP+Or3ug6JpHNWGQ9jsWwTAgZd/e+cezTM4DoKBwzu2NyDG5JAO99FM0uS5wGmzdZ9vUkc65
 inutHqbA5Pwk6/KT2ZAMoxEaW07bUPACc9DfUGhU+q2QL7mQECWdkKYPws8GILzoXuLQy0WnV
 NAawSGyo90BjtPlBgn0S8QUudCXqlu4KOKlUm2MKJUJYOjuH88jYCXMuz4j8o3+9YxZtFfuCD
 cIRjHxaE0LZIK7HANFmP5bBAMdP/fcZwiI07ph0oGLm1jsHLYH5i6b3IddruDg7VnkeH9eBGt
 3NjDGEO0X86iBbZ/z6PgrH5M/fELSvUDZBb0UTjZ6pW7cFmV1od3lpIE5TRdBEe6h939+K4+s
 cDDLK9b4mLpFGGWF5pBrfK4GHevfUT4buYSv9Qhu2234td7+O8Wc1GOCw==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clarify that BCM2711 belongs to the BCM2835 ARCH.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5..13c7c64 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3168,7 +3168,7 @@ N:	bcm216*
 N:	kona
 F:	arch/arm/mach-bcm/

-BROADCOM BCM2835 ARM ARCHITECTURE
+BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE
 M:	Eric Anholt <eric@anholt.net>
 M:	Stefan Wahren <wahrenst@gmx.net>
 L:	bcm-kernel-feedback-list@broadcom.com
@@ -3176,6 +3176,7 @@ L:	linux-rpi-kernel@lists.infradead.org (moderated f=
or non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 T:	git git://github.com/anholt/linux
 S:	Maintained
+N:	bcm2711
 N:	bcm2835
 F:	drivers/staging/vc04_services

=2D-
2.7.4

