Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0760C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 15:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiJCPjc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 11:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJCPj2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 11:39:28 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A1C2B240
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 08:39:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id z20so3483428plb.10
        for <linux-clk@vger.kernel.org>; Mon, 03 Oct 2022 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=sBjMELHhs7ootP+M1ePzkemYasHrxvoQKWyxZ5SKdJc=;
        b=6TeHRYpKr4iA6ltAvmCjUEoPS1XHVEd06IoCPr9cBmfj4KcCCpxO4crfMKOV3j+ttD
         nSeOZOMohexUm4wDctC02d16DMakiBRtjI4eW7FpPc2+VsURaV8CZmi/Rv50Ju0O6bDZ
         mdJ6TzLmnXN/GWGyzbrtYytsMwPzUJ4T13JD1nY6dCnb/sWc4wLvd3XZoRV5ZBtrJSXZ
         NYuEIairpytFb3UeLbZhZryD3bGVjUZEKacG8YLZDJT1Z/e2blxmqYGhx6Od824QDPR1
         oAdtoO8RRJNF37qDOUwsRz2nYEHUq2YFqJ+davPWQhI4GkSOm08p1XzZO+oufH7CzHlN
         JmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sBjMELHhs7ootP+M1ePzkemYasHrxvoQKWyxZ5SKdJc=;
        b=Y1TM1iFAG/ywq0V1SfzFZHynxdHR8/C/ZNDM/+0zELFXr3ouKCrlFP5cRhy+LVARqQ
         vOTd9W6/F28Q6mcRpJwOy0ntMe6yxsG15Vxu+kOaaRc28yh2WLmgfJFNMclFmfLDsokG
         +9qOSY6D3seGi1RyaIgb8zb3X115YCF7ZlpkA0/vx+1xaEA5PQARueOdI8pl2j6WogG9
         Y49gucD3RvB8BkU8vHuopPymQTrPwzLLX+K8p9PxDTb7TbWrj8+cw1Z9X1jaKkpVsl6+
         Awu2Irx++5dMlHfRs32qN2EdFeDjJV9mSccuw3C4mmfDUWgTKK+7ArH3CKhTt+2Bakrf
         y9MQ==
X-Gm-Message-State: ACrzQf3e0A1JhKX/eb5NIlTjOD+I2PP2hSkmCNl2Au2sR19qCE+6xjr+
        0sisQssZafVwWKKK0u5TDINz5Dshp5yvREdvie1g8Q==
X-Google-Smtp-Source: AMsMyM67n5/JfkI+ezU4sEpOAQkHL4Lr8SNXTP6tBMjqPf4oPEqHcs7Y4we6Zo0o6qrkQaDBeTf58h4qBuFfOWQ+eNE=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr12433645pjb.99.1664811565787; Mon, 03
 Oct 2022 08:39:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Oct 2022 17:39:25 +0200
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-9-4844816c9808@baylibre.com>
 <5920ba96-886c-1195-656a-a98d7b1f6623@collabora.com>
In-Reply-To: <5920ba96-886c-1195-656a-a98d7b1f6623@collabora.com>
MIME-Version: 1.0
Date:   Mon, 3 Oct 2022 17:39:25 +0200
Message-ID: <CABnWg9vdYYgxPxMY=qm=JSd4ZV4hHB7g8M4he3GzUj6-rzmfQw@mail.gmail.com>
Subject: Re: [PATCH v1 09/17] drm/mediatek: hdmi: add connector flag
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Sep 2022 12:38, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add a flag to indicate support for an external connector
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 86653ebaacfd..30407603d693 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -199,20 +199,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
>>   		goto put_device;
>>   	}
>>
>> -	remote = of_graph_get_remote_node(np, 1, 0);
>> -	if (!remote) {
>> -		ret = -EINVAL;
>> -		goto put_device;
>> -	}
>> -
>> -	if (!of_device_is_compatible(remote, "hdmi-connector")) {
>> -		hdmi->next_bridge = of_drm_find_bridge(remote);
>> -		if (!hdmi->next_bridge) {
>> -			dev_err(dev, "Waiting for external bridge\n");
>> -			of_node_put(remote);
>> -			ret = -EPROBE_DEFER;
>> +	if (hdmi->conf->has_connector) {
>
>If MT8195's DPI uses the internal HDMI->DP converter, I say that the external
>DP has HDMI input and DP output.
>Logically, you can't have a HDMI port that's connected to nothing.
>
>Please, rethink this change.
>
>Regards,
>Angelo

Hi Angelo,
Sorry for the late answer.

I have reworked this for V2, to use an hdmi connector device node to "bind"
both the hdmi and hdmi-ddc driver together as with "legacy" code.
So this patch is dropped in V2 (hopefully ready soon).

Just to make things clear, the hardware path on mt8195 is:
DPI1 -> HDMI Tx -> HDMI Phy
DP Intf1 -> DP Tx -> USB Type C Mux -> DP over USB-C

So there's no HDMI->DP converter involved.

Thx,
Guillaume.
