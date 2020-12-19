Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3634FC4361B
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDCC623602
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgLSXwM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 18:52:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:36412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgLSXwM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 18:52:12 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608421891;
        bh=Gb+pCOB4Qq9ZRou+eL/UI5E0hLkTz6YWG3w8SzJxfGs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h94AHvwkom6NQM5jOzZ+8OcKMwrxnKNY37DmFp0xHG0FUTkberKdB2JGplFXZSXgU
         b4WpodQ2vhIkWmTyOyiY6N9mZLse+FX+8q8fCyQDOyXI4BsYN33io2Az35/bYVlOfs
         aRrANEhemmqO0ksrDwg3JOPEryZAMDMEP4GqdM6n9ftY9Q/ZGUcIfiO+IxUuEJBjgZ
         /pwx209XkWav5HFU/93fD65Idj6xEWg5rFRMeVS4EwI6Qqpa1oDXnQQgIqXg/o5f3Q
         LL0+FB34MUw5WWoWawwNW9/ZL6dIC4puZUbJzy1CO/aStjHP5a5inedrBc63xQXKYJ
         eYg/hUudZvNvw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201106100039.11385-1-pali@kernel.org>
References: <20201106100039.11385-1-pali@kernel.org>
Subject: Re: [PATCH] clk: mvebu: a3700: fix the XTAL MODE pin to MPP1_9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Terry Zhou <bjzhou@marvell.com>,
        Konstantin Porotchkin <kostap@marvell.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Marek Behun <marek.behun@nic.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Pali =?utf-8?q?Roh=C3=A1r?= <pali@kernel.org>
Date:   Sat, 19 Dec 2020 15:51:30 -0800
Message-ID: <160842189035.1580929.16863503861561557281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pali Roh=C3=A1r (2020-11-06 02:00:39)
> From: Terry Zhou <bjzhou@marvell.com>
>=20
> There is an error in the current code that the XTAL MODE
> pin was set to NB MPP1_31 which should be NB MPP1_9.
> The latch register of NB MPP1_9 has different offset of 0x8.
>=20
> Signed-off-by: Terry Zhou <bjzhou@marvell.com>
> [pali: Fix pin name in commit message]
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> Fixes: 7ea8250406a6 ("clk: mvebu: Add the xtal clock for Armada 3700 SoC")
> Cc: stable@vger.kernel.org
>=20
> ---

Applied to clk-next
