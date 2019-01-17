Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8076C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 18:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABBDF20868
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547750978;
	bh=qcLpyuMuQfYRbWRTFJI7mthOtX7fu2Yi02akRLm2Zls=;
	h=Subject:In-Reply-To:References:Cc:To:From:Date:List-ID:From;
	b=CvU49mVUJQMaOi6N3VeipwXj5NwpGgQVSwXUHyyfCkiESqMnMu/3tfTBCqI1BkfKH
	 xSD9plAt8c2qdZ2rduiHuSoLyUgMORT7hfZhm1GRJhthUv2g9zVwdaAD/h5Fg5DUWb
	 Fs5/fk2TYA/tNkZ1YERqriVqAAz88o+kV5ML325I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfAQSti (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 13:49:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:56910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbfAQSti (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jan 2019 13:49:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45CD920859;
        Thu, 17 Jan 2019 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547750977;
        bh=qcLpyuMuQfYRbWRTFJI7mthOtX7fu2Yi02akRLm2Zls=;
        h=Subject:In-Reply-To:References:Cc:To:From:Date:From;
        b=ztEKbsWF5XoA5qDP3fvDZjT59SJD7iCGIZYyXDQEjitnQQar7JD1KtJjfwB/fxg6W
         nTjh8PFYagiJlml8ytIv0RnR2SxN3wgeS5Qv+YZWW0Xv+7KjnDWHvKBLc2kBksn0K3
         4JIwK2OBInv6AASVAnw8kBqtrt4UR9E/K/5gFVug=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: qcom: clk-rpmh: Add IPA clock support
User-Agent: alot/0.8
In-Reply-To: <7db43e9e-0f5c-9c26-6f26-c601ec69f964@codeaurora.org>
References: <1544754904-18951-1-git-send-email-daidavid1@codeaurora.org> <154706211110.15366.8008755843113316822@swboyd.mtv.corp.google.com> <11f948dc-3045-762f-b6bf-63c32d51772a@codeaurora.org> <154748442276.169631.994019688641603420@swboyd.mtv.corp.google.com> <7db43e9e-0f5c-9c26-6f26-c601ec69f964@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, tdas@codeaurora.org, elder@linaro.org
To:     David Dai <daidavid1@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <154775097646.169631.4497796001681545243@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Thu, 17 Jan 2019 10:49:36 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting David Dai (2019-01-16 16:54:39)
>=20
> On 1/14/2019 8:47 AM, Stephen Boyd wrote:
> > Quoting David Dai (2019-01-11 16:56:14)
> >> On 1/9/2019 11:28 AM, Stephen Boyd wrote:
> >>> Quoting David Dai (2018-12-13 18:35:04)
> >>>> +
> >>>> +#define BCM_TCS_CMD(valid, vote)                               \
> >>>> +       (BCM_TCS_CMD_COMMIT_MASK |                              \
> >>>> +       ((valid) << BCM_TCS_CMD_VALID_SHIFT) |                  \
> >>>> +       ((cpu_to_le32(vote) &                                   \
> >>> Why?
> >> Sorry, could you clarify this question? If you're referring to the
> >> cpu_to_le32, shouldn't we be explicit about converting endianness even
> >> if it might be redundant for this particular qcom platform?
> > Is only the vote part of the message in little endian format and the
> > rest is native CPU endianess? It's very odd to see that jammed in the
> > middle of a bit packing statement like that. Typically the whole u32
> > would be in one or the other endianness. Also, sparse right complains
> > about this macro and it's usage, so something is wrong.
> Point taken, I'll leave it out of the macro for now.
> > I think one other problem is that rpmh API doesn't really talk about
> > endianness here and that's busted. So if you want to fix endianness
> > issues that needs to be fixed first.
>=20
> Since a similar macro is being used as part of the interconnect provider =

> driver, I was thinking a better place for this macro might be in the=20
> tcs.h as part of the rpmh driver? I could submit a different patch for=20
> rpmh that mentions endianness along with this change.

Sure that's fine. But be warned that making a dependency across kernel
trees is best avoided. I would do that sort of cleanup and consolidation
after the two drivers are merged upstream so that it can go via either
tree.

