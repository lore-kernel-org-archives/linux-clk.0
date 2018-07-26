Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729801AbeGZQkQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Jul 2018 12:40:16 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <16564340083ea64de8c956ba65ea59f8@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, jonathanh@nvidia.co,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <16564340083ea64de8c956ba65ea59f8@codethink.co.uk>
Message-ID: <153261857589.48062.4721112255504541100@swboyd.mtv.corp.google.com>
Subject: Re: [Linux-kernel] tegra clock updates and fixes
Date: Thu, 26 Jul 2018 08:22:55 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ben Dooks (2018-07-26 06:32:29)
> On 2018-07-20 14:45, Ben Dooks wrote:
> > Hi, this is a set of clock updates and fixes we did when developing
> > the tegra20/tegra30 auto support. The audio change is due to using
> > the tegra in clock-slave mode (this hasn't been done before)
> > =

> > We have also implemented the clock reset status callback as it is
> > used by some of the driver work we did.
> =

> Is it possible to look at applying the bits of the series that are
> not currently under discussion? If so should I post a smaller series?
> =


Just send it again please. I'd prefer to see some reviewed-by tags from
Nvidia folks on bits that are good to merge.

