Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102ECC388F9
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0B152075E
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604544055;
	bh=qA49UIP8O7VyxGZr2r9Bjj7V+4xWjBPy6+WdiiH9c1U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FXczp/P1Lxr08rv861ARiGxMR93SQaXtdp91omUY8UuCoyurUTG8RYaWVJbQ6SERR
	 fUke/ud4HMzrulAaQRYT9zNlI82yOAFN1Jlgx7lfGJzMADXuvpstNqvgtxMlVigWTz
	 xCuyukohWJdF4HOHd3OsTcZ47vKiqls3qzSgoqZc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388326AbgKECkz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:40:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:54684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388325AbgKECky (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 21:40:54 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 589F3207BB;
        Thu,  5 Nov 2020 02:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544053;
        bh=qA49UIP8O7VyxGZr2r9Bjj7V+4xWjBPy6+WdiiH9c1U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lhDdo47tXMlL1nnDj/Fu8/Ul1SxEoWkoYuY/pIKYZWD8eGzyc2Laj0V3uBtPl4+dM
         bQx6GLq8yZf7bLTxPBUMeUSiJev1ODb52QKK/PuMLIQ6hENJ8wIwWt6a/7EYSugfyA
         JPNEInf6I3yc4z0bOo7v/dVXPil5XXdcNE6SNsZw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026120221.18984-5-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org> <20201026120221.18984-5-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v3 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 04 Nov 2020 18:40:52 -0800
Message-ID: <160454405206.3965362.3910941859515898096@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-26 05:02:21)
> LPASS Always ON Clock controller has one GFM mux to control VA
> and TX clocks to codec macro on LPASS.
> This patch adds support to this mux.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
