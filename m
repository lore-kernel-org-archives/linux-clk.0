Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49412 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757494AbdKOAm5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Nov 2017 19:42:57 -0500
Date: Tue, 14 Nov 2017 16:42:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: tegra: Add la clock for Tegra210
Message-ID: <20171115004256.GN11955@codeaurora.org>
References: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
 <1510313868-24810-2-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1510313868-24810-2-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/10, Peter De Schrijver wrote:
> This clock is needed by the MBIST WAR.

I'm not sure everyone knows what WAR means. Maybe it can be
spelled out as "workaround". Same comment applies to MBIST.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
