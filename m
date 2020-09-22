Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDCEC2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7EC2238D7
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600803918;
	bh=smD2MG6rYBVA2ltBaZSXAPGB6fl0emwyxpPbDSkm+iE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=GfqwSMWbX5/hiTHq7XR4Zk/jNUdQX2Tyx/WYDabrGv9gp/zWgQe48lOvwU5uFKNGv
	 rMy4mltFC+EDMpQKhyyfYMkuOajzsfWnNqB8IHMPmdPm24jwsa+Ml73dbIhHNTAtAn
	 +sCAh6ldZOoOfhNOAb0uneqqMjtZ1UgzfZ/Mx4Qs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgIVTpS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:45:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:60492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVTpS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:45:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE7892388B;
        Tue, 22 Sep 2020 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600803917;
        bh=smD2MG6rYBVA2ltBaZSXAPGB6fl0emwyxpPbDSkm+iE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Hc0HocffpZ4wcZpsf6IDMWNHDZtUl9filj/ZFa3dbv1yUsnW1NYZdRSc2rhkNwXwR
         YYyiR7UytWe+PCdEc4s3HjMr+Ag8US0XPZYXkeSCbY7zXfii9yYSOS0V+BVKf0Vejn
         l0WoEjH+Ilwsh4jVkHOPbowYqSDXimdf2I1nO9v0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200916161740.14173-5-krzk@kernel.org>
References: <20200916161740.14173-1-krzk@kernel.org> <20200916161740.14173-5-krzk@kernel.org>
Subject: Re: [PATCH 5/6] clk: si5341: drop unused 'err' variable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Sekhar Nori <nsekhar@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Tue, 22 Sep 2020 12:45:16 -0700
Message-ID: <160080391652.310579.3763272722855831158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-09-16 09:17:39)
> 'err' is assigned but never read:
>=20
>   /drivers/clk/clk-si5341.c: In function =E2=80=98si5341_output_get_paren=
t=E2=80=99:
>   drivers/clk/clk-si5341.c:886:6: warning: variable =E2=80=98err=E2=80=99=
 set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next
