Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:34089 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753524AbbGaPa7 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2015 11:30:59 -0400
Subject: Re: [PATCH 2/2] ARM: dts: keystone: fix dt bindings to use post div
 register for mainpll
To: mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, ssantosh@kernel.org, mturquette@linaro.org,
	sboyd@codeaurora.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	arm@kernel.org, "olof@lixom.net" <olof@lixom.net>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com>
 <1432915453-409-2-git-send-email-m-karicheri2@ti.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org,
	pawel.moll@arm.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: santosh shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <55BB947B.7090608@oracle.com>
Date: Fri, 31 Jul 2015 08:30:03 -0700
MIME-Version: 1.0
In-Reply-To: <1432915453-409-2-git-send-email-m-karicheri2@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Olof,

As discussed patch 1/2 is already made it via clock tree. Please
pick the subject fix for your upcoming fixes pull request.

On 5/29/2015 9:04 AM, Murali Karicheri wrote:
> All of the keystone devices have a separate register to hold post
> divider value for main pll clock. Currently the fixed-postdiv
> value used for k2hk/l/e SoCs works by sheer luck as u-boot happens to
> use a value of 2 for this. Now that we have fixed this in the pll
> clock driver change the dt bindings for the same.
>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>


