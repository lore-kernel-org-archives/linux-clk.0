Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EE3C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C46C72074B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604543659;
	bh=vA/WdiCUReMeg3W1Zq/nl1qAmBpCMB+WVRs0eci3CWY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=L6qzsK9gQyAxZlbs5Rwzyy86d/2A0EVOMNpFDqaW7CB5Yt1CCUm6Ht7cda665w9bK
	 5BqBp1qojfvoks2Zyq5jItCvjI1HPU41W2Pg/PlOHoAAMivUWeELJpwGgfOtB0vGjd
	 T5ksv/8EzKIVX2eerwVoUjUoTP6fbJqN0M5wG1NQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388298AbgKECeT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:34:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:53068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730344AbgKECeT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 21:34:19 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7085B2074B;
        Thu,  5 Nov 2020 02:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543658;
        bh=vA/WdiCUReMeg3W1Zq/nl1qAmBpCMB+WVRs0eci3CWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AcK8zOTcdmh2+tHB6Wi54EyAsCULM6wmDzXyMYe9WdiOFMUdFsIYvYlLPC/Pl0vTz
         7plgBumu2gfD41HAvf4ZxN3n4BXtgwbn1eC6Ua258lV7RtdRhDrREHoIQPm4KpH4Zf
         fj3x20t6NgjOesXWElJw7QIVxWfxFq7vMUQrEwek=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201019154857.v5.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
References: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201019154857.v5.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
Subject: Re: [PATCH v5 2/2] clk: qcom: lpass-sc7180: Disentangle the two clock devices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Wed, 04 Nov 2020 18:34:17 -0800
Message-ID: <160454365712.3965362.10446718680847733703@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Douglas Anderson (2020-10-19 15:49:35)
> The sc7180 lpass clock driver manages two different devices.  These
> two devices were tangled together, using one probe and a lookup to
> figure out the real probe.  I think it's cleaner to really separate
> the probe for these two devices since they're really different things,
> just both managed by the same driver.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
