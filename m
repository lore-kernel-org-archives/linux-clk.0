Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526E6C43457
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23E0922227
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602630726;
	bh=0zBPSpHevmdq1uHIA4+p1uLGrJhk+puG39JIQUADrUY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FXHhK6O9g6Oo7XkDckefkFD2/Zef4ycZ1lLAbronXxrJIGv0aNo9h6BwCNy5qGBAZ
	 l6vCiyHUsfAG74PcRMg3ueuY7+XGJl44DYFgfMbzURXHg8okivWD8o94TeQmAdfu/I
	 EF95a60MmnDs8rkUErW0ujQehqStxCkb/0/yXQjE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387582AbgJMXMF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 19:12:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387570AbgJMXMF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 19:12:05 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C166321D40;
        Tue, 13 Oct 2020 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602630724;
        bh=0zBPSpHevmdq1uHIA4+p1uLGrJhk+puG39JIQUADrUY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E6uByxTkGm1IvcvRNNDMXxLnxPNWajuOd5IxZeTX3oPYVop6IH0EdSfk1GHxMq/Br
         rf4810ui9zUhVY/9HgSzwRmDpz2/pXn9csKjDtteXCYT3XjWanp9ium8O6e72aU3+t
         Zuve/TQOeQqaG74zVSEc716JxZ2yLbKaqCMoc4fU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918132303.2831815-2-fparent@baylibre.com>
References: <20200918132303.2831815-1-fparent@baylibre.com> <20200918132303.2831815-2-fparent@baylibre.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: Add MT8167 clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     krzk@kernel.org, masahiroy@kernel.org, ck.hu@mediatek.com,
        macpaul.lin@mediatek.com, owen.chen@mediatek.com,
        matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>
To:     Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Tue, 13 Oct 2020 16:12:03 -0700
Message-ID: <160263072366.310579.8925835742463532920@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabien Parent (2020-09-18 06:23:03)
> Add the following clock support for MT8167 SoC: topckgen, apmixedsys,
> infracfg, audsys, imgsys, mfgcfg, vdecsys.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to clk-next
