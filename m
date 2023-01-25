Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB363C27C76
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 21:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbjAYVwN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236633AbjAYVwA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:52:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC9F18161;
        Wed, 25 Jan 2023 13:50:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA9E961617;
        Wed, 25 Jan 2023 21:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5E1C433D2;
        Wed, 25 Jan 2023 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683457;
        bh=0gyDhM1LxrmzhUis0dD2+k5vEpVEhpKs/NGtemgFdWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j0EGUrdZ5Bk4v6cg33QD6pxpIdSDEbYZJFRsOZgzh2tiNtqa1T3U51pIJIp1OAXGl
         MgzC4Uk7rpcrt1EQeVNgIx0JbGCrNw7XDD37DPHMPRWgM1fO08NmYv+aEKt3FHU0kM
         rpzJWdlTcQhrMmynfu0sD3aOBAVvTxJpt9nLzGfkxQqN2sRccbgCBjhyp+DbwO8KeX
         z8bTluwpg0rwWGup4z4ofBDyLOg2GPF1CXkyq+TgAIsXfQtHK3ONYF92VtlGyg8rnk
         z5WMLTT8gMBkoodhJGdyyy5AKaml5TwG3C7ehOPGHPOzG8HGqoQ+1e0dCf2NCcrCmG
         BeAkCR1brK/lg==
Message-ID: <44fcadf0cca3323ba97b33ee695eacfd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-11-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-11-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 10/12] clk: qcom: mmcc-apq8084: remove spdm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Georgi Djakov <djakov@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:50:55 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:04:00)
> SPDM is used for debug/profiling and does not have any other
> functionality. These clocks can safely be removed.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Suggested-by: Georgi Djakov <djakov@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
