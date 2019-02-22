Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA02FC4360F
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EE5420818
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550822587;
	bh=B+hxSpo5sj6W1BRmJxu55fXbV+HKy9aHmCOhAt6Qn4Q=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=jXoChLOYLN7rLuZBx23XR+OXjc+7CrTbhPEgwy5yoJifyjuUr9Yc2AiQi34CF1Aro
	 W/J01ciH19enLjSNdt07cbIU1EGoWyt6Vse+XP8JzUmpBKk3UYYJGdycQKi0VK09jv
	 kPzfkOWERtdC7Vy4zPiObK5BzRQu+R9a92++XzRQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfBVIDH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 03:03:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:42772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfBVIDH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 03:03:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D4962086C;
        Fri, 22 Feb 2019 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550822586;
        bh=B+hxSpo5sj6W1BRmJxu55fXbV+HKy9aHmCOhAt6Qn4Q=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=MsCXaJtxxAtxI/5PRstbwzzIkAkncHZ3XH0/tPPbc0C1ywFbAbLRWzv9uvguEZrwZ
         quH8EJmdCOCuv+t/KjorrpR6gfzKJBwXBS/r4k5BZpZSoD6bKc6aZj5Ew4iDzSofX8
         9hhBtitTl++ypjBBCILNmjevUd2e54JFCjfdgjsU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
Message-ID: <155082258579.77512.3841323897834397638@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org> <20190115033340.25016-3-manivannan.sadhasivam@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190115033340.25016-3-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        afaerber@suse.de, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Cc:     Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Fri, 22 Feb 2019 00:03:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-01-14 19:33:36)
> From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
>=20
> Add devicetree bindings for Actions Semi S500 Clock Management Unit.
>=20
> Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> [Mani: Documented S500 CMU compatible]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

