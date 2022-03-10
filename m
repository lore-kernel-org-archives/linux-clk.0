Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12D0C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Mar 2022 01:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiCJBCL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 20:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiCJBCK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 20:02:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB56911B5DE;
        Wed,  9 Mar 2022 17:01:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75F95B81EA0;
        Thu, 10 Mar 2022 01:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5BFC340EE;
        Thu, 10 Mar 2022 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646874067;
        bh=6UEIgVOw8k+OrqS4J+lLdn3tPa3K3WVN7d7NXfC7aSg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=URGAioaF5PsegKj1xAeHmGbWrg0p+Q0EkJwQxmu6SuiWpwOygqhcQm0AH64PxYDSl
         MkiJuZS7KNNilzZyAfPEh+8b4g2Nf/NKSxawV1kkeIiC3N89Yk3SSPYG7cg8lA5/X5
         XnELM424Osz/DCwqbqOwGEI22qsOk0/o0DbKND0FGWnmVOvBr+6Gap6+lSQfbx7DUP
         BF/idcFwu34RhIRgdVtNScb/anzOLdmpYkR2XrGTB5cfHjKoeHvyXYH2wtOVM43w4J
         JajJGlrvlExddbvzHa6xjScBH1Qvei+zMu0B45moQ2dO/snGgFnjTcmkIquwNY9mSN
         YZ98DLQ5kweCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org> <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 09 Mar 2022 17:01:05 -0800
User-Agent: alot/0.10
Message-Id: <20220310010107.1F5BFC340EE@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-02-28 04:03:34)
> After merging lucid and trion pll functions in commit 0b01489475c6
> ("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
> the function clk_trion_pll_configure() is left with an old description
> header, which results in a W=3D2 compile time warning, fix it.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
