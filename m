Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C740AC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADED761C31
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhF1DFP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231972AbhF1DFO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D776861C2A;
        Mon, 28 Jun 2021 03:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849370;
        bh=GW/5qVcu++3IR4finrja27VicqljNBqFOJ2v9D3OLrY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sBFvgaRVbqI8lyVKrLW0DG3pIjkqUqxfbj5KMvB3mxgDSyVEoW2oQ7Sfcx1oK8aQF
         OA/Ui9s6rfb3HXRSK5m74yiY7vvyhd+DqUodVvyBsLLdxUdEizmq1oxwMjmmnn3Cbz
         mhDYJ7W/T4Fjy7Y86qZ3eEKYuAbbUln08qLXceqocCsjdPcv6fDBx6W3W71DtpBLS2
         8LXgN0hyiu5hEf4pG28CZvtppRS5Urxt2E2ReMOrebI/jKjGu6doDoYY1VnYKIBfA8
         w1kczvDfUerdiTP859ztcBvSZutmxRX9Lx3ruwSJTb7jcxLCx8HpCkBdkIjHj2zzmx
         iUhbZJ0urHt9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-7-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-7-robert.hancock@calian.com>
Subject: Re: [PATCH v3 6/9] clk: si5341: Allow different output VDD_SEL values
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:48 -0700
Message-ID: <162484936830.2516444.14588191116972420818@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:40)
> The driver was not previously programming the VDD_SEL values for each
> output to indicate what external VDDO voltage was used for each. Add
> ability to specify a regulator supplying the VDDO pin for each output of
> the device. The voltage of the regulator is used to automatically set the
> VDD_SEL value appropriately. If no regulator is specified and the chip is
> being reconfigured, assume 2.5V which appears to be the chip default.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
