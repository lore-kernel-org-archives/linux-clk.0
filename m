Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D111AC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F6EA21A4C
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568024676;
	bh=kjV5UmPW+o1J0y5yc5/2T9jcM8+FpxAQwKQ1DszQ4wg=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=WMACh3xO7l/n0zBR1YYKmsskPo+LJB3OToGbjjrvcOk2Fvp6ihz4Srtyz0cUl8Y9E
	 2mqLqvzC46+VDYghj/oz+s3KH6GpSNEIaA7Fmvty0ZFzhU6/dMN+i8Wdm9EdK7/6qm
	 ubHn6eKMaZLauzr4FrmXYSeVWu9JkvEY8yMJjUFQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390602AbfIIKYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:24:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390541AbfIIKYg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 06:24:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60ED22089F;
        Mon,  9 Sep 2019 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024675;
        bh=kjV5UmPW+o1J0y5yc5/2T9jcM8+FpxAQwKQ1DszQ4wg=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=hq3gDhgmuFSBWM19gRvwEZVY7joCUP6LcIMfiG6hwI1ONsvQKARCD1r9U+6VKpDp6
         TGJU4eSfvX5UvUuOSyhSj0Y/ihIaPYqw7SWpVFux/T2r2oW7UKR61mOQGnao8LgzGR
         6rpxJXRH7YYbz/oyvwdOtbZdiAZg4f7rIXwnwX1E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adaad84a-15ce-3212-9fec-7ff387da2a88@codeaurora.org>
References: <20190906045659.20621-1-vkoul@kernel.org> <20190906203827.A2259208C3@mail.kernel.org> <adaad84a-15ce-3212-9fec-7ff387da2a88@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:24:34 -0700
Message-Id: <20190909102435.60ED22089F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2019-09-09 00:48:39)
> Hi Stephen, Vinod,
>=20
> On 9/7/2019 2:08 AM, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-09-05 21:56:59)
> >> Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
> >> disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
> >> dont want the clock rates to do round up.
> >>
> >> [1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swb=
oyd@chromium.org/
> >>
> >> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >> ---
> >=20
> > Is Taniya writing the rest? Please don't dribble it out over the next
> > few weeks!
>=20
> I have pushed the patch : https://patchwork.kernel.org/patch/11137393/
>=20
> Vinod, I have taken care of the QCS404 in the same patch, so as to keep=20
> the change in one patch.
>=20

Cool thanks.

