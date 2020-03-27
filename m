Return-Path: <SRS0=mPu9=5M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FC3C43331
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 06:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D93E20716
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 06:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585289801;
	bh=EQr83JWSBv6qrRnaDVc1g+6yUSfEfLW3jrCAgc9qu/E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=jcuciPX6DhIkGcRi5PWo6R8aACKQrcimEzoi73NfkkwNTIsWlPaVejh7qUZw/DVTZ
	 1szAp2EWD/ypPcE1EthwfhFozFWf3F+iHtKUMpzyJRJQz6XvIpTaaHOPO0VbCr6JGC
	 5IQ0qx4q+017WUeXR+mMD7f8h10Ix5u33lGcIfoM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgC0GQl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Mar 2020 02:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgC0GQk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Mar 2020 02:16:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C12D206E6;
        Fri, 27 Mar 2020 06:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585289800;
        bh=EQr83JWSBv6qrRnaDVc1g+6yUSfEfLW3jrCAgc9qu/E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gZ1o2O886u06hI24Bjx7LwiOcO2y2fDWKnO50ZSSPPDuWS5iQuSph+OIlO8S6KAfT
         +uovvR9f5MvWKFVT/CddBOoUN6LWaMqAo3YUx2TGTerSZZYv4cyeAds3Erb30X+tv3
         mBflNXYa9o5Xqr75n35oRmolrEnIa1Y20ZYt+r1g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200326171933.13394-2-festevam@gmail.com>
References: <20200326171933.13394-1-festevam@gmail.com> <20200326171933.13394-2-festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: imx8mm-clock: Fix the file path
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Date:   Thu, 26 Mar 2020 23:16:39 -0700
Message-ID: <158528979960.125146.197956427405057469@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2020-03-26 10:19:33)
> Currently the following warning is seen with 'make dt_binding_check':
>=20
> Documentation/devicetree/bindings/clock/imx8mm-clock.yaml: $id: relative =
path/filename doesn't match actual path or filename
>=20
> Fix it by removing the "bindings" directory from the file path.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Applied to clk-next
