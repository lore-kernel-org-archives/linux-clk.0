Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F6AC6FD1B
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 04:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjCGExl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 23:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjCGExj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 23:53:39 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F6A2A14A
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 20:53:38 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id f31so11317165vsv.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 20:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678164817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcE3GqJXQUb3n8r8Cf9DeCZohIcMVrjYDJopDIgXigE=;
        b=Vzrk9J5moRnykRY4cC9oel+ani17/mQT1hS7fW5bTqtqAd7jAs6j9dMN+vet4QAbiR
         wLn/UcC5dzKOaSIlo8lpjPkkrFOXTgdUN74fa4OM2opvZio84DqY/cRDreHz/DoYvVWg
         0qsmUVy/K8rXM1y8XCrhGaMupA3V/0nQMDoC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678164817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcE3GqJXQUb3n8r8Cf9DeCZohIcMVrjYDJopDIgXigE=;
        b=B+RfzeC4r584/XcZ2JObIu8yf2wgRChsP8OAzms7MzFuAEpqwQ5K23Z9Kn9g0hvVTx
         yMHXfB6Uj3Kp1DxhxMwUqeKjazmTYYgudZ2WcyIqTFHc+GdZMQs6onVB3jKih4woJRw/
         tYWb3qRv634pz+oH9Wmt40TveUomxRvSEZcU/kpNqoCqfqhcuoxXF2d3sjcZmpKnY7OH
         ogVZVPF/V//g+Mp/xs90qZrqyLb7guDPwLPLRMQadgz5l07+5mEmbhoEPO/vqqsTjV16
         1NhgVM/glBsoH2KysJEKWh2UzWL9XYlLwsD9n595f2XUdFKG+KwvAyED+fJ/WPj9xyxo
         Svow==
X-Gm-Message-State: AO0yUKVNCosavvjjTg3QaiwxQfJq7zEqfq2s43HEHrurbVOuYjPj3OHw
        Vr47CkdQbe2W2GitatTtW3o1VlKf6o7c/vdpjMkstA==
X-Google-Smtp-Source: AK7set/aeUCT0y/ttIIfAOxj05+op6eB8+wnmmD5urpBf0dNju9inYFodFHO4EvDUnuOZnaNy9rangMDYNzBR51J9rg=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr8785312vsk.3.1678164817397; Mon, 06 Mar
 2023 20:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Mar 2023 12:53:26 +0800
Message-ID: <CAGXv+5EFtex3YCqkD91XbXura+e1gOWL6uerX5YMw-1=akW7Ew@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] clk: mediatek: clk-pllfh: Export
 register/unregister/parse functions
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com,
        miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
        rex-bc.chen@mediatek.com, jose.exposito89@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 6:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> These functions are used by the various MediaTek apmixed clock drivers
> that may be built as modules: export the common functions used to parse
> related devicetree properties, register and unregister the PLLFH clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
