Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E026EC54EBE
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 18:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjARS5Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjARS5U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 13:57:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAE947EF4;
        Wed, 18 Jan 2023 10:57:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1EEF5B81EBE;
        Wed, 18 Jan 2023 18:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5680C433F0;
        Wed, 18 Jan 2023 18:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674068235;
        bh=jYXWd0dQJfEyygMvCCOwmiw3Gszhfre9ix6ddMrMumE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sF8yVf9qsnOB3taQYLFnXokellZr4EqRo5RUJtqNafmyOJvUO+0L4/msjuF/vqkqr
         wCQgNLbkdNqcXDJ338bzL6HFO1Mwck585/haZY5R4x36qu15zi2yisqjHy2/0TEhic
         HdH8ua97lusRH9RbRtsb3yEq5F6tfUgiGag2n6n3L7L13Eoq6u9dq+qagJgzktWfsD
         U0Rx9kch+D17p3chFjD9Z/tvuTsV6+Utf8UUPOKmYL2WcLtut2IF2GGdLoOUCcxEga
         0OTcj10k0c1FTHmP7v8X0SzrLg78H5mF9Znd3Dtdp4CY0I1J2Qoz7GpmyxW0MFZeGT
         1Y8WbodtdaXWw==
Message-ID: <566451543064f661f4e5414082720de8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230114233500.3294789-1-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
Subject: Re: [PATCH 1/3] clk: vc5: Use `clamp()` to restrict PLL range
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 18 Jan 2023 10:57:13 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-01-14 15:34:58)
> The VCO frequency needs to be within a certain range and the driver
> enforces this.
>=20
> Make use of the clamp macro to implement this instead of open-coding it.
> This makes the code a bit shorter and also semanticly stronger.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
