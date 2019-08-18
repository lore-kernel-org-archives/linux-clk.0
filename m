Return-Path: <SRS0=w6Q+=WO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C164C3A5A0
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7A612184D
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="PhUSsHYC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfHRQYX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 12:24:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:45057 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbfHRQYX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Aug 2019 12:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566145452;
        bh=SuYFWggGMvyL0R5mkXrY/oTS9aFzxR3LL/R2BvRwYkA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=PhUSsHYCKmrxr1aSytT9rJCP495IYidWL0Jry+kSMkdASS/E9hrSJP48UGeI7kGYJ
         G6+Af++3tteGItHQJ0EfblODvcxKqXM98kfHOwVo03JIDrZ0DzOoYWI0iJka9gdUJc
         up50fbmU2/pvaKfV0j01Asvqk/tYqWKlq/L43sVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0Ln7wj-1iSvIs3FQj-00hJwN; Sun, 18 Aug 2019 18:24:11 +0200
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
Subject: [PATCH 0/4] clk: bcm2835: Add bcm2711 support
Date:   Sun, 18 Aug 2019 18:23:40 +0200
Message-Id: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:+k/rdFlLLhqZnU2+lJXj++cOGbkfM5tkTMwxSSRsTDM21/InYHR
 nOlVzMq5YRy07Z5ti8YgN23qd4XliPEi3B1kCZ0ZXveEfCdBI17GY60xgGAsQIa1TJ6jssa
 9jfYfsz1eo9W1LJB5S80uhZD0yNOnm8pDAzHG+u97tajO6k0yKoKpurBhguC5miHNU73JlH
 jIn8WW8t6EOyFbApr2YGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lyoY62pdevk=:RatbtpIjv6tGLMnWhLYBN5
 cvmSFKiLAGfT/MxezJies3y9o3x3KO0fW5UUx49stDr3MTg3CuA92jpm/WMldYFOBasx0IQKg
 WvuhW0XRaazBUYXKdu2JRm6MVJKkQBonf9fDq21RRMh+YIL5m1cjdtvDvTsxouqAER2UdD7xL
 i2ViYwXGNDew8Qa5muCr27bceI9NKX2bOKILQ2S/myE4cHQzxBB8CeXBPNme0bPp70I3lGuaa
 eoqPMTgPbnR1i0ApoF/YNFFZm4GMYcqwImRWVLonMjLa/vacewUBjRwZvvrVgsUXz1+vM4wCe
 IJMQv1FzlDwgO7yX2PW/hUGXUGD5LINQ5vaTX2iGwplZwtm/nBOSJQl5Oa3pNBaVFsO2gNxiD
 2AreQi9+93OaO8QBnZfRw6KfW+gyIANIOQfNHyAYCbyOZO0YqI/qBNNFxnXanwAHMX/FGcM+T
 7JhNqA19lACuXgO97+LZjVACtnE8QFILbz+SU6ecpXWcVosQUdW+CTGPpJzza42XdugIe4vPU
 11N7Z4kirFLyCxcDHj5qa4nFXRb52R6NcGYWpsCPK0DuJx7Hm/wGLtDVssVwaJF0axhUFAitR
 hddyeQmvcP7qfSDiEySLo1if4U0mrAQuvEHl6M4IWcDfWAyviJA0sQeVVMJIMD202JjExUhcM
 yXjmLRUNHlp7f6dvp+Kekv9saAMrwbHLZ2DPcagHNnRDxBc4/tXz6v7aNoeH1Ni6BACoFGnoS
 eN+YOxShj8magamG8o2EwJByzC82eqEkNUAYgdO2d711P01sKliyJPoBvxa60MkdTTeIgjVDu
 e5hr+TrSvqgwXrVDcmJ7D54pUN3W9ZzRlEZSC6yJipyyPZYYFqwD6VnMvA8249g5h/HYSOAtt
 1esDTJkpFhJAEEoAwgB2zadEQIzYhi8aOgqji2+Hmp5IEJRxwWQXpb+X4yM//1mXbCxVzf/Qk
 XR+kJd6ptdlp+Y5RCF1NwFQDTn4i2YQNDKhL4LU5AyjyQDUcFzPBCBllAXPdlo0FZDgdC6Bq/
 UwdHIWNGkGr67aYwnW1mY5E+S6w4cLy8c2/BBKEyWf02tAvWMMBqMno5nC0KGCOPvvhPw6uMm
 RWt8wXHqzFllAgPjcq0IPBTDlD2e+W0lxrsRRK7Gh0NrmridsD/uhGRSQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series has been split out of the recent Raspberry Pi 4 support
series [1]. There are no functional changes, just an explaining commit
for marking PLLD_PER as critical as request by Stephen Boyd.

[1] - https://marc.info/?l=3Dlinux-arm-kernel&m=3D156571347332483

Stefan Wahren (4):
  dt-bindings: bcm2835-cprman: Add bcm2711 support
  clk: bcm2835: Introduce SoC specific clock registration
  clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
  clk: bcm2835: Mark PLLD_PER as CRITICAL

 .../bindings/clock/brcm,bcm2835-cprman.txt         |   4 +-
 drivers/clk/bcm/clk-bcm2835.c                      | 138 ++++++++++++++++=
++---
 include/dt-bindings/clock/bcm2835.h                |   2 +
 3 files changed, 125 insertions(+), 19 deletions(-)

=2D-
2.7.4

