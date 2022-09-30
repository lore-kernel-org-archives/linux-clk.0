Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181E0C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiI3Unv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiI3Unr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:43:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53AF1F44D7;
        Fri, 30 Sep 2022 13:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76049B82A01;
        Fri, 30 Sep 2022 20:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFCCC433D6;
        Fri, 30 Sep 2022 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570624;
        bh=CYrMZ+br3rGgO5alRpMgozZwcHGVfeVSNY54c/7sc/c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TU8v/Wo8CmYFQNEEQmzfFig4QPKRLc6bJJb2F5YN26O1EIrnazQPYeYZlsx6gKErg
         13ye8SIaiBAO9wUxhM9xA8fxsRRGUWd9VuqRP4+ElMQ/454ZI64P93L9svWoJinTf8
         ADo3hfM6B1xS2cXIBhNsLlUJcy9RtSprIAT0isj8oxuvAJM+r1NO50cVH8VkXxSWn0
         9HktVn8t5t3iJWuTiPuLU1n8eH5TX5zuyDTE+hBANpX+dzsJiB6tgBNEA8oNMhBIEz
         29yHfRUgtDn2965pCEmLJ7uwuL6X+X7xayutTM+ABcsT/JWJGrfPv5C9OIENOs3NwD
         yFfuiD1me6N6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-3-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-3-doug@schmorgal.com>
Subject: Re: [PATCH 02/12] clk: mmp: pxa168: fix incorrect dividers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:43:42 -0700
User-Agent: alot/0.10
Message-Id: <20220930204344.1DFCCC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:27)
> These two clocks had multipliers and dividers that didn't match their
> names. A subsequent commit goes through all of the existing peripherals
> and ensure the correct clocks are being used everywhere.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
