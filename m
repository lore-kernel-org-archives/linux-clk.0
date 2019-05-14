Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22612C04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E86132085A
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9AO/zdd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfENQ3F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 12:29:05 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35338 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENQ3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 12:29:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id g5so8524013plt.2;
        Tue, 14 May 2019 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yj7g1zX5VtWrwoZOWHxMk02AJw3vsxkG/HQMAspuC98=;
        b=i9AO/zddYqJtxhgFcoe8F5Na4bI9O43hctdsNe4kI3e3NDv++1q5htouXKw5MnRGxC
         GoGvfIHxsjQzjQNqM6tEjb78jquLfxl8kCUw7MBZV7/vv8+vTBHnoPqqZL6COLZFzq/p
         s6V+2+Bsit437yDuw7qHdOWZGXBcSZep+APajcggOS2RtZWhpHsLDVIwEO31wrhxguol
         x8prFK5E06I1cpLnjRjx4hupLjZk8dcEW30Dry3ddJhnxdVeGT/F/8u2oX03X7bV3f1S
         5Lm8rSUF3Xa1bIAlOFVfdxSi7BmruPqdtizbC8IvS0sA1KHUP3EZE5jHQ8xGr2p/yv9T
         4tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yj7g1zX5VtWrwoZOWHxMk02AJw3vsxkG/HQMAspuC98=;
        b=P6QK06fiUcDXMIq8oXfuYhbkRHVAc5xEhy6jttVlsZfJDLnBo8CfRMy3pqCnHM7Jmg
         gmav6D5KMuzYxJcH7nkrGupHq9Gi4rBe6DW4+cvmBiet1M/746FNovnfJ8cti9AJI58Y
         mowtbIvrF1yLh9shrCPovo11QlWBc2zBDFbALxelcGwGGGib60lcgGfEafeH8nHU9hW1
         gOS409MOFX8BXxcFHy7Uy3iKCR7Nz0RI2gSo1VmFDhm0fVJonhpPAdy50D6egvfs2dI6
         84TTRX0fJxQcdkWzuwxjQ2s6nVvO3GAx9WqUzvQVSdJJ5tzsce/mXUDGJJu6XsXBEDjh
         4aoQ==
X-Gm-Message-State: APjAAAXSVVxFpnklMuiayWsRG1mCcin9ur8XT/571RZUtpAM7VJGKrS6
        /4KOMy+E+cQG3SYtCmXNPKI=
X-Google-Smtp-Source: APXvYqxeRPzrXEVpgMuRnDMSw53AxeQEtchI8snOYaBDxa/Ydc0vjRoHLmr7zl3AcQ3L5HFPxGcSNw==
X-Received: by 2002:a17:902:7002:: with SMTP id y2mr39331457plk.75.1557851344624;
        Tue, 14 May 2019 09:29:04 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id t7sm29751782pfa.42.2019.05.14.09.28.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:29:03 -0700 (PDT)
Subject: Re: [PATCH V3 1/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-2-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd68f906-79b4-6eda-b1fa-abaf3b4c6a12@gmail.com>
Date:   Tue, 14 May 2019 19:28:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-2-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v3:
> - drop the bindings of EMC table
> - add memory-region and reserved-memory node for EMC table
> ---
>  .../nvidia,tegra210-emc.txt                   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> new file mode 100644
> index 000000000000..d65aeef2329c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> @@ -0,0 +1,55 @@
> +NVIDIA Tegra210 SoC EMC (external memory controller)
> +====================================================
> +
> +Device node
> +===========
> +Required properties :
> +- compatible : should be "nvidia,tegra210-emc".
> +- reg : physical base address and length of the controller's registers.
> +- clocks : phandles of the possible source clocks.
> +- clock-names : names of the possible source clocks.
> +- interrupts : Should contain the EMC general interrupt.
> +- memory-region : phandle to the reserved memory (see
> +  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) which
> +  contains a sub-node of EMC table.
> +- nvidia,memory-controller : phandle of the memory controller.
> +
> +Reserved memory node
> +====================
> +Should contain a sub-node of EMC table with required properties:
> +- compatible : should be "nvidia,tegra210-emc-table".
> +- reg : physical address and length of the location of EMC table.
> +
> +Example:
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		emc_table: emc-table@8be00000 {
> +			compatible = "nvidia,tegra210-emc-table";
> +			reg = <0x0 0x8be00000 0x0 0x10000>;
> +			status = "okay";
> +		};

You essentially moved the v1 binding into obscure and undocumented blob,
ignoring previous review comments. This is a very odd move... please
explain what is going on.

-- 
Dmitry
