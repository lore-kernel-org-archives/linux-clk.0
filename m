Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 18 May 2017 18:33:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: at91: fix clk-generated parenting
Message-ID: <20170519013302.GC20170@codeaurora.org>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/12, Alexandre Belloni wrote:
> clk_generated_startup is called after clk_hw_register. So the first call to
> get_parent will not have the correct value (i.e. 0) and because this is
> cached, it may never be updated.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Fixes tag?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
