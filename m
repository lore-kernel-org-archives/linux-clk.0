Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B36C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AA07206C0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781870;
	bh=i2RzqqTNkGQaOnZuDDUI80ZtcIczNJp32nCb+psF3qw=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=BnLBHHU8DCd+IOfIhE4WKtB5aRQca0TomuvOo+m0ejRPRoeIOvq8UNEGC6k5ZTseI
	 GuOUHz9xA9Lxv8epsW21fb39Y02o4tekTg75hPL+mrW7m7coRc6gEWtXkbMkxlpYL+
	 1ZRv8B+cQe5K4IsRlRL+DkNjKSxmaC1itntH5qnQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfBUUoa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUoa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:30 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60D7C2083E;
        Thu, 21 Feb 2019 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781869;
        bh=i2RzqqTNkGQaOnZuDDUI80ZtcIczNJp32nCb+psF3qw=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=xlHWnjeGAk1bdJD+rleR2qcFJzqpi4J1Fl5PnsJsNkJzQ7UwjQNg4058WQ7Kf342P
         weblkZJsrqGS6QIwgvbeq6MrEiQbKbllW/6xEIfePlH1Tc0D6FAa5shUI3yXjYTbVR
         CUSSLbMvy7/pDvYijxHSAqTeziIf5ssf6LTxdZuE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Message-ID: <155078186868.77512.5025642569053444714@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com> <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Thu, 21 Feb 2019 12:44:28 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-01-22 01:31:46)
> From: Bai Ping <ping.bai@nxp.com>
>=20
> Add the clock binding doc for i.MX8MM.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---

Applied to clk-next

