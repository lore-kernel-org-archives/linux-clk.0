Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74742C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 04:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 466C621873
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 04:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565238567;
	bh=jw29/PCGEXGB98PdYvc84pVMp7Xt/WJj5r1doUZhJ6Y=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=NfTk9C5yR/5zJpe6+Uo8axJR+6CEFNUFrkJ0nU+k3T0FddXJkRCD8G6wX+U0/TQzJ
	 h4W8shyWspMSOkIUewT1POCGZBvjMouDmex6Fqh0L4GER9JPKEwJgaWbS51PPdU14J
	 aoMAbZI211eRLXE4UIU751ryU+/HdVayKytMAJ38=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfHHE30 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 00:29:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:42286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHHE30 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 00:29:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90F3721743;
        Thu,  8 Aug 2019 04:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238565;
        bh=jw29/PCGEXGB98PdYvc84pVMp7Xt/WJj5r1doUZhJ6Y=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=bFegZvpP8qxz8dBoDzgNPmOw9uOSpTeSqIKRuKePg0koKG4ypWc58gAEy7xYDkNrZ
         vDRaTfBGrnGyuNpeGSvD7uFyE6ceoJXHbI6TVOcMalauATOnXSjwq7nL5YbREVYdVV
         URYYZFb9oqBPdwcC167VYeJR6HKfW4o+Y2L6U5/w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr> <f96ab735-1001-5319-a314-b8079efd9046@linaro.org> <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr> <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com> <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:29:24 -0700
Message-Id: <20190808042925.90F3721743@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marc Gonzalez (2019-07-03 07:00:31)
> On 24/06/2019 15:57, Amit Kucheria wrote:
>=20
> > On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr>=
 wrote:
> >>
> >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> >> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> >> the 'default ARCH_QCOM' directive.
> >>
> >> Add the two options explicitly in the arm64 defconfig, to avoid
> >> functional regressions.
> >>
> >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >=20
> > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
>=20
> Stephen,
>=20
> Can you take the following two patches through the clk tree?
>=20
> [PATCH v2] clk: qcom: msm8916: Don't build by default
> [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
>=20

Did Andy pick up this defconfig change? The subject is misleading.
defconfig changes should be something like

	arm64: defconfig: Add qcom clk options

I don't think I need to pick up the defconfig change. It can go through
Andy and arm-soc. So I'll just grab the first one and guess it won't
break much on the way in.

