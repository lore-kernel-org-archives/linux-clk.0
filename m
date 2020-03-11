Return-Path: <SRS0=7WK/=44=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6C1C10F25
	for <linux-clk@archiver.kernel.org>; Wed, 11 Mar 2020 07:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30B96208E4
	for <linux-clk@archiver.kernel.org>; Wed, 11 Mar 2020 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583910771;
	bh=c86VT5FpHpio5aGVvnNUNSuNXdICskgx/YVnnbeBvYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BMZuFQOzvOcQE/EJsZrqkby8NV8aI8YR8DK5iSOy6A/dxkrpcp/oycMajAZPTdeKV
	 GXaz3cbLQIMhwn/qicyvFVMU3NICiSwwpqL1mCjBCvr7HH857tEQynOzb5MDiKJHDt
	 aR42ajCIP6AZcACz9piPkDPgZtH9R8XvQSJTMMss=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgCKHMu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:12:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHMu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Mar 2020 03:12:50 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64FAF21655;
        Wed, 11 Mar 2020 07:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583910770;
        bh=c86VT5FpHpio5aGVvnNUNSuNXdICskgx/YVnnbeBvYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jXbnu6+TTEJZqPKG4EjBUyEhzRF4u40qvs9WeYqHMGOTZgQkr/kwVIaJjcU/o3FGl
         PTWzoUmJqHN3QMNfA3HR5pLY/QaQoqdMYjytG+ZbwUL9mh8YJpmbN72Q0cXpsGAUTy
         w78Jnxaaj4J19EiLgOlTZohVkJjHn2bgf6TlFqRA=
Date:   Wed, 11 Mar 2020 15:12:42 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com,
        abel.vesa@nxp.com, peng.fan@nxp.com, ping.bai@nxp.com,
        fugang.duan@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 1/4] clk: imx8mn: A53 core clock no need to be critical
Message-ID: <20200311071241.GJ29269@dragon>
References: <1582620554-32689-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582620554-32689-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 25, 2020 at 04:49:11PM +0800, Anson Huang wrote:
> 'A53_CORE' is just a mux and no need to be critical, being critical
> will cause its parent clock always ON which does NOT make sense,
> to make sure CPU's hardware clock source NOT being disabled during
> clock tree setup, need to move the 'A53_SRC'/'A53_CORE' reparent
> operations to after critical clock 'ARM_CLK' setup finished.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.
