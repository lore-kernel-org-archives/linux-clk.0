Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACF2C4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 11:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0034E2084B
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571052485;
	bh=/g4g30a0MH8QiC/8al6h1905rB2c81+BAd/3ru+5no4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xsCdQSYeg5jKK0eKHhc09VnBYL8c+MTtcEBy+lI+xoq3tIMATKAYOhiSy1peeD76F
	 ijmEgG/6oMoStaw0HFYtxLyKVneFivD1kv29BAjdmfeoBi+LxWfeE/X75jqE5avoar
	 1RZ/4/dX2+JL+YKj0csGhfjB5omIhxjgM4bcC6/Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbfJNL2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 07:28:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbfJNL2E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Oct 2019 07:28:04 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E27C820673;
        Mon, 14 Oct 2019 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571052483;
        bh=/g4g30a0MH8QiC/8al6h1905rB2c81+BAd/3ru+5no4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A6Jm6xk50F5hvw+poB+ZUbqYUv86aDPsufPT52Xu2bdWNUh+s3ahjQB3gUJeDCjMH
         K8fnALvjJGElgK9R1g/+7hC4AOO2EOabbzM/4oKavcLhWl/gGAp5tUYZMntkcRNlRX
         fPCVMqQjiSJPHFMTzEEEsAzBlB7n5dZfQSwvYgJ8=
Date:   Mon, 14 Oct 2019 19:27:49 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Laurentiu Palcu <laurentiu.palcu@nxp.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, agx@sigxcpu.org,
        l.stach@pengutronix.de, Abel Vesa <abel.vesa@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: imx8mq: Add VIDEO2_PLL clock
Message-ID: <20191014112748.GM12262@dragon>
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
 <1570025100-5634-2-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570025100-5634-2-git-send-email-laurentiu.palcu@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 02, 2019 at 05:04:53PM +0300, Laurentiu Palcu wrote:
> This clock is needed by DCSS when high resolutions are used.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> CC: Abel Vesa <abel.vesa@nxp.com>

Applied, thanks.
