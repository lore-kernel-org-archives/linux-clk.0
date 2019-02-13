Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CB1C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 08:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1681A20700
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 08:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XYJLElqV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389427AbfBMIi5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 03:38:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55092 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389356AbfBMIi5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Feb 2019 03:38:57 -0500
Received: by mail-wm1-f65.google.com with SMTP id a62so1456732wmh.4
        for <linux-clk@vger.kernel.org>; Wed, 13 Feb 2019 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zYPxwD3KaOIMYFSe9JlfKDwbgdzNPJqs8i8EAHw3GRI=;
        b=XYJLElqVy8VQFvf52aNhx5HtzGexhS3IDntGrRaZgHf+urtk0shv8h3OzWsXWacOtq
         SfS2giUxQEu0Zc42qeNMxkZzMny66vkKrY9ng45RzLjW1xbp7G1ABDz5h87Nz3qyiRQR
         HnrhnR2VmtbNLX36z4TLJu88Nfgod91voNUFO0LltSKvoQ5AD/dViQwTndHFmAnqmcUa
         ChWdwyOGO14SSfAU0nGw+D1Eck68L3TfAtb5PiggJ2rMZxvLHMHtmA1QMOC3D9Di/yIE
         kvrgHm27lp9L9l4HMeIflqfDQxIcfl7YHPtsDZeJxbbvzxUDvyO0WmKoAcZRyTveBRsG
         is5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zYPxwD3KaOIMYFSe9JlfKDwbgdzNPJqs8i8EAHw3GRI=;
        b=GL6tu0K6XN6+6SIMg2FrZJfqWHbFi8Goqkasb86jlJT3ZPkRnHqX60kzufNlrCPssw
         yXgcBV9v3hZEAbp/rz9VthZ8QqDU5WaKL6zF9m6QKvCer2858eai+FD4VWQKv9205lZh
         uiO9xHSwXsU+jiu3L4fMxr4y+qWjsKhUsX6lB2L2Gfffkap/dQTymuUFApvz4m8YIgAd
         r1f3gGU9OLRf7TgZ0hA+rG/TZpDHR7Nsw3FCOjCGdcMHV6eQYEAFKYZWm0aktiFVNZ1E
         nGmN0Gs/wh3P55ju8hSnpXHM1e7c7R50VcRuzLaMaFpb6P1RCrCFYNBLIHIg9aPtUfJF
         B5Xw==
X-Gm-Message-State: AHQUAuabC8XXkeE3HFDywI/8EnUi0m6nchYSdYuVGB1XU2BF47JnM16R
        oSiGzwYjOxt2D0EwT1/0LW7xbg==
X-Google-Smtp-Source: AHgI3IbDETGS5T9Qe1wD6lousIHYmIbj/GWqPRmQwncCH/7oQdwkT4kZ/2HczP1Rd6/XpL/H0syYLw==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr2267610wmj.13.1550047134662;
        Wed, 13 Feb 2019 00:38:54 -0800 (PST)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z3sm10337785wmi.32.2019.02.13.00.38.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 13 Feb 2019 00:38:53 -0800 (PST)
Message-ID: <98eaeaca26bc83db1a8d1f1362b56e3a32073bb3.camel@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson: Add G12A AO Clock + Reset Controller
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Feb 2019 09:38:53 +0100
In-Reply-To: <20190212162859.20743-1-narmstrong@baylibre.com>
References: <20190212162859.20743-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2019-02-12 at 17:28 +0100, Neil Armstrong wrote:
> This patchset add support for the Amlogic G12A SoC family Always-On
> clock and reset controller.
> 
> This adds support for clocks on the Always-On domain like :
> - Always-On UARTS & I2C Controllers
> - CEC Controllers
> - SARADC source and bus clock
> - Infrared Decoder/Encoder bus clock
> - USB 32K reference clock
> 
> This also adds resets lines for :
> - Always-On UARTS & I2C Controllers
> - SARADC, Infrared Decoder/Encoder
> 
> This patchset depends on the ("clk: meson: rework drivers dependencies")
> from Jerome Brunet at [1].
> 
> Changes from v1 at [2]:
> - Moved unused bindings ID out of the dt-bindings header
> - Added comment about CLK_IGNORE_UNUSED
> 
> [1] https://lkml.kernel.org/r/20190201125841.26785-1-jbrunet@baylibre.com
> [2] https://lkml.kernel.org/r/20190204091331.9298-1-narmstrong@baylibre.com
> 
> Neil Armstrong (2):
>   dt-bindings: clk: add G12A AO Clock and Reset Bindings
>   clk: meson: Add G12A AO Clock + Reset Controller

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> 
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt    |   1 +
>  drivers/clk/meson/Kconfig                     |   2 +
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/g12a-aoclk.c                | 454 ++++++++++++++++++
>  drivers/clk/meson/g12a-aoclk.h                |  34 ++
>  include/dt-bindings/clock/g12a-aoclkc.h       |  34 ++
>  include/dt-bindings/reset/g12a-aoclkc.h       |  18 +
>  7 files changed, 544 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/meson/g12a-aoclk.c
>  create mode 100644 drivers/clk/meson/g12a-aoclk.h
>  create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h
> 


