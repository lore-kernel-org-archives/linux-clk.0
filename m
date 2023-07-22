Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41961C41513
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jul 2023 09:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGVJWJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jul 2023 05:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjGVJWI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jul 2023 05:22:08 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B7D2D4A
        for <linux-clk@vger.kernel.org>; Sat, 22 Jul 2023 02:22:03 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-316f9abf204so2369607f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 22 Jul 2023 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690017722; x=1690622522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlWUiLbsFW9gesDugN/U0p0RaEcbTcHTBcVbcBj+HXg=;
        b=CI08LP4aadB+oNdXlPDEAPGTp8O5rg6MvDCNomF23KOitLAJCoMub6+oeJztpDtdKL
         I7SU0lrp+h5M3oc2m+GnAcWm/R1x2Krj1/6wc6NQ1+dsb+W8fyfhatQv3C5tY705F7hz
         wsobw6sBx58PWvDIwjUHi3Mqp5Bc/VUl9Npz5o+8o/w33QP3w9tqg4ig2PdgQpJdSKpn
         rheQaBqFYuxgqDdyrK+AhY/JxMj/5Jto8UcbUmjr0nieuQ9qU7mO/hXZfxjDxEFn931v
         AQUPNOpWVzhmdyd/eEKJeQqkKZOEbv7TUEI5d2A3iJKjYMjRniO3ab04FdUP1xN5O6+u
         AqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690017722; x=1690622522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlWUiLbsFW9gesDugN/U0p0RaEcbTcHTBcVbcBj+HXg=;
        b=ZEmIJQcpI0jOmCLJ7c7w60mG7r6QbKdRPJT1ybZ7e5y3/h7lHN25T5I6aN5BUUJ0iX
         81UiqP74iMduCzejFMdDEnweaDnAJiggDj8CB4Jw7X/9lS4rELfzLMwMPNs+7JO38oQw
         ZV4ya6ovb0fVLCywPygKv1YmMnDI1NFM1qiGz7fbw5KN/zSJrUbue9Jmw8YJLMlPU1F2
         eFqp/VqfQBOxLyClmODhFHkQVZo6gJnQd/VuFRD5hthehUZMG7CVK5ScRBdbHbgI+yyP
         hHkdJFXLogKoXHqD2eyQaiBXGZY6/pNqMXPS3yEU96iTWaWFjdJzpLJIFwKd1seS/U1S
         i2+Q==
X-Gm-Message-State: ABy/qLadClL/S1OEIgohC5SMBHZm7vZWCLbHnFUR9+A8/ynYb5qGQ/sF
        mFxTtIl5e2N1w8+DaZTpwG8XaA==
X-Google-Smtp-Source: APBJJlGciMsKReNcuLPKE1QAwsa1Oi7HAcIFG8DTm5d14xl/+70pIMi7zRqGA4Brp9CNWPPTo4v8kg==
X-Received: by 2002:a5d:638b:0:b0:314:1e73:d15d with SMTP id p11-20020a5d638b000000b003141e73d15dmr3633892wru.11.1690017722488;
        Sat, 22 Jul 2023 02:22:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003fbe561f6a3sm7730446wmq.37.2023.07.22.02.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:22:01 -0700 (PDT)
Message-ID: <25689bef-2dc9-a1ac-1ba4-0321813d5793@linaro.org>
Date:   Sat, 22 Jul 2023 11:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/10] dt-bindings: clock: Add Marvell PXA1908 clock
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.com
References: <20230721210042.21535-1-duje.mihanovic@skole.hr>
 <20230721210042.21535-6-duje.mihanovic@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721210042.21535-6-duje.mihanovic@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/07/2023 22:37, Duje Mihanović wrote:
> Add the dt bindings for Marvell PXA1908 clock controller.
> 

Squash the patch with bindings change. It has little sense on its own,


> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  include/dt-bindings/clock/marvell,pxa1908.h | 93 +++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 include/dt-bindings/clock/marvell,pxa1908.h
> 
> diff --git a/include/dt-bindings/clock/marvell,pxa1908.h b/include/dt-bindings/clock/marvell,pxa1908.h
> new file mode 100644
> index 000000000000..da9c5d499ae4
> --- /dev/null
> +++ b/include/dt-bindings/clock/marvell,pxa1908.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license. Didn't checkpatch complain?

> +#ifndef __DTS_MARVELL_PXA1908_CLOCK_H
> +#define __DTS_MARVELL_PXA1908_CLOCK_H
> +
> +/* plls */
> +#define PXA1908_CLK_CLK32		0x1
> +#define PXA1908_CLK_VCTCXO		0x2
> +#define PXA1908_CLK_PLL1_624		0x3

IDs are decimal numbers.

> +#define PXA1908_CLK_PLL1_416		0x4
> +#define PXA1908_CLK_PLL1_499		0x5
> +#define PXA1908_CLK_PLL1_832		0x6
> +#define PXA1908_CLK_PLL1_1248		0x7
> +#define PXA1908_CLK_PLL1_D2		0x8


Best regards,
Krzysztof

