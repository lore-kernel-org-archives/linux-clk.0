Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41595 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755801AbcIGAwK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2016 20:52:10 -0400
Date: Tue, 6 Sep 2016 17:52:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: carlo@caione.org, khilman@baylibre.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson-gxbb: Export PWM related clocks for DT
Message-ID: <20160907005208.GS12510@codeaurora.org>
References: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Neil Armstrong wrote:
> Add the PWM related clocks in order to be referenced as PWM source
> clocks.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

With some more thought, it should go through whatever tree takes
the dts changes. Conflicts in these header files should be
managed by the same person and that person is the platform
maintainer.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
