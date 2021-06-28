Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFC0C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:16:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0E4C61A2B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhF1ATG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231825AbhF1ATG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:19:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D79B661AC0;
        Mon, 28 Jun 2021 00:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624839401;
        bh=cZYbIvwPDyZsabJHnGegGe3Vx531JqqcJr3TLtx1zV4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Jh+q2T01sXuDRpAYrqxVxBONZI/dTA50YtkhXGTQLhQTl4nKY/HS9MRz1GyowMYgl
         ytqvAWTdhlXnF01Z9i8hYDy+q2M4dKv+ObSBKhEMQded0R0rrYtbX9olPSJ0Lp4TAP
         Ch/8eo4sMUW3czZ6HovOL/s3mjji1T/NjhMEqttn6IO5QKhmfgy5Ts38996eR32oen
         iq/QpGa2z8fN7eh8A90bby0tX6ic2TfkkcMTnmRPgSQKnEb47uU+z1pjV/Q73bzTwt
         xn6jNY/e2IjkjKPsfdyD5IOEfY1YIsf7tzhApclYh3XDRyUsuByH38MmVeHK29LFp5
         x4w0jBxczEs5A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609022051.2171-4-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca> <20210609022051.2171-4-jonathan@marek.ca>
Subject: Re: [PATCH v2 3/3] clk: qcom: Add camera clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:16:40 -0700
Message-ID: <162483940079.3259633.4640870466956106089@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2021-06-08 19:20:48)
> Add support for the camera clock controller found on SM8250.
>=20
> Based on the downstream driver.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---

Applied to clk-next
