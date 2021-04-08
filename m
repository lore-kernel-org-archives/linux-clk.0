Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE04CC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA07561184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhDHARZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:17:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:42664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCE1161178;
        Thu,  8 Apr 2021 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841034;
        bh=2rvtGr2/J2lbHlDNgj1NNytW/kyAc/yVdm2A0kvIV0o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FCGC0zSmN22HnPoat6gNhxcTmTVR2fNibiR+Bwl3kXUbrs72DkGFjpj6Z5Fo/GTqd
         2U+rvusjzoi8t8N5zZugt1FYOzNXGGCkPxPLdC3HruN1GK6Lb4qy7/011yjkN+KOfr
         dv2rjPY4e8s2419GFACT1eYrAXvPxCOkokshIzev9HyF+IYAl9oISC6A83cKJFyJaK
         xaUa7bBAksZ0Qtmvnu+Q9cDobRXbwN4UsONGKzP3E8vuoDgcBnaeb3yLBZSaPtnNms
         zf9YTBkkbubfCBhY75M3eIqU7SC0CobFENqFPZ+5OX9tZ8ZrdM4TuOOjdlhCvxVgsF
         9bTUCvzmLJdag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-26-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-26-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 25/33] clk: qcom: gpucc-sm8150: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:13 -0700
Message-ID: <161784103373.3790633.7458647463599215403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:35)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
