Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CCCC0650F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 19:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 485E12173E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565293588;
	bh=4me4XpvB7qqVvu84vAAL5nGYKbA83wV2yUhPtXDdy2M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=sUm8rsbREHWSd4+NhsHSfov8HAxlhMJleD9NgDz8YAuRC3rvnKoghMskOuKEeWjxt
	 fkhKrM4r6Lw6fK+eFFxweH6tboxUSwo92//JVGib8+meEtvDuCulLLKYcPpUDcHliu
	 Eewa21jP2GJvG9K8+xpgDlHvokVmKyCpRpO34lwg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfHHTq2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 15:46:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:55982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727649AbfHHTq1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 15:46:27 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEEA02084D;
        Thu,  8 Aug 2019 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565293586;
        bh=4me4XpvB7qqVvu84vAAL5nGYKbA83wV2yUhPtXDdy2M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DWhUDArUOh7Ld3rKR0NbaJJjppzYKgaC0SxZtenmNSc/wyyXMAwseOsG5WlEsxpVo
         7toVidYd+5F0b7ctbVsSw9aU2jav2vCfR2qDFNhcTgE53aRYRmuUDqJEERobeD9pWN
         hHeCXa5I/TuIOWKJNpi6VDgS1ukfTCwfpfujnevU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB7023C8A78321E34492290E56EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com> <20190808150028.0BC1F217D7@mail.kernel.org> <VI1PR04MB7023C8A78321E34492290E56EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
Subject: Re: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 12:46:25 -0700
Message-Id: <20190808194626.BEEA02084D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-08-08 09:46:48)
> On 8/8/2019 6:00 PM, Stephen Boyd wrote:
> > Quoting Leonard Crestez (2019-07-02 06:27:09)
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>=20
> >>   static void clk_dump_one(struct seq_file *s, struct clk_core *c, int=
 level)
> >>   {
> >> +       clk_core_get_boundaries(c, &min_rate, &max_rate);
> >> +       if (min_rate !=3D 0)
> >> +               seq_printf(s, "\"min_rate\": %lu,", min_rate);
> >> +       if (max_rate !=3D ULONG_MAX)
> >> +               seq_printf(s, "\"max_rate\": %lu,", max_rate);
> >=20
> > What are the if conditions about? We always output the values in the
> > individual files, but for some reason we don't want to do that in the
> > json output?
>=20
> These if conditions are an easy way to avoid spamming "min_rate": 0,=20
> "max_rate": 18446744073709551615 in json. If you object to the=20
> inconsistency a nice solution would to be show "null" in both debugfs=20
> and json.

Aren't those the min and max values though? I don't see it as spam, it's
just more data that is the "default". Given that json is for machine
parsing maybe the parser of this can ignore them if it wants to when the
values match 0 and ULONG_MAX?

