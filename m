Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:32952 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758953AbcIHSM2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2016 14:12:28 -0400
Received: by mail-oi0-f43.google.com with SMTP id y2so83649452oie.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2016 11:12:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: gxbb: expose spifc clock
References: <1473261223-15412-1-git-send-email-jbrunet@baylibre.com>
        <1473261223-15412-4-git-send-email-jbrunet@baylibre.com>
        <20160907212754.GB12510@codeaurora.org>
Date: Thu, 08 Sep 2016 11:12:19 -0700
In-Reply-To: <20160907212754.GB12510@codeaurora.org> (Stephen Boyd's message
        of "Wed, 7 Sep 2016 14:27:54 -0700")
Message-ID: <m24m5qntvg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 09/07, Jerome Brunet wrote:
>> SPI clock is needed for the spifc driver, expose to DT
>> (and comment out in the clk driver)
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Applied,

Kevin
