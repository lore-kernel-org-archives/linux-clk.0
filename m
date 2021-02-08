Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D55C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA7F664E87
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbhBHRzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:55:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:44522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233501AbhBHRxu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 12:53:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C82A64E87;
        Mon,  8 Feb 2021 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806790;
        bh=J8CbXAFHue+I2xtetZcgCEPOxDL+jb1IkBa76s1H9E0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YZPrJiV/7s0lD/7wBYEljhZODn3f2LAGyeVEd1nmM8crkKILoTZXWzjFS/jIT3wv9
         hsBx+ZyuniYjytHDzfgQK92r/oZd4bC1Wxq+/ExwwzquLfUH1Zjvlfah0IqZzJySfv
         QHdmSqTISYC5PpmoCyweHcH/4Uh09eOM75IQ0JDnmS0k+fvNU5nHO2NCnXL5Z52Zjg
         262lA898a54QoJBbeICYi+3X+baU1ozg47Z3U7uH8lMD0faP+0pqpph3/Kq34VS25F
         aQu0+a5cpde0DLbg2Nrhws5SSiHMvQ4roBBRjbtHk9Iyo//RxJKUMRM5+Uo4sJ0MFI
         K0cqbCGXi7CLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120223741.1610344-2-bjorn.andersson@linaro.org>
References: <20210120223741.1610344-1-bjorn.andersson@linaro.org> <20210120223741.1610344-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: rpmhcc: Add sc8180x rpmh clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 08 Feb 2021 09:53:08 -0800
Message-ID: <161280678886.76967.9295315131220768137@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2021-01-20 14:37:41)
> Add clocks provides by RPMH in the Qualcomm SC8180x platform.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
