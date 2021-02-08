Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5BBC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62FB160232
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhBHSVT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:21:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:53114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233736AbhBHST4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:19:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05B6A64E7D;
        Mon,  8 Feb 2021 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808354;
        bh=bBGOg36CSuc6xiTHaoGYnqfnUPpgeypv1CJVz4bnlsM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=J4bBTQOmsh70OBnvy9JsZcKykSBY3ZNqu+T64AuKY1hIhOcoxCRD6w3F8R4rV4jxo
         1y0MugNoafNy3FRU5S0ptxIFJeoBi5wh4QLKBA+9FqIybWEYWEL5PYiMnfcvlaV6QH
         6XM6PAdXE45zaMumqaYCKOBXmtJytFtF0+KHUGyn2R2P3m9igc9De62D0gpeid+DIi
         uWgS7HaIzf3nEmSsDEP5u+N4tRqUOH/T/sgbbyvBMv7MJE/KEG59/gcDqFIMsRscTD
         rbVmQp+MCKjvQPxJ1i4EgkXP3Q7cgcnljQxEEMh1CJgyBhYPVZFi8Aam2KID+8ecYc
         Lhg0TP13Q2oUg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-3-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-3-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 02/11] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
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
Date:   Mon, 08 Feb 2021 10:19:12 -0800
Message-ID: <161280835289.76967.7079149517164289539@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:50)
> This clock enables the GPLL0 output to the multimedia subsystem
> clock controller.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
