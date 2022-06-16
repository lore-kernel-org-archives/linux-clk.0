Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EBEC43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 02:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350511AbiFPCw6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 22:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiFPCw4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 22:52:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAD8647E
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 19:52:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1291B82205
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 02:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F7CC3411E;
        Thu, 16 Jun 2022 02:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655347972;
        bh=ZcfZSR/OWB5EpBDmMVDLjacTpdQ6DpYl8i9edWsPk5w=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Gq2ePgJrF/CVv9OFy5/EYiPlcbdZdm2kRNdmV8Bz/SwShkfZQ9JWBEGPr+P3PN5gH
         EQC/c6c/jKfYMBPuWDkduQDC3V5mQ2VRHijXlF9uKOzqN4IFyJTuqdaQZlC3/+NxwE
         pc0bupueHHxGfS8Q5nF1xqCBLI5x+eqUhucUI3YJtNqk9k+mnlz9tsy8TxLKcluu7e
         mGNYOF3sau6nKBqmtjVWYV8iPUH5jifQ0+j/Quv1E19R7eUnTGXoi3oEpPmbCFEnMd
         TEhF3oGExyyHfTrqlCWh4Pl/yjqklxhP0p5SFwVXZ8Cv1xhpuGv+Xk0vceDYtbR0Fd
         VFKPtOkf55Adw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3677796.MHq7AAxBmi@steina-w>
References: <3677796.MHq7AAxBmi@steina-w>
Subject: Re: clock consumer for output clocks?
From:   Stephen Boyd <sboyd@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 19:52:50 -0700
User-Agent: alot/0.10
Message-Id: <20220616025252.36F7CC3411E@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2022-06-01 07:15:54)
> Hi,
>=20
> I want to use an output clock, which provides some internal clock on an p=
utput=20
> pad, such as IMX8MP_CLK_CLKOUT1 or IMX6QDL_CLK_CKO.
> To prepare and enable a clock I need a consumer, but in my case there is =
no=20
> (local) consumer. Is there some way, DT node or some kind of driver/uapi,=
=20
> which I can use to enable the clock?

I think you want to use an "always-on-clocks" property in DT for your
device. See the proposal[1].

[1] https://lore.kernel.org/linux-clk/20220517235919.200375-1-marex@denx.de
