Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D0C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 14:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30A7364E05
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 14:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhA3OJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Jan 2021 09:09:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:40396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230358AbhA3OJd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 30 Jan 2021 09:09:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51EE564DDF;
        Sat, 30 Jan 2021 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612015733;
        bh=VQC3NgDeu1DxvtfWht3DJ/VAV15s5Dzsedrug9WwBoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JdxHzAZz+g9PIHg2oavwbpEpA1RcA/Tc0XOIJ2PQQjCrB+eZXfyaRsuDsbkxuiJJh
         VRzOFnz4fA73gqHTM50/vxiNaocOJQro5h0bwTHHGRGdpizEm3sI+PfnNFosKljuO6
         AAlg50CYm7gQzQnP2XF3uKKfzAt4DjTvhlCVjYvzkISlmiCd3p3vnIeNkL7FsR3iH+
         BC20owiqvBcR/Vf1Ydy13i79MccyXhPViVAunCzSsYgDkVvz6m5FdcK9FdWINfWwLJ
         0uVEydUn7xYM4ulwe268WN7ahbUfMqrTn//lyMsf1EB/M8YylAK5ebU3/DV9jOSd3B
         vihvHOmmOWWTQ==
Date:   Sat, 30 Jan 2021 22:08:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: imx: imx31: Remove the unused uart_clks[]
Message-ID: <20210130140847.GM907@dragon>
References: <20210128031248.27244-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128031248.27244-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 28, 2021 at 12:12:48AM -0300, Fabio Estevam wrote:
> Since commit 30c1951790df ("clk: imx: imx31: Remove mx31_clocks_init()")
> uart_clks[] is no longer used, so remove it to avoid the following
> build warning:
> 
> drivers/clk/imx/clk-imx31.c:54:28: warning: unused variable 'uart_clks' [-Wunused-const-variable]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Already picked up one patch from Lee Jones.

Shawn
