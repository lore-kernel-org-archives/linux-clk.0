Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3761C48BD6
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:22:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 857FC2085A
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561497737;
	bh=MYKr4ILtOi6qNQAnYQJDVyF0uLX5agNROqYO/aQVkig=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=TLf3K9yvsBDrtEE/FKh4U5+bxfRej76dYfTTX/Hf2k0DG3TqdXHLF0mlu8+RMt32F
	 GkfUa/oABdsZr4N69Gx8q3IKAWkBmnxIP/bqFPr6PvoOs0drwi1yyX3DXz4Dxzfrw1
	 fdrmJb1Ha9qNnfZzAqsBwheCie9Th6F4+rlTNFes=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfFYVWR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 17:22:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:59114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfFYVWR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 17:22:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E065205ED;
        Tue, 25 Jun 2019 21:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561497736;
        bh=MYKr4ILtOi6qNQAnYQJDVyF0uLX5agNROqYO/aQVkig=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=N/bWVRlIYTCliQQUQ91JwQP6b1k9grk56P6gyczW07Z+BxGVCwP7DdNFG/IkRxE3o
         ipbh3VzWjd1ikNAiNYFee4vhuxn5wvu86DJ9jJOzVzYiXrmLG/or3iwXUmuBNKXTnH
         8MaBRTUidUW6dACJ5lBojo+cSYjpWdJdfUdM6wBU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190619093926.21719-1-s.nawrocki@samsung.com>
References: <CGME20190619093950epcas2p3d6f7c26564844432f8153ee9b6a6007c@epcas2p3.samsung.com> <20190619093926.21719-1-s.nawrocki@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: Add clk_bulk_get_optional() function
Cc:     mturquette@baylibre.com, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, krzk@kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:22:15 -0700
Message-Id: <20190625212216.4E065205ED@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-06-19 02:39:25)
> clk_bulk_get_optional() allows to get a group of clocks where one
> or more is optional.  For a not available clock, e.g. not specifed
> in the clock consumer node in DT, its respective struct clk pointer
> will be NULL.  This allows for operating on a group of returned
> clocks (struct clk_bulk_data array) with existing clk_bulk* APIs.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-next

