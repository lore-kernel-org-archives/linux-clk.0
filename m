Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302D3C433E2
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00B8A212CC
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600130555;
	bh=Qi+wZBAQJfjFjzNK36VfjuDr2/YFCbpYm+oub6MDfM4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=WtQVCdfuW7Eh2ym6JAUQStETNUYcGwQ2lDRR4pm0qznVZjZE5sFaJjkw9Urq9JYa8
	 yNpKPnbgMYuJxmvq1ZE6IKVGtrifZ8FW9BpIYEjGuiw3uS7J9agc7IrO8tZp7SFogd
	 OkFVGbCAn6IIxGDKmA5/+qu27tQAsbnK/kZxX9qk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgIOAmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 20:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726106AbgIOAmN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 20:42:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EDEC21741;
        Tue, 15 Sep 2020 00:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600130533;
        bh=Qi+wZBAQJfjFjzNK36VfjuDr2/YFCbpYm+oub6MDfM4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mmmTSex8slsEgWeV3Wa9fiGtWNAWoMzbbOtA939NOCGpVgIBslx7Q2T7HrXDATMQp
         qhD7Yugzw+BULgoWPhMbWkeAhVLU5Z6u1rA5CWUjlk5RBqZ6QCYV3o9jeOgqgyF7YV
         QAgNsQFP2MkLD+YRDJvDBOi+xtAsebWBSUlhdDd8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200914022225.23613-5-zhangqing@rock-chips.com>
References: <20200914022225.23613-1-zhangqing@rock-chips.com> <20200914022225.23613-5-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 4/6] clk: rockchip: Export some clock common APIs for module drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Date:   Mon, 14 Sep 2020 17:42:12 -0700
Message-ID: <160013053207.4188128.5102937681760998236@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2020-09-13 19:22:23)
> This is used by the Rockchip clk driver, export it to allow that
> driver to be compiled as a module.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
