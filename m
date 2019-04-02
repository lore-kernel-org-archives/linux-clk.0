Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F1FC10F0B
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 20:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 987F62084C
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554237125;
	bh=qSfAGRL8HC7tvGvlO0NgoiQufS2iepqp86Yb9DRd6fA=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=2CwTKISOeNArkPLmiNGpqMKcICmDKlfMUa90SpED9zoW7+3/Pk3dF6ZqEKfsms8bT
	 pt2TBVFATl8+0/lC9Ar9ufDhURR7zQVqPSEcPLzgTfc5C0U9KR30Nf66X10Q0Nupx0
	 aLawichWP3RJ3Phhr8env0ehyIAYhZS65KAXME6Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfDBUcF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 16:32:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfDBUcE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Apr 2019 16:32:04 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23BCB2075E;
        Tue,  2 Apr 2019 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554237124;
        bh=qSfAGRL8HC7tvGvlO0NgoiQufS2iepqp86Yb9DRd6fA=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=PeOu2vIab04tRW7C7DJM6LhTdkMKplZ6lgyPpTVo9w2jxu6Kvsnwcpb47MsC4E10Z
         lPvHPAMkZz2ruqb8lRrV0sqQFMk2mBktu0XZtzDV5bJovdibud9gNPCRJDNtZLERuW
         crzqFyFAIhtud+2CkmryCxAwIyPVD273wAfT5kyw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190330123317.16821-6-drvlabo@gmail.com>
References: <20190330123317.16821-1-drvlabo@gmail.com> <20190330123317.16821-6-drvlabo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC 5/5] mips: ralink: mt7620: add nodes for clock provider
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        NOGUCHI Hiroshi <drvlabo@gmail.com>
To:     John Crispin <john@phrozen.org>,
        NOGUCHI Hiroshi <drvlabo@gmail.com>
Message-ID: <155423712332.20095.11826731258979770295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 02 Apr 2019 13:32:03 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting NOGUCHI Hiroshi (2019-03-30 05:33:17)
> @@ -17,6 +27,18 @@
>                 compatible =3D "mti,cpu-interrupt-controller";
>         };
> =20
> +       pll: pll {
> +               compatible =3D "mediatek,mt7620-pll", "syscon";

This binding looks wrong. It's making a node per clk in DT when we
should be making nodes only for the clk controller. The use of syscon is
also a sign that things are heading in the wrong direction.

> +               #clock-cells =3D <1>;
> +               clock-output-names =3D "cpu", "sys", "periph", "pcmi2s", =
"xtal";
> +       };
> +
> +       clkctrl: clkctrl {
> +               compatible =3D "mediatek,mt7620-clock", "ralink,rt2880-cl=
ock";
> +               #clock-cells =3D <1>;
> +               ralink,sysctl =3D <&sysc>;
> +       };
