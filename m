Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45630ECDE46
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAB7820652
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="a4QWnyIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB7820652
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbeJYG5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 02:57:23 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45708 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbeJYG5W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 02:57:22 -0400
Received: by mail-qk1-f194.google.com with SMTP id m8-v6so4475046qka.12
        for <linux-clk@vger.kernel.org>; Wed, 24 Oct 2018 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=loRgag03CAkKGSKfSxQpwNrseftfyV/D6M+SVsiBq/M=;
        b=a4QWnyIFJkPZeWemLuCWduCA6VHC58mGq2OpU4cM3P8RXPPm/hiOtRL/055K+D/fNJ
         L7dWFmsUQ/KUrrKaY9a035wFZsjQhVGkO4vRDMPvLJ8s84ZJsMRKlqFmMBxR5PO/xftH
         Lw9ssPiyTIPlSba1s8pmsN00OHbgfWN8rKZEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=loRgag03CAkKGSKfSxQpwNrseftfyV/D6M+SVsiBq/M=;
        b=dyJNIBdJxiTcs61iuAiY3mtaKD8SjFjeEIZqTbnds6lxc+4W/1z2/iPEKW8x4BZlWm
         Snz/0q36D8L+kTHqr4RoALH68S9ZQ0OfE31MrZM61hLrmihZE5Mmxf1vohHkYQSoMObK
         wjwwbBVmFScohTPLTq4Jh8pmcaU6b3n7UW+pzT3IHTxslwzE9O//9rSt23GvHIWF3OQk
         83YhBzfwXmtBl1iBn0LeDQ1Kw1Jpl/0WvUQihA+R6ZsNNb01tAAi8A9sTd1wsaur62xr
         e1Yd3mdH3LjYVZqBJxBicQpfdMHCtajdZJcbmeGVNQafDSxI3WtoyyIgqxcEEE+U6JKM
         k5hQ==
X-Gm-Message-State: AGRZ1gJyDg39DLJFbpBXXxXKpXJZrSVrwVBEuSskpxFHxFoz/Wk6LN6j
        1X4g1yjf7zdqbpnezInCOWjYKUkYWgRxjLweF9VErvv0ZO5TrA==
X-Google-Smtp-Source: AJdET5eKhBl3vQdWX8C3djy2JRm2Nn39NA63Irxi7c4PkkadEu0M9bI5Q2MKqMUDLhSVSv5SNOpfohfBOIDafpkybNk=
X-Received: by 2002:a37:5108:: with SMTP id f8-v6mr3989288qkb.288.1540420047622;
 Wed, 24 Oct 2018 15:27:27 -0700 (PDT)
MIME-Version: 1.0
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Wed, 24 Oct 2018 15:27:16 -0700
Message-ID: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
Subject: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
To:     linux-clk@vger.kernel.org
Cc:     trivial@kernel.org, mike.looijmans@topic.nl, sboyd@kernel.org,
        mturquette@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Before:

=E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82                                                                =
=E2=94=82
=E2=94=82 CONFIG_COMMON_CLK_SI544:                                       =
=E2=94=82
=E2=94=82                                                                =
=E2=94=82
=E2=94=82 ---help---                                                     =
=E2=94=82
=E2=94=82   This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
=E2=94=82   generator.                                                   =
=E2=94=82

After:

=E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82                                                              =E2=
=94=82
=E2=94=82 CONFIG_COMMON_CLK_SI544:                                     =E2=
=94=82
=E2=94=82                                                              =E2=
=94=82
=E2=94=82 This driver supports the Silicon Labs 544 programmable clock =E2=
=94=82
=E2=94=82 generator.                                                   =E2=
=94=82

Signed-off-by: Ivan Babrou <ivan@cloudflare.com>
---
 drivers/clk/Kconfig | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 292056bbb30e..8b5993ae30d8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -48,7 +48,7 @@ config COMMON_CLK_MAX77686
 config COMMON_CLK_MAX9485
  tristate "Maxim 9485 Programmable Clock Generator"
  depends on I2C
- help
+ ---help---
    This driver supports Maxim 9485 Programmable Audio Clock Generator

 config COMMON_CLK_RK808
@@ -104,7 +104,6 @@ config COMMON_CLK_SI514
  depends on I2C
  depends on OF
  select REGMAP_I2C
- help
  ---help---
    This driver supports the Silicon Labs 514 programmable clock
    generator.
@@ -113,7 +112,6 @@ config COMMON_CLK_SI544
  tristate "Clock driver for SiLabs 544 devices"
  depends on I2C
  select REGMAP_I2C
- help
  ---help---
    This driver supports the Silicon Labs 544 programmable clock
    generator.
@@ -123,7 +121,6 @@ config COMMON_CLK_SI570
  depends on I2C
  depends on OF
  select REGMAP_I2C
- help
  ---help---
    This driver supports Silicon Labs 570/571/598/599 programmable
    clock generators.
@@ -141,7 +138,6 @@ config COMMON_CLK_CDCE925
  depends on I2C
  depends on OF
  select REGMAP_I2C
- help
  ---help---
    This driver supports the TI CDCE913/925/937/949 programmable clock
    synthesizer. Each chip has different number of PLLs and outputs.
@@ -157,7 +153,7 @@ config COMMON_CLK_CDCE925
 config COMMON_CLK_CS2000_CP
  tristate "Clock driver for CS2000 Fractional-N Clock Synthesizer &
Clock Multiplier"
  depends on I2C
- help
+ ---help---
    If you say yes here you get support for the CS2000 clock multiplier.

 config COMMON_CLK_GEMINI
@@ -200,7 +196,6 @@ config CLK_TWL6040
 config COMMON_CLK_AXI_CLKGEN
  tristate "AXI clkgen driver"
  depends on ARCH_ZYNQ || MICROBLAZE || COMPILE_TEST
- help
  ---help---
    Support for the Analog Devices axi-clkgen pcore clock generator for Xil=
inx
    FPGAs. It is commonly used in Analog Devices' reference designs.
@@ -260,26 +255,22 @@ config COMMON_CLK_VC5
  depends on I2C
  depends on OF
  select REGMAP_I2C
- help
  ---help---
    This driver supports the IDT VersaClock 5 and VersaClock 6
    programmable clock generators.

 config COMMON_CLK_STM32MP157
  def_bool COMMON_CLK && MACH_STM32MP157
- help
  ---help---
    Support for stm32mp157 SoC family clocks

 config COMMON_CLK_STM32F
  def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F74=
6)
- help
  ---help---
    Support for stm32f4 and stm32f7 SoC families clocks

 config COMMON_CLK_STM32H7
  def_bool COMMON_CLK && MACH_STM32H743
- help
  ---help---
    Support for stm32h7 SoC family clocks

--
2.19.1
