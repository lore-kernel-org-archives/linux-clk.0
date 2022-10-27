Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F55ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 18:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbiJ0SWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 14:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235517AbiJ0SWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 14:22:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091504621A;
        Thu, 27 Oct 2022 11:22:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 987FD6243A;
        Thu, 27 Oct 2022 18:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FA0C433D6;
        Thu, 27 Oct 2022 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666894961;
        bh=UvYccBMXQpd8jcmhcnu+u0g9XscsdMXPp/rPJPdrT+I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PnKrsKLWA8Gxu55XbI/ou+wUMB0AoPZQ13su9+TW8hCpGMLTTrv618XuWK7PUMVN2
         KqIdMbpbIpdA2Migoh/gxwam0JIlcJDIbz7SuSyTuX2ZpTfub4vpUBGl0nODFY2c4s
         FbWHekrEvrd7rFK/fRc5EghvrwNNo0DFo/9Y9YhGoL2AXaqdwt9ZDHfNalX/ILM/Nl
         C2n8udSbyJg/7Q74KalZPqOHSNEKWpBTUmTrJ3rO6I7IJ99NZl3VVAFpwxxqVA1sgU
         P1svdD4nZeNMISZknPmtqjpAtin4drW2I8V2Do+NlY4Gr+3MlyRhJy0aCYytkihao4
         ZjsMUiLz0Ij3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221026190441.4002212-6-quic_molvera@quicinc.com>
References: <20221026190441.4002212-1-quic_molvera@quicinc.com> <20221026190441.4002212-6-quic_molvera@quicinc.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: qcom,pdc: Introduce pdc bindings for QDU1000 and QRU1000
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 27 Oct 2022 11:22:37 -0700
User-Agent: alot/0.10
Message-Id: <20221027182240.E9FA0C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Melody Olvera (2022-10-26 12:04:41)
> Add compatible fields for QDU1000 and QRU1000 pdcs.
>=20
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Is there a reason why this patch continues to be included in what is
otherwise a clk driver patch series? Can this patch be sent separately
from the clk patches (and not Cced to clk maintainers/list) in the
future?
