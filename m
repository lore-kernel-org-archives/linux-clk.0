Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AF8C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1D7C21D7F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602643694;
	bh=Buh8s8YvleUtEPtzJRdWTPJ2//hJsQEqcjVcSpkwIFw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LD/gxyPwawlu1kc9Esv1ye8xEeAXzGN6GEUR57ATp53rY/QfWeDMwh3kQr3NAxGGp
	 7L4KwyoWytBRE8+HFHguhfAruFLt/HTUNxM+W++YdMq897OZtqcdKgz5sd0e9xBZ5l
	 CpCfrbQGcjcAVhzX3yy0e/xZDWMSiaMntJVYHx9E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgJNCsO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:48:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgJNCsO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 22:48:14 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1845F21775;
        Wed, 14 Oct 2020 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602643694;
        bh=Buh8s8YvleUtEPtzJRdWTPJ2//hJsQEqcjVcSpkwIFw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HoccovkMt8pHYm7azGQcEfCXGjlrZRuNoO79p3DDrif+z69zgJpRiGxone7IrotTL
         Bzk49klAgm6R/w7KsdJiUESV2GJvsU8AArzrSD4RPak/MlHOb1Sx7f9RQCiZSXhAMf
         RFnPWnMq61wib1GrLqVECMSmZHmh13a/nLOFwkpc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200916030311.17280-1-qiang.zhao@nxp.com>
References: <20200916030311.17280-1-qiang.zhao@nxp.com>
Subject: Re: [PATCH 1/2] clk: qoriq: modify MAX_PLL_DIV to 32
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.tang@nxp.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Zhao Qiang <qiang.zhao@nxp.com>
To:     Qiang Zhao <qiang.zhao@nxp.com>, mturquette@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Date:   Tue, 13 Oct 2020 19:48:12 -0700
Message-ID: <160264369288.310579.9004484766033537806@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Qiang Zhao (2020-09-15 20:03:10)
> From: Zhao Qiang <qiang.zhao@nxp.com>
>=20
> On LS2088A, Watchdog need clk divided by 32,
> so modify MAX_PLL_DIV to 32
>=20
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---

Applied to clk-next
