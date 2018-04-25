Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:42663 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbeDYKH0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Apr 2018 06:07:26 -0400
Received: by mail-wr0-f178.google.com with SMTP id v5-v6so1978525wrf.9
        for <linux-clk@vger.kernel.org>; Wed, 25 Apr 2018 03:07:26 -0700 (PDT)
Message-ID: <1524650843.4026.58.camel@baylibre.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: meson8b: export the NAND
 clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
Date: Wed, 25 Apr 2018 12:07:23 +0200
In-Reply-To: <20180423193509.30584-2-martin.blumenstingl@googlemail.com>
References: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
         <20180423193509.30584-2-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-04-23 at 21:35 +0200, Martin Blumenstingl wrote:
> Export the NAND clock to the dt-bindings.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  1 file changed, 1 insertion(+)

applied to next/headers.
Thx
