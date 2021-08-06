Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DAAC4320A
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35B8C611C2
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243267AbhHFBss (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:48:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhHFBsr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:48:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B025660EB9;
        Fri,  6 Aug 2021 01:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214512;
        bh=6VXSeL1v6HCPLkNUEYVVJtg+bJsTjNfR34UvSCqnm4o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FSvXiyMM5H3R9h5aZYloqALVrfM1irlh5krWCHWl7IU6djeuy44obfdeICilHpemh
         NszZDE3cArpXGFZ3rFpnGkADnGMywTySRmYQqtq5Ae6P9xdcUSBwI0bk8EQs6i5wEl
         zZyGBL20l+0KoES5xRoZdp+Kz3dZtkm7LNLln7wNLGXVu5E52JRYA6oKg8BBPxiKSA
         VLK9TSULkGQkLMfSzdJsA8MOWvCnhOvXSTJKlIpzrSQqFQ3eh1PabgrDc9mb52R3Gf
         Ok7E1BQySxs3zSR0Iw1IImLTjVJkbJ4ua+o8j8WhlOfQVbctxSUyTeqy8MqpS5OkOj
         LfAVRfEVJBq9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805222400.39027-1-konrad.dybcio@somainline.org>
References: <20210805222400.39027-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: rpmcc: Document MDM9607 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 05 Aug 2021 18:48:31 -0700
Message-ID: <162821451140.19113.16302449679138542084@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-08-05 15:23:59)
> Add the dt-binding for the RPM Clock Controller on the MDM9607 SoC.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
