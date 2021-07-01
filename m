Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A965C11F66
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 00:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8202361107
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 00:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238240AbhGAAoI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 20:44:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238231AbhGAAoI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jun 2021 20:44:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A07D5613B1;
        Thu,  1 Jul 2021 00:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625100098;
        bh=WQkr6OUYRHxbloIuVUTX0/i/swSOxzEFMQEcpVDMaH0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vJHxXm/oDugsMh0rYx4KYsgyD2tevmzOAGSTrqXs7qdBOR2kqinWYjKKmGNVAYpzK
         FKWoG/k5FNqs9NFXoZrik9cXAM8vT+ZdBHLceAOm1crufW7c5mlxtbG5VTjMSTb3FK
         72kACoaVl91BXyl928gUXDnWhA7mDZaBgCKNnFwpeHxWIjp7HeXrLn/Nmn6q8JIPEr
         wAbQwxdBa7ch69cLMZ2e8DbChHhPh+JL6Dox718Gb8eRnzdaJE32dZ4GNKuRJ//B3B
         Ku6I6xANrjot6jClJ154y+mQ5rm7V/GCGuk04tgkJSEryTXFq0LeVjKevgdlPZ1QqD
         rjfxkaiQqUa/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
References: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/2] clk: qcom: fix error path and cleanup in gdsc support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 30 Jun 2021 17:41:36 -0700
Message-ID: <162510009624.3570193.9612972387190530602@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-06-30 15:59:50)
> Fix error path in gdsc_register() and cleanup code in gdsc_unregister()
> to properly unwind all genpd registration calls. Both patches bear two
> fixes tags, since part of the issue was present in the very first commit
> adding support for GDSCs, part of the issue was added when adding
> hiearchical power domains support to GDSC code.

Should also include the author of the patch that is being Fixed as an
FYI.

>=20
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       clk: qcom: fix error_path in gdsc_register
>       clk: qcom: fix domains cleanup in gdsc_unregister
>=20
>  drivers/clk/qcom/gdsc.c | 48 ++++++++++++++++++++++++++++++++++++++++++-=
-----
>  1 file changed, 42 insertions(+), 6 deletions(-)
>=20
>
