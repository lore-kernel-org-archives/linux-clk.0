Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2014BC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D871A20821
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544470315;
	bh=C5XI6M6zsmWjqeBu9sGTtb3lkO85mH290ptERvs/V0k=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=tgKaWPJ0fuag/Ql3CgnKmT+vI7oG16jIwsXOBkTlh+ftRuDZT1THhco75YEcm23XZ
	 wVFxqZ8KmI3DRJik5N/T+Z4MOGwRSuwDQsTzxGeZ1u+094UJhHqEmgZwFn1lv3Ra6X
	 qBURDhNCAmvVtr0+WHlq7A5BdA14MnwkZnSC8vJo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D871A20821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbeLJTbt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:31:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:46410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbeLJTbt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:31:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E95A120821;
        Mon, 10 Dec 2018 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544470309;
        bh=C5XI6M6zsmWjqeBu9sGTtb3lkO85mH290ptERvs/V0k=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=NxGQQWTrheEQy7OOBYKXyUWO9RJCaHxZIijz1Wh2WkOWjvRgLAzpDVvoAE67XdWOC
         OPpqkWxSbYyRXirIK0XE/z+GpvqQtm8DIfeGd5LO3HLyg5ez/BItMREEUoyQoFe44C
         lna85pKCii35hn3bmnklJSECMm+IDKvfWWYQj90w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181207084149.26470-1-vkoul@kernel.org>
Message-ID: <154447030815.17204.16045119997535339985@swboyd.mtv.corp.google.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: qcs404: Fix gpll0_out_main parent
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181207084149.26470-1-vkoul@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Date:   Mon, 10 Dec 2018 11:31:48 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2018-12-07 00:41:49)
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>=20
> gpll0_out_main parent is cxo so fix it.
>=20
> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver =
for QCS404")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-fixes

