Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB87C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 01:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FA4D61166
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 01:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhJOBDI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 21:03:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhJOBDH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Oct 2021 21:03:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AAC461151;
        Fri, 15 Oct 2021 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259662;
        bh=dj1JUdEU6uxGgYp09f5xXCUvhNxXI0mR7smMiHLej5g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gKUNPNVAszbjuXB47ibOc/uUEmvSxg1ccneQ5Re0yec4jsSJqBvLq1eUpr3bglP3U
         qXXKmpeCjNIo/KqBZL8MGVmmu78q/VHDB/Cxno121+xLiNF4QubdU8V54xQzA7/zUb
         0y+PvTlCnffB6QUa/sBzrTz8mlVNTKXHW4hCti3o7ErLxEAL8XOso7MuVitnEv8FPi
         mu7xioZ7zpIDHX9nUqXNiRhOdC5f1bK8nKKr66TNj3tNiqzEyu7jUKtWhiIvXdWlXK
         2v92YgxypTSW6/QEdPeiUaF9onEJwBAyVr1mON7EPlNHEypDjhHQ/Qq5CNOClh0lTs
         RCu7LbmdURS0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210901180953.5bd2a994@endymion>
References: <20210901180833.4558932d@endymion> <20210901180953.5bd2a994@endymion>
Subject: Re: [PATCH 2/2] clk: versatile: hide clock drivers from non-ARM users
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Peter Collingbourne <pcc@google.com>,
        Lee Jones <lee.jones@linaro.org>
To:     Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org
Date:   Thu, 14 Oct 2021 18:01:00 -0700
Message-ID: <163425966085.1688384.4832607813511109923@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jean Delvare (2021-09-01 09:09:53)
> Commit 419b3ab6987f ("clk: versatile: remove dependency on ARCH_*")
> made the whole menu of ARM reference clock drivers visible on all
> architectures. I can't see how this is an improvement for non-ARM
> users. Unless build-testing, there is no point on presenting
> ARM-only clock drivers on other architectures.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Peter Collingbourne <pcc@google.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
