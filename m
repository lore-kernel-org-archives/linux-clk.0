Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C15C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 23:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiJQXKX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 19:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbiJQXJq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 19:09:46 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A1F844F5;
        Mon, 17 Oct 2022 16:09:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7978BCE19DE;
        Mon, 17 Oct 2022 23:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4011C433D6;
        Mon, 17 Oct 2022 23:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666048112;
        bh=+D+D+jnOIR0LMv5DO0PvLa7VhwNn5lPQsrG3MqLP6qY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ryX3biLvT5MTRTAQjTBq1qlNrb4mbX0jomPG3QjXTnL6qsip72lpZGxYDWrGAJ/Kk
         Zgw9gVYGfXfcxSr16s7rf5aGPts8Ur/OCpi62dITeKDp6ow3qMxnJcF17Y9X8eXajO
         xO7UWgPyBfwZGch7phvIgY44W5foLHUnAksp5u67As2YOP/td3/GSLs42GO91LC8Xb
         bFdkgIlhNB4fz6K+T+1YzlvtGDhwUEDOjx4KS7LDH1jB9VsE0gms9tDeqrVf3SrVhf
         U9Uq6g/u4OGECxD4TAV/yZRgAuTRfD3JTNFT2CPVLw2HAgxzE+l7e3Jg85k3ra0oiq
         zg8dEas3TqRzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220913031956.984475-1-yangyingliang@huawei.com>
References: <20220913031956.984475-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] clk: keystone: syscon-clk: Use dev_err_probe() helper
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ssantosh@kernel.org, mturquette@baylibre.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 17 Oct 2022 16:08:29 -0700
User-Agent: alot/0.10
Message-Id: <20221017230832.E4011C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2022-09-12 20:19:56)
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-next
