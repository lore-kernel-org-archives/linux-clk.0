Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A027FC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 794582075F
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590545630;
	bh=iFuTagTWg52kj6zbeQQp3N64aK9WbuOF+C+yXtxYXWY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=s+1Y8rKor17TtN1AwSJbow5BQNo5LyQq3Rap01CnS8/gruvdExQHSvY+PNj0uoWN9
	 UXxcIC6W3pxS7jL447AKk+J1/Hcp7NPJVxuMc+Sj53yKBfrRWYecAhZq1uoVpzPx0V
	 iZfOvRGeji1eJzjOivb9rvRj5aittVIs25ScAsIc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgE0CNr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 22:13:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbgE0CNq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 22:13:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D571C2075F;
        Wed, 27 May 2020 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590545625;
        bh=iFuTagTWg52kj6zbeQQp3N64aK9WbuOF+C+yXtxYXWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ovHsAo64os4LiqNDkYMfU8ARlwTB64w/G2o7OHYKDK5mMT2HDGrN6M47hap9k2+Mx
         6sprUNRedqnOH79YqNxDXD2RfQUkJk4ANOjQIB9VwNTWChOc6FDgqOssTLlnrwvYEl
         nYbzoVYL92T6xxUY1nWylJqjWunR14/L59c1Ewp4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200512181647.5071-5-dinguyen@kernel.org>
References: <20200512181647.5071-1-dinguyen@kernel.org> <20200512181647.5071-5-dinguyen@kernel.org>
Subject: Re: [RESEND PATCHv7 5/5] clk: socfpga: agilex: add clock driver for the Agilex platform
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Tue, 26 May 2020 19:13:45 -0700
Message-ID: <159054562508.88029.1179994723271858871@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-05-12 11:16:47)
> For the most part the Agilex clock structure is very similar to
> Stratix10, so we re-use most of the Stratix10 clock driver.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
