Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEDCC43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7957E208C3
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567790005;
	bh=HJFZvCXScmLP/VynpJCvTMJhcWV1p90pwZuT//GAUtM=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=XIA2Kpj+iH8vZqxLkjIJ0gtF0Vf25+Wc5q89zEE2MTj04/yqdMJJw8RehzY5VnV1V
	 uxQXfUpO3AMZVr+XQg5djXCXk64WpW635CSrClRqcR73mu0otjyehbpXQyQqceNZ4o
	 pZSxjy61mwAlKWVM/uRoJ9vRxGKwardEv8+sJImg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389613AbfIFRNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:32846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727816AbfIFRNZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:13:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8847820640;
        Fri,  6 Sep 2019 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567790003;
        bh=HJFZvCXScmLP/VynpJCvTMJhcWV1p90pwZuT//GAUtM=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=ZJoEQi0jpT9Ve/DcxKpgVJ3jVt9wJPl8Pwidllew/7ZRF22Xo0/L4DZh+wMyX7H6/
         mlzn2YxtPBzSEvM4EdXemELSuC1xUoaij7h/msGl+cT97DhvS+PkgFRF0M020jn1f/
         8V/uM9zRguSP3YrNSMNga9fy4fyhVmXK3FcfHtDY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-9-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-9-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH V4 08/11] clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:13:22 -0700
Message-Id: <20190906171323.8847820640@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:22)
> Add parsing clocks from device tree.

Please describe some more here.

> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx=
8qxp-lpcg.c
> index c0aff7c..90326e5 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -157,6 +158,101 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio=
 =3D {
>         .num_max =3D IMX_LSIO_LPCG_CLK_END,
>  };
> =20
> +#define IMX_LPCG_MAX_CLKS      8
> +
> +static struct clk_hw *imx_lpcg_of_clk_src_get(struct of_phandle_args *cl=
kspec,
> +                                             void *data)
> +{
> +       struct clk_hw_onecell_data *hw_data =3D data;
> +       unsigned int idx =3D clkspec->args[0] / 4;
> +
> +       if (idx >=3D hw_data->num) {
> +               pr_err("%s: invalid index %u\n", __func__, idx);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return hw_data->hws[idx];
> +}
> +
> +static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
> +                                      struct device_node *np)
> +{
> +       const char *output_names[IMX_LPCG_MAX_CLKS];
> +       const char *parent_names[IMX_LPCG_MAX_CLKS];
> +       unsigned int bit_offset[IMX_LPCG_MAX_CLKS];
> +       struct clk_hw_onecell_data *clk_data;
> +       struct clk_hw **clk_hws;
> +       struct resource *res;
> +       void __iomem *base;
> +       int count;
> +       int idx;
> +       int ret;
> +       int i;
> +
> +       if (!of_device_is_compatible(np, "fsl,imx8qxp-lpcg"))
> +               return -EINVAL;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       count =3D of_property_count_u32_elems(np, "clock-indices");
> +       if (count < 0) {
> +               dev_err(&pdev->dev, "failed to count clocks\n");
> +               return -EINVAL;
> +       }

Is 'count' expected to be equal to IMX_LPCG_MAX_CLKS? Because later on
in this function we set the num of clks to the MAX instead of the count
from clock-indices.

> +
> +       clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_data, hws, =
IMX_LPCG_MAX_CLKS),

This line is too long.

> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       clk_data->num =3D IMX_LPCG_MAX_CLKS;
> +       clk_hws =3D clk_data->hws;
> +
> +       ret =3D of_property_read_u32_array(np, "clock-indices", bit_offse=
t,
> +                                        count);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to read clocks bit-offset\n");

This isn't called bit-offset anymore.

> +               return -EINVAL;
> +       }
> +
> +       ret =3D of_clk_parent_fill(np, parent_names, count);
> +       if (ret !=3D count) {
> +               dev_err(&pdev->dev, "failed to get clock parent names\n");
> +               return -EINVAL;

return count?

> +       }
> +
> +       ret =3D of_property_read_string_array(np, "clock-output-names",
> +                                           output_names, count);
> +       if (ret !=3D count) {
> +               dev_err(&pdev->dev, "failed to read clock-output-names\n"=
);
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < count; i++) {
> +               idx =3D bit_offset[i] / 4;
> +               if (idx > IMX_LPCG_MAX_CLKS) {
> +                       dev_warn(&pdev->dev, "invalid bit offset of clock=
 %d\n",
> +                                i);
> +                       return -EINVAL;
> +               }
> +
> +               clk_hws[idx] =3D imx_clk_lpcg_scu(output_names[i],
> +                                               parent_names[i], 0, base,
> +                                               bit_offset[i], false);
> +               if (IS_ERR(clk_hws[idx])) {
> +                       dev_warn(&pdev->dev, "failed to register clock %d=
\n",
> +                                idx);
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_sr=
c_get,
> +                                          clk_data);

If this fails does imx_clk_lpcg_scu() need to be unwound and unregister
clks?

> +}
> +
