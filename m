Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:45756 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755272AbeFNUp3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jun 2018 16:45:29 -0400
Subject: Re: [PATCH v8 03/10] firmware: xilinx: Add zynqmp IOCTL API for
 device control
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org,
        mingo@kernel.org, gregkh@linuxfoundation.org,
        matt@codeblueprint.co.uk, sudeep.holla@arm.com,
        hkallweit1@gmail.com, keescook@chromium.org,
        dmitry.torokhov@gmail.com, mturquette@baylibre.com,
        sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jolly Shah <jollys@xilinx.com>
References: <1529000862-11510-1-git-send-email-jollys@xilinx.com>
 <1529000862-11510-4-git-send-email-jollys@xilinx.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3044c2b9-2268-dfcb-2d45-0117c6f91a8d@infradead.org>
Date: Thu, 14 Jun 2018 13:45:20 -0700
MIME-Version: 1.0
In-Reply-To: <1529000862-11510-4-git-send-email-jollys@xilinx.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/14/2018 11:27 AM, Jolly Shah wrote:
> From: Rajan Vaja <rajanv@xilinx.com>
> 
> Add ZynqMP firmware IOCTL API to control and configure
> devices like PLLs, SD, Gem, etc.
> 
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 20 ++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  2 ++
>  2 files changed, 22 insertions(+)

Hi,

Does this driver claim (implement) some specific ioctl code or ID?

If so, its ioctl numbers should be documented in Documentation/ioctl/ioctl-number.txt.

thanks,
-- 
~Randy
