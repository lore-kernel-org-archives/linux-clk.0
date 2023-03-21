Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A12C6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 17:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjCURpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 13:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjCURpX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 13:45:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEA32448A;
        Tue, 21 Mar 2023 10:45:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4CBACB818D3;
        Tue, 21 Mar 2023 17:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2931C433D2;
        Tue, 21 Mar 2023 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679420715;
        bh=N3J1/tOTpmUVVtlZBsmsKwvceQFZJ+nVYVRndnoaBKc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VIF/lRfRgRLDv9oGNCbhKz07Zf1QpSuheZkRJ2MVg7FQqLDg5eQGQDXRKn2WqNq+h
         n4ZHRqtdT1MvnAdm2aVgQlZRUPO2kgvoWUS/EDybdaLdR0rM8B7Q7Ux+3IPmoPlZyi
         2cqqEXrQxLNtYywSUpec6MidpatcMs+F8fEAWgfcYzLACVtRgPVBU4R4LvEMrbNP8w
         z0uwcfO59LQmRtT4OS9cpQ8Fxu1VaK/EjQttg82pJS9d86XBbSMV/1w/zuDG9p3eH/
         L/p4PMkS1nBpEbUIVWfiSrbGBhxF4sbMbWcmHsIiQHnf5XX1mH63KxRhHa7JlQWMWo
         jVi49K815wd7g==
Message-ID: <a1a827bcdc4bc6ceb50bd1cc6d47df66.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <24293be77ccdcf5e9b1fa0fd219de6152f234616.1679388632.git.quic_varada@quicinc.com>
References: <cover.1677749625.git.quic_varada@quicinc.com> <cover.1679388632.git.quic_varada@quicinc.com> <24293be77ccdcf5e9b1fa0fd219de6152f234616.1679388632.git.quic_varada@quicinc.com>
Subject: Re: [PATCH v2 4/8] clk: qcom: gcc-ipq9574: Add USB related clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, kishon@kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, mturquette@baylibre.com,
        quic_wcheng@quicinc.com, robh+dt@kernel.org, vkoul@kernel.org
Date:   Tue, 21 Mar 2023 10:45:13 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Varadarajan Narayanan (2023-03-21 01:54:22)
> Add the clocks needed for enabling USB in IPQ9574
>=20
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>=20
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
