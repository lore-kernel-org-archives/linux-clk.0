Return-Path: <SRS0=J300=2J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8EFC43603
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DE0B24650
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576736734;
	bh=UpgA+QE6yYvToQ6OyIV2s/X7Htht2BUjpTTkVZS41qo=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=NWILN+fJtbNREIPmY1Q9kvwXcgk5UrAi/owZ0nxzxSdF2am2ljiDX9uV3ggNP1LeP
	 wq/EaCrOYc5sOhw7uOiVoj6Lsc75DNXLE6pdK30IWm0rbXh0WcZYMRpChPJpFX8s66
	 NDqR9awNq0V7cizBqcrFBbLNds0wChB5OJdjRQrg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfLSGZd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Dec 2019 01:25:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfLSGZd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Dec 2019 01:25:33 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F8CB21582;
        Thu, 19 Dec 2019 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576736733;
        bh=UpgA+QE6yYvToQ6OyIV2s/X7Htht2BUjpTTkVZS41qo=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=WdL6MAbbpBqOp+N+DGQ/q4lypMV0hvAkRzUzXdCVi9gxdQWRobmGsZQPB16RmOp7H
         A9ahPWWmG1ul9RBPfTEyC69eApmVXjHcqodredl+0Q9OX3b8sjUcwkAsSCpZDHM1or
         34ijHVx/9DphXMGmymJByao+ZditXCvQdexWO2Vk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191125135910.679310-7-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-7-niklas.cassel@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] clk: qcom: apcs-msm8916: silently error out on EPROBE_DEFER
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:25:32 -0800
Message-Id: <20191219062533.0F8CB21582@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Niklas Cassel (2019-11-25 05:59:08)
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>=20
> If devm_clk_get() fails due to probe deferral, we shouldn't print an
> error message. Just be silent in this case.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

Applied to clk-next

