Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2847DC04EB9
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E327D208E7
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544039217;
	bh=rLPOjKJt0lQsquYP3pTgcV37mb5TGAxFFzLN2PockwA=;
	h=To:From:In-Reply-To:Cc:References:Subject:Date:List-ID:From;
	b=qXarXNQ+EEGxC8bqE6MsQz5UEny5cJYyxJbzF4iRIvNcfD4le8+Yhaf0VOpQaVOHt
	 hxIXcw5oyinHK6/IC9z/zeDwbQQgLUNa+qSMF/SuwgsAnquF7hySzEJZzwe/Ni80H2
	 8Lj8t/C+hFeXFe4rA0ttMkuFEnSc1JY6I46AblEw=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E327D208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbeLETqz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 14:46:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:55860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbeLETqz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Dec 2018 14:46:55 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B8AA208E7;
        Wed,  5 Dec 2018 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544039214;
        bh=rLPOjKJt0lQsquYP3pTgcV37mb5TGAxFFzLN2PockwA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=S8afkJ1RKQ5RS4qGWAF1NEXrv1wvp0DHYd9/ETPkukCxME3cjfXtXSDSxEUwrz7ci
         Irwicrvt00cUCJi6wtHDnDMn3J75rDIHYnhqvM8c9itr0cT6OmK4PeNsUMNC33MZwo
         0GTEq4FNaPZrFSbWXYNdGFDQvRSLHJlpoOmxLhKc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        k.konieczny@partner.samsung.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
 <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
 <20181129155134.19141-4-k.konieczny@partner.samsung.com>
 <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
 <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
Message-ID: <154403921340.88331.4342352109711551229@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
Date:   Wed, 05 Dec 2018 11:46:53 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2018-12-03 02:44:17)
> Hi,
> =

> On 11/30/18 00:42, Stephen Boyd wrote:
> > Quoting Kamil Konieczny (2018-11-29 07:51:32)
> >> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS =
IPs.
> >>
> >> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> >> ---
> > =

> > Fix the subject of this patch please. It's not arm64: or dts:
> > =

> >>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.=
txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> index 50d5897c9849..4e4352bf5a0b 100644
> >> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are=
 listed below.
> >>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> >>         };
> >>  =

> >> +       cmu_imem: clock-controller@11060000 {
> >> +               compatible =3D "samsung,exynos5433-cmu-imem";
> >> +               reg =3D <0x11060000 0x1000>;
> >> +               #clock-cells =3D <1>;
> >> +
> >> +               clock-names =3D "oscclk",
> > =

> > How about just osc? clk seems redundant.
> =

> Can we keep this "oscclk" name? This patch just adds missing definition
> of one of multiple CMUs in the SoC and for the all other CMUs "oscclk"
> name has been adopted for the OSCCLK root oscillator clock. The name is =

> exactly as on the diagrams in the datasheet, just in lower case.
> To avoid confusion I would prefer to stay with same name as used for the
> other CMUs.

Ok.

> =

> >> +                       "aclk_imem_sssx_266",
> >> +                       "aclk_imem_266",
> >> +                       "aclk_imem_200";
> > =

> > And what is 'aclk'? Also redundant?
> =

> Again the names used here are exactly as in the SoC datasheet. I know we =

> could use shorted names for these consumer clocks however at this point =

> I would prefer to use same convention as for the other CMUs.
> =

> ACLK means AXI bus clock, the IMEM CMU is basically just gates that pass
> the clocks further to the SoC peripheral blocks.

Sure! Was just hoping to avoid 'clk' everywhere.

