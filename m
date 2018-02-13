Return-Path: <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH] clk: keystone: sci-clk: add support for dynamically
 probing clocks
To: Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org, ssantosh@kernel.org,
        mturquette@baylibre.com
References: <1518540942-25213-1-git-send-email-t-kristo@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <1d8bf56f-422e-29fc-e2e6-278f2c298e3f@oracle.com>
Date: Tue, 13 Feb 2018 09:00:48 -0800
MIME-Version: 1.0
In-Reply-To: <1518540942-25213-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2/13/2018 8:55 AM, Tero Kristo wrote:
> Currently, the driver contains a large hints table for clocks that exist
> on a device, however, it is possible to probe the clocks from the firmware
> also. Add support for this, and drop the clock hints table support from
> the driver completely. This causes the driver to send a few extra sci-clk
> messages during boot, basically one extra for each device that exists on
> the SoC; on K2G this is approx 80.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
