Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D548C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B23220657
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547585923;
	bh=ThIj4eyq/yU5GJS933zysmB+HdEWUbh1OxTooknskDw=;
	h=Subject:In-Reply-To:References:Cc:To:From:Date:List-ID:From;
	b=xs9v5qD6X+5iC/sDPfzY0Ua4mngx2Fl3NOpXmWLnsSM9FPbLsGPq48hkkxUp6GkOA
	 H8FPRTt9ptpbPnEeBrZ7OkEEQWZS6VOP4qz0/wWmYdgSs0KdEWqqkVLVfOWEz6AbMY
	 vcdRMJvwXgeZiHT6rfRQiJmZtf+TSF+9y0Wd+RzU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732664AbfAOU6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 15:58:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730050AbfAOU6m (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Jan 2019 15:58:42 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1082920657;
        Tue, 15 Jan 2019 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547585922;
        bh=ThIj4eyq/yU5GJS933zysmB+HdEWUbh1OxTooknskDw=;
        h=Subject:In-Reply-To:References:Cc:To:From:Date:From;
        b=M0FUXLWgq49BjofHoUMuyNB+xq52Yr2T5jbXOi/qlNJPswvAJuF3M/Yv64M1fNvVt
         AH+tNTnYwFhQT09iW7869U0VhapmuQZ886xCiwQ2DOvfgTB7uyT7yqUy6UFaWHIV+2
         CEG3okG5nFe/P9wc0YA+RyIjKDXO9EJvBsm4LYkc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 1/2] clk: socfpga: stratix10: fix naming convention for the fixed-clocks
User-Agent: alot/0.8
In-Reply-To: <20190102145932.26423-1-dinguyen@kernel.org>
References: <20190102145932.26423-1-dinguyen@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Message-ID: <154758592125.169631.16325487078023899734@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 15 Jan 2019 12:58:41 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2019-01-02 06:59:31)
> The fixed clocks in the DTS file have a hyphen, but the clock driver has
> the fixed clocks using underbar. Thus the clock driver cannot detect the
> other fixed clocks correctly. Change the fixed clock names to a hyphen.
>=20
> Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
> Stratix10 platform")
> Cc: linux-stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-fixes

