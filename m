Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D5FC0650F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 20:16:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0871F217F4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565295415;
	bh=6fiKfQIBjb92mRUjWyYGrTAtz5ZWMi+qeOSRaUacQKw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=MjhEEpiE+UMtoBG1QDNWhqkdj//XzgKnktestdVLd85HI5s7GOCNVv39lH6yHYben
	 hLWxomLEjwbcYmocUoI2N72RPOQ9qRorRxRyiG+QQxPIcVtH15ecR8/P+z7JmLjb/q
	 OozrQTHDmSVimiDPRrofXxbR7tFz1vIV15WSPTQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404467AbfHHUQy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 16:16:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404145AbfHHUQy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 16:16:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3F0D216C8;
        Thu,  8 Aug 2019 20:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565295413;
        bh=6fiKfQIBjb92mRUjWyYGrTAtz5ZWMi+qeOSRaUacQKw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eMsmOekrwMX+OYQCM1cW1mEu5Y3tQyZwrGKNgrgSxp3srGRRBCj5QOF1cBnJDFrrV
         47UPpBFiRcmqo77T4NK3Kg+Wmh+A6MjS62OEJ/BXp6TVNQpny5iN6UdXcwnDbat6LN
         dbFQd++ho96q+LCT+Gg76NB6cpjPBXRcQYeN+oQg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cc516c44-862c-ab83-84ad-67e90e088067@samsung.com>
References: <CGME20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746@eucas1p1.samsung.com> <20190808121839.23892-1-m.szyprowski@samsung.com> <cc516c44-862c-ab83-84ad-67e90e088067@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos542x: Move MSCL subsystem clocks to its sub-CMU
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 13:16:52 -0700
Message-Id: <20190808201653.A3F0D216C8@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-08-08 08:11:44)
> On 8/8/19 14:18, Marek Szyprowski wrote:
> Stephen, could you apply this patch directly to clk-fixes, on top of
> my patches:
>=20
> [v2,2/2] clk: samsung: exynos5800: Move MAU subsystem clocks to MAU sub-C=
MU
> [v2,1/2] clk: samsung: Change signature of exynos5_subcmus_init() functio=
n=20
>=20
> ? Regression that these 3 patches are fixing is not new, it has been
> introduced much earlier than 5.3-rc1, however it's quite serious and it
> would be good to have the fixes already in 5.3 release. =20
> If that's your preference I will just queue these patches for coming
> merge window.
>=20

Ok. I'll throw it into fixes and push it out later today.
