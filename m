Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB5DC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C4B608FB
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhH2E1u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:27:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:44822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2E1u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:27:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90159608FE;
        Sun, 29 Aug 2021 04:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211218;
        bh=97TeRtHLoGX+wDZ+bDnkQaKfMjJ4HXtaNYtdDkpfNe0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SlOn4jvbUUAU3e1Es+t5wdJBRF+KMm/OZPfYqMaTA1QG6NC2OKHbwaCCTogzSewQN
         aa2IAa2Cm1Wa2fc8y04rW3OlJOotxLAV/L/SgxRz5k2L3xvSz05Fnz5tQA96g6auF1
         xQ7Tq1W20FuHz02fVa8Ux7ehEOsozkaki78H9Ty2WWkapFqKxjby2vQ6qgdGb7OxSo
         YLXPAFoFt6r6RTwDnqVRJedPae/JVSdJdwt0BxqrNSdtBjOfPh9c3EgiiaAqaGKEFZ
         saPdCvmodASNmzZaE2Wvs/tx1WbghJhHWRWI//14IN397JWhV6auWMfnnZaKyVKSFy
         d5zjKV98FvMfg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210818065929.12835-3-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com> <20210818065929.12835-3-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 2/3] clk: zynqmp: Fix a memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        git-dev@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:26:57 -0700
Message-ID: <163021121742.2676726.10032390563315862314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-08-17 23:59:28)
> Fix a memory leak of mux.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
