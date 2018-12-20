Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80750C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 23:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47FF221906
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545348627;
	bh=TV9KfSBBx5po5VaXi/QvrPGaFVsd9wET3Cg8BoMrnQc=;
	h=Subject:Cc:To:From:In-Reply-To:References:Date:List-ID:From;
	b=uvgQRNi5AQfn9203uosAcM4sAVjW11O5fvkdhbrH5aIIbRKTecozcZfE75gqPLs+C
	 VIHvfLoiaEoUEPSGA2TZfqDnV6kHa3aQ0Tt5/GVA+Ltcj58M4RJz7POIYfoJY4TeRO
	 4SxWl3E5VqIDQDGZmGsfgU48lAYcPxiJjN+w7TDs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731142AbeLTXa0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 18:30:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:59212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732095AbeLTXa0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Dec 2018 18:30:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5BC321905;
        Thu, 20 Dec 2018 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545348625;
        bh=TV9KfSBBx5po5VaXi/QvrPGaFVsd9wET3Cg8BoMrnQc=;
        h=Subject:Cc:To:From:In-Reply-To:References:Date:From;
        b=Rw/DC/EyOIwTb9lvcaJPFPJc3Feqp2IgTQo2jSiCesUEY35xe8wlRZn6h1s3iADIG
         hrt32psyu3xmXIpaDvSuS7UPhI8+pwwP+Ybm6nRAURqEopq85jqeAK4KvtNJs2D/t8
         jZn8vBq44adCtYShApwX+CxPBGrPgCHa8ozCOkAQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: clps711x: Remove board support
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
To:     Arnd Bergmann <arnd@arndb.de>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAK8P3a17F-M3e=8-CwmeYip1eLyhok9yCLBC6AoGy1voC24P2A@mail.gmail.com>
User-Agent: alot/0.8
References: <20181220085433.20334-1-shc_work@mail.ru> <154533496261.79149.8151013115299125376@swboyd.mtv.corp.google.com> <CAK8P3a17F-M3e=8-CwmeYip1eLyhok9yCLBC6AoGy1voC24P2A@mail.gmail.com>
Message-ID: <154534862492.13075.8151129168540881499@swboyd.mtv.corp.google.com>
Date:   Thu, 20 Dec 2018 15:30:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2018-12-20 14:44:03)
> On Thu, Dec 20, 2018 at 8:42 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Alexander Shiyan (2018-12-20 00:54:33)
> > > Since board support for the CLPS711X platform was removed,
> > > remove the board support from the clk-clps711x driver.
> >
> > Can you reference the commit where the platform was removed in the
> > commit text here? It helps me know if there are dependencies.
>=20
> This was a while back, in commit 4a56f46a7dc6 ("ARM: clps711x:
> Remove boards support"), which made it into linux-4.8.
>=20

Thanks!

