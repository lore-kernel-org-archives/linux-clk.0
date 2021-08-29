Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E419C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E762E60F3A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbhH2Gnn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 02:43:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2Gnn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 02:43:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9FFE606A5;
        Sun, 29 Aug 2021 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630219371;
        bh=qlNrjeT0M0MaxWzPGJxGNvLe/JIVkB3B1zQVGGrMS3c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mcv/tAafpjnieSdwMX14UGFGQA1O0OMOFlXGytigs/hQbyiljUraZnoU6iT4D9cgz
         ADWHASvAfjBmlEF3I2YxRllWfbAmI2IVLR/eFDrY9ZwWfJKXHarZywhK67pNIzPS6U
         VfEu6jOwGJq6e5fo32Di2G8e5zVxYEuj/BZUIing9et1LxSM6MnhYFikHK7ecH23rY
         cXXAyndEGzamHx7+77b1TjcVJvD0ex7SiG2zjIsE7REwV8VszU/OLIwcWf1H5WqqbL
         Cn8uTp9VZ1PN10Ad/KAHPknjmDWabBcJOG0a2+oDV5hpgWkLKkxl+8yv9/dOomw6lp
         nLCzL1kriu8Mg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615864045-182813-1-git-send-email-dj0227@163.com>
References: <1615864045-182813-1-git-send-email-dj0227@163.com>
Subject: Re: [PATCH] clk: at91: clk-programmable: remove redundant value check of best_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     huyue2@yulong.com, linux-clk@vger.kernel.org,
        dongjian <dongjian@yulong.com>
To:     Jian Dong <dj0227@163.com>, mturquette@baylibre.com,
        nicolas.ferre@microchip.com
Date:   Sat, 28 Aug 2021 23:42:50 -0700
Message-ID: <163021937061.2676726.8259422841085617957@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jian Dong (2021-03-15 20:07:25)
> From: dongjian <dongjian@yulong.com>
>=20
> for best_rate's initial value is -EINVAL, if get tmp_rate belongs to
> [0, req-rate] at first time, then best_rate will be updated to a positive
> value, the value check will never run;
> if never get the tmp_rate belongs to [0, req-rate], then first cycle will
> end when parent get NULL, the best_rate value check also will never run.
> So, the value check is redundant.
>=20
> Signed-off-by: dongjian <dongjian@yulong.com>
> ---

Please resend. It's been months and nobody has reviewed.
