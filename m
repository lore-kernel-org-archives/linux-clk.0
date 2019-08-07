Return-Path: <SRS0=sie6=WD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1B7C433FF
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF96C214C6
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565217266;
	bh=TBjlUxEWLj9ugZeqxjBTcifOmxVwVhBj6unFuLiqAGM=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=qUBtLAu6s7I8JnSAGFON3gVwDDHESj5fq2VyvyOyZGUxNGa/6FdhFmgWAlqmgjzYu
	 3nk48xUfQmP8GV6G2HOLAyN0AEtrdsW7glc60XGzXmuWKi2CebpunwIV9+fuFH3MQE
	 BQoOLfPnMaHN3T7PrvIDckjhpM94U15sLv+5yuvo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbfHGWe0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Aug 2019 18:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727213AbfHGWe0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Aug 2019 18:34:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65327214C6;
        Wed,  7 Aug 2019 22:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565217265;
        bh=TBjlUxEWLj9ugZeqxjBTcifOmxVwVhBj6unFuLiqAGM=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=mx4KkwKSIJmzrARbz2lpU+M2p4xqmMGOyChzDo5XS2sONDPLMra/ocmjItmHyddEC
         AS5YCtPapLW67Aq2dwVJJ3aJ9ztdxISCGLa+KCMd7uLt7/LpvVlFYtfMahrveIY63d
         QcurEfzNtBW+hFyfkl1gMgIvp4bEavCEz2O0QEb0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190804163151.6511-1-nishkadg.linux@gmail.com>
References: <20190804163151.6511-1-nishkadg.linux@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-clk@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH] clk: st: clk-flexgen: Add of_node_put() in st_of_flexgen_setup()
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 15:34:24 -0700
Message-Id: <20190807223425.65327214C6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nishka Dasgupta (2019-08-04 09:31:51)
> In function st_of_flexgen_setup, variable pnode takes the return value
> of of_get_parent, which gets a node but does not put it. If pnode is not
> put before the function returns, it may cause a memory leak. Hence put
> pnode after its last occurrence.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Applied to clk-next

