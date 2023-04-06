Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71564C76196
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 17:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239965AbjDFRZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 13:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238096AbjDFRZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 13:25:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC1A93D8
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 10:25:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sg7so3129659ejc.9
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JL0tcMswVOFBcZqE4ysEfWlvhjaRhWrngkh1Ruhoyo4=;
        b=MPnQBH6smOnFly3D5rRvEyKmiqswxLyP6gr0q283GTwxvlhz603IrS9F2/iq2f0NPn
         aKYKWU77mZQcOPlybykSjECnvL0fRAidu65ZbPR2GXBg7hl2FeNx2aVSGFzDbenDXfJL
         9S1vKwxSiNBGNJUgkUa1eCNZp4+SHY58amq+JWamL8UjzApvijwt+ikbQANg1+17nYd2
         9RgUl7CAU99JcmphuUYcGBhloboB/Qtwi2ytfZ2EktnW5Gv7RiVYxry8vbP7fcT8nDC9
         GFTNdOObFQR6uvbrzzR1kqhot3m4RblcY5k2iQTjGiUzTG5kExnUP1/c5SvV8sD5c+MW
         o3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL0tcMswVOFBcZqE4ysEfWlvhjaRhWrngkh1Ruhoyo4=;
        b=CiRBxCaffocFMnysikXfiAiXxGeuv4VKw5F0PyIl/PDWJDxC9lBDO3N1BNhS/xC8+p
         9QBQ46mleKpYpsDVXlUm9H3WaFvcO1AVw2S8OqtrCxL9eX3bbrCw7t9ozDRWlWbO/4FS
         MfgBjdx9OnIc21jXR/S4cqvq5sF/UdlRIk5X2+gWrJLW+rz+0sjbkhz1Iu1/Lv9IR6q6
         7SDmbBln3zJCW2XVlK98DmfimrIpLAt3z1Oy+H4L5tMiwMkJYi2MUyYhRNrEEU9Znbg+
         wvi+WRUAMQIq94aHwXpXs+SFS9adezdDCbKk+2PR3xGmdP42islwWQWxrZRJuK+eUUOg
         t3og==
X-Gm-Message-State: AAQBX9fPFpptGq/AeiNa2yCMPzR/3JfjCcouJXEVzUyEyneGa3N4YKjV
        taJWDP0jKimf2qr/zj+ngA2OrA==
X-Google-Smtp-Source: AKy350ZDUjvvTADIBKKgF4owoWF4Z6S7eh506PO079mECLi4kym9F7fYqfKxh7TctbTIQkCLAiJ3Cg==
X-Received: by 2002:a17:907:c201:b0:8b1:75a0:e5c6 with SMTP id ti1-20020a170907c20100b008b175a0e5c6mr6737603ejc.18.1680801868922;
        Thu, 06 Apr 2023 10:24:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id li16-20020a170906f99000b008d68d018153sm1059812ejb.23.2023.04.06.10.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:24:28 -0700 (PDT)
Message-ID: <63f14414-2054-d7d6-8cdd-82f8e034641f@linaro.org>
Date:   Thu, 6 Apr 2023 19:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] dt-bindings: clock: Add binding constants for
 BLZP1600
Content-Language: en-US
To:     Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "soc@kernel.org" <soc@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-5-nikolaos.pasaloukos@blaize.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-5-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Add SCMI clock IDs which are used on Blaize BLZP1600 SoC.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  .../dt-bindings/clock/blaize,blzp1600-clk.h   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)

Missing device schema.

>  create mode 100644 include/dt-bindings/clock/blaize,blzp1600-clk.h
> 
> diff --git a/include/dt-bindings/clock/blaize,blzp1600-clk.h b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> new file mode 100644
> index 000000000000..bcc8ff513b28
> --- /dev/null
> +++ b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */

Same question as for reset.

> +/*
> + * Copyright (C) 2022, Blaize, Inc.
> + */
> +
> +#ifndef DT_BINDING_CLK_BLZP1600_H
> +#define DT_BINDING_CLK_BLZP1600_H
> +
> +/* Simple clock-gates */
> +#define BLZP1600_CPU_CLK	0
> +#define BLZP1600_CRYPTO_CLK	7

Same problems as for reset.


Best regards,
Krzysztof

