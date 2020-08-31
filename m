Return-Path: <SRS0=AQ30=CJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263A3C433E6
	for <linux-clk@archiver.kernel.org>; Mon, 31 Aug 2020 02:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0313F2078D
	for <linux-clk@archiver.kernel.org>; Mon, 31 Aug 2020 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598840967;
	bh=5XXLwr3gA1xrG0V9krERl8EjNNilBSq5UBzxHEblVKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=O+97MdGYfb/NcOEfVR9Z1wvWFBrw16jJq951n9x0r+k3QqlQaIwjtrErdqy4XfjeG
	 BHa0oOHJ9L+hA0WaTRxYGnhLFDAxE5f0uY4GNQeSZ7dEpZrCYdxIlXdFMMtEGsjFiN
	 1aXp2Fyiv9u0CJcsxKrB9gLlBquGteD/Iy85ZTiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgHaC3W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Aug 2020 22:29:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgHaC3V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Aug 2020 22:29:21 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FC8C2071B;
        Mon, 31 Aug 2020 02:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598840960;
        bh=5XXLwr3gA1xrG0V9krERl8EjNNilBSq5UBzxHEblVKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/o8vhL80wpTGvqkWVnze7gat3kTG3TUBKecOLplGzAm720sn57uV6Pbrq6zUy+D1
         yuqMIUTMokUIIe6n25Kz+l/zyECt+AcR649/+OCcDlWLut93VMgb96y+jTaoB+W1OO
         E71JJIw5rD2nrr2TBxH1wJYADCzdlMqZMrY6wl00=
Date:   Mon, 31 Aug 2020 10:29:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: Correct the root clk of media ldb on imx8mp
Message-ID: <20200831022914.GC4488@dragon>
References: <1598254622-29340-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598254622-29340-1-git-send-email-ping.bai@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 24, 2020 at 03:37:01PM +0800, Jacky Bai wrote:
> The root clock slice at 0xbf00 is media_ldb clock,
> not csi_phy2_ref, so correct it.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied both, thanks.
