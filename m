Return-Path: <SRS0=OKLv=SD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D12C43381
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 11:42:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CC5B20880
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 11:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MT9lire1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfDALmN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Apr 2019 07:42:13 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:51382 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfDALmN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Apr 2019 07:42:13 -0400
Received: by mail-wm1-f52.google.com with SMTP id 4so10051437wmf.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Apr 2019 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=S03zV7Lta1Z8ty3kqkDyLujewmb8PFtwjVhwG7a5SxI=;
        b=MT9lire1XgvKh0JBk59+p9bdJe1fgGCsCJMjkAj4OtXaouuQ3GYClT8UqNF/2O9Thi
         8oB/Klb6s17kkFOtQvFYlGjEjwOTp7EbnP0UtuFM5kJVQGTMa/jUxt/J29jwfEjzAtQz
         pK1Y8WUZjsKuUricgyma6Z0rct1dp27pQyoiHRYj0rQuOkijaC6eW461P8U6Zn+r37Qe
         WaAGAoIR3p8VbQ8QZl2QJZwUeCsvJKy3l/0KRf36u7RmAKBIZm2ssypW0jmHLmLB+wli
         Go9WLbsI5xzKq6eeRmt63l+42BAL1CuJUr4esCGhgqxjDtVBSGIWe+52SLQV3MUUc1KF
         RNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=S03zV7Lta1Z8ty3kqkDyLujewmb8PFtwjVhwG7a5SxI=;
        b=DILla3SWduSa2QX/meI6sCrZ+nJfp3/SoIqOBij1UGoggzHZBphRYfVVb+SLV4s4fp
         E7r2N0l0ge9OR1jYznHYi6J0O/ATE8jmAcLqtF4LFPUGDUwy/44O3S2of9zsZTNNX7Mb
         h6uUBe43GUXKIDabLrlmXgQetoJMKuHhNQzDiGTmpnaCZwaSMX7zKulsDM7D+QWSC4XY
         SF0gGQXw2VLkzxCWbvUE7ZMcCmSZ7u4MszLgxS2UbrmkJVOnHyei9GggfkC9EJBpnwgp
         yn1k058oOaoqmxarVD9XmcS5P9ZkQawG8tkcO1OOUX/ij4HXSP0l1t98HHMdqCHb9VG8
         7dgQ==
X-Gm-Message-State: APjAAAUo0wY2cYpZr+687ChUUOxGfWX/SJKn3nOtAHdBFGkkedV0RMuN
        //qLfPHxnlzdLby9f7EZhBvmVA==
X-Google-Smtp-Source: APXvYqxInC2PN2hWbPlLRhT3e+bs54RJ96d9qK4DKLCWg/Z9n+8u9zu2D6Ajb/yacN8d4iMwXoe/NA==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr12935297wmc.46.1554118930039;
        Mon, 01 Apr 2019 04:42:10 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id s10sm10670604wmh.0.2019.04.01.04.42.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 04:42:09 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v5.2
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e659729f-31a4-76c1-84a0-3fd441aa23b2@baylibre.com>
Date:   Mon, 1 Apr 2019 13:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.

It covers essentially new VPU and Video clocks for Meson8b and new
PCIE, CPU and Video Decoder clocks for G12a.
The remaining meson8b "ABP" ID is finally removed, and 2 clocks IDs
of the G12A AO clock controllers are re-exported.
Thanks,
Neil

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.2

for you to fetch changes up to 90751f686e3f0415f1f931bf47ff14dd34316ea5:

  clk: meson: meson8b: add the video decoder clock trees (2019-04-01 13:34:29 +0200)

----------------------------------------------------------------
- Adds VPU and Video Decoder clocks on Meson8b
- Finally remove the wrong ABP Meson8b clock id
- Adds Video Decoder, PCIe PLL & CPU Clocks on G12A
- Re-expose SAR_ADC_SEL and CTS_OSCIN on G12A AO clock controller
- Unexpose some AXG-Audio input clocks IDs

----------------------------------------------------------------
Jerome Brunet (1):
      dt-bindings: clock: axg-audio: unexpose controller inputs

Martin Blumenstingl (7):
      dt-bindings: clock: meson8b: drop the "ABP" clock definition
      dt-bindings: clock: meson8b: export the VPU clock
      dt-bindings: clock: meson8b: export the video decoder clocks
      clk: meson: meson8b: use a separate clock table for Meson8m2
      clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
      clk: meson: meson8b: add the VPU clock trees
      clk: meson: meson8b: add the video decoder clock trees

Maxime Jourdan (2):
      dt-bindings: clk: g12a-clkc: add VDEC clock IDs
      clk: meson-g12a: add video decoder clocks

Neil Armstrong (7):
      clk: meson-g12a: add cpu clock bindings
      clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
      dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
      dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
      clk: meson: g12a: add cpu clocks
      clk: meson-pll: add reduced specific clk_ops for G12A PCIe PLL
      clk: meson-g12a: add PCIE PLL clocks

 drivers/clk/meson/axg-audio.h              |  20 +
 drivers/clk/meson/clk-pll.c                |  26 +
 drivers/clk/meson/clk-pll.h                |   1 +
 drivers/clk/meson/g12a-aoclk.h             |   2 -
 drivers/clk/meson/g12a.c                   | 631 +++++++++++++++++++++++++
 drivers/clk/meson/g12a.h                   |  31 +-
 drivers/clk/meson/meson8b.c                | 734 ++++++++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h                |  27 +-
 include/dt-bindings/clock/axg-audio-clkc.h |  20 -
 include/dt-bindings/clock/g12a-aoclkc.h    |   2 +
 include/dt-bindings/clock/g12a-clkc.h      |   5 +
 include/dt-bindings/clock/meson8b-clkc.h   |   6 +-
 12 files changed, 1479 insertions(+), 26 deletions(-)
