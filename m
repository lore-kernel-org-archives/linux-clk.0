Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ABCC4332F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Nov 2022 20:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiKAUKZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Nov 2022 16:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKAUKY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2022 16:10:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763A31BEAC;
        Tue,  1 Nov 2022 13:10:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2EAF5B81F76;
        Tue,  1 Nov 2022 20:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6180C433C1;
        Tue,  1 Nov 2022 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667333420;
        bh=3VqrBkVtuQxqDzc/aj1Jgl+flir8+zN6FTD2olM8T/s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=T1brwFuXzWmAaQFMZLc8FdCvqkid0cynIaZpBitP9ZcKrEouGfJy7XI6i63g6eQLa
         H0B85Cc5Cq/h7//RqkF61/QkALDBGP9xtdnxJJr+Kqf+zEMszdvulfccjcnxW+YhZK
         GPKywJYuIsn4TZBukirCzRTTyTqWyV9w9HB3JMANBxjpfyH6yi9qelxUJNYbnFpFGm
         1QZP11XCBeaw9mE6kEoSc7QeGZZRVd33naDfTRTI8eNU7n+qowINjOPajv1Xr+Vs7P
         0k0yYOZYiEe+eUl9j4/t6tH11Q+ztLLG1F5YRFPMHHLqTiiq1uvzOo5l70oQHbtzDi
         gtNc7tYo9CzEQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com> <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-doc@vger.kernel.org
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date:   Tue, 01 Nov 2022 13:10:18 -0700
User-Agent: alot/0.10
Message-Id: <20221101201020.B6180C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2022-10-28 09:33:59)
> On 10/28/22 12:13, Sean Anderson wrote:
> > On 10/27/22 19:03, Stephen Boyd wrote:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref =3D devm_clk_get(dev, ref_n=
ame);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(clk->ref)) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(clk->ref);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev_err_probe(dev, ret, "could not get %s\n", ref_name);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk->ref =3D __clk_get_hw(ref);
> >>
> >> Please don't use __clk_get_hw() for this. Instead use struct
> >> clk_parent_data and set a DT index in the index member to map to this
> >> clk.
> >=20
> > OK
>=20
> Oh, I remember why I did this. I need the reference clock for clk_hw_roun=
d_rate,
> which is AFAICT the only correct way to implement round_rate.
>=20

Is the reference clk the parent of the clk implementing
clk_ops::round_rate()?
