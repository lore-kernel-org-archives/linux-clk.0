Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDCC10F14
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F16E20870
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555893838;
	bh=9j+hf5eDTFEHiYfu+MIDUAPZ+iMAT96cnznwccPyl1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=A7Vnquex6qOkqkhG6UF8CcghTqO1IMO+JWLpjiiLEwEqdG+W9QEM90SCv98/RjEwI
	 v02gVd1a0WTL3vdOFLbTbuc/MlBjc6gRWmCk6/WoeEhrHd3HrreZKbZYZlB2pCXaWW
	 hYTANSBFzJ704u/BNyklCWBTt+GSLnaH/7mxr/ko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfDVAn5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Apr 2019 20:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfDVAn5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Apr 2019 20:43:57 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51D0420833;
        Mon, 22 Apr 2019 00:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555893837;
        bh=9j+hf5eDTFEHiYfu+MIDUAPZ+iMAT96cnznwccPyl1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cImcL3jl55Ii7/2VRjSrAbyHUinx9q2WUEDIW2eo9wSl6O2+4yUtJt+fRGh1C8z9p
         6JYmWNIlR7t8DsLZ1X6v6Q0j81ITmjV0wsMUmrnyqMOCk2WixHr7FP8RTYC0yJ2VcO
         0Le+uQ3Z+SkrPazvaR7qFsKknQfcsAKhDJBrqMHw=
Date:   Mon, 22 Apr 2019 08:43:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable ROHM_BD718XX PMIC for
 imx8mm-evk
Message-ID: <20190422004337.GI19962@dragon>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
 <31905a9f97f4195b705cb9e853976aa3e9f6b144.1555077720.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31905a9f97f4195b705cb9e853976aa3e9f6b144.1555077720.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 12, 2019 at 02:10:04PM +0000, Leonard Crestez wrote:
> Enable mfd and regulator driver for PMIC found on imx8mm-evk boards
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
