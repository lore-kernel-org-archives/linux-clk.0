Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:58176 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbeGZOtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 10:49:25 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 26 Jul 2018 14:32:29 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: linux-kernel@lists.codethink.co.uk, jonathanh@nvidia.co,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [Linux-kernel] tegra clock updates and fixes
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Message-ID: <16564340083ea64de8c956ba65ea59f8@codethink.co.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-20 14:45, Ben Dooks wrote:
> Hi, this is a set of clock updates and fixes we did when developing
> the tegra20/tegra30 auto support. The audio change is due to using
> the tegra in clock-slave mode (this hasn't been done before)
> 
> We have also implemented the clock reset status callback as it is
> used by some of the driver work we did.

Is it possible to look at applying the bits of the series that are
not currently under discussion? If so should I post a smaller series?

-- 
Ben
