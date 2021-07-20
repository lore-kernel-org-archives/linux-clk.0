Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C026C07E95
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A91610CC
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhGTU26 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jul 2021 16:28:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232035AbhGTUV4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Jul 2021 16:21:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A690E6108B;
        Tue, 20 Jul 2021 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814953;
        bh=/2CH8VV6dPIox+Gfhd3VLkqQWV9B0Ck2QN4Aopu+odA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kLpchj2lEv7VXPuD7Pbc4uJFbJiXDIA4+25jU4d8eN6lrmDtiCSlAwMJ+HIGE0qFb
         peyhS/j5vwnKs3Myt+7G/Sps+MCvA2LJjf5WBAkxvXVpGTDr6FypZCBJfrwQRZO179
         RK1xwuSDcOzKbfdz9HRXKfvIZnROfJiV2waRV4QpuXjViYiilymw6+2XdUFDpfUM1l
         WWCbd2q2f4gscEi8seXDFxkJhW2rvMDHDUR6C25HDqgIx3EB1J9UtgELp1oNLKunQB
         6ZcFL9wZHYk1GUwfTQG3i4eghpT5zUZ2McCHTjwj426RGnAz/g42XMkdPYckgyH0Sq
         ad8ctQBKNLgQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-2-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Update license for GCC SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:32 -0700
Message-ID: <162681495245.2679160.18018885366075461196@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:17)
> Update BSD license for GCC clock ids.
>=20
> Fixes: 87a3d523b38c ("dt-bindings: clock: Add SC7280 GCC clock binding")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
