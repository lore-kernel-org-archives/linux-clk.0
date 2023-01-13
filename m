Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AA4C54EBD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 00:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjAMAfe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 19:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbjAMAfd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 19:35:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB386132C;
        Thu, 12 Jan 2023 16:35:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AECDB815FA;
        Fri, 13 Jan 2023 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E21C433EF;
        Fri, 13 Jan 2023 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570130;
        bh=hFUBvp6L+rmw5MY62tfaAam+gdYWAa6PBzqrih4E2FI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dJouYXlShToFt+kkDoZr3vbPVBfpnUVBJDe+PMUhiOp0NJvx3J7p+9eASKzk7LuNm
         RwfMXaF1LO6oPJCoCl/wEkrgSeCzDShX18hr+3J4IFYzx7lym6yy6KfxUVp3+uLuUt
         D/HOr3XI7pi2sRJhwhLHVAuSCHDiL3DOpJyr5pFzljKXvCqbOUKyzyXsZMeezCNrak
         06ZaRme8i9hqd/gzNiT35vhxPzcausRbASi3rEjQ5ljHMwbEj63/eaW/8oV4j5Ghz5
         WfTsKV8TbDu3deVCrmQuC8AmTl8OijLPNN7I8liugz+jJYasaYJJ2n3emunWT6BzHQ
         mj+v4MWwcSYzg==
Message-ID: <c825677a998c0c94e78746e0faba7cf9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-12-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-12-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 11/16] clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Thu, 12 Jan 2023 16:35:27 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:32)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data/names/hws easy and errorproof.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
