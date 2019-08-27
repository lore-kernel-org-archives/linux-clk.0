Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAE8C3A5A3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 22:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1359E2186A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 22:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="erWudouu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfH0WfN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 18:35:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45049 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfH0WfM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 18:35:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so300560pfc.11
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2019 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=jdwDMeG5Gy8r+selbq8n2uifwalgXCtHNkU64dqsTgM=;
        b=erWudouuqQ0Yh6EkCEe6Xx4WugJd7xm8WMPsfPht6ox6w5IPtS+q29u/A3mTFBZEJH
         LTadr2zS+89ffAaJDt+4ZaeHq8EO/BwyhyWXOdmun2Z48Yuk1NzOGRvhk8itUKqyW9qk
         8rG/O3+euT/5hvx3SWA9cke3mhhXIEApT0fnMlDy94G+6fKTrakyFJ3JCZVaUG4VOXMI
         ayIIGSg+l9SMXi0NnVNxx8fPKRwgOJgtg1MbMsNqzMyqSr+MwJqxSrGpYN3ymU5ZFb85
         Q5vtcLg87ILuyBPxJBjVphvQZOQQRva8uBM4Q4mSwXZIJkpT+0bi4iFCbPRlNeCjvbpq
         hNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=jdwDMeG5Gy8r+selbq8n2uifwalgXCtHNkU64dqsTgM=;
        b=dcEXNCEWjJ8KUvtM6AdAm5CpVkfmm8M3TCJtory6+1DGRwi8LZ5SKtAnWbf/yWoTah
         iG1pagBnQ6weN7lPSlmxMDLL99gdgByXad/exHod0CgURY9cRJBh5SnrnxooL4LQmfM9
         p4iXdR5mA730xTUicDuDDOM6AG4UmJznmlyAEmd8EGlVbOAh7ZjQl+QvfXBZZ8954Dh3
         2UVykeYgyfDR3GQNyeXkhsMUfCw/DYD+214l8rLsuD8GhjAN4ywl8EgLETYizUje7fpf
         8IigPrjIKaCnI87XBqgGDCCiHkFTIKDXrpDAQ/pusYqaxnIEYz3dolplub80IkRFhGxl
         tB7A==
X-Gm-Message-State: APjAAAU7Ew8f+RTvC718p1IL/YL0YTM97bNkqjVr0e4stuimXxTRFFv5
        7c2dE8OvgngfAnJhdQbNx0jHlg==
X-Google-Smtp-Source: APXvYqxRh6iZPF7EBcmWzywBoXlbYwRouh4Bcrsl9kudC14pWnkhfyepcM10JRQLzhwAV0ZpX28itQ==
X-Received: by 2002:a63:3009:: with SMTP id w9mr737348pgw.260.1566945312087;
        Tue, 27 Aug 2019 15:35:12 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
        by smtp.gmail.com with ESMTPSA id d18sm364839pgi.40.2019.08.27.15.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 15:35:11 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <7h8srexw1i.fsf@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com> <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com> <7h8srexw1i.fsf@baylibre.com>
Date:   Tue, 27 Aug 2019 15:35:11 -0700
Message-ID: <7h1rx6uti8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>>> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
>>> enables DVFS on the SM1 SoC for the SEI610 board.
>>>
>>> The SM1 Clock structure is slightly different because of the Cortex-A55
>>> core used, having the capability for each core of a same cluster to run
>>> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>>>
>>> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
>>> with a bypass mux to use the CPU0 instead of the dedicated trees.
>>>
>>> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>>>
>>> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
>>> G12A only a single version of the SoC is available.
>>>
>>> Dependencies:
>>> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
>>> 	but is not a strong dependency, it will work without
>>>
>>> Changes since v1:
>>> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>>>
>>> Neil Armstrong (5):
>>>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>>>   clk: meson: g12a: add support for SM1 GP1 PLL
>>>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>>>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>>>   arm64: dts: meson-sm1-sei610: enable DVFS
>>>
>>>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>>>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>>>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>>>  drivers/clk/meson/g12a.h                      |  24 +-
>>>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>>>  6 files changed, 697 insertions(+), 5 deletions(-)
>>
>> Applied 1 to 4
>
> Will there be a stable tag I can use for that so I can apply patch 5?

Ah, I should've finished reading the list before asking.  I now see your
clock PR.  I'll use this tag[1] unless there's a different one I should
use.

Kevin

[1] git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2
