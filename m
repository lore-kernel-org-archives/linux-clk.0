Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43908C43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 02:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 096FD20851
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 02:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vWrEX/8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096FD20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbeK1NFs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 08:05:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbeK1NFs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Nov 2018 08:05:48 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCE072081B;
        Wed, 28 Nov 2018 02:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543370755;
        bh=FbDeK5SFCKnifPh4work3Uj9CMHwniLjuAI2ZZPMUK0=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=vWrEX/8WcEC7falJQXoAJuSt8FNE4YpmfZOwaJLtwYVr43gdB90vW9LECk1R5pXqe
         Pb4lqaxoZ4RNGc00En8v7xYJAwfi1Iabjl4Tlgg1pcXs54qijo78QDRmGjwIdU5VNT
         XxR2wYc+xGC4Z5HQFVOA6cNdKC5Tcb1URbAdiRbk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Message-ID: <154337075410.88331.3258607435538015529@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] clk: meson: updates for v4.21
Date:   Tue, 27 Nov 2018 18:05:54 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2018-11-23 07:23:33)
> Dear clock maintainers,
> =

> Below is a request to pull updates for Amlogic clocks.
> =

> It covers essentially Meson GX Video clocks, Meson8b CPU clocks
> and 2 bindings changes.
> =

> Thanks,
> Neil
> =

> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d=
2a:
> =

>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> =

> are available in the Git repository at:
> =

>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-1
> =

> for you to fetch changes up to a7d19b05ce817d60ae672c4c112e77892978dc3c:
> =

>   clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 =
15:11:58 +0100)
> =

> ----------------------------------------------------------------
> Update for meson clocks targeted at v4.21
> - Add GX video clocks
> - Switch to HHI syscon for meson8b

This never seemed to be resolved on the mailing list. I'm still waiting
to see what happens with the syscon and binding. I guess I need to look
at these PRs a little closer to make sure nothing else it outstanding on
the list.

> - Fix meson8b cpu clock
> - Add support for meson8b CPU scaling
> - Add Meson8b CPU post-dividers clocks

These other ones look OK.

