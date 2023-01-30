Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CFEC636D6
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 22:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjA3WaY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 17:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjA3WaX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 17:30:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887E52ED68;
        Mon, 30 Jan 2023 14:30:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37DB7B8118D;
        Mon, 30 Jan 2023 22:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B8C433EF;
        Mon, 30 Jan 2023 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675117809;
        bh=d9G8/QnUInkOhp8U+UKSxXG01HfHMeg7Z48itkC2/EA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eo6j30SL57qwi0oTX4fKOlrj+t/+4Jpv4pqJPEWUOk0Jw6uY7YsXbhh3xw3+sbuvl
         WNMSU9rBpb1vVFlSUBrNjoGG8ecNrr9ltvdZSkv8NA9hq1FYPXN4SnHr9LEOho7rJu
         NgPMKCKHt4v/Giy1FedYeZbi8CLA9Xj2imEjEUEl3UTcZl4rTW24GecwzEzRytxD8r
         hdBGA/iI+3az6sQW7ATm7prJuALC//YbTKO35kWCSD88FPEwe7VYGPqXQog51SZiy9
         l8lG7uSR1LCaBRbMKQVojdPfjHIFPCu0VzK+KROWjE05ElOTYPTxbsGfOL1DpFazQb
         lohilWY9hnlKw==
Message-ID: <5243dd0a8ca7ca5c319ec42c98b22430.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230130135555.3268172-1-arnd@kernel.org>
References: <20230130135555.3268172-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: fix duplicate initializer warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 30 Jan 2023 14:30:07 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2023-01-30 05:55:47)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> In one of the clocks, a redundant initialization for .num_parents
> got left behind by a recent patch:
>=20
> drivers/clk/qcom/gcc-qcs404.c:63:32: error: initialized field overwritten=
 [-Werror=3Doverride-init]
>    63 |                 .num_parents =3D 1,
>       |                                ^
>=20
> Fixes: 2ce81afa0c7c ("clk: qcom: gcc-qcs404: sort out the cxo clock")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

This is https://lore.kernel.org/r/20230123201812.1230039-2-krzysztof.kozlow=
ski@linaro.org
