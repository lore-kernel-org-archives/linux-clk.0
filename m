Return-Path: <SRS0=ANa5=YV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA59CA9EA0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 08:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 748AC20873
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572252468;
	bh=qY+aV1eHCkydjCdPgxyshRtFqKJCycbia5BU8IV0eB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gW9DNwV02wb1YHXWXT3swB17RH4jO+L69G7NL+F3CO7J3fAWXo3+DrIxdgSizfqQP
	 muXzqIYi4c5Z8vwtvn3S+MQDiIOUwf8hH9Hq78nQyRkUb9OwmFISIoDRyhPpbV209h
	 Mo/lxo+KdmWxOJCcIeVepbfkUV0OIUqCKyhKR5xI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbfJ1Irp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Oct 2019 04:47:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:57718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731611AbfJ1Irp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Oct 2019 04:47:45 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC0A72086D;
        Mon, 28 Oct 2019 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572252464;
        bh=qY+aV1eHCkydjCdPgxyshRtFqKJCycbia5BU8IV0eB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UOiVUv/2hhedVD/fLdz+uyRgJy1g3V60Ju89tC9e5l1lzbcJpcYCKtFqSdj/Rgrsm
         UFHtpFsIVCgQBdxKMYn9oUHOihmoVjiul8R+kLF5UOuSQebaW8p05mWr1gwqeI9f4O
         SoVmjeWRnzm0PCtZLbP57x94D304yEK6KXGJ01Cg=
Date:   Mon, 28 Oct 2019 16:47:21 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] clk: imx: imx7d: use imx_obtain_fixed_clk_hw to simplify
 code
Message-ID: <20191028084720.GW16985@dragon>
References: <1571884513-19892-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571884513-19892-1-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 24, 2019 at 02:38:22AM +0000, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx_obtain_fixed_clk_hw could be used to simplify code to replace
> __clk_get_hw(of_clk_get_by_name(node, "name"))
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
