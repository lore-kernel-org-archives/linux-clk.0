Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB9EC4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 00:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECA91611B0
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 00:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239081AbhHFAdF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 20:33:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229587AbhHFAdF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 20:33:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D8A261185;
        Fri,  6 Aug 2021 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628209970;
        bh=cdWLE1z1MeCEEoTdGIO3FffLsKNa0p+8V7JmvQsNR1U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iZ0Y674BqjwxYZB6t2UWFMsajVQaPrAyvKHG7cRISWDo2lS7tf4zAUX5hfKpAGZOk
         0sF/UXwdDcS/73bMWUbGFzlde0KQq9pC/p4oZk3iIa6z0DPu8zgWjuBpn60MV1i5aP
         nW1VeQkhK12whYq0n2Yl9K+HnwJOiTdTUIsMuI6MGrVpMP0QzLdoNNOkdm+0S3iO/9
         5KvE0UCRV6DtUhT2LvIR3zluFa4Tuhiym5N0trXuKgTbqa8dihs75/zoFlnld67eYW
         tfXVdP+iJri3OHwlqM3WICoSYdfyBLb/Lh5Qs7upi2Laxl6o5nwUDT1s0xMPQgm7ZG
         Ay0d3V7d/mJTg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5468cd9e50cda8fc59cb6baab9413c6c0de1a974.1626257689.git.geert+renesas@glider.be>
References: <5468cd9e50cda8fc59cb6baab9413c6c0de1a974.1626257689.git.geert+renesas@glider.be>
Subject: Re: [PATCH resend] clk: Align provider-specific CLK_* bit definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 05 Aug 2021 17:32:48 -0700
Message-ID: <162820996886.19113.10627033259757713800@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-07-14 03:17:36)
> The definition of CLK_MULTIPLIER_ROUND_CLOSEST is not aligned to the two
> bit definitions next to it.  A deeper inspection reveals that the
> alignment of CLK_MULTIPLIER_ROUND_CLOSEST does match the most common
> alignment.
>=20
> Align the bit definitions for the various provider types throughout the
> file at 40 columns, to increase uniformity.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
