Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E394C43381
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD64964E15
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBKURx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 15:17:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:45198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231425AbhBKURq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 15:17:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 779C764E15;
        Thu, 11 Feb 2021 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074625;
        bh=dAWXwp8RiUduopVR7dDYBUi0O0oaInqBsehb95Khx7U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h0mRZzJ1gkRJZ6P5FUa83w78G+Ie9/MY7zkh3lHIzZNSmbdSDBjohrU/gsB6/ZVW6
         x5BAqP8l+kLLshuyhnIlPd3gAg5toWtKoCiNE+U20Sj4FY6ZcpcZ2o4JBbbpgUpp/c
         wW72dglYFV/C8Zj9J0v9aNJjxz7NVj6xb2y2RGojt8yKngD9J7LjrXmAySHEq3WXS8
         Pi2TSRsKa2IrOEFD6D9l75pY2lj8dDhydKDnGC1f3wXCGi5VcyiS0xXYFahvAJyHBA
         Edg3hYGiCikBvzNk1XFcl9LVqOMl4bj3mzUOY0v243kxxUlbkZbrTmi76s1fANv0yc
         wDj3J46xJl+wQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612496104-3437-3-git-send-email-saeed.nowshadi@xilinx.com>
References: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com> <1612496104-3437-3-git-send-email-saeed.nowshadi@xilinx.com>
Subject: Re: [PATCH 2/2] clk: si570: Skip NVM to RAM recall operation if an optional property is set
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org, git-dev@xilinx.com,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
To:     Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Thu, 11 Feb 2021 12:17:04 -0800
Message-ID: <161307462424.1254594.8298923328470990860@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Saeed Nowshadi (2021-02-04 19:35:04)
> Recalling NVM data into RAM during probe() initiates a re-calibration of
> the clock. If the clock is already in-use, the recall operation can cause
> a glitch on the frequency out. At power on, the factory data are loaded
> from NVM into RAM by default. If the clock frequency has been changed
> since power on, the recall operation can be used to re-initialize the clo=
ck
> to factory setting.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---

Applied to clk-next
