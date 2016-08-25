Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37548 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754968AbcHYLo3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Aug 2016 07:44:29 -0400
Received: by mail-wm0-f51.google.com with SMTP id i5so67492005wmg.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Aug 2016 04:44:28 -0700 (PDT)
Date: Thu, 25 Aug 2016 12:44:24 +0100
From: Peter Griffin <peter.griffin@linaro.org>
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Olivier Bideau <olivier.bideau@st.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Pankaj Dev <pankaj.dev@st.com>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@stlinux.com,
        linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        arnaud.pouliquen@st.com, benjamin.gaignard@st.com,
        vincent.abriou@st.com, gabriel.fernandez@st.com
Subject: Re: [RESEND PATCH v2 00/13] Clock improvement for video playback
Message-ID: <20160825114424.GB3281@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Gabriel,

On Thu, 16 Jun 2016, Gabriel Fernandez wrote:

> v2:
>   - Simpliflication of clock binding
>     remark from Rob https://lkml.org/lkml/2016/5/25/492
>   - Suppression of stih415-416 support for the clocks (in order
> 	to help simplification of clock binding)
>     (others patchs for the machine and drivers will come)
> 
> This serie allows to increase video resolutions and make audio
> adjustment during a video playback.

For the series: -

Acked-by: Peter Griffin <peter.griffin@linaro.org>

Peter.
