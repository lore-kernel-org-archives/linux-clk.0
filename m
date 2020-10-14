Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247BFC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:54:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B875A221FF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602644046;
	bh=1hB3PWAERAP6BXliOM7WFzoZezTklW21CYdH0m5Nv2U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=L1ggjQ/SxxPBHY2iuXrEZzpIWFHveaMpH45QtPzeN8DS5rKuyDe7x3kspNmAkGXmv
	 mV5Az1aZWE1uFYxBAqXD6o/thZ3MAvKWVxkRSrVTT+/U+ZQ8bCrgq+9B2O6R++LmLA
	 RkCCxLnmn0CpDf+bYHwiVxoHPuqqgifaTxUyLSQg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgJNCyG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:54:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgJNCyG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 22:54:06 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9091B21775;
        Wed, 14 Oct 2020 02:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602644045;
        bh=1hB3PWAERAP6BXliOM7WFzoZezTklW21CYdH0m5Nv2U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uJLRow1YTWqL0u1PykK28703eFtlUazXzDIMDbqTyw8vgXXIWHd5OeI+2scgva1T3
         /8DVoVp5uT24Uy6L+J9I5nTRZTBElmi19UzZjtsWQCONJaC/bKTMTQGOBlS5uv/3Mp
         HLvu3eXAZ3FjVzpCGY/Q0gBhHBDhUFx336CFeoY8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200925233914.227786-1-lkundrak@v3.sk>
References: <20200925233914.227786-1-lkundrak@v3.sk>
Subject: Re: [PATCH] clk: mmp2: Fix the display clock divider base
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Tue, 13 Oct 2020 19:54:04 -0700
Message-ID: <160264404431.310579.1783996108709092551@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lubomir Rintel (2020-09-25 16:39:14)
> The LCD clock dividers are apparently based on one. No datasheet,
> determined empirically, but seems to be confirmed by line 19 of lcd.fth in
> OLPC laptop's Open Firmware [1]:
>=20
>    h# 00000700 value pmua-disp-clk-sel  \ PLL1 / 7 -> 113.86 MHz
>=20
> [1] https://raw.githubusercontent.com/quozl/openfirmware/65a08a73b2cac/cp=
u/arm/olpc/lcd.fth
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
