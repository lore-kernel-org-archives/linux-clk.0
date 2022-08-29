Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB098ECAAD2
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 20:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiH2UfZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 16:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiH2UfY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 16:35:24 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3916477EBC
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 13:35:23 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-11eb8b133fbso7626465fac.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=TWr3TDm9avVPonPTqZ8cUHmP3gOyN78ms22mt44A4BA=;
        b=Kcmk8a1VG0mh4MVJt1/BosKmHsd8u7eRp44VVAGwsoMWNpp7CysGzRWyiNC/8lJrSo
         48GDKBnn0P/JJ/xyPgIavaeqckB2M7Dhfovv1DdouDJ0fXQksy93uOowjbUCvqx7v8J/
         MKOZu4BwH/lHh5HigZqtIzBDvNYxWtelUKXwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=TWr3TDm9avVPonPTqZ8cUHmP3gOyN78ms22mt44A4BA=;
        b=33ZM6lCFTyNZozjLwUgPuD4JorgojgE8+fnWEQc//deJ+UMmo14qTBMZYi+2w3pC8D
         LhghWZ1CihKcrle+PynKoLoRv/fqMYyLInl6hZGpKabOToOmCmOiyTYYMOLWe+pOI4td
         dwJqDDeHcmn8fsmQluEHPXw/uh9SDs4WMGDTNSZwYxWpiTmL2qqjVrG5G09lwQWKV2SU
         /NA10zrofI2pLneH1TgAaBPvvtb3tNmuXc8I9apg1gGp1iN8xUOXOdI6F8brqjPdVISB
         r2wqZXOoiacclpIh4eJ2geWFe1kRRk8C4+SNTAzWNBRMBtqWtTKALiQGXqntIcac9g0u
         QVuw==
X-Gm-Message-State: ACgBeo0v7nKhntZAli1devyBWUG66OgQz+cRPdEYmjvnZCHlkJDJwaNZ
        rFhdMYqnuOVjUy1UdlOK2U0usZ97P2o0vrRRfpNVO9ahtFs=
X-Google-Smtp-Source: AA6agR4Lu5UWdr0LmgmFR4I9mbK8Vk3GAncKRJqKl9w2iKJ8h1UMLCmJk/2ZASLN1J8YDCUQA9s95qmhETYrrzckAN4=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr7779595oik.0.1661805322493; Mon, 29 Aug
 2022 13:35:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Aug 2022 15:35:21 -0500
MIME-Version: 1.0
In-Reply-To: <1661754153-14813-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1661754153-14813-1-git-send-email-quic_c_skakit@quicinc.com> <1661754153-14813-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 29 Aug 2022 15:35:21 -0500
Message-ID: <CAE-0n50oOi99jgL7Z=Dt784XEv-Q3O9TSDT4ZiRz8t_X8fV0ZQ@mail.gmail.com>
Subject: Re: [PATCH V8 2/5] clk: qcom: lpass: Handle the regmap overlap of
 lpasscc and lpass_aon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Satya Priya (2022-08-28 23:22:30)
> Move registration of lpass_q6ss_ahbm_clk and lpass_q6ss_ahbs_clk to
> lpass_aon_cc_sc7280_probe and register them only if "qcom,adsp-pil-mode"
> is enabled in the lpass_aon DT node.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Your Signed-off-by should be last. If Taniya's SoB is present then I'd
expect a Co-developed-by tag as well, or the author should be Taniya.
Either way Taniya's SoB should be first.

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
