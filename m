Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D198C282E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 22:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BF2C21855
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 22:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555711995;
	bh=b0VcxDBWAx+xR25SLjawq+jYEubuCa7+f3ThG1fWlVs=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=SukaNiGQ29dOcjWRc1hJ22h1W8Abm234/pl/1g1OdLhZszjHeaIXiEK6k5kUXpdC1
	 EhdosTYhifNciNdXb277pVkdYT+CryecESF3/c0/kkiobnkhFPqTkqaUzBtbl2xsKK
	 0McUdeF6RfK+Me2gy7KCU9HddxoKXCPXdSGN0i7o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbfDSWNO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 18:13:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfDSWNO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 18:13:14 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFA7A217FA;
        Fri, 19 Apr 2019 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555711993;
        bh=b0VcxDBWAx+xR25SLjawq+jYEubuCa7+f3ThG1fWlVs=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=M/9Bn10clTIwBecPa0FRuEH9x2xjFXlhZXYGbdyAo1SrA2Ae+PQSfX4OovFOKKCZ5
         R8NFN/nQ79HNyrBJ4I7pGHFKG4YfEDZHfHxCG1c9G+F6LXpLW/koDVpnOpKgqqY9VC
         hPVmsQ+1r8C1wA5K2/XtYm/G0g+kU7JDoX21lA0g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190412183150.102131-10-sboyd@kernel.org>
References: <20190412183150.102131-1-sboyd@kernel.org> <20190412183150.102131-10-sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 9/9] clk: fixed-factor: Let clk framework find parent
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Message-ID: <155571199315.15276.12067998514283098623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 15:13:13 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-04-12 11:31:50)
> Convert this driver to a more modern way of specifying parents now that
> we have a way to specify clk parents by DT index. This lets us nicely
> avoid a problem where a parent clk name isn't know because the parent
> clk hasn't been registered yet.
>=20
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

