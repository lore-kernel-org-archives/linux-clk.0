Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FDDC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA68B60F3A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhH2Gqg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 02:46:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2Gqg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 02:46:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FEE6606A5;
        Sun, 29 Aug 2021 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630219544;
        bh=tMXK9ExZ4o4CkrH4w+njOFf3u81+aOOhDqfxXf66dFA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Gd2XEGAU+Ls5Dh/SslLZGy8E0oCDIzB/ZviPRXHlIzoPRYkRvGMaZWpTkeSQTSDlm
         GWwHEner9zrD+MgTM1O8LLdwmGcmp9vx/xXd1l7QZnjWFSK7b13zxGOJ2xCEXLxFMl
         lV4yz0/PMo2nImDhEFojSVNiQ5uJbBV8R1yWl/J5iz5lYr0scjVVjy/ZCgYRUlzEzj
         0+UWLk4CuzZwTn3VYgU4oEj+v2nfEq/5FDyg0ub9WSJt94LIDXlCONngQ9w7iVh9bz
         pDJVLrX1gSwVi5CQhaLwTZ+DfPMpeniaAU8SJGHu4tORrXzQ3vus2EcjtdUmJxriia
         hT++f0y3MXT+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210819052918.6753-1-zajec5@gmail.com>
References: <20210819052918.6753-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: brcm,iproc-clocks: fix armpll properties
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, <rafal@milecki.pl>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 23:45:43 -0700
Message-ID: <163021954302.2676726.4343974228427375599@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>=20
> armpll clocks (available on Cygnus and Northstar Plus) are simple clocks
> with no cells. Adjust binding props #clock-cells and clock-output-names
> to handle them.
>=20

Applied to clk-next
