Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A6C76196
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 09:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbjDCJXN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 05:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjDCJXC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 05:23:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F0459D6
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 02:22:47 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eg48so114494585edb.13
        for <linux-clk@vger.kernel.org>; Mon, 03 Apr 2023 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjeXiHYDWLDYDH3tp2OHz3EiswuWFVd+Ntpw6O0fatQ=;
        b=z6Av2ppJybkbEQzB/0dLSbhCmvSMg5sYHB4466FR8KqhH52rocQ3sWeQY3mdCNFvo5
         XfaL9ToasOWr2ICYR62hiz2ND++yoH3QWb+0nPmUcBtCWGHZkhKPvOcoLoU5+lKJMUKG
         C2hTVV9C8i1v1O7A89inr67fbEcNcmo3JZn85HtACkWz6CegDyAhZ0TfZtFYEUzffekY
         vYXwosGWmAZiHATxb0yuWMxjpSbHTMmnQkZuj9oWI+2USGbWIuNCGH78B7kcQzzxCUT0
         fwZH//+Tx2IYhjk41NbaurMuAep+vwsZDHnA+zPXBfPxmyFHfq1wTjmK9c5miaSfnkMN
         A4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjeXiHYDWLDYDH3tp2OHz3EiswuWFVd+Ntpw6O0fatQ=;
        b=VpatOb7Xc8IzIJE5X7xTjKffMI7PSJEqSEusTS03+gvKeGPyBIwumyONfyPFc3/QZw
         2cBPmFzzJnI4PZHGiOBRcrixtad4DrLroHgk/I6A+NWpsr8uLiF5r5SelJvJfot+fDHH
         DB50oTA9QowAypHU9tSwV9WpTjFyFUV7LhOy0SemlBKwKuMKdDskAjC+3OTA0gn8Usw2
         uf8rD55bSD6Q5ZMrUAeupk4nALtYI0JvH7hxwAvphqNylu7e6Iuze2PvkN39nffIVWvI
         9u9JZcKm86U25O6huRdVqR9VyMf98U6u8Lxm6TK/I26+K5B1sFKHjtMCsXiHeWnDnQwd
         f+/A==
X-Gm-Message-State: AAQBX9f/fwiGHrw69eFXTF1keAdJKeFhJY4nvY4hMwVO2+BYjOMuymht
        SiWx5TgNle+AUMS6SZT+1bJYNg==
X-Google-Smtp-Source: AKy350Yj5ESiRy5699EV3GW6T9BfJpuMHWCkbBNGLqd26yEE0yjjj1FOYFwSJySIaibJItggeUy8Yw==
X-Received: by 2002:aa7:d5d5:0:b0:4af:63a7:7474 with SMTP id d21-20020aa7d5d5000000b004af63a77474mr30655770eds.17.1680513763451;
        Mon, 03 Apr 2023 02:22:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id b17-20020a50b411000000b004bf7905559asm4347630edh.44.2023.04.03.02.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:22:43 -0700 (PDT)
Message-ID: <5f324c32-86a3-a1af-cfe6-b41c4b3979f4@linaro.org>
Date:   Mon, 3 Apr 2023 11:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 2/4] dt-binding: clock: imx8mp: Add LDB clock entry
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20230403081246.3194230-1-peng.fan@oss.nxp.com>
 <20230403081246.3194230-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403081246.3194230-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/04/2023 10:12, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add LDB clock entry for i.MX8MP

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  New
Best regards,
Krzysztof

