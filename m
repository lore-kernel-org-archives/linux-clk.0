Return-Path: <SRS0=7p6v=2O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38883C2D0C0
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 02:16:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD442075B
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 02:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577153798;
	bh=Xl1sl6qPOVuQHTaphbCgGtQrDI9M8MqK9eJ5gq7yL7g=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=ZKCdEeEh4fIJKswruTmMr21mPJt52X0ErIrK1Qb6LRhijSrrHMFIqeDg0dpy1jcGf
	 0+O0JZKyEM4Q/UgcOcYYjdNrODtI2oy59jSXOvcs7mrQg9bN1+jER0k14gjsVRU5al
	 DkVr3rcdLTjXKLb5hD9LHOY9MG7xRTK3I0SuTaO8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfLXCQh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 21:16:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbfLXCQh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 23 Dec 2019 21:16:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF47E20643;
        Tue, 24 Dec 2019 02:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577153796;
        bh=Xl1sl6qPOVuQHTaphbCgGtQrDI9M8MqK9eJ5gq7yL7g=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=mfmJvbEY/K1nmfa3j6qBL+0BM8/Y7DP+64wSIsLWY5un1ffy2ROeiF8kQDe7COrEF
         G7QWKlmjCpHp/0kzJMoc+EbVzlzQcw+6zDDauEYCp2cI3hh2bgADo5JDu2oU6CGEoc
         MyA4h0lqPxvzwSIIrYU77piEW9vGZ0kAB8+A6RMs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191220175616.3wdslb7hm773zb22@flawful.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-8-niklas.cassel@linaro.org> <20191219062339.DC0DE21582@mail.kernel.org> <20191220175616.3wdslb7hm773zb22@flawful.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Niklas Cassel <nks@flawful.org>
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:16:35 -0800
Message-Id: <20191224021636.CF47E20643@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Niklas Cassel (2019-12-20 09:56:16)
> On Wed, Dec 18, 2019 at 10:23:39PM -0800, Stephen Boyd wrote:
> > This is odd. The clks could be registered with of_clk_hw_register() but
> > then we lose the device provider information. Maybe we should search up
> > one level to the parent node and if that has a DT node but the
> > clk controller device doesn't we should use that instead?
>=20
> Hello Stephen,
>=20
> Having this in the clk core is totally fine with me,
> since it solves my problem.
>=20
> Will you cook up a patch, or do you want me to do it?
>=20

Can you try the patch I appended to my previous mail? I can write
something up more proper later this week.

