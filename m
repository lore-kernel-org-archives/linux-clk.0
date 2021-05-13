Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00828C433ED
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B540061432
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhEMHXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 03:23:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:52908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhEMHW6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 03:22:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 582F2611CA;
        Thu, 13 May 2021 07:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620890509;
        bh=gqVqj0ufiYKdkeB6/XFJC4EVl2BcDh65UQ0aR2zZ5E0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FSVyJg/M4vsONKsSRrYrdIxN/4xwbqPkvNEMc+0gMrLnAY0nQiAKudf/LDTAD6ShB
         YVlHEhTn6bRJDh/V0pyjPjxvp4KuAOBJ9o8VxT2zgenkjQID8kWzs6zGfhMyrey2Zs
         DDYznVkK9npG2az4l/Vsh+SQuj66iJjdnzIEWg8NePHBZ7hTV+YcLSOiSkwwNPQCZ5
         9dAKUg1tJ5CiJMbak5gwEAnqkS0mMN/b8NtBy2npPRmwhYIzQNUUomv8HjwQfls6J+
         Tx7a7DKAgrgS2iNNlMkDWxZ+g46ysxBzsDV2e1XzwWc2oCOkzXEmALy9L3RkkNgtvx
         qxhDxF1DlhEUQ==
Date:   Thu, 13 May 2021 15:21:43 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     robh+dt@kernel.org, abel.vesa@nxp.com, s.hauer@pengutronix.de,
        sboyd@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp: Remove the reference to audio
 ipg clock on imx8mp
Message-ID: <20210513072143.GR3425@dragon>
References: <20210420055453.1235297-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420055453.1235297-1-ping.bai@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 20, 2021 at 01:54:52PM +0800, Jacky Bai wrote:
> On i.MX8MP, there is no audio ipg clock, so remove the wrong reference
> to this clock in dts file.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied this one, thanks.
