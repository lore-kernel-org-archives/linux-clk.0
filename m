Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B01C282E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17BCB217F9
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555706225;
	bh=U3VIVZnEscOkbedxyikOcAWZqT5OKG3peIh61msM/UM=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=j4AqdzuwnltQlEDOyAceyiLvtHmlMky5IG0jFMDYnHAAssnlbSL8Y8aAgNXqBP8Rb
	 tyy9E6lnupOfh/DZGbbHwnIudLUqZ/cRkoUt+K4wIbYNd1OQSi0KknXspcRIExBNCL
	 cBWG226wxZnDDNUsfeUhpRhzR4+RfqJBIazoGXMI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfDSUhE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:37:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfDSUhE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 16:37:04 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF72020869;
        Fri, 19 Apr 2019 20:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555706223;
        bh=U3VIVZnEscOkbedxyikOcAWZqT5OKG3peIh61msM/UM=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=Y6265FXSBrT/QK4ClDVMTNHBGICJk5Eve/ctWalHdOgcRzDrCz3J/STg9DRMPKCqr
         snL128ezEddJjT2CTnjiei7iOJK5GiUuWoXVombS9PaQdYitc/XVn+1gdIddZ+YPXm
         b+qQ3XG4jT5aFZjZ96AS42ly0rN/1EPnd2rFQAFI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0e9089fc-7497-ae52-a27f-515d2f9a0ecb@samsung.com>
References: <CGME20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b@eucas1p2.samsung.com> <0e9089fc-7497-ae52-a27f-515d2f9a0ecb@samsung.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk/samsung updates for 5.2
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <155570622303.15276.1236336485552364566@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 13:37:03 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-04-19 02:55:35)
>=20
> Hi Stephen, Mike,
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.2-samsung
>=20
> for you to fetch changes up to 691dc382769e350d4bc6f90a8edcacf7f8863d70:
>=20
>   clk: samsung: exynos5410: Add gate clock for ADC (2019-03-22 12:41:57 +=
0100)
>=20
> ----------------------------------------------------------------

Pulled into clk-next

