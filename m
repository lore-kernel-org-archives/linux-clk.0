Return-Path: <SRS0=LKfv=46=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815E3C2BB1D
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 20:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56E5720754
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584131407;
	bh=NFuWO4GhKliupoqTZLI2LfLmpwyd7zhsfwNCfXgzDhA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=tlShzSfTlRHcVhnpl93M8F4n7USUG3TIE2ZTB0XDTjAFXu3u1PBCuBB1SB85qeqdy
	 godIfIpPVuYYzb4zp1CP/qt9ekuNY9a0M+FY9AXehqMgfDSajMLitoMutZ0C3RjolP
	 6zsy4k1PKpTngdj5JU00R61DRgBDgKgFBnWgoTF8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMUaE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Mar 2020 16:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCMUaD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Mar 2020 16:30:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 331B2205F4;
        Fri, 13 Mar 2020 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584131403;
        bh=NFuWO4GhKliupoqTZLI2LfLmpwyd7zhsfwNCfXgzDhA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Vzuv6bghVEzClsf8wZLOeWqA0jw7fvgxTz2kyGHuXdd3I1Y1hJgFMcEkqpWsxqpQ/
         1LnnO6PM6lBFYTwfzCNR9cgtgxKaC6soU3KK9cgFUegFKNvTJJlQXMnNuhc1u5ZHPr
         aRRG+aqq8VYrhxltAV+QnX6gdKJVkkO6XmolV1/U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313185406.10029-1-ansuelsmth@gmail.com>
References: <20200313185406.10029-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>, agross@kernel.org
Date:   Fri, 13 Mar 2020 13:30:02 -0700
Message-ID: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ansuel Smith (2020-03-13 11:54:06)
> kernel got hanged while reading from /dev/hwrng at the
> time of PRNG clock enable
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Is Abhishek the author? Otherwise the tag chain here looks wrong.

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Is there some Fixes: tag we can get here too?

> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
