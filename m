Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D721C54EBE
	for <linux-clk@archiver.kernel.org>; Sun,  8 Jan 2023 17:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235956AbjAHReK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 12:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbjAHReF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 12:34:05 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A48D2E2
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 09:34:05 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 192so6646854ybt.6
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V2jHf0CmVk76MT9CE9txPFL+dGiXtk/VfQ6Man6idzU=;
        b=FBfOHyyAOtW6jHCnwF3qHiQm/BcwUnSxN/cZLtSdFGSv0kPAUO1XkbKXwYTTxxNjEx
         DUNuc4679uvNWcQNzRFmjEO+CidPtTxQF20n9Sk4TY6AnWcW6QqXBuFUbtpSWwI/oUIU
         8fn/VSIdNtx701CsUiASPxvRXy/L0UgmERjYbMOB2SmgFjOYyIwcQyC4a3QOiF+HLXSy
         OpEQWZHCaUn69mbCBcuCTNw/Qcvr+IPpkYym21iFA+7UmZw14rFQfCKg4UKWLV/O+Aos
         M2/upW+Fi3cvXNxtW9H5Py61p9KbZLJog339nvFO1uY8IbfAjI8y3gzGIJiTwr8cJ+B4
         S1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2jHf0CmVk76MT9CE9txPFL+dGiXtk/VfQ6Man6idzU=;
        b=AUU4WBfS8DplX0cG7rshzQp4JZBFGxNjy8FUAbDQlOrc3oxd74FZ0N9Vyn59Fm1w+E
         3LgRG/By39A2fC8jsjw3JrlnyGiz1psn5lFUbaJTF+mVRjnwL1hRJCfzB/Uqkqi3oqck
         N0mQpBOR5V3uJdzywQjSGprZ5JRGis0iDETwg4hGveNlWG+JLZpq+vIpqIeoAFS17Rgo
         TwG4pPEH/jJOmabmLXFQ0z+bgCCNRPpzvRWn2FzyJefgpGEvAYB5q/pH6u2jZmW40ARf
         KzUSXUnHBATW6oIrfqC3MjX103xF3fdlZzZm8a0M/RAb1vb49T1vavDsFgW5Wc+Mn8hn
         bTIw==
X-Gm-Message-State: AFqh2kpUhTLfokk7pAeEbF8RS6nKvYnjCXWaF104l2rMrcLTB+ZBXKjn
        TYCIw1laQtlFPZFpsyep3OccvVUjjwOldu6GoklmgQ==
X-Google-Smtp-Source: AMrXdXtQHxR7HAQ9ptzSEaLNQMJH1O4aFrNClHq1bePjEEhFySDo4yqRifUBGoRCDk7HUQBhZUIj4kYwXeuAcJ6NN7Q=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr5564526ybg.288.1673199244264; Sun, 08 Jan
 2023 09:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20230108130440.670181-1-robimarko@gmail.com>
In-Reply-To: <20230108130440.670181-1-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 8 Jan 2023 19:33:53 +0200
Message-ID: <CAA8EJpqR9w2maBB_ABXk7ggxD34WKvQS+m79-ua-nN50H79nOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: ipq8074: populate fw_name for usb3phy-s
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 8 Jan 2023 at 15:04, Robert Marko <robimarko@gmail.com> wrote:
>
> Having only .name populated in parent_data for clocks which are only
> globally searchable currently will not work as the clk core won't copy
> that name if there is no .fw_name present as well.
>
> So, populate .fw_name for usb3phy clocks in parent_data as they were
> missed by me in ("clk: qcom: ipq8074: populate fw_name for all parents").
>
> Fixes: ae55ad32e273 ("clk: qcom: ipq8074: convert to parent data")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Ah, excuse me, this is what I asked for in the other patch. We can
only hope to see these clocks added to the gcc DT node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
