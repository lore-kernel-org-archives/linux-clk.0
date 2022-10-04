Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB56C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 03:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJDDyJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 23:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJDDyH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 23:54:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F48720BFB;
        Mon,  3 Oct 2022 20:54:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 066E3B818F9;
        Tue,  4 Oct 2022 03:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90338C433D6;
        Tue,  4 Oct 2022 03:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664855643;
        bh=ujHEZHhUHzNSsXzRgFH4/o/r/QxfMcUb/AE7VpSuEYE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YZir0L19tYUe+VrtKeYvi0J/Ph0vvlYOFF7923f4GRBggeJ7IU2P9We8dJSCne0L0
         ng3xLSQKxpS+/Mgjd5plQ4LAKq8wZyZ9rmkBlIVecXK0qsFEEheOQmToceWQXtAX3X
         2LoMM8NMKAr7wYjlXwuOIVm237C1JkHubazFreCAC1CbpIkemy1qe6K3vZBXO4jMat
         exsyVRoNCnX9m4u4tKiolXbf/+LiAAqgumJWnGxSCVKTpuH3hpbiGwmAQAgDCktChg
         Ad3QiUpwAHimeu6onGld1RxPowpMDQHek6mPDURapjncaAYr3QdxVEwLPLlrqYqhF/
         hCBsi2milcHEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221003211438.25691-1-konrad.dybcio@somainline.org>
References: <20221003211438.25691-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm6375: Remove unused variables
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>, agross@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org
Date:   Mon, 03 Oct 2022 20:54:01 -0700
User-Agent: alot/0.10
Message-Id: <20221004035403.90338C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2022-10-03 14:14:38)
> gcc_parent_data_15 and gcc_parent_map_15 are not used in this driver.
> Remove them.
>=20
> No Fixes tag, as the commit introducing it is still in -next.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
