Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from marcansoft.com ([212.63.210.85]:49284 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964875AbeBLQ0F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Feb 2018 11:26:05 -0500
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Message-ID: <09072c49-9796-9a16-8a6f-8e5c609d7e06@marcan.st>
Date: Tue, 13 Feb 2018 01:17:49 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.

For the series:
Tested-by: Hector Martin <marcan@marcan.st>

This requires an additional patch (Thierry has it in one of his trees)
to fix the tegra_powergate_sequence_power_up path (missing `pg.pmc =
pmc;` in that function). With that fix, this series fixes the
nondeterministic "green bars across display" issue.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
