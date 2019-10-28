Return-Path: <SRS0=ANa5=YV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BC4CA9EC0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 23:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C641C217D6
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 23:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572305929;
	bh=xBmvXJr+GIY5paJ2Zoq8AFBSZGqlYt1dcC4tldS/uxI=;
	h=In-Reply-To:References:From:Subject:To:Cc:Date:List-ID:From;
	b=BkcEmSdjkYwJzpfZYLSMxjiOCIUI6LfKAbqpithFOkoU5trME3bWQqaaCehYqJEzw
	 WGcbt7CcbpohbDJaWaTBhKeh+zkOJHAdjoZQZLP67J2t2yGGma0djMz3YPtlEUbP7H
	 AgDqcJFvxDZ16MrTHAtyqPAx4m0h0WvzcCobiUnQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfJ1Xit (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Oct 2019 19:38:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:43428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbfJ1Xit (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Oct 2019 19:38:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8214214E0;
        Mon, 28 Oct 2019 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572305928;
        bh=xBmvXJr+GIY5paJ2Zoq8AFBSZGqlYt1dcC4tldS/uxI=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=xwNccI+pAe6iGmxgbtPjJ4jPQY+okL5rN+zBjDAavgqBlBFw1sJThSfvC53I+zSPm
         Jmq5YcUoSX1chBtU61LDo+QGlqtshQinDmO/az6p9LQdXsVBsmH8RO5LWF5mJCpv5J
         Vjhs1ZKtCxjk9EEjMQQup3E1y76BnoDms8jCeJDc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191017105348.8061-1-ben.dooks@codethink.co.uk>
References: <20191017105348.8061-1-ben.dooks@codethink.co.uk>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: rockchip: make clk_half_divider_ops static
To:     Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk
Cc:     Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 16:38:48 -0700
Message-Id: <20191028233848.C8214214E0@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ben Dooks (Codethink) (2019-10-17 03:53:48)
> The clk_half_divider_ops is not used outside or declared
> outside of drivers/clk/rockchip/clk-half-divider.c so make
> it static to avoid the following warning:
>=20
> drivers/clk/rockchip/clk-half-divider.c:142:22: warning: symbol 'clk_half=
_divider_ops' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

