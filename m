Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A02C43612
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 23:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46D9720859
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 23:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547078168;
	bh=BtZKa8ke/W+kc1urj0r2VWXhtZFrHzTiN6ylajabc0Y=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=f5z0EOONT42eC+hRYQcb7FgVhxgM2367XgD/vG0UsVpKWr0v6E/ACbNzsKy6jVJsf
	 xrvmPZiRnBe9bY9u9jXGVDn4K2RXftcJzRRZwfOpRA/AKhUD0E7j5gTO3ayHcDF27T
	 RuHmMV3OhNNBNZmIK22Uvvw/OjHx4IVp+3rbmZlQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfAIX4H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 18:56:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:46152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726887AbfAIX4H (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 18:56:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AEE920675;
        Wed,  9 Jan 2019 23:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547078166;
        bh=BtZKa8ke/W+kc1urj0r2VWXhtZFrHzTiN6ylajabc0Y=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=TdG8S+ofsSX2xZQFjPfVLgRP27fJB0CQyZCM0NE5woscCBlEsSoQTuZzCbXIV1kn4
         pKHCL24iDqT1qVNSK5J3CigGTvbuEdQC+f3xauo6TqcbIJMinEv/2otyzaUc/rZBLN
         IzTM9maBA6onBbHIxixSd+qWHrWh5zGy/x67FL5g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] clk: meson: meson8b: fix naming of the APB clocks
Cc:     jbrunet@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <CAFBinCAginPSuBObJE52puvbay-S698OjAj6aLEm5kfn0SdU0A@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181223235836.12466-1-martin.blumenstingl@googlemail.com> <20181223235836.12466-2-martin.blumenstingl@googlemail.com> <154705938114.15366.1098954164811397084@swboyd.mtv.corp.google.com> <CAFBinCAginPSuBObJE52puvbay-S698OjAj6aLEm5kfn0SdU0A@mail.gmail.com>
Message-ID: <154707816530.15366.6699688522231286811@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 15:56:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2019-01-09 14:30:24)
> Hi Stephen, Hi Neil,
>=20
> On Wed, Jan 9, 2019 at 7:43 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Martin Blumenstingl (2018-12-23 15:58:36)
> > > Fix a typo in the APB clock names by renaming them from "abp" to "apb=
".
> > > No functional changes.
> > >
> > > Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU p=
ost dividers")
> > > Fixes: a7d19b05ce817d ("clk: meson: meson8b: add the CPU clock post d=
ivider clocks")
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.co=
m>
> > > ---
> >
> > Can I apply this directly to fixes? Or it's not critical so we can punt
> > until next merge window?
> actually it's not critical:
> I'm not aware of any IP block that I needs the APB clock as input (I'm
> pretty sure there is some, but I'm not aware of it so it can wait).
>=20
> Neil already applied another patch for -next which conflicts with this.
> we can choose now:
> 1. Stephen takes this patch, Neil drops the (conflicting) GPU clock
> patches from -next and I re-send the GPU clock patches
> 2. Stephen and Neil don't do anything, I re-send this patch on top of
> the GPU clock patches
>=20
> I'm fine either way, but #2 is less work for you guys.
> if I don't hear back from you then I'll go with option #2

If it's not critical then I'll let it go via the normal paths through
Neil's tree.

