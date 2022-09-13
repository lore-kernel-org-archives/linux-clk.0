Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86366C54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 10:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbiIMKrt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiIMKrn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:47:43 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AD05F201
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:47:41 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bz13so20127601wrb.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1vy5STKK7f2y0rHKknJzg204tlai8/pL9+x/aTilWa4=;
        b=y8QCjmtDE47p1BAtUXGN2yQIZAcmaJ61+b7F9i515kKieNrhrgZTikmvyl/ZZr91E8
         GNrxgDg0CdYHIHlAMueh2s0tzvenU1I51AtqOyKeRuVd3uhXMIYjwaQQjUm9vpzEze53
         EERNxUrk0yi/nwKNFPxIp4sePzGMl9VtUKRDxAsahptVMKMM2qWs9q4swesa+E2128O7
         j39WBrwgBg3rNB+MbEU0n3PGR2ZPiz56MehEPiDwJL/ewwfJT3mcrqYhkrWt8Io78VVK
         N4Gu+SRUmj6lhh/Vk35jIzMn7lOgPA+OyG1z6dtIPhGLw9Rl4ZyFa4MftUZSVg+jRfjF
         zAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1vy5STKK7f2y0rHKknJzg204tlai8/pL9+x/aTilWa4=;
        b=FPgkh1tcnPIsx840IRANRDCjXZYtTPRxXMY/Z2VR8RrBQu/udEQGLFnqHigibHPhMo
         pZn9hhVdj+ORoHL1LydzFtTc/MDez8vcL+yjkGpYCyzmUribiWFK40cVRt3jwhqzw+pq
         IjOrcmHnymG46slBiHndqpZShD8cUF8eVAn3j1s37cmm8vQhRV29rdUyOpAuXhjYx2PO
         yRPzQF75WB70x4ZQHTxVi+NhRAjEn+O1Dk4JvN+n0thDA6G56EOxz45Oco0o94RG2FcB
         d0hbhw0aMYOMTb8WTgs6dBRIJzIl1hyMy0BDoTO1bnETJIdYz1XLYzCVK8vJa7QdHBQH
         hprw==
X-Gm-Message-State: ACgBeo2GnthnT95nR6GOn6hbXBL3mQ1rZEQN01QcgmpT5VJaqnytFRKC
        +nqHlz04ISpbl+Qyb3ob/nftow==
X-Google-Smtp-Source: AA6agR6RNyW1z8wsPDHR+Ec99QlY1hPpXtYXHddNwCA4ZFovERfZatAC3wk48ltJhAjQzzIsHRfrzg==
X-Received: by 2002:adf:fc02:0:b0:22a:43e8:d205 with SMTP id i2-20020adffc02000000b0022a43e8d205mr10522868wrr.420.1663066059775;
        Tue, 13 Sep 2022 03:47:39 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b0021eed2414c9sm10387270wrt.40.2022.09.13.03.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 03:47:39 -0700 (PDT)
Message-ID: <c6d4fb3e-9907-cda2-90d8-cfa21e8ebd41@linaro.org>
Date:   Tue, 13 Sep 2022 12:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V3 0/2] clk: imx: introduce fsl,always-on-clocks
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        abelvesa@kernel.org, abel.vesa@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <20220913092136.1706263-1-peng.fan@oss.nxp.com>
 <20220913102957.sir37bsdr5sayxal@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913102957.sir37bsdr5sayxal@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/09/2022 12:29, Marco Felsch wrote:
> Hi Peng,
> 
> On 22-09-13, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> V3:
>>  Rename to fsl,always-on-clocks 
>>
>> V2:
>>  Use protected-clocks
>>  https://lore.kernel.org/all/20220816130327.2987710-1-peng.fan@oss.nxp.com/
>>
>> V1:
>>  Use fsl,protected-clocks
>>  https://lore.kernel.org/all/20220815033632.1687854-1-peng.fan@oss.nxp.com/
>>
>> There are two cases that I wanna this property could serve:
>> Virtualization: root cell linux run in parallel with inmate cell
>> AMP: M7/4 runs in parallel with A53
>>
>> The major case is:
>> Jailhouse hypervisor only support partition, so devices are partitioned.
>> But there is only CCM module that provides clock, the CCM is handled by
>> root cell linux, need make sure the root cell linux not shutdown the
>> clocks using by inmate cell.
>>
>> I was thinking whether need to provide a rate entry to ask root cell
>> configure the clk rate for inmate cell. But NXP downstream not have it,
>> see https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/clk/imx/clk-imx8mp.c?h=lf-5.15.y#n690
>> So just leave the property as uint32-array.
> 
> Can you please check my recent proposal? I recently stumbled over such
> an issue on the mx8mm-evk as well but with the 32k clock provided by the
> pmic. Unfortunately I forgot to add you to the to list, I will change
> that. If that proposal will fix your problem, I would like to go the
> generic way.
> 
> https://patchwork.kernel.org/project/linux-clk/list/?series=676522

Your proposal does not change bindings. You cannot introduce new
properties without documenting them in the bindings.

Unless you documented them somewhere, but this is no reflected in
Patchwork at all.


Best regards,
Krzysztof
