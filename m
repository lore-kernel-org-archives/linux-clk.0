Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5B7C7618E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Apr 2023 01:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjDYBOc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Apr 2023 21:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjDYBOb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 21:14:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086C35272;
        Mon, 24 Apr 2023 18:14:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9147F60EE2;
        Tue, 25 Apr 2023 01:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA10C4339B;
        Tue, 25 Apr 2023 01:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682385269;
        bh=GxmMXN8bjubx8moTEEB2GPp+bfP/IUpllK5wYlBvT34=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sfog3bHGqRFSQ6oDsyqkt7gsW70igSL9FIaoj4owAGixxP3LgBusV/hOGO+twEYzI
         42VcJkwovaQJkkserzhQx1cOJpq4/qnFZXqUa729/eYHjGFS+/meY+NXbhvoxgridR
         OXKPFGj07E4p3yN8QOS9cHWFM33TVQL3A1hQYOz35YWuh1jiFn1nKSkdL/GyUCkr6l
         HuViNHQO2Zfj9fnAVvGf5u6N+uPDo16iuLE/FCeuDF4wktkT0St9+cvlfxbSvz23DV
         CC5AjlOjlskVoW8ShveHnj9g+S5E81DPnxBzR7KzhEMdW+BZjOzYCqJxm7Zcy86J0q
         Q0oQITZUp06tg==
Message-ID: <477c7845dcc5f3a2dfbeafd2088a5e5d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230424144536.277508-1-andersson@kernel.org>
References: <20230424144536.277508-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Clock updates for v6.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Otto =?utf-8?q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Rayyan Ansari <rayyan@ansari.sh>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Tom Rix <trix@redhat.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Mon, 24 Apr 2023 18:14:27 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2023-04-24 07:45:36)
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>=20
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.4
>=20
> for you to fetch changes up to 32c2f2a46db1322caaf78d5ea747ed5c56d2e353:
>=20
>   clk: qcom: gcc-sc8280xp: Add EMAC GDSCs (2023-04-24 07:22:01 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
