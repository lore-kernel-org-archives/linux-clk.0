Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC113C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 09:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FBE52222A
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 09:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jvDdn/lr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgJNJYL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731180AbgJNJV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 05:21:56 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D6BC0613BD
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2020 15:27:08 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id l6so955805vsr.7
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2020 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nEh8aWSBzrx6UT31IWc0LsTnrFS8ZDfHAx42jaS0Cjs=;
        b=jvDdn/lroKNiUWKl5bN/qT1jMxMbc7sZcDAu3vbzKBJYEOQM00+YdWsySveShwX1qr
         LTiDPBQG5xOZ/wML9iM6nzFQgC76cHZwJpg9OoaMQN3FhlVSj/quqpW7HMh0VMVa8ILu
         VS8aq2hPsvuME+fGU5NMgPErb9Z5OJzMtD+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nEh8aWSBzrx6UT31IWc0LsTnrFS8ZDfHAx42jaS0Cjs=;
        b=L5dZ0AEv4GietbbM1L8r6DpcKHDDwi33rmljKKy8tk3yHSA8bLzFa2E0YWG0UnFTau
         RsG70LfHJ+mZmFFrqzOsUfw8dS8setq46A8QJDGp8CDCc2Xt7IquM3Pf3KxaGjoaoPPj
         9GVoyy0eBrWqGY8G/jef7LKA47mHRpKWvlcn/36lbqtvZEHyVuMsA7WOQin7uebFrxSk
         RfLx2JNpUAejaSuibwsQA0gc1IOJGwV4EoI23+vX+/+R7aR/vvxbNItweQAf2Av4fx0H
         +mngiYqROXVXOYU4NTniw7vrFQy8KebxMQfXNLDu/xt9Np/doPQzSACpNMgDPsLKmqMg
         vDCg==
X-Gm-Message-State: AOAM532H7Iz6NWpkIMuBTcdJnounTezmLqvIhLcxewX73ObKU6ytr5R+
        1bB1I23puNJtC3DWoDEDUSrNhZSVVpJ8pw==
X-Google-Smtp-Source: ABdhPJzmlGAS+/zfTb1WII62pAzCOWVkXEXGAXAHQYHK2MoOol6hUKJQo0bfJVuW4f0cXZ5ZUYocgg==
X-Received: by 2002:a67:6504:: with SMTP id z4mr1944542vsb.48.1602628027566;
        Tue, 13 Oct 2020 15:27:07 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id m125sm195010vkh.15.2020.10.13.15.27.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id x11so503689uav.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr1804071uad.104.1602628026293;
 Tue, 13 Oct 2020 15:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <1602614008-2421-1-git-send-email-tdas@codeaurora.org> <1602614008-2421-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1602614008-2421-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 15:26:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOj-Vg36v8GtE1sjay0jCdCLgRMJtyN9ZYyZhsNkdVfg@mail.gmail.com>
Message-ID: <CAD=FV=XOj-Vg36v8GtE1sjay0jCdCLgRMJtyN9ZYyZhsNkdVfg@mail.gmail.com>
Subject: Re: [PATCH v0] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Oct 13, 2020 at 11:33 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> In the case where the PLL configuration is lost, then the pm runtime
> resume will reconfigure before usage.
>
> Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7180.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 228d08f..5804a93 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
>         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>  };
>
> +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> +{
> +       struct regmap *regmap = dev_get_drvdata(dev);
> +       int l_val;

nit: technically "unsigned int" to match what regmap_read takes.

> +
> +       pm_clk_resume(dev);

Even though pm_clk_resume() doesn't currently return any errors, it
would be good form to check.  AKA:

ret = pm_clk_resume(dev);
if (ret)
  return ret;


> +       /* Read PLL_L_VAL */
> +       regmap_read(regmap, 0x1004, &l_val);
> +       if (!l_val)
> +               clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> +                               &lpass_lpaaudio_dig_pll_config);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops lpass_core_pm_ops = {
> +       SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)
> +};
> +
>  static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>  {
>         const struct qcom_cc_desc *desc;
> @@ -386,6 +405,9 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>         clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
>                                 &lpass_lpaaudio_dig_pll_config);
>
> +       pdev->dev.driver->pm = &lpass_core_pm_ops;
> +       dev_set_drvdata(&pdev->dev, regmap);

I'm kinda confused.  Why not just change "lpass_core_cc_pm_ops"?  Then
you can get rid of the above two lines of code and get rid of the
whole "lpass_core_pm_ops" structure?


-Doug
