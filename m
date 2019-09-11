Return-Path: <SRS0=WWrt=XG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E10C49ED6
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 16:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E65262168B
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568218010;
	bh=0JKyzgRWDAVfhj+Rbx+NnAMPX+l8CSgMDc04vXyE5bQ=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=DMejdE0N2zzSug0T6c3MjvSkpo7X+dG3uSSb+JiJNGMJuhIFDNarv76T2xwAl19LR
	 N3Zm+C9HduazLGxTTrOQptPKkCTKSC1kdraDRRwa9LlSuW4y6ooiNDhv72/y7KmXa5
	 P1ovcuH4kP5eDlBrFCXnrM8gKKIU2oWzPp8g76hU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfIKQGt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Sep 2019 12:06:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728921AbfIKQGt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Sep 2019 12:06:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F88D2075C;
        Wed, 11 Sep 2019 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568218008;
        bh=0JKyzgRWDAVfhj+Rbx+NnAMPX+l8CSgMDc04vXyE5bQ=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=sXKGdCyh4WhyF7veHQuc6U2T2rCx3t5K1Qqy6gewGeUjK0ywl2v7bsN7VXpXOO1EP
         41pg/jq1NtfXy0pZV4kDqBLMcny74NX33xccjvArhN8zuoLaF6fm1gyKxvTzciCM8U
         eahHK7f35XmBY0SS/eWDlnS+6YNVbiWw0YsHeyyw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190823100315.2148-1-ada@thorsis.com>
References: <20190823100315.2148-1-ada@thorsis.com>
Cc:     <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, <devicetree@vger.kernel.org>
To:     Alexander Dahl <ada@thorsis.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
User-Agent: alot/0.8.1
Date:   Wed, 11 Sep 2019 09:06:47 -0700
Message-Id: <20190911160648.6F88D2075C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Dahl (2019-08-23 03:03:15)
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

You need to Cc Rob and devicetree list on binding changes.

>=20
> Notes:
>     v2:
>         Add additional explaining text to following paragraph and strip m=
ail
>         headers from commit message.
>=20
>  .../devicetree/bindings/clock/clock-bindings.txt     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b=
/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index b646bbcf7f92..1d4942380918 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed b=
y any non-zero entry.
>          compatible =3D "fsl,imx-uart";
>          reg =3D <0xa000 0x1000>;
>          ...
> -        clocks =3D <&osc 0>, <&pll 1>;
> -        clock-names =3D "baud", "register";
> +        clocks =3D ...
> +        clock-names =3D ...

I don't see the need for this change.

> =20
>          assigned-clocks =3D <&clkcon 0>, <&pll 2>;
> -        assigned-clock-parents =3D <&pll 2>;
> +        assigned-clock-parents =3D <&pll 1>;
>          assigned-clock-rates =3D <0>, <460800>;
>      };
> =20
> -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0>=
 and
> -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> +In this example the <&pll 1> clock is set as parent of clock <&clkcon 0>=
 and
> +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
> +setting for <&pll 2> is omitted (end of list) and rate setting for <&clk=
con 0>
> +is skipped because set to <0>.

Maybe you can comment that the "clocks" and "clock-names" properties
don't matter for assigned clk rates and parents.

