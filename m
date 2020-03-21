Return-Path: <SRS0=7yfQ=5G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B20C4332B
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17F85221EA
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584752158;
	bh=0HTHgcFjmWW1cL4Pi4xvWFi7dNLJv/AQGCq6g4m7PKY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=J4rSn/OtBn4osMC132NgHc2OfpvQAUa9pGI5LkUmAlYLR22URea0O49hpR7rQLPnC
	 Je9Orvn8BbWKT40WP40cywh3iLyayZZAlWaDOyHm45qGKPC2zd0HZG5+JQe4rRA29M
	 sWcz1szuU5qQyBPWVTCs2HeLbihdrD/5MRUQVQLM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgCUAz5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Mar 2020 20:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUAz5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 20:55:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2421D20A8B;
        Sat, 21 Mar 2020 00:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584752157;
        bh=0HTHgcFjmWW1cL4Pi4xvWFi7dNLJv/AQGCq6g4m7PKY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=p2CDY+JAVl9+EbkRXpJZt4+FNmL5Z0gEpn723mTbSnGF+mUAAr6SG27Whp4x6uIpV
         NvX4FEWu22QGovIyfxf/N24EyLyozxHXcLg1wpzXDlmqUtmCQujISLT3waC4Ctvc5s
         Q7FmSZQBeyQfKkZ9aG4sz37DLrlK0nsqyTopBDmU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219103326.81120-2-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org> <20200219103326.81120-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v3] clk: versatile: Export icst_clk_setup()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 20 Mar 2020 17:55:56 -0700
Message-ID: <158475215638.125146.16690448545766362120@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-02-19 02:33:25)
> Export this clock setup method so we can register the
> IM-PD1 clocks with common code in the next step.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
