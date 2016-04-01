Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34661 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167AbcDATDd (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2016 15:03:33 -0400
Subject: Re: [v7, 4/5] powerpc/fsl: move mpc85xx.h to include/linux/fsl
To: Yangbo Lu <yangbo.lu@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-mmc@vger.kernel.org
References: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
 <1459480051-3701-5-git-send-email-yangbo.lu@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, scott.wood@nxp.com,
	Russell King <linux@arm.linux.org.uk>,
	Jochen Friedrich <jochen@scram.de>,
	Joerg Roedel <joro@8bytes.org>,
	Claudiu Manoil <claudiu.manoil@freescale.com>,
	ulf.hansson@linaro.org,
	Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	Zhao Qiang <qiang.zhao@freescale.com>,
	Kumar Gala <galak@codeaurora.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, leoyang.li@nxp.com,
	xiaobo.xie@nxp.com
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <56FEC601.7020800@codeaurora.org>
Date: Fri, 1 Apr 2016 12:03:29 -0700
MIME-Version: 1.0
In-Reply-To: <1459480051-3701-5-git-send-email-yangbo.lu@nxp.com>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/31/2016 08:07 PM, Yangbo Lu wrote:
>  drivers/clk/clk-qoriq.c                                       | 3 +--
>

For clk part:

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

