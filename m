Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B5DC433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 01:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDF6207DE
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 01:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602638255;
	bh=y3QiFbuLZbNyFvL0kFtJw3iVroxHHsZurQAgBLkSTtA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Vu0IE4iH/ZjTzX1fK++RA2K7gpyLtlUa6NqfFbI0KfMndhNGsnxVnNtxUfM57Ox1J
	 Px6Ewk8F5AfVV45NflIkuJn9iXKetOIBAnzJVngpisXBrG9wLygaWNuoPC4ImIV9Rd
	 /8BS9dZbX5g6RAHRG9yI3raRoCKR7tbnzQYTk6M8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgJNBRc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 21:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgJNBRc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 21:17:32 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7680207DE;
        Wed, 14 Oct 2020 01:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602638251;
        bh=y3QiFbuLZbNyFvL0kFtJw3iVroxHHsZurQAgBLkSTtA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=x9bTOPuHLND03KpLn17glMj8Q3HnkiYfD47Y4ZkSRpto6bPArDvSxsO+jHaFMlG/w
         nS90Lg+ykjn3TRDCrueG2Yxt2cVrHVE2ofmsZDmfKasPhHZpZFcYn96zyfOw8H1ZNu
         M/EfF/eJ574gdwUklRzWCox5FrJ1LxKUM9+KZ1UE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923160635.28370-3-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca> <20200923160635.28370-3-jonathan@marek.ca>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: add SM8150 QCOM video clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:17:30 -0700
Message-ID: <160263825064.310579.9369498029054781232@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:06:28)
> Add device tree bindings for video clock controller for SM8150 SoCs.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
