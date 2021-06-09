Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC147C4743D
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 00:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 977EE6124B
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 00:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhFIAze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jun 2021 20:55:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231765AbhFIAze (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 8 Jun 2021 20:55:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB10E61003;
        Wed,  9 Jun 2021 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623200020;
        bh=0qG3nv6bwsfFWlI7/qmTerqOmGprUoJ5MwQ8gz9q18Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LNDjJVMpH5+Jk2Y0Brv6SoP29O8xHNvYpJEeYFY03/a1QdF+Gy3mUm22KlH8xOBK0
         conCzdVVpf0WBsKfDVaQ38KOVKT03mWjq2e9oXNyVF12ufkfHbuV/XBlsOaVqZJhcz
         aZqTx5J9JooXukAIPbBIJK7jhKdj5EJYUbxW74WHhDkJ4FUsFXUJGVm7rK/RSNzgQT
         7mfc/6ERuazpMzbUYZrMwGrz0+e2yMd8WGa7TPNmDBbWv5sZt5g7OCtjXnqpCGBV1Q
         mTiAYfcPEsrzCER+aGGNYBkArRguNN1GR7e+/7jnkcv9YXZ4xSAAvIKHfnRzxnw5uW
         YyU1gwN4SdJ9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210527211647.1520720-1-luca@lucaceresoli.net>
References: <20210527211647.1520720-1-luca@lucaceresoli.net>
Subject: Re: [PATCH RESEND] clk: vc5: fix output disabling when enabling a FOD
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Adam Ford <aford173@gmail.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:53:39 -0700
Message-ID: <162320001952.1835121.12525475382527041110@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Luca Ceresoli (2021-05-27 14:16:47)
> On 5P49V6965, when an output is enabled we enable the corresponding
> FOD. When this happens for the first time, and specifically when writing
> register VC5_OUT_DIV_CONTROL in vc5_clk_out_prepare(), all other outputs
> are stopped for a short time and then restarted.
>=20
> According to Renesas support this is intended: "The reason for that is VC=
6E
> has synced up all output function".
>=20
> This behaviour can be disabled at least on VersaClock 6E devices, of which
> only the 5P49V6965 is currently implemented by this driver. This requires
> writing bit 7 (bypass_sync{1..4}) in register 0x20..0x50.  Those registers
> are named "Unused Factory Reserved Register", and the bits are documented
> as "Skip VDDO<N> verification", which does not clearly explain the relati=
on
> to FOD sync. However according to Renesas support as well as my testing
> setting this bit does prevent disabling of all clock outputs when enabling
> a FOD.
>=20
> See "VersaClock =C2=AE 6E Family Register Descriptions and Programming Gu=
ide"
> (August 30, 2018), Table 116 "Power Up VDD check", page 58:
> https://www.renesas.com/us/en/document/mau/versaclock-6e-family-register-=
descriptions-and-programming-guide
>=20
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Adam Ford <aford173@gmail.com>
>=20
> ---

Applied to clk-next
