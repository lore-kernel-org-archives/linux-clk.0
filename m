Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2271C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 03:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237648AbiBSDFn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 22:05:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241262AbiBSDFl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 22:05:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1844B206DDE;
        Fri, 18 Feb 2022 19:05:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A93B2B82545;
        Sat, 19 Feb 2022 03:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6B0C340E9;
        Sat, 19 Feb 2022 03:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645239921;
        bh=qcG42ckwvTujI+qvncPuMVGp5lOEJBPmEsEliCc63As=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Qg5YmeZvqwfGVHULJRENtysMRRqXqbs2M8AUOBxpMtNV6J1H0V11NEUyoJjhl8qDT
         2lZZPZqsoKY1k44WvtdovkvvfT09PikT4+DuAI3JQiuX4asIVAneN+RiKX3JTRtHlS
         lIjHs/aLM56DQAZqyUASIkBEgdfZztj68bpg7SABcFBsviHPGcgDqYUU1ZxVC7cfei
         PcG5Qpz0TeaonbNnmg9vg4m3na9urQsAYRfVfJZ81NfNePrSaQNccqpDKG/G3K3tkS
         8tBmMoaXlN4nDH8GT/hmt0vKSccTXVBLzMDSutI4+PHf1MoUXXfE97cUX30gAU5kRJ
         /+EolOQAbRqcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <182f1f73-70eb-5811-b3ad-35b6428ed59a@denx.de>
References: <20220213173310.152230-1-marex@denx.de> <20220213173310.152230-2-marex@denx.de> <20220217234539.819AEC340E8@smtp.kernel.org> <006919c7-74c9-390a-964e-6b76611988e5@denx.de> <20220218221504.54F8DC340E9@smtp.kernel.org> <182f1f73-70eb-5811-b3ad-35b6428ed59a@denx.de>
Subject: Re: [PATCH 2/2] clk: rs9: Add Renesas 9-series PCIe clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 18 Feb 2022 19:05:19 -0800
User-Agent: alot/0.10
Message-Id: <20220219030521.0A6B0C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-18 17:11:04)
> On 2/18/22 23:15, Stephen Boyd wrote:
> >>
> >>>> +       if (!parent_clk)
> >>>> +               return dev_err_probe(&client->dev, -EINVAL,
> >>>> +                                    "Missing XTal input clock\n");
> >>>> +
> >>>> +       rs9->regmap =3D devm_regmap_init_i2c(client, &rs9_regmap_con=
fig);
> >>>> +       if (IS_ERR(rs9->regmap))
> >>>> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regm=
ap),
> >>>> +                                    "Failed to allocate register ma=
p\n");
> >>>> +
> >>>> +       /* Register clock */
> >>>> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> >>>> +               name[3]++;
> >>>> +               hw =3D clk_hw_register_fixed_factor(&client->dev, na=
me,
> >>>> +                                                 parent_clk, 0, 4, =
1);
> >=20
> > To do that it looks like maybe we'll need to export
> > __clk_hw_register_fixed_factor() and introduces some sort of
> > clk_hw_register_fixed_factor_parent_data() API.
>=20
> Setting parent_clk to NULL should be enough.
>=20

Perfect, but also weird. I worry that's a bug that snuck in. Probably a
good idea to not rely on that.
