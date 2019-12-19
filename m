Return-Path: <SRS0=J300=2J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99396C2D0C0
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65DB3222C2
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576736727;
	bh=0sOx2b8U2ZDWM6CYWJ8AGys9iyWgFn0dLkgDREfc6yg=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=QTZ5/1V54SgYZPysVLfuYbET67GOEeTTbo4rmW5jw4MDSpUYS6XWrxEmAGqQ3dagq
	 XzDXz+fBNNt4uYsRQsCDx/ZMKWZaQaTGFOFH5OwmGEOHSlxysqx8gbS6uBsTTH8c3i
	 orC9JpqQO0xpU9tvD0UtOQ2wrEjRnTmFNTqa0Utw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfLSGZ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Dec 2019 01:25:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:59990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfLSGZ1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Dec 2019 01:25:27 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57BEE222C2;
        Thu, 19 Dec 2019 06:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576736726;
        bh=0sOx2b8U2ZDWM6CYWJ8AGys9iyWgFn0dLkgDREfc6yg=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=Xo3+f+hr/rYxqV0HfaUBYL1Dt9ypRGa2N0ictoUpjV77m0ASHfcisT1ByOzACbKNL
         JuoCt6tCokc9LBAaSUybbKdoVPM4d5pICTAAOrjRHmNPHGJDyVKpuq1i26s6jhCXFz
         fmXTnGWr+mcjcd5BcxphXBu0B8zEzU5EmugSizms=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191125135910.679310-6-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-6-niklas.cassel@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] clk: qcom: hfpll: use clk_parent_data to specify the parent
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:25:25 -0800
Message-Id: <20191219062526.57BEE222C2@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Niklas Cassel (2019-11-25 05:59:07)
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>=20
> This permits extending the driver to other platforms without having to
> modify its source code.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

Applied to clk-next

