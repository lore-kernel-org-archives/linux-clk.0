Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5D1C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 21:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjDSVhP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 17:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjDSVhO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 17:37:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A37BC;
        Wed, 19 Apr 2023 14:37:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95DDE642BA;
        Wed, 19 Apr 2023 21:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA52C433EF;
        Wed, 19 Apr 2023 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681940233;
        bh=oXbP44FFeom1UFaKGtZXbWp0wlf68kOkYhyhd6aJL3Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RjLTR1zy537E9p1rG6cwCaRYJr/ui6DawDDXijTR5TlVVGT7yw2VNznJz+Ag358MK
         Ozqx9RqDI+/30epaCdTIvOzAg88ml3LbzNzNaGwa21YjBr9cd6wPPv4D3mUtQ7bnZk
         +gTIMZT0OkaDVNsgdQjmduI420pi/0FZpnE2JCRqgAaYRYuDAr7wUt2stxSvCTY3FK
         McvQZOaCpXQGJ3tmVOYciW/HI7PMI3NBHF53iuLILNEtRto+slcLf/+n3FMoudjwrV
         /nBXdRyfoyPZdcmd7iIfVjfNSJO/HAo1J0GZbhUEJiY8IvPGcs8055zYFsNjTSK84h
         HGpt+ap81dNuA==
Message-ID: <0dc457cbd13ea76a3aa3c70b2a31a537.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230419133013.2563-2-quic_tdas@quicinc.com>
References: <20230419133013.2563-1-quic_tdas@quicinc.com> <20230419133013.2563-2-quic_tdas@quicinc.com>
Subject: Re: [PATCH 1/4] clk: qcom: branch: Extend the invert logic for branch2 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     quic_skakitap@quicinc.com, Imran Shaik <quic_imrashai@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>, quic_rohiagar@quicinc.com,
        netdev@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 19 Apr 2023 14:37:10 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2023-04-19 06:30:10)
> From: Imran Shaik <quic_imrashai@quicinc.com>
>=20
> Add support to handle the invert logic for branch2 clocks.
> Invert branch halt would indicate the clock ON when CLK_OFF
> bit is '1' and OFF when CLK_OFF bit is '0'.
>=20
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index f869fc6aaed6..4b24d45be771 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -48,6 +48,7 @@ static bool clk_branch2_check_halt(const struct clk_bra=
nch *br, bool enabling)
>  {
>         u32 val;
>         u32 mask;
> +       bool invert =3D (br->halt_check =3D=3D BRANCH_HALT_ENABLE);
> =20
>         mask =3D BRANCH_NOC_FSM_STATUS_MASK << BRANCH_NOC_FSM_STATUS_SHIF=
T;
>         mask |=3D BRANCH_CLK_OFF;
> @@ -56,9 +57,16 @@ static bool clk_branch2_check_halt(const struct clk_br=
anch *br, bool enabling)
> =20
>         if (enabling) {
>                 val &=3D mask;
> +
> +               if (invert)
> +                       return (val & BRANCH_CLK_OFF) =3D=3D BRANCH_CLK_O=
FF;
> +
>                 return (val & BRANCH_CLK_OFF) =3D=3D 0 ||
>                         val =3D=3D BRANCH_NOC_FSM_STATUS_ON;

Do these clks have a NOC_FSM_STATUS bit? I think it would be better to
make a local variable for the val we're looking for, and then test for
that. We may need a mask as well, but the idea is to not duplicate the
test and return from multiple places.

>         } else {
> +               if (invert)
> +                       return (val & BRANCH_CLK_OFF) =3D=3D 0;
> +
>                 return val & BRANCH_CLK_OFF;
>         }

While at it, I'd get rid of this else and de-indent the code because if
we're 'enabling' we'll return from the function regardless.
