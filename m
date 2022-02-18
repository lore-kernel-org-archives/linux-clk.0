Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1447C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 01:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiBRB2h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 20:28:37 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiBRB2g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 20:28:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C6F3A19C;
        Thu, 17 Feb 2022 17:28:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43143B8253B;
        Fri, 18 Feb 2022 01:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA554C340E8;
        Fri, 18 Feb 2022 01:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645147698;
        bh=jhzByY0/VWFNx3dAoANaAk2W/OZcMkfg0NTGzj6TXko=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tPPcj5rEcJd3R4iuX45H/GGG8uEU6+fY3k2453ABEBP9VCmFDKqlWRT7oUvmU5iGP
         wpJ55Wvg/WmXDTVhNO1S/8W9emE1U7teHm6fabsuzOVBOvNFHfrDT9AcPxdFgz0tmF
         wsqTwgBK2FgyAPXJv9/Q4EKp0v1hAN4yByrfzF/eW2dnPH1AKd20cHPwS0GAn8IRBZ
         BXP5VVJ07bPtpMoFDqVaHLCvNee/OUSvoYivDokYyBP5vO3KYbQM42Ayzxs13eVGnB
         DUrxUcW4n1u5ugTZKRvt4jks7pKPlEKz/VuIVVD9J75MIN64/ypfXCBzvRjTn1wM17
         cH0HHSM4PsUiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7605efbd-1a5e-ef80-5638-8376a325e3ba@denx.de>
References: <20220213173310.152230-1-marex@denx.de> <20220217233954.6C8ABC340E8@smtp.kernel.org> <7605efbd-1a5e-ef80-5638-8376a325e3ba@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Thu, 17 Feb 2022 17:28:16 -0800
User-Agent: alot/0.10
Message-Id: <20220218012817.EA554C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-17 17:09:26)
> On 2/18/22 00:39, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-02-13 09:33:09)
> >> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.y=
aml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> >> new file mode 100644
> >> index 0000000000000..774053748d9f0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> >> @@ -0,0 +1,102 @@
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - '#clock-cells'
> >=20
> > Can it operate without an input xtal?
>=20
> Not to my knowledge.
>=20

Ok please make it required property then.
