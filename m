Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5701C636CC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 20:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjAaU0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 15:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjAaU0b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 15:26:31 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9B4521E0
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 12:26:29 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b13so7252783ljf.8
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+WicTkXVndZ07GHnNQe6ipzb4YsdiJNTuwmAU0Sz2L8=;
        b=Bf9Ov4q3GVnCky1QJQ+/a57YxXm3bt+7lNTdglDfPdLnCZxChH6RrzNB3yBU5kKzwE
         AuLNylMeYEF6xFn5H45h0e8spBQb7yFBlHAAFR63Yz514vMYRu6nw0BTBtjQ2J8Oq+Hl
         Bd4ubKyJthMk2RjDxPhxBauT+gdBgg9fG2u60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WicTkXVndZ07GHnNQe6ipzb4YsdiJNTuwmAU0Sz2L8=;
        b=2xhz8w99CCRZTXhKSVCQHZ4wwKq9a+t1DOEBMew3gMX1UJFTBmwOjUJofcWhw331HK
         zRegWVYsBrmQ1owPOijnJjSC3XZ1ffl71PlY7D//f1PkgDELUPhQXaDcJWxd2mZtoUgC
         nv3SO5G8eDM9XcOwBj/wmddhG/nt9IcMuzfSM++jOTzlPVV415nHcEn9Mzhczzz4evd/
         tTaKjQT81y4oBfWzFqHvNudR7kq/G4ihG9GPmOWkTLACqzJG2GdoXVuJLj+VXEJG7xHo
         /kYjdorKsuFcZlS7XdQxOyrFBGOl7GSVELPqZW6A6UXJBbqVFSoCZY/1Ma0GS7FAF7eS
         BEOg==
X-Gm-Message-State: AO0yUKVR+xbYyibmvEK0HKt5b2A3BODSQbpNaNUivBROhAcFK6R4vvD4
        Zzul7QR0Mmw0M5wKe4+TVcpPLi5sKeE3zG+ENH7oxg==
X-Google-Smtp-Source: AK7set8KBkpr+y1ysEDqO7DO4k/P1BRS4tDvdlexR3qHwklCkm97ZcXq8H83tLgM5vq/VuQIz+wEKfhUwl5QRRzr/0E=
X-Received: by 2002:a2e:9dc9:0:b0:28e:bba7:22dc with SMTP id
 x9-20020a2e9dc9000000b0028ebba722dcmr2751500ljj.56.1675196787342; Tue, 31 Jan
 2023 12:26:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Jan 2023 12:26:26 -0800
MIME-Version: 1.0
In-Reply-To: <c8d779fe-2508-4aa1-8de9-26d858bc068b@quicinc.com>
References: <1674728065-24955-1-git-send-email-quic_srivasam@quicinc.com>
 <1674728065-24955-6-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n50y4JEQqW2wgS_qoDkdrqP=bzpC6b_LpA6Q9P+jDc00ZQ@mail.gmail.com> <c8d779fe-2508-4aa1-8de9-26d858bc068b@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 31 Jan 2023 12:26:26 -0800
Message-ID: <CAE-0n50fJWqHE0A3R8yawGZAcNb_QDNQ5h2=CXxKAX0eOghegQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] clk: qcom: lpassaudiocc-sc7280: Merge lpasscc into lpass_aon
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-31 01:29:16)
>
> On 1/31/2023 6:34 AM, Stephen Boyd wrote:
> Thanks for your Time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2023-01-26 02:14:24)
> >> Merge lpasscc clocks into lpass_aon clk_regmap structure as they
> >> are using same register space.
> >> Add conditional check for doing lpasscc clock registration only
> >> if regname specified in device tree node.
> >> In existing implementation, lpasscc clocks and lpass_aon clocks are
> >> being registered exclusively and overlapping if both of them are
> >> to be used.
> >> This is required to avoid such overlapping and to register
> >> lpasscc clocks and lpass_aon clocks simultaneously.
> > Can you describe the register ranges that are overlapping?
> Okay. Will add register ranges in description.

Thanks!

> >
> > Here's what I see in DT right now:
> >
> >                  lpasscc: lpasscc@3000000 {
> >                          compatible = "qcom,sc7280-lpasscc";
> >                          reg = <0 0x03000000 0 0x40>,
> >                                <0 0x03c04000 0 0x4>;
> >                          ...
> >                  };
> >
> >                  lpass_audiocc: clock-controller@3300000 {
> >                          compatible = "qcom,sc7280-lpassaudiocc";
> >                          reg = <0 0x03300000 0 0x30000>,
> >                                <0 0x032a9000 0 0x1000>;
> >                          ...
> >                  };
> >
> >                  lpass_aon: clock-controller@3380000 {
> >                          compatible = "qcom,sc7280-lpassaoncc";
> >                          reg = <0 0x03380000 0 0x30000>;
> >                          ...
> >                  };
> >
> >                  lpass_core: clock-controller@3900000 {
> >                          compatible = "qcom,sc7280-lpasscorecc";
> >                          reg = <0 0x03900000 0 0x50000>;
> >                          ...
> >                  };
> >
> > Presumably lpascc is really supposed to be a node named
> > 'clock-controller' and is the node that is overlapping with lpass_aon?
>
> Okay. As it's been coming previous patches, didn't change the name.
>
> May be we need to do it as separate patch.

Sure, another patch to rename lpasscc to clock-controller would be
appreciated.

>
> Yes. It's overlapping with lpass_aon ( <0 0x03380000 0 0x30000>).
>
> CC clocks range is <0 0x03389000 0 0x24>;

Is that a new register range for lpasscc? Why do we have that node at
all? Can we add different properties to the existing lpass_audiocc,
lpass_aon, or lpass_core nodes to indicate what clks should or shouldn't
be registered or provided to the kernel?

>
> >
> >> Fixes: 4ab43d171181 ("clk: qcom: Add lpass clock controller driver for SC7280")
> >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> >> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 13 +++++++++----
> >>   1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> index 1339f92..8e2f433 100644
> >> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> @@ -826,10 +829,12 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
> >>                  return ret;
> >>
> >>          if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode")) {
> >> -               lpass_audio_cc_sc7280_regmap_config.name = "cc";
> >> -               desc = &lpass_cc_sc7280_desc;
> >> -               ret = qcom_cc_probe(pdev, desc);
> >> -               goto exit;
> >> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cc");
> > We shouldn't need to check for reg-name property. Instead, the index
> > should be the only thing that matters.
>
> As qcom_cc_probe() function is mapping the zero index reg property, and
>
> in next implementation qcom_cc_really_probe() is also probing zero index
> reg property,
>
> unable to map the same region twice.

Use qcom_cc_probe_by_index()?

>
> Hence all I want here is to skip this cc clock probing by keeping some
> check.
>
> If we remove, it may cause ABI break.
>

I'm not sure what you mean here about ABI break, but hopefully just
using qcom_cc_probe_by_index() works!
