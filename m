Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3655C4167B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 01:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLIBVe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiLIBVc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 20:21:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC7DAC6D0;
        Thu,  8 Dec 2022 17:21:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E37562104;
        Fri,  9 Dec 2022 01:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0054CC433F0;
        Fri,  9 Dec 2022 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548891;
        bh=DKPT7J8lJghQRKRYiRO+gf5Epi/In/TlKje1orYJKjc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=loTQzyXGSUo8cd+OLarD7scA3SHjyPanNqUITILrXI4xbrwrSuByWsrf/HnbPq0Cf
         PRLYB3vi1ps4pAFzGPfz1VG15LpT8FGZDkWPD1P070zn9hmwG8Ssl66UK52wdZWbIW
         MpW0eD/pAd5jG7VQiS6EmHkl/a4xbBPtJ8MiFmT0lp1XDf8sdZiNbd1U4Ny2rwWfEd
         Io7edpIz442aK0WV87acZ7kqfiHrHnDkeAV7EpbK6/QNvggDJpSuj5xjBzcvt1fdd7
         ytpbd79DdiEsmso2BbCKhZ5mTObohxc6FwA0gOnLK+HANv2WppJX1xi5tIOMuXGWK1
         7ISoov/AhSSaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
References: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Dec 2022 17:21:28 -0800
User-Agent: alot/0.10
Message-Id: <20221209012131.0054CC433F0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-08 06:39:45)
> diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-=
spmi-pmic-div.c
> index f2cf55cee2fd..aa015c51ab4f 100644
> --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> @@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops =
=3D {
>         .round_rate =3D clk_spmi_pmic_div_round_rate,
>  };
> =20
> +static const struct clk_parent_data clk_spmi_pmic_parent_data =3D {
> +       .index =3D 0,
> +};

Why not put this on the stack? clk core should be deep copying.
