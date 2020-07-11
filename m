Return-Path: <SRS0=QFiD=AW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37B3C433E1
	for <linux-clk@archiver.kernel.org>; Sat, 11 Jul 2020 16:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E6E5207DD
	for <linux-clk@archiver.kernel.org>; Sat, 11 Jul 2020 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594484693;
	bh=4HCzef5BV6/HU9r6IluFe/pcOzRvUVtC2RJv4yS7uAA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=BBWxF6NIlC6BysEXXFKeUcs/bmFMAibWtbkFfjkYOPEwkzT4leq9QddlekTrrxthN
	 ov2a2Bu6LjRkKDUNMHAMipSvCTqo4mRWl0pqnebiCbqi/QcqPQevDdonFbPQqhGJoY
	 5uZlB43v6DI688FGMwz91cQjMJeIc5ZdI/zYqBDc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgGKQYx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Jul 2020 12:24:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728441AbgGKQYx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 11 Jul 2020 12:24:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7FA1207D4;
        Sat, 11 Jul 2020 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594484692;
        bh=4HCzef5BV6/HU9r6IluFe/pcOzRvUVtC2RJv4yS7uAA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ilJW3iEDwSw5sxl7XQfwcGerFV02J/lGG/5Lw4uSNfmIhVU2r6NIFVUtuNuidf0lq
         OgOXT3oue7eVwST1HXMngdon2eWTKgzUxiWFsvai5LGexrWXNPASn8eXjucHlaQ8Z4
         9W+0miuy16PNpGAJE3vtfIDWnuiAYqZMkXovJs7s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200614115140.41262-1-andriy.shevchenko@linux.intel.com>
References: <20200614115140.41262-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] clk: Drop duplicate selection in Kconfig
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 11 Jul 2020 09:24:52 -0700
Message-ID: <159448469202.1987609.17192927198595987825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2020-06-14 04:51:40)
> There is no need to select RATIONAL in individual drivers,
> since common clock symbol does it already.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Ok... Applied to clk-next
