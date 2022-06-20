Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ED0C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 08:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiFTI0L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 04:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiFTI0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 04:26:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63636105
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s12so19587866ejx.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=feqxyD++ZNyntOrZZnmNSSht705UCVtD7ApY5yH0Mvs=;
        b=gNxb44il+HQYrhBnShvzucZXX6Gwi4FVkDiqeRAqpYwudwpb5N5mV+m2h3Zm8v5mr2
         o9bBSO0oTZgdjnMekuBrSGxllkOicFAVUoFYplLcTQh9HbUL8b/oWfAMiXZYHx09+qa+
         xBdfnwQni1Q90PgBXwc1Xcr916eO5OTtLhdRBz3sU/sjAXw1Qb0Kg+mp8YzEJYhtDsA/
         FFQOcO2x/z6WjKFPywRuS3xAKttjDaPz6GH9cc2XSlqkg8JlGr4cvhRmdutVDbRN2kIB
         zmfFkZIxPlUpEROwZcnUMMWN0YqEmAEad/hF1PX33dWuE314Hkhs4skaPtGGXvGsufZ1
         PeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=feqxyD++ZNyntOrZZnmNSSht705UCVtD7ApY5yH0Mvs=;
        b=zpiWzi4aNmpPxOkgycMOnzjtU5THRqAqFw4CnNpbOpjyxva2nmMMSr6lMKYATVinzp
         NyzJVhuoARKSoZSrHS8oiBX5slvl8W5fgAFiobfzZaf+/6TB6Q0ap3tsfsx9/EpGwG42
         uhHlwsE0PbLXx+zOkYzf0X3Cp8+biHj+JXJRSFdzxKodtS2GKtYZkrX1gLDhhSzWE31d
         Nof9QKcwRdHxR9ep8OvYhJhARDhYQuwfDhBbCzMWHN2BjfWOiH2NNgPjLVI3akENYgPC
         b+0nJoRDpPO9fU8lFRz9JD4Go8zG+rRZ8ouf8ZWWvk/pf5Sd2MLCq3k1VN7KPqpLcDDS
         tPhQ==
X-Gm-Message-State: AJIora+fDdXwGgV28J4BV9mDhLM59eAp+Rh/QJH62jJo7054a3yfck1e
        UALgXE9mqAkJhaRKKE2PCFWukg==
X-Google-Smtp-Source: AGRyM1sjFzk8/oI1yQ/uy+RG3TYabiaCKsMY8TD99fc+s3KjWuVK4O2rvV5My5XgAjgX+UfNlgDSVw==
X-Received: by 2002:a17:906:a858:b0:70e:a4d8:1c45 with SMTP id dx24-20020a170906a85800b0070ea4d81c45mr19232866ejb.213.1655713567929;
        Mon, 20 Jun 2022 01:26:07 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b006fef557bb7asm5530127ejh.80.2022.06.20.01.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:26:07 -0700 (PDT)
Message-ID: <95249574-d12b-92ad-5e1f-89fa4e7e42b9@linaro.org>
Date:   Mon, 20 Jun 2022 10:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 16/18] arm64: dts: nuvoton: Add initial NPCM8XX device
 tree
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-17-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220619151225.209029-17-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/06/2022 17:12, Tomer Maimon wrote:
> This adds initial device tree support for the Nuvoton NPCM845 Board
> Management controller (BMC) SoC family.
> 
> The NPCM845 based quad-core Cortex-A35 ARMv8 architecture and have
> various peripheral IPs.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
