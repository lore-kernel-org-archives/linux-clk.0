Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46500C433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E51E64E84
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhBHSQJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:16:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:51802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235320AbhBHSOC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:14:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18A3D64E37;
        Mon,  8 Feb 2021 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808002;
        bh=p+q5w5lYu4DB8M7gtYUN1FTZ2M5bnksue/15v79r55M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YTcu0c6p/E88RZVUcb80DJyChlGD4hnh/J4N56NF0NPO6CB9WNHK/ZI2MZ2rO2oVK
         JdjIeK3k2a0CSAo71fwmfwVqwLdZQEzi++E38cTmvjeSjEf1VvJsFlrRv15lTuiEL3
         dpkh1lSNzPrSfzuTMxhVnAZKk9emNKvojcOQvQ2eqUbJm6WfCxdwLovYFB84XCjW33
         3TgXWpVZcGEeWXNk2SVoeahZ1tCm+4SrrNemwa6aTazkyDm1VyeLFPiSPttdlfK9MP
         GI1uH5Mdc6/G6FT7tRGptMPwK1JQDJLZV0wEvRiLtqi5KjQ4DRMyU/H8O/DSC6Bjrc
         WU/cbvozLIzzA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210204150120.1521959-2-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org> <20210204150120.1521959-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add missing SM8250 videoc clock indices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 10:13:20 -0800
Message-ID: <161280800069.76967.1806439829584830910@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bryan O'Donoghue (2021-02-04 07:01:17)
> Two indexes need to be added to videocc-sm8250.h for venus to function
> properly. Rather than adding the missing indexes when used we add them
> separately here to keep checkpatch.pl happy.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
