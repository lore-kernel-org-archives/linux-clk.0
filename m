Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34124 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752506AbbHKVRs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 11 Aug 2015 17:17:48 -0400
Received: by pawu10 with SMTP id u10so172115735paw.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2015 14:17:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1437420787-32137-3-git-send-email-eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Stephen Warren" <swarren@wwwdotorg.org>,
	"Lee Jones" <lee@kernel.org>, linux-clk@vger.kernel.org,
	"Stephen Boyd" <sboyd@codeaurora.org>,
	"Eric Anholt" <eric@anholt.net>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-3-git-send-email-eric@anholt.net>
Message-ID: <20150811211733.31346.11122@quantum>
Subject: Re: [PATCH v4 2/8] clk: Add a Raspberry Pi-specific clock driver.
Date: Tue, 11 Aug 2015 14:17:33 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Eric,

Quoting Eric Anholt (2015-07-20 12:33:01)
> +void __init rpi_firmware_init_clock_provider(struct device_node *node)
> +{
> +       /* We delay construction of our struct clks until get time,
> +        * because we need to be able to return -EPROBE_DEFER if the
> +        * firmware driver isn't up yet.  clk core doesn't support
> +        * re-probing on -EPROBE_DEFER, but callers of clk_get can.
> +        */
> +       of_clk_add_provider(node, rpi_firmware_delayed_get_clk, node);
> +}
> +
> +CLK_OF_DECLARE(rpi_firmware_clocks, "raspberrypi,bcm2835-firmware-clocks",
> +              rpi_firmware_init_clock_provider);

Do you require CLK_OF_DECLARE here? Could this be a platform driver
instead?

Regards,
Mike

> -- 
> 2.1.4
> 
