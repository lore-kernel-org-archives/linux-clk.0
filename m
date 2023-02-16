Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7660C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 05:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjBPFbT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 00:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjBPFbR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 00:31:17 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90C818E
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 21:31:07 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id br9so1426840lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFQCMoGRAPH6dehjVG/yBE9xvAz6XsP3o4px0fSg/AM=;
        b=VwmWqxzsNj9sHR7iN7HlMKc//rExG1U9GW4iut0f8hvW3evoQRmPOFxjMUT1tymqv3
         XQmq3KR1NUtc24ypeu2MCrJv00KF9uXWf1N6QQ5iToqoyZDQd1KuOxFsN01xIbMbj+To
         k49ZaioWZ4sQyn83Mw5B+y2wv/gG0BmyXcyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFQCMoGRAPH6dehjVG/yBE9xvAz6XsP3o4px0fSg/AM=;
        b=mkkRXuV3WNZDFpW6JTZqgDqF1D6fhETSe2kXM9NFULKBg50u0oupzPh/iVek6ncxgL
         KAIxEspDcNikAXFD+FwPxp+MJcU+wTNLV0DLzt0fDzet0O++Ohe4VwdbyNQClwIdDce6
         nWn79/r2uyqkxobtGwNGZ2pBQt2reQ8kHPmQ4Lr3k2330AqCatJVLN5NnnnWIEBBhpta
         wwJtZIL5ABK/78JNpqpHwQE2Z98A1qGyGXPWYU57oz32sGWKHpScnqdYB24ri6cjFx7+
         ob9NvgD4AsJ6r0lw9E5R+DfoOqQFbdTGJNZIgsU7FzHS3ZH/XDlY21CzvQdgyx8UT0gc
         BSug==
X-Gm-Message-State: AO0yUKXxARhHk7U8Rc0Bm2brAtc/vlGSWQD5diWuM/l6jbSF0ACOhX5S
        BnPmuZa+g7jVPfe5glZsRmHbaLwcQ/TFivTrWXCVHQ==
X-Google-Smtp-Source: AK7set9zOf0Nj+96wPZzv/vZ3f7zQsOYTb0J2vm25mrASaWg6smR9eD6/ZCsK+Fc2IYoEm/MvAwwsI/20Ivhbdf/C/0=
X-Received: by 2002:a05:6512:96b:b0:4d5:ca43:704a with SMTP id
 v11-20020a056512096b00b004d5ca43704amr1294568lft.13.1676525466138; Wed, 15
 Feb 2023 21:31:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Feb 2023 21:31:05 -0800
MIME-Version: 1.0
In-Reply-To: <20230215151330.539885-5-quic_mohs@quicinc.com>
References: <20230215151330.539885-1-quic_mohs@quicinc.com> <20230215151330.539885-5-quic_mohs@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 15 Feb 2023 21:31:05 -0800
Message-ID: <CAE-0n53mDzqua47jEqrJwQBhcQcyBjJAtNvH2J-tCPhkvV9JtA@mail.gmail.com>
Subject: Re: [RESEND v8 4/5] clk: qcom: lpassaudiocc-sc7280: Merge AHB clocks
 into lpass_aon
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com, robh+dt@kernel.org
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mohammad Rafi Shaik (2023-02-15 07:13:29)
> @@ -828,8 +830,9 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
>         if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode")) {
>                 lpass_audio_cc_sc7280_regmap_config.name = "cc";
>                 desc = &lpass_cc_sc7280_desc;
> -               ret = qcom_cc_probe(pdev, desc);
> -               goto exit;
> +               ret = qcom_cc_probe_by_index(pdev, 1, desc);

Where is the patch to the binding yaml file?
