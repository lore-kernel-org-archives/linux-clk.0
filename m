Return-Path: <SRS0=Dvha=2Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724C4C33C99
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jan 2020 21:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4909E24654
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jan 2020 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578173810;
	bh=Gyd/bU7Y+tPiaitKzJdqAWHNM4gk6qITC6+roiF/TGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bWrO6KYEvG/mkgtopOS0uE34cW2I+F5wsMQEkQrNEwSRu0ZAoQG2CltFX4eg3JY56
	 D6pwGi+H/MsfX/KIv2wacRBCYv3oaG5i0BphmjL2i+8zI/n+ABzcDxeo6BO7RWsymh
	 k8+smG0z9BGGotG24n9SZbr2vK0TXAGC3sfx9dlk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgADVgt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:36:49 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:36825 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgADVgt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Jan 2020 16:36:49 -0500
Received: by mail-io1-f68.google.com with SMTP id d15so1324785iog.3
        for <linux-clk@vger.kernel.org>; Sat, 04 Jan 2020 13:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6NIkJehX5PQPcR5AGeQlXeeI6cS9FMXt1VVPV226sY=;
        b=jxRKafqgOflmOyKLGnm3FsKgNOJIbGOUpXRu3c/Y12vKmQSH9Eg6KqK5QPUP1nbxvb
         pXS39m9fJ+kcjcUIZE1dOeD09QeZiZ/MB7SVy/CHQVF8dIgMN8Lfp/bPrjyAk7dFEW1g
         CwmiDwxmgiwXGbcqf6Ua6tsb6SeMJPzkMmYGaExaeL00+w02NSb6g65gLsE6Dq3/wJDZ
         PpU9JPoWVvOCz4Bb2nV+ZlwwvinH7wOAqMC7xbunhs8ABfJgLAHJH0Np+soyEnPBx5AJ
         /7qbJxgnBY3hvE1+rrwqxmsCIC31Gs0GH/OMxdxz7RyBpkxf8Y26U16b738TY+ggxa9h
         Zwog==
X-Gm-Message-State: APjAAAXl8T6zSOUQvDzbPPk5uNIXxOs2ZunfSEwxh2vrTpec0yQ9T7UL
        cJxnbW69uoVJ8rdv8Rfi27IT34s=
X-Google-Smtp-Source: APXvYqzSXJVr3iodaXOXoq+AmBIgSkKVLnw2Y+ijoUbNlhqPEGeGid/bZ3TRQ13T/SgfL5ph6Dm6zQ==
X-Received: by 2002:a5d:8899:: with SMTP id d25mr66102005ioo.260.1578173808124;
        Sat, 04 Jan 2020 13:36:48 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c69sm22346760ilf.41.2020.01.04.13.36.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:36:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:36:45 -0700
Date:   Sat, 4 Jan 2020 14:36:45 -0700
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200104213645.GA25711@bogus>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 27, 2019 at 10:12:38AM +0530, Taniya Das wrote:
> The MSS clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..05efe2b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible :

drop space     ^

> +    enum:
> +       - qcom,sc7180-mss
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  additionalItems: false

With the indentation here, you are defining a property. Should be no 
indent.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41aa000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041aa000 0x100>;
> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
