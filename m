Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A1FC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 22:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiEWWwq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 18:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiEWWwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 18:52:45 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5069BAFB
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:52:44 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id l1so13156038qvh.1
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUVpHrGsWFdpmHijjTHWgW3zbODgXYO9/RKM5yTRDuI=;
        b=dbwT19t5cpVruIALgVmfGy44+S5C32idyjwxhDCuTYIvCRilH0ylGpz6YxpJPRg+xn
         MEg4hduZqdTC46dHgHZNetXKPRkJT+V0xntPmDgNck+9MGz049AyhRjDVo+T9DdR0nyH
         rkxTcTti1/4X39o14uHqaGdH/w3KW/zqoIfUlMWVbR6VcJhXsytkmfjtPNI2IGVze1IE
         0Q+oyv1yhdkLWhjIKaI7oLbk1edD+liaDjWF4+Lv35Rxgt8/r9VircuNHbltNvVsadcx
         0izyRQYCDe7bUrJvl/zQrTR2TSPnv5/fVQpNV4ONkyk3sqAJxl6mz8GyruRIIOjwECNb
         mo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUVpHrGsWFdpmHijjTHWgW3zbODgXYO9/RKM5yTRDuI=;
        b=LA+9oWTb8guFAlE7MTa/AdEsCdf59FfNLfOFsDuYuDRlS8bSgv/5z/F6k1PJl5BoRX
         +rFg20AlTG73g5j5JDC6LFvub3WqcY75emQwHBsHsz+b8fNDJpxxjTNoyw5vp2XPbxk4
         DHEQAmLbHj6MM0svIKY1TxecnO9CDXeA7+VDai135GNRNwAZoee9A3KUuYYIl0Cz7bs3
         tlee8SpxPQjq3XOwf1Tk0+3GRm+M4/8jwoGDMay8MFTbQvLNHOZExAEX9Un6TxvL7KI+
         tPMGxPEiNGsuAS0iZvWbgiI7HjebVKaNNFSJsreWLNujJJg/VoSoLpRl/Eh8x1e+BguD
         b3FA==
X-Gm-Message-State: AOAM532qSbycQQykhDv0QXzSnsIOSl7uQbVVk+FOgX37h4WzE29++kCX
        mSdXiwgyXUTF+sIKsTk96CYaQlVb2FscfbbNN6D0ng==
X-Google-Smtp-Source: ABdhPJz0L862d4LbPRYNVicS2bt3U+l7geWkMJ97OKfiAKAymqSQWmgMZll4IQHbb+ItHL14MvPGMGWpODDcIwbZ36g=
X-Received: by 2002:a05:6214:931:b0:461:d289:b7f6 with SMTP id
 dk17-20020a056214093100b00461d289b7f6mr19245958qvb.55.1653346363592; Mon, 23
 May 2022 15:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org> <20220523213837.1016542-10-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-10-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:52:32 +0300
Message-ID: <CAA8EJpqfS6xi40Zewm+v7La=jER5CR6s1=htn1C7jLka5SuKGQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/msm/dsi_phy_7nm: Replace parent names with clk_hw pointers
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 May 2022 at 00:39, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 92 +++++++++++------------
>  1 file changed, 42 insertions(+), 50 deletions(-)
>

-- 
With best wishes
Dmitry
