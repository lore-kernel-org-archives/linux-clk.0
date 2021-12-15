Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB41C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 12:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbhLOMQE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 07:16:04 -0500
Received: from mail-4322.protonmail.ch ([185.70.43.22]:47885 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhLOMQE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 07:16:04 -0500
Date:   Wed, 15 Dec 2021 12:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639570562;
        bh=C2Esh76nKJPiqYXPTDJuFHL8WTuB99uBX0WaROHo7AY=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=sAZxmMQ1Wqw5kp+rEShZ05LyAVDheN/fSbl9tMq9zvd0HWROfTslOSdusekCypE4y
         F27RGrvzK4SKZVQVuxI3GkW65WKC/9ybOlZsXtQFyGQJqzqK0nIrL0RynjHmimvhRY
         mDCCye0rfBpsDx3hFx9tCyvT1N7BRDX0iJ3SFx//EJlNX4LR1OKABS7CXbCbYibPi6
         FJaGzL76jXHb1Wg/3I8iw1Jsu0Do15+/yvkyuMLbgkTBgHxCnBNibbQsGa7/Gps4Mn
         Eg/GC480CWuBwqZH0uy9HociajjVbSVqWpzVMuXzfNTlC1reDlfLU2QVrqsyZPPBTF
         IyzEkaFL9AYLA==
To:     Sven Peter <sven@svenpeter.dev>
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Message-ID: <97B86688-DE6C-4AC2-BFBE-0BB2488C9ED5@protonmail.com>
In-Reply-To: <0be8517e-a488-4203-9941-b43eac3d8f24@www.fastmail.com>
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-2-povik@protonmail.com> <Ybi61fzpOV7CumtR@robh.at.kernel.org> <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com> <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com> <F62225F0-C9C6-4E39-9163-B125A7253733@protonmail.com> <0be8517e-a488-4203-9941-b43eac3d8f24@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> On 15. 12. 2021, at 9:43, Sven Peter <sven@svenpeter.dev> wrote:
>

> Are there any dependencies between these individual channels?
> Is there some common initialization required for all of them?
>
> From a quick glance and my uninformed opinion it looks like these are
> separate to me. They only all need this LSFR table which could still be
> shared.

That=E2=80=99s right.

>
> Sven

Martin


