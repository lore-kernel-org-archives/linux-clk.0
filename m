Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF578C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 24 Apr 2022 10:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbiDXKKd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 Apr 2022 06:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiDXKKc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Apr 2022 06:10:32 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6D26544
        for <linux-clk@vger.kernel.org>; Sun, 24 Apr 2022 03:07:32 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r13so24341913ejd.5
        for <linux-clk@vger.kernel.org>; Sun, 24 Apr 2022 03:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OJlYAV8vSTnWXomsTtiXBSUp1xsB3tnRUddj5QlukZ4=;
        b=X5cwwo5Fd8HeegNgzPpR3bnJKm0VpMNgBLaqICYXGKbcNlAv4VZoHtysrExiZIaVa1
         BV3TC6w+210sUzNjW+XLZWJi2mZ9A3I6YIMgNWT6NeWvbg5WtBlAZQswj+0/yg6Tlf/4
         l6Vfk5TTMd0x7mnuG+mF24xgJxSJsZiYvDftdMpWqJSVYfRlVwI9aF7TaptdRZu9PVkG
         FkpLE8EuggJ66Z1G+YEXBtOxNNrYr9j2usxfB6VC2gKJR1QO21/67++3tneENQzq9QVU
         94SDfGGRMYCQ8JOI6tveOLGtXx7kHU3/2FGiOhJz71BJW3zHG2lFD7z9M3tFELZAeCZK
         VWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OJlYAV8vSTnWXomsTtiXBSUp1xsB3tnRUddj5QlukZ4=;
        b=cfsJ0+SJw7UzBC0crtdwl6OPMFFqsFvMmfXzrBF77OdQC2eo0iA4k+bkCPZp4XqVuQ
         xmh07pMTC6qo4ruQVzFzkgWzpprTe8bGtP6L2oPX5GBNPFL0eCbp1r6eGGreOWJC2Fhv
         wfkW6tex0ZE6h6kioLH5tElY9emz9vz6bxS23QdlEACsP96bEMPsOoFoIOClMai3VLwY
         Mi6UCu7BOseb7BdMFzyZeML2pKlKQant05m1k01XNVxyLhMD3J82uf+2HIXpeQ4vZRK6
         14MR7TFJi43ePhteOToCvmqQLElSjslyKg5WknhuxlOPiDgMUP+gHdxxfv6Nb3i6U/AD
         ofxg==
X-Gm-Message-State: AOAM5303QoXh99YIjzqWPAy7DX9NJcuW7kLI3zVjGs/wXw/sio5s96Sf
        B1Ejv6OdtPzgd/5qHv3M/Ca1cw==
X-Google-Smtp-Source: ABdhPJyuiF2SOSBKDXcmSIorC2U4elJdrOewuVp/EizS+DAVjXzvXyjjopr/0ydow9WgZxPsYXt9Mg==
X-Received: by 2002:a17:906:3ce9:b0:6ef:a8aa:ab46 with SMTP id d9-20020a1709063ce900b006efa8aaab46mr11365983ejh.579.1650794850702;
        Sun, 24 Apr 2022 03:07:30 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g21-20020a056402115500b00413c824e422sm3091656edw.72.2022.04.24.03.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 03:07:30 -0700 (PDT)
Message-ID: <b620e809-4375-3559-4a27-3b168edf985e@linaro.org>
Date:   Sun, 24 Apr 2022 12:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 1/3] dt-bindings: clk: sprd: Add bindings for ums512
 clock controller
Content-Language: en-US
To:     Cixi Geng <gengcixi@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Orson Zhai <orsonzhai@gmail.com>,
        "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220418125630.2342538-1-gengcixi@gmail.com>
 <20220418125630.2342538-2-gengcixi@gmail.com>
 <714caf6e-5f81-6d73-7629-b2c675f1f1d4@linaro.org>
 <CAF12kFv6uioc7ATtXLpGTTDBFT1wYWZUBoyjQqP1bSUnut0pKA@mail.gmail.com>
 <a5a59f3c-00a3-afc5-24aa-1ae3de2600ec@linaro.org>
 <CAF12kFsqOSZDZ9iw+KfR-x533YzNa=yxR1rqWuoGX=vBgh+wGw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAF12kFsqOSZDZ9iw+KfR-x533YzNa=yxR1rqWuoGX=vBgh+wGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/04/2022 05:14, Cixi Geng wrote:
> Hi Krzysztof:
> I find the history discuss about the sp9863 clock[1] and last
> ums512-clk dt-bindings patch[2] which from chunyan.
> please refer to the reasons below.
> 
> These clocks are at the same register range with global registers.
> the registers shared with more than one devices
>  which  basically are multimedia devices. You may noticed that these
> are all gate clocks which are in the global registers
>  ranges and are used to controll the enable status of some devices or
> some part of devices.

You replied top-post, I don't know what is it about.
> 
> [1].https://lore.kernel.org/all/CAAfSe-s0gcehu0ZDj=FTe5S7CzAHC5mahXBH2fJm7mXS7Xys1Q@mail.gmail.com/
> [2].https://lore.kernel.org/all/163425295208.1688384.11023187625793114662@swboyd.mtv.corp.google.com/

Could you keep URLs without any additional characters (so surrounded by
whitespace characters) because it makes impossible to open them.

Best regards,
Krzysztof
