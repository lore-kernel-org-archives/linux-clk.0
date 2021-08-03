Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E3C4338F
	for <linux-clk@archiver.kernel.org>; Tue,  3 Aug 2021 20:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F32260F70
	for <linux-clk@archiver.kernel.org>; Tue,  3 Aug 2021 20:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbhHCUQY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Aug 2021 16:16:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231599AbhHCUQY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 3 Aug 2021 16:16:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EF5F60EB2;
        Tue,  3 Aug 2021 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628021773;
        bh=4Hc5H3tFBMyJGEzXpbHHIkA4xHumd/DYIMeOo+hLB1U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tQDbPjAMf95JdIq3bORY3WK8waUp+Vpu3ootxDnbV4GkJK0hclTk+dI9egY7DuiAr
         1ouL/gaUX5Ni8jJwPr9vVSxCwM3/2KnN/iLRFwHjMS7NdvJAXNJi99zhAjGYeunFNp
         qzBFkpP4oSLhWkQf3pA7KKCsvryQidRt8X9/AA54fbWxRULaYOyuiYvVBF7CTRPd57
         BEpyfqnHQ8GA/r2yMBaoDwBaptHtZqEnFgNXRGnlh9dAxTrhbuJjoJeELBqEAI95XD
         dGrz3Wzwd+aEdDt6szXGPoI8EbelH0aFAlO+O+ErS3tCIR5e24f4zkyF6Fv8kTdqdL
         IAngTID7axTjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFBinCDGHdqEDv4DA4QU9T2pmMS3GMSo_tJDzya=Uhcr8Fr5Uw@mail.gmail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com> <CAFBinCDGHdqEDv4DA4QU9T2pmMS3GMSo_tJDzya=Uhcr8Fr5Uw@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] clk: switch dividers to .determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 03 Aug 2021 13:16:11 -0700
Message-ID: <162802177168.3896750.7152723802271449673@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-08-03 12:32:41)
> Hi Stephen,
>=20
>=20
> On Sat, Jul 3, 2021 at 12:51 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> [...]
> > Martin Blumenstingl (6):
> >   clk: divider: Implement and wire up .determine_rate by default
> >   clk: imx: clk-divider-gate: Switch to clk_divider.determine_rate
> Abel has already picked this patch (thanks!)
>=20
> Can you please take the rest of the series (that is: patch 1 and patches =
3-6)?
> I can also re-send them if you prefer that.
>=20

No need to resend. I can pick them up.
