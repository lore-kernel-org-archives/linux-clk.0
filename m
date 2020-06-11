Return-Path: <SRS0=Q/ZM=7Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E02BC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 01:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2EAE20801
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591837729;
	bh=4lVbfj0iU6Saaa7Z4qVl2VtAyMqNYUbAA+x/WtKhr9M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Wm9vXVvRJv/1fO36hPo/UQBDhCCMLJGqWCT4sZh3kVFVHaXJMRcK1ummeRyF/LPXW
	 24OxSI4samCMnEjwG96qRoN1gx8Hlj0QwLeLMdMDZaM1rhq31WR4/oRLMMb+8tu40n
	 PmSbEFLWFHXiEGDiLT6FvdOQ4O/bdvBCKBnuXUkE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFKBIs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 21:08:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbgFKBIs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Jun 2020 21:08:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45F562078D;
        Thu, 11 Jun 2020 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591837728;
        bh=4lVbfj0iU6Saaa7Z4qVl2VtAyMqNYUbAA+x/WtKhr9M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G7/WKhVHrCRIbwcRNEuXBo1bRED43MAAETtya0HTekvJKt5paxQCR2X8Vy5JcylWb
         QE3Mo4uUsCQu+NvwxSScaZiLNW0MJmc4CLge7p7BCTAtiZ/REnKu5seG0fWN8z5zhh
         ei5SpSYX17a9fzjq7xMqkK4z8VPVhc4mSjePbFWE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200610151744.35478-1-sarangmairal@gmail.com>
References: <20200610151744.35478-1-sarangmairal@gmail.com>
Subject: Re: [PATCH] clk: add function documentation for clk_hw_round_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sarang Mairal <sarangmairal@gmail.com>
To:     Sarang Mairal <sarangmairal@gmail.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Wed, 10 Jun 2020 18:08:47 -0700
Message-ID: <159183772766.242598.9437068405376794038@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sarang Mairal (2020-06-10 08:17:44)
> Information about usage and prerequisites for this API.
>=20
> Signed-off-by: Sarang Mairal <sarangmairal@gmail.com>
> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 407f6919604c..9cb9bc67a165 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1400,6 +1400,19 @@ int __clk_determine_rate(struct clk_hw *hw, struct=
 clk_rate_request *req)
>  }
>  EXPORT_SYMBOL_GPL(__clk_determine_rate);
> =20
> +/**
> + * clk_hw_round_rate - round the given rate for a hw clk
> + * @hw: the hw clk for which we are rounding a rate
> + * @rate: the rate which is to be rounded
> + *
> + * Takes in a rate as input and rounds it to a rate that the clk can act=
ually
> + * use which is then returned. If clk doesn't support round_rate operati=
on
> + * then the parent rate is returned.
> + *
> + * Useful for clk providers to call from within clk_ops such as .round_r=
ate,
> + * .determine_rate. Requires prepare_lock to be held before calling this
> + * function.

I think we can use the 'Return:' and the 'Context:' sections in
kernel-doc[1]. Can you reword using those please?

> + */
>  unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
>  {
>         int ret;

[1] Documentation/doc-guide/kernel-doc.rst
