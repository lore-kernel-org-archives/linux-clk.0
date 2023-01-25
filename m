Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD7CC54E94
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 21:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbjAYVwJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbjAYVvz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:51:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DCD83EA;
        Wed, 25 Jan 2023 13:50:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 58877B819C5;
        Wed, 25 Jan 2023 21:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FCFC433D2;
        Wed, 25 Jan 2023 21:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683439;
        bh=3SjkO0GmYNBZ2ltL6fzcqvrVQsu4D+gp6oibH4ukQVk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tzyd4PpuBE1YSHezOV7fwCQ02zNDVGWJ+pAsy/+QEBP2X0IAsalMlBxgPZ7ycTcaZ
         uMPL4oEz+UUQhASiDpklbr8DsTv9AyfPNeMqBFBmDSLvNhNqbU+3B6VFVSTSAG8jbs
         CptBPVXbG1HrHwfxTMHCOEeyIPoNuhABvYXTFMQ12EWcJ2F83zLARjvidqG0anu/fb
         r79iJ99JVWi5ev+xHcISCz10muyF2E/5wGnftlzjSpqkjbA0YLZJUyS28qdpekD/49
         VNbZ/HLwQioyqMyt1a1LOEvcfNSWb28WMvI10A0x6n6Plq8nKctqTOi38BJnjjI1tX
         tvz91uxcje20w==
Message-ID: <9face676b401ed68ffbb74012ea20cc9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-10-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-10-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 09/12] clk: qcom: mmcc-apq8084: move clock parent tables down
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
Date:   Wed, 25 Jan 2023 13:50:36 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:59)
> Move clock parent tables down, after the PLL declrataions, so that we
> can use pll hw clock fields in the next commit.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
