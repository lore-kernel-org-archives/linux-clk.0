Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC0BC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Nov 2023 08:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjKFIuh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Nov 2023 03:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjKFIuh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Nov 2023 03:50:37 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBDCD8
        for <linux-clk@vger.kernel.org>; Mon,  6 Nov 2023 00:50:32 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507c5249d55so5441701e87.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Nov 2023 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699260631; x=1699865431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvsRfYdBOBRI+2J2urSL+yk+k1mRSeviqg4tt/tKPu4=;
        b=hO1dO19A4v401DrpNXgLuzSL0P+oB2qcFAqt1L7t9KGJU04IIN5uXcRdXaxpDeko2O
         mP+hBlE1K1UttF9J2OVmx4oKR4Pmz090OmI/9xOMungGXdWRz35vtI98Dp0iD+PCHlyC
         ydBpKYlg2lFfthsSxZVSrolqEmHBnYC0j/YT9mIoa0u6T+xlWHEnGxFa2fUgZ2SxJZgw
         HZq+NcuXuY8z9ZSqVRGEV/ir3PJenUnXKLfCNPabMlqJ/gu87H67aMl51zJJDwIN1Xm0
         5erkkjT8n2idogH8zfCSn0t85Q/Rwrx+xtSxsZZjMr7Mv3rzsFpQZwdS+ulPua/pe384
         m/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699260631; x=1699865431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvsRfYdBOBRI+2J2urSL+yk+k1mRSeviqg4tt/tKPu4=;
        b=HmprEF5IBxE3RuOwarai1C8eolxynzyqQUmSxBcY5uFKCU4rKQ8DMD4ngXwcoQq8hZ
         MKADvwzj6ss8BzJ4tHN2j0YsMo+khD+UiYSl9bmuYhuDWUn/wYFDAqALXrCUwLgNt4s8
         eNPXQuEJzkOjpJE6le96wBiv2YqYhBKtJuY8hXWo0j/9/MhqpcyDfQ1POYBtU3Zgjgiw
         UDWGpMYF1Qc1XUwAAYf0+mCFw/KzUR0RLMMe4zpxoHsmbUdBwfpog16x8yKrG6NKRZDf
         ys2Sg14PH2TKxjdLZTf9nkdPi2MMba7w4iLC5MUE2jarm8dwr/aCghJTwP6zMxLYRv2t
         xwcQ==
X-Gm-Message-State: AOJu0YwenJ6/R+jP3CXUZ9Ado9F6zAeQ0fVo0RAtTU1ImhEJ12iwQnR3
        vaY3QgVnTLM+8VGxP2P7z+nuWg==
X-Google-Smtp-Source: AGHT+IFtG/faO87cJotALJcL+BJ0/q9GgEd4szJRDFIiNksFhPa1PUp3VBl0axOB+aGZEJFN0JWOIQ==
X-Received: by 2002:ac2:5626:0:b0:507:9ff6:75b6 with SMTP id b6-20020ac25626000000b005079ff675b6mr19451969lff.50.1699260630822;
        Mon, 06 Nov 2023 00:50:30 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b00405bbfd5d16sm11521401wms.7.2023.11.06.00.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 00:50:30 -0800 (PST)
Message-ID: <34b7503e-5d1e-4fd2-a909-d7f50e45c8e6@baylibre.com>
Date:   Mon, 6 Nov 2023 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
 for top_dp/edp muxes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org
Cc:     mturquette@baylibre.com, matthias.bgg@gmail.com,
        wenst@chromium.org, msp@baylibre.com, yangyingliang@huawei.com,
        u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com>
 <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 03/11/2023 11:25, AngeloGioacchino Del Regno wrote:
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
> 
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>   - top_edp was set to TVDPLL1, outputting X GHz
>   - top_dp was set to TVDPLL2, outputting Y GHz
>     - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>   - top_dp is switched to TVDPLL1
>   - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>   - eDP display is garbled
> 
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
