Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB0FC43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 23:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4915A2183F
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 23:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547250070;
	bh=Z0K4XBtv4BRswLESTndbWr7QxrhX72329bpN9TqBmjo=;
	h=Subject:In-Reply-To:References:Cc:To:From:Date:List-ID:From;
	b=eAVUweJUu6BeFaWh6V43LPn+JEzxJD4S3q/TQDGJHacLbLz544cT6LZHwyRNf8bFm
	 QjX1bnhuaz8Dzxyhwh2eFmUB5kuT6o3bmaQbQmzA73OgRgUJw4A6yWH7QXWcvULvMI
	 v6ZptP2keMV+vMEn/lqm0/qSW67GmxuBTphGNtcY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbfAKXlJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 18:41:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:59264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfAKXlJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 18:41:09 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0748F20878;
        Fri, 11 Jan 2019 23:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547250069;
        bh=Z0K4XBtv4BRswLESTndbWr7QxrhX72329bpN9TqBmjo=;
        h=Subject:In-Reply-To:References:Cc:To:From:Date:From;
        b=NYZW1wwOqp/A71b4IBlJLNSSt90kz4Phb0D8zXgc9ckUmduyaydAuqbwqc2iKhKRw
         8bWNMEmFy6Iiw0jLtSaUmANamEGoceEocSGeYRtSec1Ulrcobb8OK+AqVkd6ZM5Ls4
         eVME7zSwGZt/AHUkRaqx99sUvUBwrLWAusB6zoAE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: socfpga: stratix10: fix rate calculation for pll clocks
User-Agent: alot/0.8
In-Reply-To: <20181218000614.30520-1-dinguyen@kernel.org>
References: <20181218000614.30520-1-dinguyen@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Message-ID: <154725006827.169631.11387684968829410246@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Fri, 11 Jan 2019 15:41:08 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2018-12-17 16:06:14)
> The main PLL calculation has a mistake. We should be using the
> multiplying the VCO frequency, not the parent clock frequency.
>=20
> Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
> Stratix10 platform")
> Cc: linux-stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-fixes

