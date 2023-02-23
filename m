Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087CFC61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 18:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjBWS4t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 13:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjBWS4s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 13:56:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7151B334;
        Thu, 23 Feb 2023 10:56:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1E43616DE;
        Thu, 23 Feb 2023 18:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36E4C433EF;
        Thu, 23 Feb 2023 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677178607;
        bh=lh3O4K2uQYYnZm7iTsoHpc8yyCCA0Oz/2ar/BdqkP9A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KtdqBOHFcm6dbujpia/0OPv05BQR3esYI5YtUqhd3MgA+S9Dr/bRZVJ8/uaTLiJR8
         T2aKoSR8KfbwCST9mJ9eZ24gSaQUfxHnXp2p97bGrDBgGi1JgaO6ap2SRZUxaHboJp
         /a8S0CdB635QJjJ9Fw03pBvEBI2m3IPFXX33W78A1zP5mmEjVKVOEKiJFUji9hsPsu
         cZNhuBk+kXvBRQ/eWTnb497++W7JCVh6bskSOvE5FUi5HMBe5CgWdb548ZyZBfTBsM
         1PvBNsy1xf0415oHHK//EXhU6/+VvLp56H2G7EhO0Cd7KW8Hzs8XobXqoeLfSRP59f
         fZ8whthewFV+g==
Message-ID: <b0595f7a7d0a4b263abd22dd6256155a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230222153253.3105863-1-andersson@kernel.org>
References: <20230222153253.3105863-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Thu, 23 Feb 2023 10:56:44 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2023-02-22 07:32:53)
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.3-2
>=20
> for you to fetch changes up to c1855dd0a62b7ead360eb9231fb65c2108efaf47:
>=20
>   clk: qcom: Revert sync_state based clk_disable_unused (2023-02-22 06:34=
:08 -0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
