Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16272 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753342AbdLSW2B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Dec 2017 17:28:01 -0500
Subject: Re: [PATCH v2 1/4] clk: tegra: Add la clock for Tegra210
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <47980cf0-8837-bff1-a25a-1287dd96b689@nvidia.com>
Date: Tue, 19 Dec 2017 22:27:56 +0000
MIME-Version: 1.0
In-Reply-To: <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 16/11/17 14:28, Peter De Schrijver wrote:
> This clock is needed by the memory built-in self test work around.

Can we say what this 'LA' clock is? What does LA stand for? Looks like
this is only used for Host1x.

Cheers
Jon

-- 
nvpublic
