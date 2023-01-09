Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F045C54EBD
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 18:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237656AbjAISPE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 13:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbjAISNt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 13:13:49 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004DA17585
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 10:11:07 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w1so9081162wrt.8
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fML4kPdr/TJZTTTjmDRqZF2NKNyIrXL/psZmLGwFohM=;
        b=m+fHzmBRRmF0BsG7LIAgKERc94P4/TYZiGuv2hl2kyEkRddu8aKFzX9476xmik78CG
         UsJw18F5gsV9YLSp8LMulmGbo1rrCZI/o3bDIe0W8l30ll1ABpAY6m04D7bQK4wo/kKB
         xVUEoSchbv5Qt1rguhdILk1ezkn7KVaPbEGAIirexPPBmqoN8Lp8UGUQdyQPnVQXy1dE
         xysaH5osPcYaE1IJfvlKrTw3cHMyEnpBocHevQ9EqRUPZNX/xBrrYNvP0aHlRNcy6mtr
         clG/Mt8HIMOjgc+tRH4qcP+UXGaSoxO4A9IlzcI7amrv1SDxIz2FWQJdaTqaYV447O4l
         D1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fML4kPdr/TJZTTTjmDRqZF2NKNyIrXL/psZmLGwFohM=;
        b=pmZ8U1jKPxv6+8PfyAXozt58N0oybGJasN3v8oTYyQg57UDCyXYq/b60KdNdj9jJkO
         YnF18dHQuR72+uUghoZDlf+CCb/mFqoAPvAsexAOgPZ60iz1R+SMC1C5EIQU4WA2UCVl
         BLnBV3PdOd8DLIp68Ec0VE/9Veoh0jGmDB7mSTBDeFVyQ0ABgfJOQGyUjuAGJyAdU7lB
         7fP5Wk4ZyEwds20q65XjssOfOZ79KmPluEhy+xGw9hauWhIGduip65Y1xExtJ33Skm6X
         D7mS9D/h8vBVLKAemjZuI6/m7xVjRu9vBLE46jt63zQ8xsMbhBVntSbxlW/f71ChFu6y
         SqCg==
X-Gm-Message-State: AFqh2krxpLeim/HwgmXENtT/BW7fKzTtTesXC6gFZE/WRYufF/U1+0J8
        zublQgI9hRueAiviCYlxpizaQA==
X-Google-Smtp-Source: AMrXdXt7fojJue/+zqiYvHFyhcP0O74KqMDyTAn2+LC1MBCbIrE+iHWW/13fcFX63cwCA3EoHUAtcQ==
X-Received: by 2002:a05:6000:136c:b0:2bb:e1fb:5d83 with SMTP id q12-20020a056000136c00b002bbe1fb5d83mr4390655wrz.58.1673287865741;
        Mon, 09 Jan 2023 10:11:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y15-20020adffa4f000000b002bbec19c8acsm3846694wrr.64.2023.01.09.10.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:11:05 -0800 (PST)
Message-ID: <04bcb4c5-0605-2ea8-d658-feee4370ac4b@linaro.org>
Date:   Mon, 9 Jan 2023 19:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/18] arm64: defconfig: enable the pinctrl driver for
 Qualcomm SA8775P platforms
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-12-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-12-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/01/2023 18:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the Qualcomm SA8775P TLMM pinctrl and GPIO driver. It needs to be
> built-in for UART to provide a console.

One defconfig patch for entire SA8775p patchset. There is no point to
enable piece by piece because anyway each defconfig will have to go via
qcom soc tree.

Best regards,
Krzysztof

