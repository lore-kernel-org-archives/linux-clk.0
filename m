Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CA0C04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 22:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF85420673
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 22:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ilIyqPOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF85420673
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbeLAJ4y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Dec 2018 04:56:54 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40325 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbeLAJ4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Dec 2018 04:56:54 -0500
Received: by mail-ot1-f68.google.com with SMTP id s5so6597354oth.7;
        Fri, 30 Nov 2018 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d66nfdb6nRHfyIxjtkymN7FcacI50xatMuiTDWYRxCg=;
        b=ilIyqPOTKdnfxrRQmABlndAaM9ftZrcf2ozNPjLsTvLKoEb7UkZQa7NexMMHjRqHx7
         E7JGExVR1xmcu3tMCye/+8Hu9f0cXOBK57xHGYgwM53bklYVMUtRw4aX2MyVOuuj6dok
         MooYQRpz3SSJoMA/FYHn7vI2NIlIh60yHJ7EfSrc/XJBrGXFxRX7S+j60z9TH6QQPSIF
         970aqVJVWKrwM4C6VArwvxbBoID5qf6LLvUxhtbvaBz29ZPrhCpw0CXCKf3i0EFYPzjn
         dSm5ZTqmum6uUJOxtGmV0jYlOh0h2I7Ho6KN3eQsoR3ropsIe2N6w61hmokaZbP4R1kV
         Pw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d66nfdb6nRHfyIxjtkymN7FcacI50xatMuiTDWYRxCg=;
        b=Iy+VmeqvwbYLY5cmzFhHSotrAdzPL9aJVzzSczWprQCEFX8luz9jIbKFpV8omVVGiq
         7jQha6ACWECqtf2IT+0aAYxC/ByA/A9htIsLHa+J4vj4Rzuwuz9sawvaagbI2QS7q/PR
         9QvTV3vCxJKofJEKI1odlbKfeHXxuIW/ZsAYWDCz6SqujaMX2Urqqm7nQf0IPhhAJ4ty
         puHdDp8Z/V3/QcTPafltKbFXox6Bfeznk6BMQ3VkfurKlOWgm3UhAYM82teEm/CnWLcg
         VE9/0bI0/9s/o/xukoLR7rB9o2eelC3Hi+lbuPVlnJuzNNO/LbjDaESzGwvg749IxptF
         22OQ==
X-Gm-Message-State: AA+aEWbzXrKEkP3DSmElrt1530QTI6xTuOItjTaCUtPCA8sbKsUkoCd4
        3aLpizGgMCrXlexkvh1I+5FXD3Cg725Rm73SLCM=
X-Google-Smtp-Source: AFSGD/UdfImz4EVK5/UOGGV6c0vRKkbQB0GTn8Aesr7MYurCQCpM5B2d5+9eWgT4VKG6aLhWjDQmYdwkGrFskAcbl5w=
X-Received: by 2002:a9d:6a8e:: with SMTP id l14mr4500301otq.348.1543617962894;
 Fri, 30 Nov 2018 14:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
 <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com> <7hr2f25t4b.fsf@baylibre.com>
 <7h4lby5nky.fsf@baylibre.com>
In-Reply-To: <7h4lby5nky.fsf@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 30 Nov 2018 23:45:51 +0100
Message-ID: <CAFBinCCH2AOV0nJBzEdE9=rfb7d=L-Uni2gZkfdLAbLg+GkiPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
To:     khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Kevin,

On Fri, Nov 30, 2018 at 9:15 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
> > Neil Armstrong <narmstrong@baylibre.com> writes:
> >
> >> On 28/10/2018 13:08, Martin Blumenstingl wrote:
> >>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> >>> register region called "HHI". This register area contains more
> >>> functionality than just a clock controller:
> >>> - the clock controller
> >>> - some reset controller bits
> >>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> >>> - HDMI controller
> >>>
> >>> Allow access to this HHI register area as "system controller". Also
> >>> migrate the Meson8 and Meson8b clock controllers to this new node.
> >>>
> >>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> ---
> >>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
> >>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
> >>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
> >>>  3 files changed, 23 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> >>> index 0d9faf1a51ea..ad903d1a2cb6 100644
> >>> --- a/arch/arm/boot/dts/meson.dtsi
> >>> +++ b/arch/arm/boot/dts/meson.dtsi
> >>
> >> [...]
> >>
> >>>
> >>> +&hhi {
> >>> +   clkc: clock-controller {
> >>> +           compatible = "amlogic,meson8-clkc";
> >>> +           #clock-cells = <1>;
> >>> +           #reset-cells = <1>;
> >>> +   };
> >>> +};
> >>> +
> >>>  &hwrng {
> >>>     compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
> >>>     clocks = <&clkc CLKID_RNG0>;
> >>>
> >>
> >> Kevin,
> >>
> >> I didn't apply this one, but it can wait another cycle I think.
> >
> > OK, I'll take that one through my dt branch.
> >
> > I don't see any obvious dependency on the clock patches,
>
> ... and a quick boot test shows I was wrong, and should've (re)read
> Martin's cover letter a couple more times. :)
yes, there's a hard dependency on the clock patches

> I think it's best to leave this one until the next cycle when all the
> deps are merged.
I have this on my "resend this for the next development cycle" list


Regards
Martin
