Return-Path: <SRS0=pQOJ=5T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2BFC43331
	for <linux-clk@archiver.kernel.org>; Fri,  3 Apr 2020 01:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 181E02082F
	for <linux-clk@archiver.kernel.org>; Fri,  3 Apr 2020 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585876090;
	bh=UDkQfWYeDpy8gRC+sgnoV8ebSNJatc9JRs4jGUJHRxQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=a0JcKM0SKGlaV8GsNjAIDWy6l1rVPcqPW3laCEtb3/RNSK+RTeAEw1BnMBUuFUk5i
	 smSq8yxQ9jxMqouf3BnhejPt0oQFeyMeMLYJaHiGo8F+HZa4JB1ktMnXGyOMKp6xK3
	 nDjRjL+6j/t84XsA7knwLPz975NBLt9dowIuNIc8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389939AbgDCBIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Apr 2020 21:08:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:47800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731783AbgDCBIJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 Apr 2020 21:08:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3CD020675;
        Fri,  3 Apr 2020 01:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585876088;
        bh=UDkQfWYeDpy8gRC+sgnoV8ebSNJatc9JRs4jGUJHRxQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FXFjUE9ZimtleKsD/qcXUDLjWbYiOA5l7vS6yMELDMIpxDrnRTf8qFWWyW3p+K+kc
         LlHP92OAqYXvLjFobKCk9dYYEj4Z/DnLKXBGKJ5CjBLXio6sbLUC5l5JIDgvetV2QW
         wCy3f46PPQ91iPc9TOjY6+iyeOqPZNmvZIHoStno=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200330021640.14133-1-zhang.lyra@gmail.com>
References: <20200330021640.14133-1-zhang.lyra@gmail.com>
Subject: Re: [PATCH] clk: sprd: fix to get a correct ibias of pll
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 02 Apr 2020 18:08:07 -0700
Message-ID: <158587608797.125146.13372364275748896742@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chunyan Zhang (2020-03-29 19:16:40)
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>=20
> The current driver is getting a wrong ibias index of pll clocks from
> number 1. This patch fix that issue, then getting ibias index from 0.
>=20
> Fixes: 3e37b005580b ("clk: sprd: add adjustable pll support")
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---

Applied to clk-next
