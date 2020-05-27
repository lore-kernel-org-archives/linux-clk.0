Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83FBC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A820B208B6
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590546341;
	bh=UoTVgoKDles63nN4sclEP7UwYYpFYa+JCCtVXHygpEA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ultRl2DtCPUe8C1yCmvl9/V0Lt2qCe6Vp60BDH0czgwvAgRNMjb/a57AqzD3kmTc7
	 OTbKUYjJlW2TdzqJBU6Jo3qkALkWWso2iAS8gwjq0+nEG15Q+9gfLqyrUFX7nfgBVp
	 po45PyW1qG7lqjILfIbLRil1/w83Lf1LS1oX41N8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgE0CZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 22:25:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbgE0CZi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 22:25:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E13CF206F1;
        Wed, 27 May 2020 02:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546338;
        bh=UoTVgoKDles63nN4sclEP7UwYYpFYa+JCCtVXHygpEA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tCpKqzm1yRwoBOisZybfeOeNRw+BDSCDpDBpnRRUbvohhWBLDA3IvHf+7vYxJ8ojV
         WOtZaLfipIyY0qMpEbQB9r+TORX73c9a5QHxkDNH4rdOOsEkzI1XgidoicxdDagrMJ
         F+HlD8z2ktYeAqMCQCce6GaQr4ua4HcLBrFwtjd4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V5 0/8] Add APSS clock controller support for IPQ6018
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:25:37 -0700
Message-ID: <159054633712.88029.2188316950952149370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-24 03:04:38)
> The CPU on Qualcomm's IPQ6018 devices are primarily fed by APSS PLL and X=
O,
> these are connected to a clock mux and enable block.
>=20
> This patch series adds support for these clocks and inturn enables clocks
> required for CPU freq.

What is your intended merge path? You sent this to qcom SoC maintainers,
mailbox maintainers, and clk maintainers. Who is supposed to apply the
series? Should it be split up and taken through various trees? Are there
dependencies? Please add more details to help us.
