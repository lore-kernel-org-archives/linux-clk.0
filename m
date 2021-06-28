Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CD3C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACDA361A0F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhF1BNa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:13:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231882AbhF1BNa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:13:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76FED61469;
        Mon, 28 Jun 2021 01:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624842665;
        bh=4U8IAKyf+nfJFUagq67MN8/R+vxrNYFsxhRbesRmJe0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PNhXXyu6uxAOqvbEQydZ1kX2kjjK+ceZftAF06hIUdlRRUc0K8xaPdJegNgwlh7q5
         adhvVBsapcmQOIY2vjv0IwNWw5OmvBiLkkZA0WmW9bbJ0ja3EyLadHQO2kUY9hei8d
         5VN+nVtjA/t6YurX20bclVNtgQ0LMR1zokB9OtJ4wQiXKMr2fP8SiTR5H6qCoaXLLJ
         3lCkS0iDzmgq+dKgR130gWElxuBAVXat4d6G3xzvSw5AfXwf4Th4WE+f/X03ltDGeU
         m5jLS+FQk7r+FZjonSc28VjQwDG44l3ho8Hs+0pvDJ5LeKGksqxlDpT0jgyKoYNuCn
         qLUcLCdiqBNUg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210423004057.283926-4-liambeguin@gmail.com>
References: <20210423004057.283926-1-liambeguin@gmail.com> <20210423004057.283926-4-liambeguin@gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: clock: add ti,lmk04832 bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     julia.lawall@inria.fr, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
To:     liambeguin@gmail.com, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 18:11:04 -0700
Message-ID: <162484266430.3259633.17852417675846434232@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liam Beguin (2021-04-22 17:40:57)
> From: Liam Beguin <lvb@xiphos.com>
>=20
> Document devicetree bindings for Texas Instruments' LMK04832.
> The LMK04208 is a high performance clock conditioner with superior clock
> jitter cleaning, generation, and distribution with JEDEC JESD204B
> support.
>=20
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---

Applied to clk-next
