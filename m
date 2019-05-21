Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C83C04AAF
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 18:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC7B5217F5
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558464861;
	bh=pGnWjrWwcAERSC/ENQSsLfsgcNI5Pu/basBjAjHLLe0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=pqfqaruCN9IaWDj9hs2qojaaajoRA65OlaF0Rm3WfX1nYwTsLHgaC5M7lHrwkiI/m
	 jxiN+57FOovyMYQnyYF45belngpigL0pt8Ij0Fhmbzgbj++XFHC62Mva3lgvbxFsjk
	 fQPALEvFG9OHFXbtKfV6NT2ql03auxAJqasHBGaI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfEUSyV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 14:54:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727990AbfEUSyV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 May 2019 14:54:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 745FF2173C;
        Tue, 21 May 2019 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558464860;
        bh=pGnWjrWwcAERSC/ENQSsLfsgcNI5Pu/basBjAjHLLe0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zjH56mZr+Rs1f937c3Dvpf5PZjMRxsWxRAQN9tZSrjr1D2feSiqcUc3BHZMCVT85a
         if2FDx1pz+VxSR2tLfOFdREsmZKYdw8Xk9jmn0rc+AmgJvoAU3D5Gqnq9rE0Oa8qwM
         8PwcymCXEYwri9PywAiEDhEmq1gYfS8PE5SdNHKI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190506210854.24300-1-tony@atomide.com>
References: <20190506210854.24300-1-tony@atomide.com>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix clkdm_clk handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
User-Agent: alot/0.8.1
Date:   Tue, 21 May 2019 11:54:19 -0700
Message-Id: <20190521185420.745FF2173C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tony Lindgren (2019-05-06 14:08:54)
> We need to always call clkdm_clk_enable() and clkdm_clk_disable() even
> the clkctrl clock(s) enabled for the domain do not have any gate register
> bits. Otherwise clockdomains may never get enabled except when devices get
> probed with the legacy "ti,hwmods" devicetree property.
>=20
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes

