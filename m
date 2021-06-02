Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9258FC4708F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 06:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77045613C1
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 06:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhFBGwE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 02:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFBGwE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 02:52:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8350361090;
        Wed,  2 Jun 2021 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622616621;
        bh=zLYlC44JwKKSpRlcCYDmPAMa/Zf94xrsm6JGjdW7c5U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QON80Ix//rxQJ95d36yEHlASvU3nMORXMjA6g4S6qdzCl196mK9BE4l8idCPt6Dte
         pSHMHTsyY0FpxmpajkZh3PCrueOYXhXYacCFe7lcvfdEiAL74TDirT3o2eITx2t2v1
         p60Un9+/65lLfOtRPRfENcfkiaRVnirgaFJWjCU4Dgdk2jURVh2meRQuClHibfVcvX
         NO2GNDmLLoGvaBROm8UtLRLRYQnvrcSt46hr00vfniTaqml4L+jMnWP3PByWjQa4OD
         6Snlp5Kv416DUS+yx1omotwNb0UZKuLISW8XpRgRhqJ93mt6I3fmeRpV46FWXogmHS
         NAsBdpszjVJAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313020310.386152-1-konrad.dybcio@somainline.org>
References: <20210313020310.386152-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add MDM9607 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 01 Jun 2021 23:50:20 -0700
Message-ID: <162261662040.4130789.3654997759500822604@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-03-12 18:03:07)
> Add device tree bindings for global clock controller on MDM9607 SoC.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
