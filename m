Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5916C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjBUD0G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbjBUD0G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:26:06 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3A123DBA
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:26:05 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id f20so163557uam.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=RrKZTF1jnLdV3a0kGJHaExjDHfO20XWEcPPkfAhXPb2Vk02cA7AfXQDSNzMx7JMS6B
         Uo5GVpZuNhRm/1SzVdI3tCMfZpZBvFKsNt3d3OBy+AhdIoDfcMPu16K4z8LfvvhmrveN
         wXw0WewUMcbD7nsvM9PKjAAJvwI6UplrjSS4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=RXLjcifMMnoeMGGwgR1GiVoyzrWddPfGhCcqVrYiEC6kXWDvkVudZTQqpUlhmE/VzI
         e9EmoC2ik6ZNBTxv63BOuasQELT8P9Y1HzuekJr2riC2ywyJ7Fz7Szr4d+W1U5uCXPuN
         ndOlgykrZkc2ALKTZ8VHioocF4ifkVYrlzBlh+9PA955lPMFSiR+i0W3Ff8CSxIv5Ten
         eaQ1XNBq5Eek9JFpEN7inO+I7BiopWquekpZusTxRGO6/mk1kOUSSbI0iod75Rb9zO6x
         JNL1mItEHf3N4Hcob7pnKZw3sBwMWiY0xFRTRmMFpfX/gGdZ5yk/LGdsk2GvLA7gno8n
         E8jA==
X-Gm-Message-State: AO0yUKW362lgWaFO9+9cS/RbK7yx7eQXsP/l7Jh0D3NlF1pzX/V2H568
        STPnY9Zis1Xah4aUO4SaV0bSkZMa3yRfWamvrOq0GQ==
X-Google-Smtp-Source: AK7set8xWP4VDK1zpzVf35dhRjpPCPCvPMYTxP1UoLD3FNmbqHdbOhuvm16GTBZ9oS4Ysc0oQtkHPSJYnmTdH4nHLSs=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr531329uaa.1.1676949964782; Mon, 20 Feb
 2023 19:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-10-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:25:53 +0800
Message-ID: <CAGXv+5GJqu_xE4EOTFmeNJxLPM7zL-z3Cg22t9mFd=-Yp8B9mw@mail.gmail.com>
Subject: Re: [PATCH v3 09/55] clk: mediatek: mt2712-apmixedsys: Add .remove()
 callback for module build
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a .remove() callback to the apmixedsys driver to allow full module
> build; while at it, also change the usage of builtin_platform_driver()
> to module_platform_driver() to actually make use of the new callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
