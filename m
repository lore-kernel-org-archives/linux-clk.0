Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E74C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjAKVTS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbjAKVTF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:19:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70441A82E
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:19:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j17so25507128lfr.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv2a1NqKo5aZA53tRjiZ0Ie1voogHfFfahY4ZwIQhHM=;
        b=g41EMSDqpmA2PVl35TdVoQieEn9RXxLBsba8XhY33RIx97XHiCTrABe7GsZVKLqnee
         4DKyj9VMgcbmQkUaYvOsZbERNL84+qvNqLvDhxMLbYkqEBVMB/syYg1LsSd84f7Xq5I/
         Auq8FAc7ODW9BgcnI5Rt8SuvsY+JKjQvMhDjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv2a1NqKo5aZA53tRjiZ0Ie1voogHfFfahY4ZwIQhHM=;
        b=Awia6VeSvVOyY/SC0JXK8KvJwjwOtaHsAIcIhYFElUjLZkDZ2TXTR5uHWFBkps4OHB
         tsD1PkSfKnFiANdSkAwwPrxctZgj1rT9firChG7boOmQkqLgA3R/kmtVcI4D5/ZqLgdi
         pBTeDLvbaGCggfAJwN5XXmV3z0gshDWeWdFs+ilLi7XlVfOS5peSP0ygthxIFc+9d4uj
         mKTRptSEaqDwxCrME7sFbZMn9M0BuCyZ6KJVTJD8RdQqcEguFFEVMj9EHjb1Ig5FNIlE
         O87MiNURB9rlMkLH5nykxiAGT9Uczake8SP2VJMBei0e/hyiGiJtSabvb52E2/WsmmiD
         AbOA==
X-Gm-Message-State: AFqh2kqwN8vFNYY5FsdetI/HOoGAYmHcRb1cAXIqN4o6vT87JhM4Sl0j
        rYxCGhMkw2wREwpcWcMULJoGT8uRrXOeQYafyK0ImQ==
X-Google-Smtp-Source: AMrXdXu1qo8ydiSXNkr1gjUsIvDH+a+2FznMvvYgUDkJX3Tg9MLCiUuN3WSQ+haee1cIOmrRtPXxP5rU3apLNHYFPww=
X-Received: by 2002:ac2:5dc4:0:b0:4b6:e4c6:b751 with SMTP id
 x4-20020ac25dc4000000b004b6e4c6b751mr3249961lfq.309.1673471942140; Wed, 11
 Jan 2023 13:19:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jan 2023 13:19:01 -0800
MIME-Version: 1.0
In-Reply-To: <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com> <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 Jan 2023 13:19:01 -0800
Message-ID: <CAE-0n50bLN_E+yXvwN3QX-ETewqDm5YuCePMfyKRE5sAeqyR9Q@mail.gmail.com>
Subject: Re: [RESEND v3 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Add
 qcom,adsp-pil-mode property
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:34)
> When this property is set, the remoteproc is used to boot the
> LPASS and therefore qdsp6ss clocks would be used to bring LPASS
> out of reset, hence they are directly controlled by the remoteproc.
>
> This is a cleanup done to handle overlap of regmap of lpasscc
> and adsp remoteproc blocks.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
