Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6F4C04AAF
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 06:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04F2C20851
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 06:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558333529;
	bh=cHtPiNNVfcFAjX+nwUKdfSPkv8k0K9dC/wDPLIYqoC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WYjiSSWQpf8TNRBjALYOS0Pp3n7wD45tHiu3j9qodXyA02qf9quk3/uUOC55Nbv+H
	 Xmww24RsH1tD7MgISOo1TwcvdVTwneFO5co9VNMy+K4f2SLFDOeg9Ao+NapUs6COeZ
	 +cF8W1mmXm6st7XBZljB5/SDrE0yBlnttuA5wRi8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbfETGZ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 02:25:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:32878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730223AbfETGZ2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 02:25:28 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6775206B6;
        Mon, 20 May 2019 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558333528;
        bh=cHtPiNNVfcFAjX+nwUKdfSPkv8k0K9dC/wDPLIYqoC4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tO924fTYxBOLlVpLQTgBUHdUpSksa7C+1caY+Yic32c0eHlI4Wq10XAsaatQ2e/qG
         UKtEJdEDTlrNOWHE3hddUghhe9uhPW1ziiDvWorEAmV0hELjBZoVPmGHAKhlmYe705
         Gq02YDxXaW5SOWfLXnJptkL8IHdJgnEDiQ7CBCOQ=
Date:   Mon, 20 May 2019 14:24:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: clock: imx8mm: Add GPIO clocks
Message-ID: <20190520062433.GO15856@dragon>
References: <1557655926-12915-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557655926-12915-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, May 12, 2019 at 10:17:08AM +0000, Anson Huang wrote:
> Add macro for the GPIO clocks of the i.MX8MM.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied all, thanks.
