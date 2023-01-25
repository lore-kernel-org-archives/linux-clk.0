Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79B8C27C76
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 21:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbjAYVwF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbjAYVvw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:51:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE655C15B;
        Wed, 25 Jan 2023 13:50:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C32F61637;
        Wed, 25 Jan 2023 21:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33A7C433EF;
        Wed, 25 Jan 2023 21:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683425;
        bh=oyA/Tez4Ap+XFGXy08DwLinBl33EInJYI08BAAS822k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UMv/Kp9FTMJ3b1EXyg4RWveUgexYdOCU3gilFhvXgyb8uAoNn2+CrXjYcbxtXsqs0
         n7KIIc+3P8QrPAGogJluLtmV5cGs4F7bpSsKnpEmuf6fj15woICQMVkcrP5Kf56NOa
         jEGiKGrRh5Dttg/L97u93t2By0pk9VZ+I4Ab/VUKb64HcauF/ptalFXl8j3uJOoqg+
         gBcTppBRmhGh0u/pPtbTC3tZJfVQXcfhZhTObOyWwtj6JtTRj7yqvZwMEptj1MoQcY
         bB6EmZe39UWGNM7JGyzixdYYwi+1xWu75jlvLTF7MMTzVd5s26bOYtBq9YN469m6vH
         JwqT1kXTJLLPA==
Message-ID: <93cd9ed6f7b0a47abdbb0ce2782bed9c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-9-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-9-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 08/12] clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
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
Date:   Wed, 25 Jan 2023 13:50:23 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:58)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
