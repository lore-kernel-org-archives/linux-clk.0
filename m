Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:20148 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589AbbFZK4u (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:56:50 -0400
Date: Fri, 26 Jun 2015 13:56:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: linux-clk@vger.kernel.org
Subject: Re: clk: stm32: Add clock driver for STM32F4[23]xxx devices
Message-ID: <20150626105641.GP30834@mwanda>
References: <20150626103110.GA350@mwanda>
 <558D2F2D.4020803@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <558D2F2D.4020803@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 26, 2015 at 11:53:33AM +0100, Daniel Thompson wrote:
> Maybe just "BITS_PER_BYTE * sizeof(table)" achieves that best?
> 

That works.

> BTW... you're happy for me to send a patch on this (with a Reported-by:)?

Yes, please.

regards,
dan carpenter

