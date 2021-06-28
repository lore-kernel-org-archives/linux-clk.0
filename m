Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69F0C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDAC161A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhF1BNY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:13:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:35420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231881AbhF1BNY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:13:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67E8061469;
        Mon, 28 Jun 2021 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624842659;
        bh=+wS5YIe6dgHqIG4uNVNcfdZ7vb3vGFYJt+H7YQeWAC4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kAKa2cDX2dBCZU/bnjqk7ouxToktEx1wI4kZacvgM3ILZ+rdWfU5PrLjMPrRdiy9o
         Gd9t6FSjt34frhgY9U21a7qbrMMHcxcEkyeVbAEDiCRIXUFVZc7Hzt5rSoQdn+yuqd
         UUPGaGq9fuBuzyjBS+CXd2RIp8x2sdbqURa57TnQRtlhgNk2jKk9FzJHf4Y3BhSbSW
         LxPVUru0XwZ1ryhFILdMfOfvrtP0U3Ur8oA5ue6J2r99aUsfWgRLhOa2Kwq9bexuxT
         +VfytCDdbk0nNagsG3HnEH83Y2i3bUIz1RXEzVxtcQxPegJDQBSGXIOe+SkEgSx+KL
         v0IgApEK0Wv6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210423004057.283926-3-liambeguin@gmail.com>
References: <20210423004057.283926-1-liambeguin@gmail.com> <20210423004057.283926-3-liambeguin@gmail.com>
Subject: Re: [PATCH v5 2/3] clk: lmk04832: add support for digital delay
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     julia.lawall@inria.fr, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
To:     liambeguin@gmail.com, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 18:10:58 -0700
Message-ID: <162484265822.3259633.1205812088952427742@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liam Beguin (2021-04-22 17:40:56)
> From: Liam Beguin <lvb@xiphos.com>
>=20
> The digital delay allows outputs to be delayed from 8 to 1023 VCO
> cycles. The delay step can be as small as half the period of the clock
> distribution path. For example, a 3.2-GHz VCO frequency results in
> 156.25-ps steps.  The digital delay value takes effect on the clock
> output phase after a SYNC event.
>=20
> This is required to support JESD204B subclass 1.
>=20
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---

Applied to clk-next
