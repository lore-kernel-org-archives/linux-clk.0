Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC219C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbiI3UoV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiI3UoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:44:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693E21F34A1;
        Fri, 30 Sep 2022 13:44:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B19CB82A00;
        Fri, 30 Sep 2022 20:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDFBC433D6;
        Fri, 30 Sep 2022 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570651;
        bh=CfGZvWSdQGdjbD5BwFXd7IvKWc9UfQgIgoQ2WEogQBw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TBNmBeo1ZX3nKD6QmXyajIzahhbEm+NozjGdxTyPQKLMxzRDTU/Lydso6AwQgM6CW
         ifOGQHviBkLQjSjZ+Vq0INaobJ8DYhUROzzSVoBR2bG0bwyfyQXW2DOpxCCz7NLhVV
         vcJQ+1OlOxf7ZHpfy4kFl9m//fS2qWKL9SCweUAZdVddwGmuJGPobFrcXUrL563U/R
         eT0uvcH7/Cn5vHjygPph3dsV4alm9XskDOJHpJbJF1nEWHN2IVrZXiqFE8Qycb6E5m
         Xxa+U+nVwEzKxUxfCFUWWBhMhRR7nF5bnXUrDD52F4lv+EiXh+phr/nFmyu/mDK+RI
         9Q+9+hD+LyfQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-6-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-6-doug@schmorgal.com>
Subject: Re: [PATCH 05/12] clk: mmp: pxa168: fix const-correctness
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:09 -0700
User-Agent: alot/0.10
Message-Id: <20220930204411.CCDFBC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:30)
> While working on this series of patches, checkpatch recommended that
> an extra const should be added to the mux parent arrays.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
