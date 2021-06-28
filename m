Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18A2C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A11B261A2B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhF1ADq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:03:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1ADq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:03:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84C1A619C4;
        Mon, 28 Jun 2021 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838481;
        bh=4K0QKCG3sGox2auz+GZbmnjGvgDUstww5UANWMpjBVM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CDx6myWzqhNkFg4n2tQcI3Ux8Yc0fwzp+jw5kCVTRyWj6PwU56i4GpdJQfvGCDnt1
         Rb8HrvATyUTlRKhRsRKXBQzFmgnJyklH8z22T8myktrzfh0ekMjiy7ogkWLy7uxEcp
         eLblfddhI2LZYqHgfxtb+SxsWPNx1I1qeiDWxbW9UgeaJIwqcbOZ4Q5p02mRMBxm1F
         Fruh91Q86lvvAf5uFhRcRUDSFpnsA+Ex+RbRUGuVDgUXi0E8rlPCIQKlBNoIDZXACr
         x5DADCd/n9rJA0GaN3ANtWiiz0JQ59zMGfDpPf6eABzHy0hgO8EyyvUKl/74ebZzyY
         E29fGaeWgCueA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210418122909.71434-2-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl> <20210418122909.71434-2-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: qcom: Add MSM8226 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:01:20 -0700
Message-ID: <162483848026.3259633.11167699199982402828@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bartosz Dudziak (2021-04-18 05:29:05)
> Add compatible device strings and the include files for the MSM8226 GCC.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---

Applied to clk-next
