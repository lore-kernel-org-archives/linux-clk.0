Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42243C47254
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11FCF206FA
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588705990;
	bh=3JeIJR/lnOvle//EvNwkhKuKP0L/fm0m414IIHf0BGE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eTtz8nR5j4l0Hml7KP2FC2YeI0UvQ52ajbFqKGL4NXaXidlXPmfZIckR4U2d6HsTh
	 c721JLD2JX0/qV4yqSmf67rGeep/ody/tDSFfzboTd7zdBMhGUt/LJC7i9vYwsYFaI
	 KOCrUIyzJnAZeYMSfYqmiTy8KULM102uJITYJqNc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgEETNJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 15:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbgEETNJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 15:13:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25D1B206B9;
        Tue,  5 May 2020 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588705989;
        bh=3JeIJR/lnOvle//EvNwkhKuKP0L/fm0m414IIHf0BGE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RVesV0aCb9Rx6m9ZekByMrsSaWbWWQgfimU1peKwIU32HEwLBqKMdeVdhl+6SQIcK
         ECm7yEhWo+ahUpOof4bVtnJZyLTfcyMgplhqtwoobzFiN6H08O89xn/Whi9jQsaw1c
         ONbwa0owKgEpa+hGXNm9zZpcTVxM9QdkiVy0EB9w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdbrkZnD8JpaWgqY6R4gAbsrBh2Xwfe+Nm15SEUPOJnfEA@mail.gmail.com>
References: <20200416081348.326833-1-linus.walleij@linaro.org> <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com> <CACRpkdaurouZLFD2aqjDnUgvp=iMOjZ0Lu=xboxqEUx4-dvWWg@mail.gmail.com> <158865980315.24786.12205627766889336218@swboyd.mtv.corp.google.com> <CACRpkdbrkZnD8JpaWgqY6R4gAbsrBh2Xwfe+Nm15SEUPOJnfEA@mail.gmail.com>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 05 May 2020 12:13:08 -0700
Message-ID: <158870598840.26370.15595608833504297253@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-05-05 01:06:16)
> On Tue, May 5, 2020 at 8:23 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Linus Walleij (2020-04-28 05:51:10)
> > > On Wed, Apr 22, 2020 at 12:02 PM Stephen Boyd <sboyd@kernel.org> wrot=
e:
> > > > Quoting Linus Walleij (2020-04-16 01:13:48)
> > > > > The IM-PD1 still need to pass the clock output names.
> > > > >
> > > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > >
> > > > Is this a
> > > >
> > > > Fixes: 84655b762a27 ("clk: versatile: Add device tree probing for I=
M-PD1 clocks")
> > > >
> > > > change?
> > >
> > > Yep. Can you fold it in when applying?
> >
> > This is being deleted so does it matter anymore?
>=20
> This patch is for the device tree path. What is getting deleted
> is the board file path, if I'm not mistaken.
>=20

Ah ok! Thanks for clarifying.
