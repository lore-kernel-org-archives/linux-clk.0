Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E94FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 21:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbiJ0ViH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbiJ0ViG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 17:38:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3CD72B44;
        Thu, 27 Oct 2022 14:38:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 574B06251D;
        Thu, 27 Oct 2022 21:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50F1C433D6;
        Thu, 27 Oct 2022 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666906684;
        bh=ix0PYNSgySxYrk2hW53SOaFo1wchmy/qngotI3mQ60k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FlFwi1il3n7gBMxfgVrNJHlUjGgX+AciY8MIdiEaGdPowUVvmFaqwoDIdAAvUyz8r
         Tf8gYxd+LhXstF12EuFWTGB0ocYBgB9ijMpNhxE+Lg8u2bDSWAxU0Ceq7l9lOl471Z
         jJqG0ETuCxQEOXFJo6y5V/QH8jc59WscPn0XIq5/tjtflucFgwi7KuafLLqD5mamM8
         KzK1i7ALvc86YY3YPBmDq1Vbbsp9RZcg1bJRRXBtfwZ4ucwfSRidwnKjBpbTbZ8Nw/
         NNGQkPO7Rjcfti+FnIFSa8bsb/LpgkxPlHA3iaKF3koqB4JOovkbQS5FaoWd8AB2BM
         vV2vEqjWpfZ9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eeb3e06d-316a-1ff8-b4b8-c257fa03a206@quicinc.com>
References: <20221026190441.4002212-1-quic_molvera@quicinc.com> <20221026190441.4002212-6-quic_molvera@quicinc.com> <20221027182240.E9FA0C433D6@smtp.kernel.org> <eeb3e06d-316a-1ff8-b4b8-c257fa03a206@quicinc.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: qcom,pdc: Introduce pdc bindings for QDU1000 and QRU1000
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 27 Oct 2022 14:38:02 -0700
User-Agent: alot/0.10
Message-Id: <20221027213804.A50F1C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Melody Olvera (2022-10-27 14:31:08)
>=20
>=20
> On 10/27/2022 11:22 AM, Stephen Boyd wrote:
> > Quoting Melody Olvera (2022-10-26 12:04:41)
> >> Add compatible fields for QDU1000 and QRU1000 pdcs.
> >>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> > Is there a reason why this patch continues to be included in what is
> > otherwise a clk driver patch series? Can this patch be sent separately
> > from the clk patches (and not Cced to clk maintainers/list) in the
> > future?
> Sure thing. On reflection, this belongs with the misc support patches.
>=20

Thanks!
