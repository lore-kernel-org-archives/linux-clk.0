Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F6CC07E85
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:33:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B3812082F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lfu1PXI3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B3812082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbeLCSdu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 13:33:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:54450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbeLCSdo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 13:33:44 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2273B2145D;
        Mon,  3 Dec 2018 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543862021;
        bh=oz6A+bf0ogIWlM0m4roHnd74rx8mLkMWd1Pz55Ek66w=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Lfu1PXI3GLjdlaoEzfI+P8qhr+/w7iiwqsddOEquEN10wYiMBgJO0I2aznvwbFXM9
         LZkBYCFVoEgA2VboyEoQIitRZMhmtUb90GfKMKCVpIsscRkkly0qVGpbZnkwOuOh3q
         ULi/EnTEFbmmHM/LLJ1LK16GHQZlCXhvcLumDPzw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542809234-539-3-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <1542809234-539-3-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154386202048.88331.5253991483966563852@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V8 2/7] clk: imx: add scu clock common part
Date:   Mon, 03 Dec 2018 10:33:40 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-11-21 06:12:23)
> Add scu clock common part which will be used by client clock drivers.
> SCU clocks are totally different from the legacy clocks (No much
> legacy things can be reused). So a new configuration option
> CONFIG_MXC_CLK_SCU is added.

Why are they different? Can you add more details on what has changed
here? I hope to see something like "it's a firmware interface now".

> =

> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> new file mode 100644
> index 0000000..5f9c1f6
> --- /dev/null
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2018 NXP
> + *   Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +
> +#include "clk-scu.h"
> +
> +struct imx_sc_ipc *ccm_ipc_handle;
> +
> +/*
> + * struct clk_scu - Description of one SCU clock
> + * @hw: the common clk_hw
> + * @rsrc_id: resource ID of this SCU clock
> + * @clk_type: type of this clock resource
> + *
> + * This structure describes one SCU clock

Drop this sentence, it duplicates the first line of this kernel-doc.

> + */
> +struct clk_scu {
> +       struct clk_hw hw;
> +       u32 rsrc_id;
> +       u8 clk_type;
> +};
> +
> +/*
> + * struct imx_sc_msg_req_set_clock_rate - clock set rate protocol
> + * @hdr: SCU protocol header
> + * @rate: rate to set
> + * @resource: clock resource to set rate
> + * @clk: clk type of this resource
> + *
> + * This structure describes the SCU protocol of clock rate set
> + */
> +struct imx_sc_msg_req_set_clock_rate {
> +       struct imx_sc_rpc_msg hdr;
> +       u32 rate;
> +       u16 resource;

These should be __le32 and __le16 presumably because the firmware
interface we're talking to is little endian?

> +       u8 clk;
> +} __packed;
> +
> +struct req_get_clock_rate {
> +       u16 resource;

Same.

> +       u8 clk;
> +} __packed;
> +
> +struct resp_get_clock_rate {
> +       u32 rate;

Same.

> +};
> +
> +/*
> + * struct imx_sc_msg_get_clock_rate - clock get rate protocol
> + * @hdr: SCU protocol header
> + * @req: get rate request protocol
> + * @resp: get rate response protocol
> + *
> + * This structure describes the SCU protocol of clock rate get
> + */
> +struct imx_sc_msg_get_clock_rate {
> +       struct imx_sc_rpc_msg hdr;
> +       union {
> +               struct req_get_clock_rate req;
> +               struct resp_get_clock_rate resp;
> +       } data;
> +} __packed;

Does this need __packed? struct imx_sc_rpc_msg is naturally aligned so I
think we don't need this.

> +
> +/*
> + * struct imx_sc_msg_req_clock_enable - clock gate protocol
> + * @hdr: SCU protocol header
> + * @resource: clock resource to gate
> + * @clk: clk type of this resource
> + * @enable: whether gate off the clock
> + * @autog: HW auto gate enable
> + *
> + * This structure describes the SCU protocol of clock gate
> + */
> +struct imx_sc_msg_req_clock_enable {
> +       struct imx_sc_rpc_msg hdr;
> +       u16 resource;
> +       u8 clk;
> +       u8 enable;
> +       u8 autog;
> +} __packed;
> +
> +static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct clk_scu, hw);
> +}
> +
> +/*
> + * clk_scu_recalc_rate - Get clock rate for a SCU clock
> + * @hw: clock to get rate for
> + * @parent_rate: parent rate provided by common clock framework, not used
> + *
> + * Gets the current clock rate of a SCU clock. Returns the current
> + * clock rate, or zero in failure.
> + */
> +static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct imx_sc_msg_get_clock_rate msg;

I really hope msg isn't DMAed to the firmware, because the response is
in there!

> +       struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +       int ret;
> +
> +       hdr->ver =3D IMX_SC_RPC_VERSION;
> +       hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +       hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_RATE;
> +       hdr->size =3D 2;
> +
> +       msg.data.req.resource =3D clk->rsrc_id;
> +       msg.data.req.clk =3D clk->clk_type;
> +
> +       ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
> +       if (ret) {
> +               pr_err("%s: failed to get clock rate %d\n",
> +                      clk_hw_get_name(hw), ret);
> +               return 0;
> +       }
> +
> +       return msg.data.resp.rate;
> +}
> +
> +/*
> + * clk_scu_round_rate - Round clock rate for a SCU clock
> + * @hw: clock to round rate for
> + * @rate: rate to round
> + * @parent_rate: parent rate provided by common clock framework, not used
> + *
> + * Returns the current clock rate, or zero in failure.
> + */
> +static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long *parent_rate)
> +{
> +       /*
> +        * Assume we support all the requested rate and let the SCU firmw=
are
> +        * to handle the left work
> +        */
> +       return rate;
> +}
> +
> +/*
> + * clk_scu_set_rate - Set rate for a SCU clock
> + * @hw: clock to change rate for
> + * @rate: target rate for the clock
> + * @parent_rate: rate of the clock parent, not used for SCU clocks
> + *
> + * Sets a clock frequency for a SCU clock. Returns the SCU
> + * protocol status.
> + */
> +static int clk_scu_set_rate(struct clk_hw *hw, unsigned long rate,
> +                           unsigned long parent_rate)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct imx_sc_msg_req_set_clock_rate msg;
> +       struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +
> +       hdr->ver =3D IMX_SC_RPC_VERSION;
> +       hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +       hdr->func =3D IMX_SC_PM_FUNC_SET_CLOCK_RATE;
> +       hdr->size =3D 3;
> +
> +       msg.rate =3D rate;
> +       msg.resource =3D clk->rsrc_id;
> +       msg.clk =3D clk->clk_type;
> +
> +       return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);

This function returns normal error codes? Or some firmware special error
code? Please make sure we return normal linux errno values from this
driver.

> +}
> +
> +static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u32 resource,
> +                             u8 clk, bool enable, bool autog)
> +{
> +       struct imx_sc_msg_req_clock_enable msg;
> +       struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +
> +       hdr->ver =3D IMX_SC_RPC_VERSION;
> +       hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +       hdr->func =3D IMX_SC_PM_FUNC_CLOCK_ENABLE;
> +       hdr->size =3D 3;
> +
> +       msg.resource =3D resource;
> +       msg.clk =3D clk;
> +       msg.enable =3D enable;
> +       msg.autog =3D autog;
> +
> +       return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
> +}
> +
> +/*
> + * clk_scu_prepare - Enable a SCU clock
> + * @hw: clock to enable
> + *
> + * Enable the clock at the DSC slice level
> + */
> +static int clk_scu_prepare(struct clk_hw *hw)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +
> +       return sc_pm_clock_enable(ccm_ipc_handle, clk->rsrc_id,
> +                                 clk->clk_type, true, false);
> +}
> +
> +/*
> + * clk_scu_unprepare - Disable a SCU clock
> + * @hw: clock to enable
> + *
> + * Disable the clock at the DSC slice level
> + */
> +static void clk_scu_unprepare(struct clk_hw *hw)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       int ret;
> +
> +       ret =3D sc_pm_clock_enable(ccm_ipc_handle, clk->rsrc_id,
> +                                clk->clk_type, false, false);
> +       if (ret)
> +               pr_warn("%s: clk unprepare failed %d\n", clk_hw_get_name(=
hw),
> +                       ret);
> +}
> +
> +static const struct clk_ops clk_scu_ops =3D {
> +       .recalc_rate =3D clk_scu_recalc_rate,
> +       .round_rate =3D clk_scu_round_rate,
> +       .set_rate =3D clk_scu_set_rate,
> +       .prepare =3D clk_scu_prepare,
> +       .unprepare =3D clk_scu_unprepare,
> +};
> +
> +struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type)
> +{
> +       struct clk_init_data init;
> +       struct clk_scu *clk;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
> +       if (!clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk->rsrc_id =3D rsrc_id;
> +       clk->clk_type =3D clk_type;
> +
> +       init.name =3D name;
> +       init.ops =3D &clk_scu_ops;
> +       init.num_parents =3D 0;
> +       /*
> +        * Note on MX8, the clocks are tightly coupled with power domain
> +        * that once the power domain is off, the clock status may be
> +        * lost. So we make it NOCACHE to let user to retrieve the real
> +        * clock status from HW instead of using the possible invalid
> +        * cached rate.
> +        */
> +       init.flags =3D CLK_GET_RATE_NOCACHE;
> +       clk->hw.init =3D &init;
> +
> +       hw =3D &clk->hw;
> +       ret =3D clk_hw_register(NULL, hw);
> +       if (ret) {
> +               kfree(clk);
> +               hw =3D ERR_PTR(ret);
> +       }
> +
> +       return hw;
> +}
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> new file mode 100644
> index 0000000..09f381b
> --- /dev/null
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2018 NXP
> + *   Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#ifndef __IMX_CLK_SCU_H
> +#define __IMX_CLK_SCU_H
> +
> +#include <linux/firmware/imx/sci.h>
> +
> +extern struct imx_sc_ipc *ccm_ipc_handle;
> +
> +static inline int imx_clk_scu_init(void)

Is this supposed to return EPROBE_DEFER or something? Who calls this?

> +{
> +       return imx_scu_get_handle(&ccm_ipc_handle);
> +}
> +
> +struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
> +
