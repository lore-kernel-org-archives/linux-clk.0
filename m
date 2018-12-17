Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221BAC43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E79DD206A2
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545075230;
	bh=0IbSh5wJzKsX8p2reer3lAnIpOfCCmXmbxn2u641xVU=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=q64AZg8QiHt3YJ97FTIO8pblRKJMOmEfIzCWKccHEAfek9TCgnOJSLFBMjoMDJ8Y/
	 k7Wr90vEqatgubCebztAoH88GQIs8nBXPOwYQR+0KzW+HgmA62Kmuc5bmF07rgvPEU
	 C6nmGc3/8u5rUOMz/Ly5sSkL9PE4r9SZrmcUktq0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732429AbeLQTdt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:33:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:45092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbeLQTdt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 14:33:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BE7F206A2;
        Mon, 17 Dec 2018 19:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545075228;
        bh=0IbSh5wJzKsX8p2reer3lAnIpOfCCmXmbxn2u641xVU=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=SMT1TFOoogH2/8uY2qIrS0iwWwmI8sZh4MT7IFx15mLK14RgOOZ9VoEUyIfJQxQ4e
         tiXkzqshcu+VJpjsj4ZilG0BQoXnDjmm/nE9iHQSVaxOqO7QHrXN6ytP2IzegUDA/Q
         R2DJsFjVTE/EuGjDzEfocSa5+MVJmDsU8eZg/wKU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-2-govinds@codeaurora.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-2-govinds@codeaurora.org>
Message-ID: <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 11:33:47 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:51)
> Add device tree bindings for WiFi QDSP subsystem clock controls
> found in OCS405 soc.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

It was?

> diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Do=
cumentation/devicetree/bindings/clock/qcom,wcsscc.txt
> new file mode 100644
> index 000000000000..2b19ef0b5689
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> @@ -0,0 +1,26 @@
> +Qualcomm WCSS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible           : shall contain "qcom,qcs404-wcsscc"
> +- #clock-cells         : from common clock binding, shall contain 1.

Drop the full-stop please.

> +- reg                  : shall contain base register address and size,
> +                         in the order
> +                       Index-0 maps to WCSS_Q6SSTOP clocks register regi=
on
> +                       Index-1 maps to WCSS_TCSR register region
> +                       Index-2 maps to WCSS_QDSP6SS register region
> +

Index 0, Index 1, Index 2? Not sure why there's a hyphen there.

> +Optional properties :
> +- reg-names    : register names of WCSS domain
> +                "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
> +
> +Example:
> +The below node has to be defined in the cases where the WCSS peripheral =
loader
> +would bring the subsystem out of reset.
> +
> +       clock_wcsscc: qcom,wcsscc@7000000 {

clock-controller@7000000

> +               compatible =3D "qcom,qcs404-wcsscc";
> +               reg =3D <0x07500000 0x4e000>, <0x07550000 0x8012>, <0x074=
00000 0x104>;

And then that unit address doesn't match the first offset so that needs
fixing too.

> +               reg-names =3D "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss=
";
> +               #clock-cells =3D <1>;
> +       };
