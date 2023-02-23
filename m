Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79677C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 18:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBWS7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 13:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjBWS7e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 13:59:34 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF21E23C63
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 10:59:33 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id by8so6906456ljb.7
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrKZBYzgrUY+yT1Sm6r8rYhRImsEiv0nymsNFzBZTig=;
        b=mLOlHmCobTk7ODTXZj4kvMvZSq3dbf7CN8kW6AwzeqG8wy7pXxYJEj9jX8JcE44NQf
         rbIr7lgWnloXvvyqdvgAO2hpJ7WVAIsNa2IKrPaltX+Ik3W+Nj91Q/WsXD5RTD0L3HJf
         pPWAo41bCftknxF7z7ARoIKS3sPuxz2Pb2PjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrKZBYzgrUY+yT1Sm6r8rYhRImsEiv0nymsNFzBZTig=;
        b=xGH3RpaU9ecxoaDwNZBbqc5LyuTn4GPQIt0r8XUg4AutwuOW0SaJdGXC922mu7pCX7
         ZxffOsdc+jviKO+b/ZKtABg1+L8l/gjYA0R6Ddflu8NO784SFCbaT2W9j1qE3oZ8gjkx
         V13yzR9stHUpDqgqlONDvkyGLWeqr9Nots9mctVqQX+Re+9cjS8fLBJYuCe9cuajI0yi
         hDccg1LxPnfWtihAmW0u3X1dZWn42eCNlpfxLEgb3+9IalRxuIphahAJC2a+wPPL1ChW
         XmANkGCol/cjsZYW1PzHnLJVCIxPoKcqp7cb33QmqZsGuVtNkK8C85fPEowFjmgxvMdc
         +03Q==
X-Gm-Message-State: AO0yUKXy5vhH8O+hpRQs0L9zEe/aZKrUZ0oAja3BRiwDJAlibItrv7sf
        zNlLyRK9b4gd8slptX53hnz+lyG5gQun3QwAuMUtlw==
X-Google-Smtp-Source: AK7set/l8Tuw2PrNZ5eEO0k2aNueP3SGyCL0EtuYv8nYx+cObISGq/vMLL/Udukub6jGMnM8zbbG6oae6gK4zdLkyFc=
X-Received: by 2002:a05:651c:336:b0:294:764a:3318 with SMTP id
 b22-20020a05651c033600b00294764a3318mr4022405ljp.0.1677178772084; Thu, 23 Feb
 2023 10:59:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Feb 2023 13:59:31 -0500
MIME-Version: 1.0
In-Reply-To: <ef82f126-af16-8eba-4da9-eb08106a03db@quicinc.com>
References: <20230215151330.539885-1-quic_mohs@quicinc.com>
 <20230215151330.539885-5-quic_mohs@quicinc.com> <CAE-0n53mDzqua47jEqrJwQBhcQcyBjJAtNvH2J-tCPhkvV9JtA@mail.gmail.com>
 <ef82f126-af16-8eba-4da9-eb08106a03db@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Feb 2023 13:59:31 -0500
Message-ID: <CAE-0n50tKWWPgU31dpcUo7bfJnnwjM-bNkDhFc0+e=iGkh3e_A@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mohammad Rafi Shaik (2023-02-23 02:19:30)
>
> On 2/16/2023 11:01 AM, Stephen Boyd wrote:
> > Quoting Mohammad Rafi Shaik (2023-02-15 07:13:29)
> >> @@ -828,8 +830,9 @@ static int lpass_aon_cc_sc7280_probe(struct platfo=
rm_device *pdev)
> >>          if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-m=
ode")) {
> >>                  lpass_audio_cc_sc7280_regmap_config.name =3D "cc";
> >>                  desc =3D &lpass_cc_sc7280_desc;
> >> -               ret =3D qcom_cc_probe(pdev, desc);
> >> -               goto exit;
> >> +               ret =3D qcom_cc_probe_by_index(pdev, 1, desc);
> > Where is the patch to the binding yaml file?
> Thanks for comment.
>
> The dtbinding=C2=A0 yaml file for this is already present in existing yam=
l.
>
> Below is the snippet for the same:
>
> compatible =3D "qcom,sc7280-lpassaoncc";
> reg =3D <0x3380000 0x30000>;
>
> Actually what ever the=C2=A0 CC register region <required range is=C2=A0 =
0x3389000
> 0x24> which we are accessing is already present in the above reg map
> range of dtsi, so we have not updated the
> /devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml file.
>

The usage of '1' in qcom_cc_probe_by_index() means that the reg property
should have at least two addresses. The example you pasted above shows
only one reg address. The binding needs an update for two registers,
where is that?
