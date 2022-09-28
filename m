Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D74CC04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 23:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbiI1Xll (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiI1Xlk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 19:41:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F264D8E4C7;
        Wed, 28 Sep 2022 16:41:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B14BBB82236;
        Wed, 28 Sep 2022 23:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ACEC433D6;
        Wed, 28 Sep 2022 23:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664408497;
        bh=pj5nMrrdP/CRvouu8xZ7JSZ+bE3JyQ8euMvOq+SIUpw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=odpcpGuDxTWmIJsaqNucsIg/IQB1LyehnFP1iQ2FAME3oxULTMA5TuBOGc8YAG3Cw
         KzHtLbBWidzofr4rw7gLBGFtmqa4St5H3tvBvieQXpEBLZQgSOgWynm8rWHqJiKJ4I
         USmlaJlCw+mQgXp1c9z1xQGf4egMrAWC31Gi62bGlnyFlHHHHkFSyHV2nqq+iFu8MA
         /vTZNeBEITW9gNSI3kEEqz7Uzk8N77XDvelWG3CwThq3X5Vx8xvm7L7TxKrZ2bTBvr
         yPttoiG0SwE7x3GIrkewyzEU4aCbTHkbcdKt8QP/AHAxbM310ImmXnviFp3/573Upy
         wQwnUGqb8aM/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5a037955-4832-e42a-eb58-719ed4672395@renesas.com>
References: <20220923205251.1387-1-alexander.helms.jy@renesas.com> <20220923205251.1387-2-alexander.helms.jy@renesas.com> <20220926230438.GA3128861-robh@kernel.org> <cbe89899-7f56-c43a-f8c9-887825fbe4a6@amd.com> <CAMuHMdUuzrdf4rmD3n_-S9ujrfmY5Y6VOsNapiLRR5MG9bKAjw@mail.gmail.com> <5a037955-4832-e42a-eb58-719ed4672395@renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add bindings for Renesas ProXO
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, geert+renesas@glider.be
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@amd.com>
Date:   Wed, 28 Sep 2022 16:41:34 -0700
User-Agent: alot/0.10
Message-Id: <20220928234137.71ACEC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alex Helms (2022-09-28 16:16:04)
> On 9/27/2022 7:51 AM, Geert Uytterhoeven wrote:
> > Hi Michal,
> >=20
> > On Tue, Sep 27, 2022 at 4:10 PM Michal Simek <michal.simek@amd.com> wro=
te:
> >> On 9/27/22 01:04, Rob Herring wrote:
> >>> On Fri, Sep 23, 2022 at 01:52:50PM -0700, Alex Helms wrote:
> >>>> Add dt bindings for the Renesas ProXO oscillator.
> >>>>
> >>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> >=20
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/clock/renesas,proxo.yaml
> >=20
> >> Driver is also using clock-output-names which is not listed here.
> >=20
> > ... which is deprecated, and thus should not be used by the driver
> > at all.
>=20
> Can you point me to somewhere showing it is deprecated? It is in the
> current dt clock documentation.
>=20

I wouldn't say it is deprecated. Instead, it isn't useful if you're able
to use struct clk_parent_data and auto-generated clk names.
