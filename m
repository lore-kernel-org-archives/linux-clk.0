Return-Path: <SRS0=XVLz=WM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64E1C3A59C
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B9922171F
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565976049;
	bh=EiqT5I9OiC8W1JJEBjQ9TcBrd+8f4TKXsiAqfeG2nGQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=w5VyLL2leJQKXaRJ/IeyTpWayltZnLfdmCgXX/xELwgR96/sAl8T9jeegCfAqb6zy
	 mHa12LNyygcPzpTJDDEsOGICIn5cTrF2VEHcbHANXLwMqwV3EYN8IQ3Zptu7rjH2tM
	 wI6O9KEBdVqwQFcJjtxlZxzmuajBhrzp/SJhZF18=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfHPRUt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Aug 2019 13:20:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfHPRUt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Aug 2019 13:20:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6302B2171F;
        Fri, 16 Aug 2019 17:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976048;
        bh=EiqT5I9OiC8W1JJEBjQ9TcBrd+8f4TKXsiAqfeG2nGQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BIKw0WWM0dLt/gyTyCs7+P85X+j6cd2Fy6iWK9oYzAB01uuMFu0R0sGhDArFKGrwn
         sO+Q0Mha0pptInEo2Ts57vAxGJpD3XkKjAXzJmEZtGE3RyUtRyHzKmfWz+DPe0igcW
         ChHPMgyhKSo1vBVqT8vhiYGulkICsR/+BoeDdoe4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190815160020.183334-5-sboyd@kernel.org>
References: <20190815160020.183334-1-sboyd@kernel.org> <20190815160020.183334-5-sboyd@kernel.org>
Subject: Re: [PATCH 4/4] clk: qcom: Remove error prints from DFS registration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:20:47 -0700
Message-Id: <20190816172048.6302B2171F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-08-15 09:00:20)
> These aren't useful and they reference the init structure name. Let's
> just drop them.
>=20
> Cc: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

