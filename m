Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98E9C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DFFA64E84
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbhBHRsl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:48:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:43202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233886AbhBHRrm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 12:47:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C574A64E88;
        Mon,  8 Feb 2021 17:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806421;
        bh=gdthpV38G/AIJ/AOjTg54x5o+7Io8nZ25ztXekrNOzk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=knQUIplZ3P1GZKrHdJZFSfMaXonAodq5F6LlyT4+7k6rsSkqum8IqNlcCCMNRvQUo
         DjhBH36Gcwgd0ZQQkkIB/s3dohyvQuqVgHuMR52MzD0BX49rQTK9ena711Jvkuowwb
         E52sCs+yxDHDQkLC3AvQDfwHIvZjaPn35O2O/zukWesAUFcv6XDytchOgCE3W/cOkm
         6s1TNejlbj69KlUh9Xp0Pk+IQnZ16c6vgdmMkYEiDbe9MFVM991w3H1Ptx7aEuT69E
         DmhBwFCmS/rQANUaIf/kD4rVm6haKRxTzREBpFPiZvKaotgP2KQZfxMBHtSEX29cFj
         kl7u7j9o+ZBiQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210118041156.50016-5-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org> <20210118041156.50016-5-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: qcom: Add A7 PLL support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 09:47:00 -0800
Message-ID: <161280642039.76967.16012787163094114326@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-17 20:11:55)
> Add support for PLL found in Qualcomm SDX55 platforms which is used to
> provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
> frequency clock to the CPU above 1GHz as compared to the other sources
> like GPLL0.
>=20
> In this driver, the power domain is attached to the cpudev. This is
> required for CPUFreq functionality and there seems to be no better place
> to do other than this driver (no dedicated CPUFreq driver).
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
