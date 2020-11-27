Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A252FC3E8C5
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 20:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 426A921D91
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 20:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsQnKtmp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731500AbgK0UiL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Nov 2020 15:38:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:43632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732423AbgK0UhH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Nov 2020 15:37:07 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACB0C21D7F;
        Fri, 27 Nov 2020 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606509426;
        bh=ULgWkvmDlIUY55y1ofW2kwgDWhQZ95ZYXPdKqB+/lgo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fsQnKtmpZxuoBo05efGaHxVWuRGEk4Gxwf8ZlJSI3Ctk5BA94wQgBlxzqKOGI+q/5
         /YS65Z9XVbQOVeoehXnYFV6oMvwqkDvKr+WBW7HNPx99M759eldHMClyf3DDI0fAaC
         xmO4fSuf9g7sL5r6U1G+ge5tVngqXjWrtKjHFXt0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201127134256.79186-1-geert@linux-m68k.org>
References: <20201127134256.79186-1-geert@linux-m68k.org>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.11 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 27 Nov 2020 12:37:05 -0800
Message-ID: <160650942533.2717324.17625868257825974183@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-27 05:42:56)
>         Hi Mike, Stephen,
>=20
> The following changes since commit cf5577a1cfc104c71f011738ab753bf2ac2f91=
ed:
>=20
>   clk: renesas: r8a779a0: Fix R and OSC clocks (2020-11-10 09:25:46 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.11-tag2
>=20
> for you to fetch changes up to acaece1de58901a7f56cc0d4e5149897a903ad23:
>=20
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to j=
son-schema (2020-11-27 09:01:25 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
