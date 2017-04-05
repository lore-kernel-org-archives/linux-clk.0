Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44846 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753464AbdDEBiR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Apr 2017 21:38:17 -0400
Date: Tue, 4 Apr 2017 18:38:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] arm: dts: renesas: Drop _clk suffix from clock node
 names
Message-ID: <20170405013815.GK18246@codeaurora.org>
References: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/03, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The current practice is to not add _clk suffixes to clock node names in
> DT, as these names are used as the actual clock names.
> 
> This patch removes the remaining offenders in the various Renesas DTSes.
> 

This changes the names in the clk framework too though? If you're
ok with that I'm ok too.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
