Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B6C4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C094260200
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241915AbhHFBx2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:53:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBx1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:53:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADF9861184;
        Fri,  6 Aug 2021 01:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214792;
        bh=u7C/ZYBp1+uE98Vmc9rEo6WQcoy2ptqGLdTnaPr/4yY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WnbPUGZGDUC1u020fKQuOFCakYIOZRNgPFdIEynN7xRUYPF/7V7+97aTl55Dt0D49
         1lipGpM1iypaOX7x+hcOLGvdNAyXi+7vJm16l1wv+5ct5L7QpKPt3A+Uuoigkw2a8p
         qgrcMI9l229hkoz3D9NeWe/3ncs9xnv5RAYhIiQOxZgBU2DCx2ELmsRh0Db2AxcR+4
         0CAISaAym+Q+7VYLlGsdJDxzlR7AotGQauiQDclwdA7xetX4HMHqwSjG/iOTKKja6D
         Fp09GIvZtUlPTzCNTTyNC7eLCpqh/IV6EoZdIYjiCldTYJQr9+ywwozlb0P2oxpvrE
         PVJirN8VEZnkw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210704024032.11559-2-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org> <20210704024032.11559-2-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 1/4] clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 05 Aug 2021 18:53:11 -0700
Message-ID: <162821479146.19113.12449981882393634486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2021-07-03 19:40:29)
> The clock source for MSM8916 cpu cores is like below.
>=20
>                         |\
>          a53pll --------| \ a53mux     +------+

Applied to clk-next
