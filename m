Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34232 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751734AbdFIKUP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2017 06:20:15 -0400
Subject: Re: [PATCH 1/3] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <5f07dd96-e1fb-0789-22fc-a38e20d50e47@samsung.com>
Date: Fri, 09 Jun 2017 12:19:53 +0200
MIME-version: 1.0
In-reply-to: <20170608170411.cfqvqmgzgi6qs7hz@kozik-lap>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <CGME20170608141722epcas5p2310095ad549f30841430f5cc3e364908@epcas5p2.samsung.com>
        <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
        <20170608170411.cfqvqmgzgi6qs7hz@kozik-lap>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/08/2017 07:04 PM, Krzysztof Kozlowski wrote:
> Everything looks good... but you are aware that lock_stat and enable
> offsets are equal to PLL35XX so the disable/enable ops could be re-used
> directly?

I planned to add enable/disable ops for all PLLs and there are different
bit offsets used for some PLLs than 29 and 31, e.g. PLL2650XX.
I just reworked the $subject patch to reuse the pll35xx callback functions
for pll36xx but I think it's better to leave this patch as is, so it is
easier to handle differences across the PLLs.

-- 
Thanks,
Sylwester
