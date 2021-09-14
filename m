Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A5CC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE46061213
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbhINViv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:38:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:44796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235132AbhINViv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:38:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8002F60E8B;
        Tue, 14 Sep 2021 21:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655453;
        bh=WwzSLsTMjLJiR94GNvIekUWoK6QUTkUJXToMsNRnYmE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FZhtAJ9myg/0wiPkb3zHvrKcbgiBMTAl4JOt2rntYmFAZ+FZvu6GLYsIWidR8JaVH
         8lBpG9GDsmsV6gFw5QwSjJJpTSKJ+uUp4AuxpPNs1V4iXDPPGbDBjiqNcyy3kRqHc8
         iuUwWhRynHCyRumpuS6f7MulxT9raRYHr9J7Iz2cXrzJkk2mwt5c/Q4R0woJd5dsow
         YBZ3ktNohnwYvM7X9LuPnwPb95f5/R1UjD3QNfZ6HE6s7K3qktdDacmpvfwd897VkH
         y6KlO7hWWsy1qdfnfHvTqrMf8ZVT81zzb3JEYWtOtTdCRhExVBu0R7U7WUhcyEHe8H
         W5MPNGS92uSZA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210904183014.43528-1-konrad.dybcio@somainline.org>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Tue, 14 Sep 2021 14:37:32 -0700
Message-ID: <163165545224.763609.14645730018738716104@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-09-04 11:30:05)
> Add documentation for the MSM8994 GCC driver.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
>=20
> - Dropped second dt-binding part for the weird SD card clock configuration
> - Fix up many mistakes, including maintainers, license and order
> - I still have no idea why I get a pinctrl regex error.. need help here!

The compatible fro gcc-msm8994 seems to already be documented in

Documentation/devicetree/bindings/clock/qcom,gcc.yaml

so it needs to be removed from there and only specified in this 8994
specific binding.
