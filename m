Return-Path: <SRS0=N9em=Z7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26102C43603
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 02:31:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E620620709
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 02:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575858709;
	bh=8+8UFXbOiRuBoUitT9o7PTg1+Ylp9ikDv43w7+HAuaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ndo+Z/wNyj5VLxlrn+1xMoOJ+C+dk3zUdeqg6xuEu/hP4PdN9iEQfqVfJDsmAuwyN
	 laqO2FO1QB1q1Ty72tnVziEg9aIrZaNy+PH3FVi6MKOZmmSm4L3AYFbxeZQRYkuWy6
	 hehpjuvYwyH85KEqBHoIK0ls8OZJAN+aH+3z5vXM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLICbs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Dec 2019 21:31:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:41038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbfLICbs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 8 Dec 2019 21:31:48 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04380206DB;
        Mon,  9 Dec 2019 02:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575858707;
        bh=8+8UFXbOiRuBoUitT9o7PTg1+Ylp9ikDv43w7+HAuaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UFVSvqL6hIAz9Bnj8X3YscVQ9gytFtuBY/+nWEzFoGz8rKa0caRA++qoRUF6z21Vk
         NzGtPPGYDopE5btAN3H0rA6QdJSZ4bQEH6WMH4i4hEv59G17r49EYQT+ck14YjY/wk
         KHq2qF8s9YXdjm3LIRSfhHCb0Os2kKYMtJrm590g=
Date:   Mon, 9 Dec 2019 10:31:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx7ulp: Fix watchdog2 clock name typo
Message-ID: <20191209023134.GU3365@dragon>
References: <20191119192848.27043-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119192848.27043-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 19, 2019 at 04:28:48PM -0300, Fabio Estevam wrote:
> There is a typo in the watchdog2 clock name. 
> 
> Fix it by changing it to "wdg2".
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
