Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C014AC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ADE564E37
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235537AbhBHSUk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:20:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:53082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235481AbhBHSTs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:19:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C029A60232;
        Mon,  8 Feb 2021 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808347;
        bh=dAk6jAEnB/3PNWiM5i+hERJ1F1c4+wxifLhwpeVZQY8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=c10ID4+eoXrcZaXUrWkQR4TBFN+KkTjoSC8bpuvcLqcEHSe34pVxY9OmQb9bxmFuE
         dl0x8M+dl3Plg+RGhsLoMCx11RnohrN+IPFxZ5vkjCvjbn5hEAcDnkGb6tYzOKS8bW
         vOuDIS0an6XxlA6z3DbyrPoBwNRM3UVpPRCmHOJXu6lDe005Grjjpwbil+x1QnkPez
         3J/6mQ/Wzpv0yebDpoja1vSMAhhI85LMWxVDq8VGYTseJJIXpdxdoHpdSUEDe+9kgH
         ib6nk27G24NKBapBwSvDjVNhb8OEQHURrbaOdXK25JVUn5+dI7anMFAZQ05g8anptV
         HBL/HaXN2y+MA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-2-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-2-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: clocks: gcc-msm8998: Add GCC_MMSS_GPLL0_CLK definition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:19:06 -0800
Message-ID: <161280834643.76967.10247333191757057612@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:49)
> Add new clock definition to gcc-msm8998 dt-bindings.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
