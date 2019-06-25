Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C23C48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C72A12085A
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561497741;
	bh=xLE1yGhewFoiNzw43L7/FPh2CWZdJ5lHe9GzDwb2+EQ=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=u/sPdati+LBD22BRq+LXiGJLeCv2ah5h4vsJVlHe6k54Yw77ZO8D/q0aSPNh6VKR8
	 ceVAVqd+bhO86slxkjMZzrSiniXQVZs8s3F8QbpsXJT76BCpASm1UmfPJ6R6fR4SXY
	 TPrVThB8eaDDQuyBAYLAStd65z5oYdBI7AO6kBec=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfFYVWV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 17:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfFYVWV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 17:22:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4574205ED;
        Tue, 25 Jun 2019 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561497740;
        bh=xLE1yGhewFoiNzw43L7/FPh2CWZdJ5lHe9GzDwb2+EQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=TpKe6DZdroNv+BttyYfkCNQCv7u2Jw5mIiq9ptOxOq6RgxwUr6vMnaKqN+yLUH9Tj
         Kf85cC16Bm8R28jR7gQEcn31jW6K0pN5d5xpLYLOBI8fLZspQ76uHyRsK4H/ND64il
         yZkm7xEveB74tksF6tDUJZFJYWJ9lYEDkjTMhbA8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190619093926.21719-2-s.nawrocki@samsung.com>
References: <20190619093926.21719-1-s.nawrocki@samsung.com> <CGME20190619094000epcas1p364fdcb03f801ec0ea3a533ead5ac2441@epcas1p3.samsung.com> <20190619093926.21719-2-s.nawrocki@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: Add devm_clk_bulk_get_optional() function
Cc:     mturquette@baylibre.com, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, krzk@kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:22:19 -0700
Message-Id: <20190625212220.B4574205ED@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-06-19 02:39:26)
> Add managed version of the clk_bulk_get_optional() helper function.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-next

