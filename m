Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21059C38A02
	for <linux-clk@archiver.kernel.org>; Wed, 26 Oct 2022 00:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiJZAlM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Oct 2022 20:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJZAlK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Oct 2022 20:41:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65590B56D1;
        Tue, 25 Oct 2022 17:41:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10A8FB81EED;
        Wed, 26 Oct 2022 00:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A1C433C1;
        Wed, 26 Oct 2022 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666744862;
        bh=/M/cSFTEIbB4x5+l9bbSk5KzSc4pVUaMmK9baOOC12Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kuAmy+el+Kg4wa+l8WkE7gfOgfVWNrj1a06aW6gqaZH3CphZ5ee8ThSDnbHQh7ttv
         lAz3jlz0hNtiO6rLID7gKSaMJ/1WknTnA+CuIEgrAOmPnZJW4AUFR/7aCY2w1wluFN
         +aGm53lEmBjGe2C9/AM2SgjU43DKq5blNvR69+dUeAyGLr1sOXxIl2/PShJEDuS7zf
         0c7ZU0UT9rz4S+CuvPZgVD45NNdBoIDEybtX3tPNi5R7Xz+fNQawXvtt4FNQRfbzwx
         u1isoIx0Vip9H870PcC+FrsQ8HuJLzGKGLez5gb4b2dBeUkw/Zufr3WWAC4C/L/W2N
         hq0ybkx9tTf2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-rate-request-tracing-v1-1-6f3aa0b0b9de@cerno.tech>
References: <20221018-clk-rate-request-tracing-v1-0-6f3aa0b0b9de@cerno.tech> <20221018-clk-rate-request-tracing-v1-1-6f3aa0b0b9de@cerno.tech>
Subject: Re: [PATCH 1/2] clk: Store clk_core for clk_rate_request
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Steven Rostedt <rostedt@goodmis.org>
Date:   Tue, 25 Oct 2022 17:41:00 -0700
User-Agent: alot/0.10
Message-Id: <20221026004102.934A1C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-10-18 06:56:41)
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Why?
