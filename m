Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5931AC433FF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 16:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C91120665
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565799794;
	bh=tN017jx7D3mqg2uTVkRp7Eusfnr22JSYqNHhZgC5KJY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=yCLQJkmRu1Q75hPO1zNOALNRjJ7YDOZ1A231S3l6ghnQmLhHb436Zv9nu4AF3JVxQ
	 wWFlcNujtYU+gzdDNkBg6WiVfU2rG46l6wlwHfLD4gOVUgSa/zYQbgpahGWrEWEUbL
	 Rcr27VBwbdkRXGBQdKs6GsJ5kEyfflncNE27cePY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfHNQXN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Aug 2019 12:23:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728262AbfHNQXN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Aug 2019 12:23:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85E81208C2;
        Wed, 14 Aug 2019 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565799792;
        bh=tN017jx7D3mqg2uTVkRp7Eusfnr22JSYqNHhZgC5KJY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oFCxzkNDOTeh1H6184ZWtl/56xl35DazBAlo6hqrFwDwf1P2hDOmpbVbwjbydjksB
         m+nToyVCXv3TJ4yMoq7C/JFpW46MeYdgczjPNUpLb5wLL5+rqwy3SD58FcycXeCxQU
         /4Ghn8g7Hbp3mYhUkPbDmxh41idiKRP4Pmeo0WFk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814002402.18154-1-sboyd@kernel.org>
References: <20190814002402.18154-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: socfpga: deindent code to proper indentation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Dinh Nguyen <dinguyen@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 09:23:11 -0700
Message-Id: <20190814162312.85E81208C2@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-08-13 17:24:02)
> This code is indented oddly, causing checkpatch to complain. Indent it
> properly.
>=20
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

