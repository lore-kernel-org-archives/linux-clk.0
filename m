Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C249CC001B2
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 01:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiLIBX0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:23:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiLIBXZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 20:23:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2222FBCB;
        Thu,  8 Dec 2022 17:23:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE25962103;
        Fri,  9 Dec 2022 01:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AF2C433D2;
        Fri,  9 Dec 2022 01:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670549004;
        bh=hE1SxyEr1fWbeGdpdh0yfTiK2ghK9RsbEC5DC9MKPok=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h2iVWv0+hjh3eDTfbXH2zxwmxvEY2LMRBm4Qwg3HEoR4N4btb9XPtxo+UmxLh9RDA
         +NhIZ8fkzWx1BLFEEBPkgPO1ltyjHSCDPkjskwOcrOOX53LjiPdp8rbb6BjId/MuoG
         7cfTPHxjVV8GqM4znrVZ3oxO7Yy6ext6e3qOqUT/WuJpv71lkg1rRmii84Nz5lj2aS
         eQ2KQYnvvZxrYDQmkYwp+foYU/pHZzZ01Euw3w8XHTUkmB6ZwifhtIB333ojldIrL/
         wGIpSslr5/ZNtQDdwuQdCkhMzva4oy6YL8YgMMlV2+PJt/F1FlhKPDkjIAi76Q+ezS
         RA0spYK3gRsQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221208141912.47262-2-dmitry.baryshkov@linaro.org>
References: <20221208141912.47262-1-dmitry.baryshkov@linaro.org> <20221208141912.47262-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Dec 2022 17:23:21 -0800
User-Agent: alot/0.10
Message-Id: <20221209012324.11AF2C433D2@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-08 06:19:11)
> Change gpll0 to use parent_hws isntead of parent_names for

Same.

> gcc_disp_gpll0_div_clk_src clock.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
