Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1355 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752369AbdLUIzg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Dec 2017 03:55:36 -0500
Date: Thu, 21 Dec 2017 10:55:31 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Add la clock for Tegra210
Message-ID: <20171221085531.GQ29417@tbergstrom-lnx.Nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
 <47980cf0-8837-bff1-a25a-1287dd96b689@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <47980cf0-8837-bff1-a25a-1287dd96b689@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 19, 2017 at 10:27:56PM +0000, Jon Hunter wrote:
> 
> On 16/11/17 14:28, Peter De Schrijver wrote:
> > This clock is needed by the memory built-in self test work around.
> 
> Can we say what this 'LA' clock is? What does LA stand for? Looks like
> this is only used for Host1x.
> 

I think it stands for Latency Allowance.

Peter.

> Cheers
> Jon
> 
> -- 
> nvpublic
