Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7E6FA373D
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 02:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbiJ1CRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 22:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236092AbiJ1CRh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 22:17:37 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B11EBA935
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 19:17:32 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id w29so2728565qtv.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 19:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJWq+oV9qCWB9nsJJoQSKw7FQSgWYiEd+bdoELvwk7c=;
        b=VybGqElICFb96ny5ImphHSJ4bPBiryi0OLukwgdxtu7Apmvl6DqhkGO6US9H+puEjr
         rOdYx4AAQ7ijRQ0853O4pV3fdTdfBOay+Y9RNZkyd5DP5OlmvtyqYJoj7NdxTdfPKZZs
         pJ0tBSoKW+EHYTQNRmAPOztYPVOk8WwYRCSPdCu72M1k036ZDrOpjWTyitgfsGwyPiKh
         7S5wakI/81U1g04sbymHYoat3Zr9W0mZOU4pqNPLSpzcc06bxKDj4TbI60UIpG+ufErA
         aCuEuC1/Uk5kSG9GlmrHMtBmMNoyKLAXL/cb5HK0v21yq7kqgSsHMvvuIb+Fslsu7Rw5
         Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJWq+oV9qCWB9nsJJoQSKw7FQSgWYiEd+bdoELvwk7c=;
        b=anXDoTDyHj3EyBBDCiWizRAM1LFGClVu/3JFRe9bas86pXSDYABLLJ+xS6qC0KFQSe
         GgLnUdR48q+hzElTszhg+WtO67DQ5VcwSqYtVb088luyzCermUmq0A3Ld+amjnkaOpP+
         KC6hzdN6c7W7z2EdM78gcf8V7FrFN7ujNuCCBMuVbb0pCD64RooxvA3Dmldn5yeTpdgY
         N9fD+Pjb8ErKBUvXn2MofeXZO3HaJL/uN9Xx1H4RjkyGJzAP8odEpKnaFRJnSCOrk/PH
         qGs3JZWD7pQxcONS9W2XdDsJbzQYIxK/3CWMdFH0QA5aiIM26cl8mXc+Vu+PfRdnPxu0
         aZgQ==
X-Gm-Message-State: ACrzQf2K2bb6roijuy8yRg7vTQ0CeOGtsXcPfn9aSjtIduzp9xOWNTaq
        UsYML+EcYJBu/iBH1V3HgSAAVw==
X-Google-Smtp-Source: AMsMyM6sHImfq+ADwCCpfFGFstcpO4jS6IWwSFdv+ExMapjj41nSytwQQbllPPAuW9NuIBm3yZW0Iw==
X-Received: by 2002:a05:622a:1646:b0:3a4:e8b5:b8c8 with SMTP id y6-20020a05622a164600b003a4e8b5b8c8mr12886869qtj.339.1666923451637;
        Thu, 27 Oct 2022 19:17:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bs15-20020a05620a470f00b006ec09d7d357sm2101353qkb.47.2022.10.27.19.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 19:17:31 -0700 (PDT)
Message-ID: <7fe4bf93-6b60-f1f7-d89f-8d7f75c9e58c@linaro.org>
Date:   Thu, 27 Oct 2022 22:17:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: imx8mp: Remove unused
 IMX8MP_CLK_AUDIO_ROOT
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
        abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
References: <1666922026-6943-1-git-send-email-shengjiu.wang@nxp.com>
 <1666922026-6943-4-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666922026-6943-4-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 21:53, Shengjiu Wang wrote:
> Remove unused IMX8MP_CLK_AUDIO_ROOT which is replaced by
> IMX8MP_CLK_AUDIO_AHB_ROOT.

You break users, so this should be a bit better explained.

Best regards,
Krzysztof

