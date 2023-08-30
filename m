Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C36C83F14
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 20:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239171AbjH3UF5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbjH3UFq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 16:05:46 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F05900B
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 12:49:24 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso5680039276.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693424889; x=1694029689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJMdw/C4AyMPoyB2tq4Z62TY5NrdXD5YnDuPj2zmJiM=;
        b=njJIUNv8KWQ/BrI6KiPJhRxe9apUJc6X8Mh0GZIx1JfrYqOYRX/GtSrSdu/198UTcS
         cr8whSpwBEk/mWljKOr0AUlJqp2vDU3jrb4GF1uqOIZA4Q97tr5G27Y1iKFKArSBdwqo
         M9W0QfP6jzimf8rV8IIZfYxyAjh4Gd0BLjjBHVVoH+iNmoU7BgA9yFqyObwUbJ5lVMh8
         huMj9bLaluf9/ou9F5GEBnDyZPwC4oyzzhrU0qV3ut4KnliGE+CEm83C7x4fmZKONOrK
         zAhk5qc/19rVXPL6vSYeqlrG5QO21ZxykJJ9c/DTtK0c5pVZu1kTfcyXskU3NRap0yH5
         2bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424889; x=1694029689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJMdw/C4AyMPoyB2tq4Z62TY5NrdXD5YnDuPj2zmJiM=;
        b=exk+b62Xaj4xFahm4VHHTaAnT1N6MeV8Tg3xeVt8kwIpdBxIRJtmKLndAAHt6lYG84
         YED3KC+8Q+tNOKuRcuRy/5RH0sTs+GsPwVgZBDLbjMrLdT5mQH9iBe+0tSlNVOWMHI2T
         d5nLEa4cCtH3rL8R6h6SDrD6y9e5jpdQabFM5NXeWcrd7FONMCW3zGOiqv9xVAt1tlQY
         BB0pYSTa76GIQOcapFuTJJ7+FrGqZxli10j+w9mXHdMa6L+SwFiZkSmFOm0yC/YxKsN2
         4utUVbbFnNf2PCCIKm3y/TOeDzAsYN9hPUvLY8iCRddhU11cw4pFeyVRErmGmrbq2rvl
         HQqw==
X-Gm-Message-State: AOJu0YwQrWHHuLGx5Zb5dFWM0hMwVXVb3q2n196SUJtP2gSsDp3bx7BF
        t2k2FwmhjhA6CPnDVnifEFw7s58tKUzXERnYc/NxfA==
X-Google-Smtp-Source: AGHT+IGkX+b8/id5mnhsdSwU9pp41YFk3WYZkYEZqYPlBixDk1KbdsztU74V3Q6iBQqWEbgI4/9irEaASDq7WrvYvAE=
X-Received: by 2002:a5b:889:0:b0:d47:3d16:4b0d with SMTP id
 e9-20020a5b0889000000b00d473d164b0dmr2944641ybq.25.1693424889246; Wed, 30 Aug
 2023 12:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230829095423.760641-1-quic_gokulsri@quicinc.com>
 <20230829095423.760641-2-quic_gokulsri@quicinc.com> <3722a8f6-8f63-fe7c-6983-ac96caa18c87@linaro.org>
 <d2080d0b-f0d2-b5f2-4fd5-c929735e406c@quicinc.com>
In-Reply-To: <d2080d0b-f0d2-b5f2-4fd5-c929735e406c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 22:47:58 +0300
Message-ID: <CAA8EJpo=e0JNWRhERUFFtLZ6o+hMhdBspC8yPi3j8U0AAo_FQw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,a53pll: add IPQ5018 compatible
To:     Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Aug 2023 at 21:31, Gokul Sriram P <quic_gokulsri@quicinc.com> wrote:
>
>
> On 8/29/2023 3:39 PM, Krzysztof Kozlowski wrote:
> > On 29/08/2023 11:54, Gokul Sriram Palanisamy wrote:
> >> Add IPQ5018 compatible to A53 PLL bindings.
> >>
> >> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > Knowing that this patch could not come from downstream (it's some old
> > kernel without this file), I really wonder why two people were involved
> > in developing trivial one line change.
> Sure, I had kept this co-developed-by for this whole series of patches.
> will remove co-developed-by for this patch.

Each patch is individual, even if they form a series. Different
patches might be developed by different parties or a combination of
them.


-- 
With best wishes
Dmitry
