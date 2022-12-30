Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEEDC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 05:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiL3FMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 00:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiL3FMs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 00:12:48 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A03D15FD1
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:12:47 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id p30so14751561vsr.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4sxQBZTeARJaOtpQ26mu6MKSoj0k8stp/j0GJKpAsI=;
        b=S2uvp+3QvQHmc53dc1Zb1zRkgnvTrqDFph6z1iQJ1dkE2S6Lmyw3pPi+ReQ+TZaYlj
         +bKXUOQpdkzuNh3oeBy/xi3M8XP7xyHXoZqCEIFP8mjmmnjMsQAnKKXwimC5lwdvax/e
         7Thkl1MUfROcmT+3COFvA0FOA1TwikZ6me+j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4sxQBZTeARJaOtpQ26mu6MKSoj0k8stp/j0GJKpAsI=;
        b=nXzHBs6gF29q5qXzmQSuK/bFTENtKbFap1bp5likpK90roYv9vRk+wAdwaYZt5Hwgv
         lwsIkKr3H/tl8D0I0OfVNqySyxYWPfFs72egJwY5laQRJdSw6k901+87QaTO4kJ5/Mke
         RGJtHVHdEqePkv+PviFiVgZc71E77dxNp8NRhjpB3DI5xnw1MenZXY7L/9PSk0HFRnIQ
         orMD3XrrZFzjKazV0Ei0JZxiUVOl2Ou0/05k+aYBXQagLM8hW5d+JFr1jBVeLIkHR1rS
         JQZAO1bXmwLf9xTULIJ72IqC95DUSHjqAcoKoHmrn7gowjVz5bDVJ5PqLqQ5rUpCRKGL
         pmFA==
X-Gm-Message-State: AFqh2kp6ToIIySQgc0TFQPfteEjPOipal7Uel4/VTxgWVAqIr7I801+m
        fqDLL6keyfZZKZxoC76i5YM1Ihpfut/y6Nl4r55erg==
X-Google-Smtp-Source: AMrXdXvBIpfvv7eYq0qOFA9b8lukSrK2ZsYP9FnFRdTNpKcBJc7aHUFbMHI+JTfSPUyiqECr7ENUw3wXDtbCuyv/VHU=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2639318vsv.9.1672377166648; Thu, 29 Dec
 2022 21:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-12-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 13:12:35 +0800
Message-ID: <CAGXv+5GYk2wr-UnnshT3R2uDUSn7-i5KifyJ4qDDZbptSQ9G7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] clk: mediatek: Switch to mtk_clk_simple_probe()
 where possible
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> mtk_clk_simple_probe() is a function that registers mtk gate clocks
> and, if reset data is present, a reset controller and across all of
> the MTK clock drivers, such a function is duplicated many times:
> switch to the common mtk_clk_simple_probe() function for all of the
> clock drivers that are registering as platform drivers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2701-aud.c   | 26 +++----
>  drivers/clk/mediatek/clk-mt2701-eth.c   | 34 +++------
>  drivers/clk/mediatek/clk-mt2701-g3d.c   | 56 +++-----------
>  drivers/clk/mediatek/clk-mt2701-hif.c   | 36 +++------
>  drivers/clk/mediatek/clk-mt2712.c       | 83 ++++++++-------------
>  drivers/clk/mediatek/clk-mt6779.c       | 42 ++++++-----
>  drivers/clk/mediatek/clk-mt7622-aud.c   | 49 +++----------
>  drivers/clk/mediatek/clk-mt7622-eth.c   | 82 ++++-----------------
>  drivers/clk/mediatek/clk-mt7622-hif.c   | 85 ++++-----------------
>  drivers/clk/mediatek/clk-mt7629-hif.c   | 85 ++++-----------------
>  drivers/clk/mediatek/clk-mt8183-audio.c | 19 +++--
>  drivers/clk/mediatek/clk-mt8183.c       | 75 ++++++++-----------
>  drivers/clk/mediatek/clk-mt8192-aud.c   | 25 +++----
>  drivers/clk/mediatek/clk-mt8192.c       | 98 ++++++++-----------------
>  14 files changed, 236 insertions(+), 559 deletions(-)

This looks mostly good, however ...

> diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
> index ab13ab618fb5..1fd6d96b34dc 100644
> --- a/drivers/clk/mediatek/clk-mt2701-aud.c
> +++ b/drivers/clk/mediatek/clk-mt2701-aud.c
> @@ -76,6 +76,7 @@ static const struct mtk_gate_regs audio3_cg_regs = {
>  };
>
>  static const struct mtk_gate audio_clks[] = {
> +       GATE_DUMMY(CLK_DUMMY, "aud_dummy"),
>         /* AUDIO0 */
>         GATE_AUDIO0(CLK_AUD_AFE, "audio_afe", "aud_intbus_sel", 2),
>         GATE_AUDIO0(CLK_AUD_HDMI, "audio_hdmi", "audpll_sel", 20),
> @@ -138,29 +139,26 @@ static const struct mtk_gate audio_clks[] = {
>         GATE_AUDIO3(CLK_AUD_MEM_ASRC5, "audio_mem_asrc5", "asm_h_sel", 14),
>  };
>
> +static const struct mtk_clk_desc audio_desc = {
> +       .clks = audio_clks,
> +       .num_clks = ARRAY_SIZE(audio_clks),
> +};
> +
>  static const struct of_device_id of_match_clk_mt2701_aud[] = {
> -       { .compatible = "mediatek,mt2701-audsys", },
> -       {}
> +       { .compatible = "mediatek,mt2701-audsys", .data = &audio_desc },
> +       { /* sentinel */ }
>  };
>
>  static int clk_mt2701_aud_probe(struct platform_device *pdev)
>  {
> -       struct clk_hw_onecell_data *clk_data;
> -       struct device_node *node = pdev->dev.of_node;
>         int r;
>
> -       clk_data = mtk_alloc_clk_data(CLK_AUD_NR);
> -
> -       mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
> -                              clk_data, &pdev->dev);
> -
> -       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       r = mtk_clk_simple_probe(pdev);
>         if (r) {
>                 dev_err(&pdev->dev,
>                         "could not register clock provider: %s: %d\n",
>                         pdev->name, r);
> -
> -               goto err_clk_provider;
> +               return r;
>         }
>
>         r = devm_of_platform_populate(&pdev->dev);
> @@ -170,13 +168,13 @@ static int clk_mt2701_aud_probe(struct platform_device *pdev)
>         return 0;
>
>  err_plat_populate:
> -       of_clk_del_provider(node);
> -err_clk_provider:
> +       mtk_clk_simple_remove(pdev);
>         return r;
>  }
>
>  static struct platform_driver clk_mt2701_aud_drv = {
>         .probe = clk_mt2701_aud_probe,
> +       .remove = mtk_clk_simple_remove,

I'm not a big fan of mixing devres and non-devres teardown code. Automatic
devres teardown happens after the remove callback returns, so in this
case you could have child devices being unregistered that touch clocks
or resets that have already been unregistered and freed in the remove
callback.

>         .driver = {
>                 .name = "clk-mt2701-aud",
>                 .of_match_table = of_match_clk_mt2701_aud,

[...]

> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c

[...]

> @@ -1482,7 +1459,11 @@ static struct platform_driver clk_mt2712_drv = {
>
>  static int __init clk_mt2712_init(void)
>  {
> -       return platform_driver_register(&clk_mt2712_drv);
> +       int ret = platform_driver_register(&clk_mt2712_drv);
> +
> +       if (ret)
> +               return ret;
> +       return platform_driver_register(&clk_mt2712_simple_drv);
>  }
>
>  arch_initcall(clk_mt2712_init);

Would this get cleaned up even more? I.e. have just one driver left and
we could have the nice *_platform_driver() macros.

Thanks
ChenYu
