Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33299 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbcLFU0h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2016 15:26:37 -0500
Date: Tue, 6 Dec 2016 21:25:59 +0100
From: Richard Cochran <richardcochran@gmail.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Mugunthan V N <mugunthanvnm@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Wingman Kwok <w-kwok2@ti.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/6] net: ethernet: ti: cpts: add support for ext rftclk
 selection
Message-ID: <20161206202558.GB23605@localhost.localdomain>
References: <20161128230428.6872-1-grygorii.strashko@ti.com>
 <20161128230428.6872-3-grygorii.strashko@ti.com>
 <20161130095632.GC28680@localhost.localdomain>
 <bf207ac4-0f9f-d4a7-14ac-704d93fb7764@ti.com>
 <11994fbc-3713-6ef7-8a44-8a2442106dfc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <11994fbc-3713-6ef7-8a44-8a2442106dfc@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 06, 2016 at 01:39:40PM -0600, Grygorii Strashko wrote:
> I come with below RFC patch. if no objection I'll move forward with it.

Thanks for following through with this!

The am335x will also need the MUX in its clock tree, won't it?


Thanks,
Richard
