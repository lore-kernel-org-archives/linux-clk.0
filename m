Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:34680 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753392AbeDSRlX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Apr 2018 13:41:23 -0400
Received: by mail-pl0-f65.google.com with SMTP id z12-v6so3669046plo.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Apr 2018 10:41:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] ARM64: dts: meson: hhi syscon and clock controllers
References: <20180315115545.1884-1-jbrunet@baylibre.com>
Date: Thu, 19 Apr 2018 10:41:20 -0700
In-Reply-To: <20180315115545.1884-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 15 Mar 2018 12:55:41 +0100")
Message-ID: <7h1sfb5c1r.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Jerome Brunet <jbrunet@baylibre.com> writes:

> The HHI register region provides more than just clocks. Several drivers may
> need to access this region, such as the clock controllers and the display
> driver.
>
> Meson-gx clock controllers has been developed and merged before we knew the
> hhi could be needed elsewhere, which is why it requests the region directly.
> Meson-axg was built following the model of meson-gx.
>
> To fix this situation, the clock controller should be a child of the hhi
> system controllers. The hhi system controller node already exists on meson-gx.
> It needs to be added on the axg.
>
> This changeset depends on [0]. This dependency has been merged in
> clk-next. A topic branch is available here [1]

As the dependencies are now merged for v4.17, applying this to
v4.18/dt64,

Thanks,

Kevin
