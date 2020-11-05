Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C59C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 311B32075E
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604544061;
	bh=+MBPEwKAk3RBiZL9N98sDC39C2JwWEk1rlNgVw+6tQo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=SVPXdRThheAr4YG4WQDQnqhBybdevJCbEZX5ANZksVGJDMBRJZY2vOz/8Z5DoqRPK
	 g3p0fvsaMPEcOHmCYMxXXNe0yN3mc2fGUwB4XZiFUMt0U92j3NgPiV+B3m/Chx7N/K
	 m0KyV2BW6GTvx0smb8hU1QeKzht01O5lsFYHft8M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbgKEClA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:41:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:54876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732925AbgKEClA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 21:41:00 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F7AF20756;
        Thu,  5 Nov 2020 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544059;
        bh=+MBPEwKAk3RBiZL9N98sDC39C2JwWEk1rlNgVw+6tQo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aom2Qob2OXaK5o0jau5ANYsqFVSqWd/a/2lAv9/R+bfPT3cNA0gAnVvFZP2eB6RQZ
         4W83NvIvOWiNOJqbfOk8vSbgTBzl11i0H7scHjmIWZHG0eBJ90aeFbtDsV36Dnp86f
         I+30M8tNF8LqOER8mCWwiOZCVuMcNMwK7Hy/47II=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026120221.18984-4-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org> <20201026120221.18984-4-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v3 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 04 Nov 2020 18:40:58 -0800
Message-ID: <160454405802.3965362.9882510090819717845@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-26 05:02:20)
> GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
> This patch adds support to these muxes.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
