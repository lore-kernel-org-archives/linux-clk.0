Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3554FC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 097BC239FD
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgLJAep (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:34:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:55914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgLJAem (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Dec 2020 19:34:42 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560441;
        bh=ztRy3RwegMmfhpEloe43oPsN/BkuuHHg7xxYZn3AIN0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bkRwLXF0B5d/nwNhTR3YONsLelEv9fhYXUJMStHdaOPOSKB3ErQvwme2JekM7K7PM
         48Jr3YUcfyrtbJMJWIShj0uCk2sQlfkxZn0hepKy8knRgyGPbvkOvU7sbdmEq1HKhq
         u84a6W9mr2jPiV5UJ+w03eESGg+cA2L2AqmxjqxP953HHEMe7KDNM4+UTS4RwZD9M0
         2isrs9W8iIRtOoJEci+TfRFwpUxeLBtBGzV5FS6JWWLudEjn0lXHergac70YlOiAPL
         HOvCXcd8BTT0/ntSeu0NiMglvAEyLhl8SmXilvhvKG9iicCciYV2eFugwCLX1fLgbS
         e8+p58KTXW23w==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-3-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-3-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 2/6] clk: qcom: Add SDX55 GCC support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:00 -0800
Message-ID: <160756044021.1580929.16733790599661869369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:40)
> From: Naveen Yadav <naveenky@codeaurora.org>
>=20
> Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.
>=20
> Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
> [mani: converted to parent_data, commented critical clocks, cleanups]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
