Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B7DC43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6FAF21780
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UQD3Q2jS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6FAF21780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729115AbeKOUAl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 15:00:41 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43047 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbeKOUAl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Nov 2018 15:00:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id r10so2937544wrs.10
        for <linux-clk@vger.kernel.org>; Thu, 15 Nov 2018 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+dWf1/cybYH9Uzg4HwdijekvX5EolKfnz5DYANY4zdw=;
        b=UQD3Q2jS6uPfU2vXqpYTQW39KDdvhAmjsJ6mNaHQ1vHmoi1OA+iK5NmrR5XfebNgkA
         OzyUqhsBRAtD5eFqf2tBp2nsU0pKb4VOTmQz0u3ICYmnQ3AmkOyHxQcCieS9GjceEW6V
         JCXDk+jnQluYs4XkD5Ldgl8eeBnZhlOJZ+WsPhx96JL1biKO7gxewG6rYcRw0NrF+Gv/
         l1evmUIIYd7CoUmFSKy57vigMkMBcWtZFukaCYbVZE/kIQ4RC3+CG3uzGLxVfGvVhZJ5
         kegy3u10rO91CVlAglZSyb34CxEcly4VtELBJS75HffRmO43Bji1cxdWFmIs4n+ivK9s
         wYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+dWf1/cybYH9Uzg4HwdijekvX5EolKfnz5DYANY4zdw=;
        b=EYMPME23hdp/+004s1BCzZhWdgq9rScHMDGqBm8243QYB19P8cTFI6lH+DM81Z22N1
         dbWinp0qIRzbzXCkHaNhf9EmvHgWvehr3QlpA6P7PxGdrapTzHJ60zI3w2k/I/hsXCYo
         6d7ZrmDWlO4/MWOvIGV7EXrAgIzJ8k8/MBIuMr+HIBqfTZ4/WwR8+Ddyar0tKMU/hHjE
         QX6l8zdOAJbr32u1qTxpEhVZPDlkHZVu3zYxEFv0AhKMebnlAZ2qOq+zNhHFs35htIKb
         jfQFl6gbY5FbzRgHE1G5UvSSdbtbhXXFMlXqIz9ie+dHZma1le07PyWQUq4kRjez/ovW
         bg1A==
X-Gm-Message-State: AGRZ1gKXY05ydDtPcneXLa89gufsuyCtOsp21csuqqk6m3MjDlAqfVQK
        H1lmkp9rVMri520F8/Rv5TwBhg==
X-Google-Smtp-Source: AJdET5eJsnEkHyTv3gNjHKE5lgO5FwzXDvh6Bs9z9OSBTy+nIHCxOKPG6UpXU9izjF8Clgo3TWBGnw==
X-Received: by 2002:a5d:4609:: with SMTP id t9-v6mr5254025wrq.198.1542275612889;
        Thu, 15 Nov 2018 01:53:32 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id f18-v6sm21984772wre.57.2018.11.15.01.53.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Nov 2018 01:53:32 -0800 (PST)
Message-ID: <a27625d70e7061e0ee380230755449a1d34c55fb.camel@baylibre.com>
Subject: Re: [RFC v1 1/7] clk: meson: meson8b: run from the XTAL when
 changing the CPU frequency
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        narmstrong@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Date:   Thu, 15 Nov 2018 10:53:30 +0100
In-Reply-To: <20181114225725.2821-2-martin.blumenstingl@googlemail.com>
References: <20181114225725.2821-1-martin.blumenstingl@googlemail.com>
         <20181114225725.2821-2-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2018-11-14 at 23:57 +0100, Martin Blumenstingl wrote:
> Changing the CPU clock requires changing various clocks including the
> SYS PLL. The existing meson clk-pll and clk-regmap drivers can change
> all of the relevant clocks already.
> However, changing for exampe the SYS PLL is problematic because as long
> as the CPU is running off a clock derived from SYS PLL changing the
> latter results in a full system lockup.
> Fix this system lockup by switching the CPU clock to run off the XTAL
> while we are changing the any of the clocks in the CPU clock tree.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Original submission wasn't that far off after all ;)

Thanks for digging and fixing all the bugs around it ! It must have been quite
a challenge !

If you don't mind, I would prefer if your series put all the clock fixes
first, and this particular change just before the last one allowing RW ops.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/meson8b.c | 63 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9bd5920da0ff..40e77fe4ba7c 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1103,6 +1103,53 @@ static const struct reset_control_ops
> meson8b_clk_reset_ops = {
>  	.deassert = meson8b_clk_reset_deassert,
>  };
>  
> +struct meson8b_nb_data {
> +	struct notifier_block nb;
> +	struct clk_hw_onecell_data *onecell_data;
> +};
> +
> +static int meson8b_cpu_clk_notifier_cb(struct notifier_block *nb,
> +				       unsigned long event, void *data)
> +{
> +	struct meson8b_nb_data *nb_data =
> +		container_of(nb, struct meson8b_nb_data, nb);
> +	struct clk_hw **hws = nb_data->onecell_data->hws;
> +	struct clk_hw *cpu_clk_hw, *parent_clk_hw;
> +	struct clk *cpu_clk, *parent_clk;
> +	int ret;
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		parent_clk_hw = hws[CLKID_XTAL];
> +		break;
> +
> +	case POST_RATE_CHANGE:
> +		parent_clk_hw = hws[CLKID_CPU_SCALE_OUT_SEL];
> +		break;
> +
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	cpu_clk_hw = hws[CLKID_CPUCLK];
> +	cpu_clk = __clk_lookup(clk_hw_get_name(cpu_clk_hw));
> +
> +	parent_clk = __clk_lookup(clk_hw_get_name(parent_clk_hw));
> +
> +	ret = clk_set_parent(cpu_clk, parent_clk);
> +	if (ret)
> +		return notifier_from_errno(ret);
> +
> +	udelay(100);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct meson8b_nb_data meson8b_cpu_nb_data = {
> +	.nb.notifier_call = meson8b_cpu_clk_notifier_cb,
> +	.onecell_data = &meson8b_hw_onecell_data,
> +};
> +
>  static const struct regmap_config clkc_regmap_config = {
>  	.reg_bits       = 32,
>  	.val_bits       = 32,
> @@ -1112,6 +1159,8 @@ static const struct regmap_config clkc_regmap_config =
> {
>  static void __init meson8b_clkc_init(struct device_node *np)
>  {
>  	struct meson8b_clk_reset *rstc;
> +	const char *notifier_clk_name;
> +	struct clk *notifier_clk;
>  	void __iomem *clk_base;
>  	struct regmap *map;
>  	int i, ret;
> @@ -1166,6 +1215,20 @@ static void __init meson8b_clkc_init(struct
> device_node *np)
>  			return;
>  	}
>  
> +	/*
> +	 * FIXME we shouldn't program the muxes in notifier handlers. The
> +	 * tricky programming sequence will be handled by the forthcoming
> +	 * coordinated clock rates mechanism once that feature is released.
> +	 */
> +	notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
> +	notifier_clk = __clk_lookup(notifier_clk_name);
> +	ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
> +	if (ret) {
> +		pr_err("%s: failed to register the CPU clock notifier\n",
> +		       __func__);
> +		return;
> +	}
> +
>  	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
>  				     &meson8b_hw_onecell_data);
>  	if (ret)


