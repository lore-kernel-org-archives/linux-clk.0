Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31AFC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 21:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B559B60F9B
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 21:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbhG0Vl5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 17:41:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231755AbhG0Vl5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 17:41:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A6FF60F23;
        Tue, 27 Jul 2021 21:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422116;
        bh=mEcZ8rhbKxqpPpeD6dTsJWxfVkWP2r9ViT674pA+ly8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kZKoDf4kvFITeQ73uFUFXR+0yGUOE9mPZy392bFsjwgZgJFxP8n/vdICsen/v/f8d
         0uCuo4XSBd/aVBK8/CBLtFBLWj8N4rZQNOTDhksMhHz69R/AhVnY/tWjhpQcCIBfEo
         xk9pSdjm/puzd3+iKv18qoKbtdRUjmEv6wSTTYBlwWLnNX2QvDSxcW3HrVO7rsfgYf
         +KDdyxP4B/S4jHdfrtSlomawGUlOxjtsUJfg9j3iL2SnUenJpZhCJhfKj1C+tvFenR
         g7COxpTLmniPBeyGx3Io4+1gw/D+UX4hj8K0PP18gwJsOn8H4rtZUvyPFjyE4P60aq
         f0w2NHN2s+/hg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210627185927.695411-3-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com> <20210627185927.695411-3-iskren.chernev@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: rpmcc: Document SM6115 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Tue, 27 Jul 2021 14:41:54 -0700
Message-ID: <162742211441.2368309.7036071434081189234@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Iskren Chernev (2021-06-27 11:59:24)
> Add the dt-binding for the RPM Clock Controller on the SM4250/6115 SoCs.
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied to clk-next
