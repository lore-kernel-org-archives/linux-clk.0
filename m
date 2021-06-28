Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39444C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22EA861A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhF1C5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 22:57:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231984AbhF1C5T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 22:57:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13C4261A2B;
        Mon, 28 Jun 2021 02:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848895;
        bh=QINI1zojbysDtsEdCYssYD6D+MdF9Zq1A0cMJJEzbEQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ecpdHdOqV5BKWpLELrLW4KsGmAISZp7Vc/rELFTeUrq8Z4cUiPB5aqwJePnh9N/wc
         F5fpmoRvdy/tJxKEa62yqrE30a92yoLYE+zPCqSdhok1Gb+uyRzzOoRbwLQWpvLNcV
         0t2KgpRcDcUvOdu3khh+4hhg03KgST7D8OepDa8xmXVsUjLw5YF0QoBxG8HSX+jSYw
         1GlXi9uE3asQj4fPZoiHLATviWowLRZIuAaUvAsdxq7WMMzpO7owVY5IIOOrG6m8OA
         xTGqZ+5F7kbWfKP5fyhybVn9stogHsYu/9nzXhvuqxPnfbFQIVAPEUEgN5K902nsSb
         peqOlEB8tG5Fw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210331201632.24530-4-avolmat@me.com>
References: <20210331201632.24530-1-avolmat@me.com> <20210331201632.24530-4-avolmat@me.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: clock: st: flexgen: add new introduced compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
To:     Alain Volmat <avolmat@me.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Jun 2021 19:54:53 -0700
Message-ID: <162484889392.2516444.13579026101464926842@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alain Volmat (2021-03-31 13:16:28)
> New compatible are added, supporting various kind of flexgen in
> STiH407, STiH410 and STiH418
>=20
> Signed-off-by: Alain Volmat <avolmat@me.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
