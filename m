Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF74C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B924861477
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhF1A0z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:51438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhF1A0z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:26:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86C5B61477;
        Mon, 28 Jun 2021 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624839870;
        bh=KaPAjvJRfqmc9aUNbV2JwuLFTi2lX/IOhttlmn7vfh0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pDBrTAw4LIDDS8HTvATeccj22VNq2zEcKVMjBmNnlXr3kOqMfGKZBrBG6DckmnMet
         b9+JU9KL11GySFZ1NzQeKp8p9b29g3XxaNWCKUy//9fBChslD3ciGHoAHpibW9qB8X
         64n3tc0l4SBIcLYlGz0c8vzW4/jHo3nmgi86NfR0u72esyX6iaaxcLGzlOEyGISk+M
         JI8STn1vPHaIIc1o8Bccz4IanAYKXkBmngtuYgn9Ww19CwV6b2N47ZxblTAnKVOuVd
         VGWYINH1kAiexhj6gjraU5Yn6aN21RumV8qUxzUvJd3q8QM60VMcpCaghpiq6Dpwwz
         GDyvDQSZpvvzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210504052844.21096-6-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org> <20210504052844.21096-6-shawn.guo@linaro.org>
Subject: Re: [PATCH 5/5] clk: qcom: a53-pll: Add MSM8939 a53pll clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Sun, 27 Jun 2021 17:24:29 -0700
Message-ID: <162483986930.3259633.2041905014013624017@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2021-05-03 22:28:44)
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index bfa048dc01ec..8c6f8bcc6128 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
[..]
> +       { 1651200000, 86, 0x0, 0x1, 0 },
> +       { 1689600000, 88, 0x0, 0x1, 0 },
> +       { 1708800000, 89, 0x0, 0x1, 0 },
> +};
> +
> +static const struct pll_freq_tbl msm8939_cci_freq[] =3D {
> +       { 403200000, 21, 0x0, 0x1, 0 },
> +       { 595200000, 31, 0x0, 0x1, 0 },
> +};
> +
>  static const struct regmap_config a53pll_regmap_config =3D {
>         .reg_bits               =3D 32,
>         .reg_stride             =3D 4,
> @@ -98,6 +137,9 @@ static int qcom_a53pll_probe(struct platform_device *p=
dev)
> =20
>  static const struct of_device_id qcom_a53pll_match_table[] =3D {
>         { .compatible =3D "qcom,msm8916-a53pll", .data =3D msm8916_freq },
> +       { .compatible =3D "qcom,msm8939-a53pll-c0", .data =3D &msm8939_c0=
_freq },
> +       { .compatible =3D "qcom,msm8939-a53pll-c1", .data =3D &msm8939_c1=
_freq },
> +       { .compatible =3D "qcom,msm8939-a53pll-cci", .data =3D &msm8939_c=
ci_freq },

Can we push these compatibles and tables into an OPP table? Then the
frequency plan would be an opp-table binding and the driver can drive
the multiplier on XO (probably l_val) without having to hardcode it here
in the driver. It does mean we spend a bit more time at probe detecting
the frequency plan, but it would at least avoid the concern that Rob has
with multiple compatibles and probably make it easier to handle CPU
frequencies anyway.
