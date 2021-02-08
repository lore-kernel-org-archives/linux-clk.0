Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1B7C433E6
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E40D64E28
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbhBHRze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:55:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:44474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234930AbhBHRxo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 12:53:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EAB664E84;
        Mon,  8 Feb 2021 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806784;
        bh=kOHPBspk+3gbz76Awe4TMzr7KIEboo9x7T9esWHYaEg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eDnnYmFZstvVOIZ5NXqly9Mduywx3KURNE05ds3lWX4WrIYg4BQBQUinIYZLdq5M0
         a/dHCAjO+AikgzbQw5JGjWzJZcV3XHZcyGiIA7PBuEUrH/g5kQm41wqLy84fygC1yL
         nAEF93KD+KhpgzoqMd2dhQSVSagp1grrJEevYlR+xTPvlxcCgTbVpd2laX3o2j52rD
         hIDCdwLUU1OOXe6bbs0Q0z14mUqZWfG+wIqskTR0s7MIduEUHbphwAXQ3el+w5k9Gl
         ELb6x7+iO1Jb3Q6LSEElNEo5C/wJoJqr6gq53mwWEWEdwnjZQJkGXd+BSoYssQtz3x
         ilNLnu9xy/qIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120223741.1610344-1-bjorn.andersson@linaro.org>
References: <20210120223741.1610344-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: rpmhcc: Add sc8180x rpmh clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 08 Feb 2021 09:53:02 -0800
Message-ID: <161280678265.76967.15070881971365224684@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2021-01-20 14:37:40)
> Add Qualcomm SC8180x to the list of compatibles for the RPMHCC binding.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
