Return-Path: <SRS0=7yfQ=5G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323DCC4332B
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E44E120753
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584749575;
	bh=DnhPbWzQwKroX7nBdWFxqbUk1n4HZdjpIAK0tlR+kEE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ay0IdwECKp21Z5wyQleOcEa2Zt7kQ/Fo+Qh4D8AKwa9WKDee03w0jw9oroYAaa9/R
	 94DZsLwZm/HE95mAKEzM8WtR4QUHPcyZeHK3QrXSjUW1FWF5+T+/bDpUUzkYroPHzx
	 7mihDCiBbejeHrKGvfMTGumKQm6WWJWK2G9ucok8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgCUAMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Mar 2020 20:12:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCUAMy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 20:12:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB4C720753;
        Sat, 21 Mar 2020 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584749574;
        bh=DnhPbWzQwKroX7nBdWFxqbUk1n4HZdjpIAK0tlR+kEE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zqlaoCwA7nXfDw2SkB5hDp8OKPJrAZhKd24EIaj+OQSkQlsRTFf5bUg5iiy8ZQK/z
         iRlUu3zDT0SXHzg3b30OW/dCW6uoczGfroRGm0TjnpMHy9LieEaPmntBfSHNtul0pe
         bNJ1bErDB5xTkplAI8S+Sl9T1ITaLDsVcIJX2WYE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310135507.87959-1-andriy.shevchenko@linux.intel.com>
References: <20200310135507.87959-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] clk: Fix trivia typo in comment exlusive => exclusive
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 20 Mar 2020 17:12:53 -0700
Message-ID: <158474957303.125146.849596024736449322@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2020-03-10 06:55:07)
> Fix trivia typo in comment exlusive =3D> exclusive.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
