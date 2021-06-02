Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48A2C47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:39:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0560613C1
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhFBHlE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:41:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231836AbhFBHkr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 03:40:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DE926138C;
        Wed,  2 Jun 2021 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622619544;
        bh=C9yRXennZQo2mISXjhgyAwmWaRf13t5VNQid5+T4bqQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nOMSNPMNoO7CG/rl1RGF6hor//zoB+iLsx5Z/Q68GSv3oPekznOUIMgcR0c7LF0S6
         Pkxf4YXma7lbvVCuswY69K+ISZ2J7L0dmNyFDIaYq5WWs+RGu2A4qSvJTQsZEFGLn0
         XmdgakN/ZSr/y01BUjPdqLS0IbQKg9OkbEZ77jfgbOlT8mHaWcb88bEHaV3lOZ7L1G
         pCJdtYMBDfKPIwJWlbMrmnUKQvOXLVBu9VoTu21Z8wvkaJpUS53hXGPhP92HxMAz3p
         IaI6s/g4twJl3UeoCZTJxb3WfXT2WWgYij0QQu7j+fWIpwATMy3UuKlGT+HnNgYQ0D
         zqqwqSHRR7gPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210502122027.9351-4-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl> <20210502122027.9351-4-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: rpmcc: Document MSM8226 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 02 Jun 2021 00:39:02 -0700
Message-ID: <162261954289.4130789.11327695669287036063@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bartosz Dudziak (2021-05-02 05:20:26)
> Add the dt-binding for the RPM Clock Controller on the MSM8226 SoC.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---

Applied to clk-next
