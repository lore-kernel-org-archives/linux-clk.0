Return-Path: <SRS0=Qq+g=ZB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79A9C17440
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DF122084D
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573259979;
	bh=PkbmG8SyLOdrqjgY6Pqa++Dmk9EPJSwTtjnzeuigXVg=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=TaDfHCyfWUUIGG5g8fcy19EzgnH5JMZnlaZZAaunoRlnE9Ti7WJJnFEhDZ0jQ4rei
	 hG+haG63hyca8cZWT/LVkqzIHmth+LA4FcKBJ2BSYgYqmur29X7thC2QGHEr1+eZVr
	 UVJcavnW6q4ig2uD+LyOYo9RukxOJ+tjFgroce/I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbfKIAjj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 19:39:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:55698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAjj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9406021019;
        Sat,  9 Nov 2019 00:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259978;
        bh=PkbmG8SyLOdrqjgY6Pqa++Dmk9EPJSwTtjnzeuigXVg=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=b7ZRTTqNUV8Yq5Xx020oNTXoBk1mJQLz+Fuz3eKuV9MPKRX9xLoAKFJfp70F6H1II
         3g5q6RJGPlaAaN3Ds4JqQqNwCah9/QCuVy4PDXtmOp5GQWT4LuS8GMhBkF0SxoXNGd
         YdBFFOgTVuA2LVT5m4R5oFfUctMP3bV3/pgjMEhY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-5-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-5-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] clk: tegra: Reimplement SOR clock on Tegra124
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:37 -0800
Message-Id: <20191109003938.9406021019@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:18)
> From: Thierry Reding <treding@nvidia.com>
>=20
> In order to allow the display driver to deal uniformly with all SOR
> generations, implement the SOR clocks in a way that is compatible with
> Tegra186 and later.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

