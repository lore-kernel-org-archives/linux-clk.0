Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D1FC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjBQH0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjBQH0r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:26:47 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700DB5DE27
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:41 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id p9so49769vki.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fdxhdYgUrieRTHDHYg/VxkIsWyyrT4Lc3Lq1NP/cZ4=;
        b=ZZ7ZJuigvVz5KfSje/MdYNtDmS91EC9g9+auzcOt2EDXKzg1pv92alpsJtnuGu7XPz
         ySePv3EhuySbjAcK/wxIz3IiWls+IFVZgB7HmJUcKW/dIeZbAiHpIW9qE0P5vt3/OVFH
         behyGp/qka25mpBkg7FLpJL2Qf05w8Jr8KxS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fdxhdYgUrieRTHDHYg/VxkIsWyyrT4Lc3Lq1NP/cZ4=;
        b=TMJgoFRwZa/IXRpZPIoW4X0LUPinSEmi9Gp3Bqi9ybEhQymMPM88WIiefwnSJhakmr
         MQxTHhTdUzLcnjppYzgl7cEMDRH52p+iYM5xOxDgpttcbYg6F/Fm9NJlA7V8kT1bfRo3
         iH8xzgUJR7a3CenLiRKQZqs9QR46goomRzspcOwdiB+tvIY4WC0uASYdGG8GzkVgec19
         mvI9YR2D31aH8NAYdlZkeKI8c6sXdBC6U8FdlCi5iO3V/NFMwrBnpO0FlaFWfrVIb1YO
         LiyAo5cPtJVBhO9nLIyiGl+gdDsKvoAZfcuilS12qo97n3+uCOf7R+V76YFOqoQe6LH4
         deLA==
X-Gm-Message-State: AO0yUKVcffQc1L6XPHj5AHR1rA3Dt9xO+a3pdF1IQk+k98MyimifO55w
        AVtKnmqgm4Yf9InONPtLwLAbrGZK9p4G0qcFMTHXrQ==
X-Google-Smtp-Source: AK7set8jPjsh41skslVXvudRd5O1/mU3tyaEp+bhxmI9s0f0Gj25wehb+e9KPewhiMMtyVT6ouBXY2+DbtziPqkuqsY=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1392988vke.2.1676618800587; Thu, 16 Feb
 2023 23:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-44-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:26:29 +0800
Message-ID: <CAGXv+5EWRJNhw86-pAduob4Yjy83tdZPpBFbj-13Tg4=_Vkucg@mail.gmail.com>
Subject: Re: [PATCH v2 43/47] clk: mediatek: Allow building most MT6797 clock
 drivers as modules
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Most of the MT6797 clock drivers can be built as modules: change them
> to tristate to allow that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
