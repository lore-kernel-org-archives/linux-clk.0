Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:40310 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbeFZIJQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jun 2018 04:09:16 -0400
Received: by mail-wr0-f193.google.com with SMTP id g18-v6so16203395wro.7
        for <linux-clk@vger.kernel.org>; Tue, 26 Jun 2018 01:09:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: meson: remove unused clk-audio-divider driver
To: Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180620100610.29010-1-jbrunet@baylibre.com>
 <20180620100610.29010-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2cdbc56d-a1e5-62f7-c3d5-9d5f37544118@baylibre.com>
Date: Tue, 26 Jun 2018 10:09:12 +0200
MIME-Version: 1.0
In-Reply-To: <20180620100610.29010-3-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 20/06/2018 12:06, Jerome Brunet wrote:
> clk-audio-divider is no longer used, we can remove it.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/Makefile            |   2 +-
>  drivers/clk/meson/clk-audio-divider.c | 110 ----------------------------------
>  drivers/clk/meson/clkc.h              |   7 ---
>  3 files changed, 1 insertion(+), 118 deletions(-)
>  delete mode 100644 drivers/clk/meson/clk-audio-divider.c
> 
[...]
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
