Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8ACC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F9F60E94
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhH2EAv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhH2EAu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:00:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1867160E94;
        Sun, 29 Aug 2021 03:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209599;
        bh=Jmo4xkgton5hMoTfL4MUBWmLMLej7nT1Iaj8Lqb+huc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z1FI8+Ay5GkVP2Vx5T24Jv2R1fRQNWnFXsxUN9digUVVZgD+TeOJ6U+udEh5y7djK
         CS9h5RJ4FRCN4XgnRyNQps0b0Y/d0Ad8f5Y0zquwRaQBd9/d8J1pmZzEW3hxuUfplo
         0mXBHFJwTBkMPYchcqSukXKR0K6BqDahcjTkRfJR/T7ui/2/6gRHwMKifT4BN5gMzC
         CEibiWHjnkMtf7Ng3UllGW8ozZ7Y3Dx70eKymiM6iotSP3ofvEyWaEeihVxJA+MY3s
         h9+hMURnmD2rm/Y8jFfOGe3itOMW++GpTwJzYl8QRG19QzRIP3AbSKHi/A5BHD4EsG
         a5zMAJpBas5nw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805161107.1194521-2-iskren.chernev@gmail.com>
References: <20210805161107.1194521-1-iskren.chernev@gmail.com> <20210805161107.1194521-2-iskren.chernev@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Sat, 28 Aug 2021 20:59:57 -0700
Message-ID: <163020959786.2676726.14879770900123889521@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Iskren Chernev (2021-08-05 09:11:06)
> Add device tree bindings for global clock controller on SM6115 and
> SM4250 SoCs (pin and software compatible).
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied to clk-next
