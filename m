Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BEDC4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 13:23:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9F692089C
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571059388;
	bh=/8QNopu9sg/HvKCl5p+5djIJbq//CVacOt1EOwSJXtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OS7vq6t5c+zqgcXGMimE2X3zuwZvVRZhqVceicNV0Ag2+pPIy7YMECDSsni0wH7tj
	 rxvoxvEAdsCzTLO1CpHpffEeWKgTyl5022n0LcjOjY89uZz/aInvlrDVs6/qXrxPcZ
	 RH9yIFqJ8nPvU7vUqo1tAUVfVE/gNEsU7CNL5zzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbfJNNXI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:23:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbfJNNXI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Oct 2019 09:23:08 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 227D621848;
        Mon, 14 Oct 2019 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571059387;
        bh=/8QNopu9sg/HvKCl5p+5djIJbq//CVacOt1EOwSJXtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jRkO2K34EPsHAUrgHWJK7FGDuYVosHluCoBbos0eb8HKebh0j0NygFfczV3PxeFTN
         GO3gNDnlmkT4B0YbXpPFY84ut0N/0dXFZUrBeCE6eDM5yKeWxq6jO7SN7bO48d8W36
         vcxl8Yn6bxZxz1r+IrqDbc6kedXhSt58NIlbRxFg=
Date:   Mon, 14 Oct 2019 21:22:43 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        leonard.crestez@nxp.com, peng.fan@nxp.com, Anson.Huang@nxp.com,
        ping.bai@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: imx: clk-pll14xx: Make two variables static
Message-ID: <20191014132241.GY12262@dragon>
References: <20191008071908.24568-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008071908.24568-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 08, 2019 at 03:19:08PM +0800, YueHaibing wrote:
> Fix sparse warnings:
> 
> drivers/clk/imx/clk-pll14xx.c:44:37:
>  warning: symbol 'imx_pll1416x_tbl' was not declared. Should it be static?
> drivers/clk/imx/clk-pll14xx.c:57:37:
>  warning: symbol 'imx_pll1443x_tbl' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
