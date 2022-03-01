Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CC6C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 14:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbiCAOao (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 09:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbiCAOan (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 09:30:43 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D05A90CE6
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 06:30:01 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id d10so31825325eje.10
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bkbyTq/HuGB/gUe5U+zKi1bdPyvJx/pnnNk+UM+qLcQ=;
        b=V1gmL10RUggu5kqyYjATb3evJHmNuGQs8M8eqV+qE730eEh9IXjH9CBkRxNU77huDQ
         IaUsQWwg/7GjP2BXhkR4m1Axy7hnPbG64wHdEy2coe+C7WIQl5PUQz+oThi0do6jHeRg
         +o4E2T2HhUB8t6TTkzvE8iKsFHXNydGYMLLFEt1skNw/qrk+hcLa/K8kBl7ht7BEQJ6D
         +4X34vWR4a5PQzmo8N7Pu5natWGiLp9rBGo3I9ROO3rHcXGXwo8Uk7q1DGr7I/vImhbA
         uY7mXwcNi82+9i2g+wroGbN4nwTZkZw3WvEg2mxmgcVXuW/LcU9k9FPuo6iab9nHXJsD
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bkbyTq/HuGB/gUe5U+zKi1bdPyvJx/pnnNk+UM+qLcQ=;
        b=BETdPkIFWI4mci5EEpUEir/mYfR3FuFk0l63AHMlt7eq5BGzkgq5GOvpq/VgZPpip7
         Jb+AbsRzru+QDkTGvUQ3hGTsaRj4TFCgHBWoJ3gfsBu8XxGJZ5wG1N0noRc7rsblw6jM
         D1dvW4XKC3D1UKgs69cWXJYqZsqzzTVIaVRi+kfMs/bsEfSjMhz2TmuYKciVzQ6kuNZM
         M0CjhsJNmlII2dPPwlBdAgoBLDFLoac/fAoNhYYj2tlT/NTs4xfJXbSW5bWS+wsh9hlP
         L8oHUNyEq7dafxO93P1bphWe+pBZr1mq4NtiLMT7egK01+9NHMUdKwgEkwC4DNoBVbcE
         EkCg==
X-Gm-Message-State: AOAM530bZ+kGKEana0SfS7ltn2WGaQ/AU/YrAqETfx1AR/BMKMOE5Bc3
        LZqSgI88L6Rp46TkTwCulBY4UGAbI72l7mzQbF5mZ2W7SqQ=
X-Google-Smtp-Source: ABdhPJzXcX9+N94MwjAT8uIGyvRIVFToNv/uqiqjyNR1favTg6OHoz8PAzNMEd0A7IjanxSwr+CMVcqhqosEvqI2TXU=
X-Received: by 2002:a17:907:7b9f:b0:6d7:a24:8cbd with SMTP id
 ne31-20020a1709077b9f00b006d70a248cbdmr1352700ejc.588.1646144999540; Tue, 01
 Mar 2022 06:29:59 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com> <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net> <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
In-Reply-To: <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 1 Mar 2022 08:29:48 -0600
Message-ID: <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 1, 2022 at 8:12 AM Fillion, Claude
<Claude.Fillion@mksinst.com> wrote:
>
> Thanks for your replies.  A few more points/questions.
>
>
>
> > -----Original Message-----
>
> > From: Luca Ceresoli <luca@lucaceresoli.net>
>
> > Sent: Monday, February 28, 2022 5:14 PM
>
> > To: Adam Ford <aford173@gmail.com>; Sean Anderson
>
> > <sean.anderson@seco.com>
>
> > Cc: Fillion, Claude <Claude.Fillion@mksinst.com>; linux-clk <linux-
>
> > clk@vger.kernel.org>
>
> > Subject: [EXTERNAL] Re: Questions regarding regarding idt/renesas
>
> > versaclock5 driver
>
> >
>
> > This email originated outside of MKS.  Use caution when sharing informa=
tion
>
> > or opening attachments and links.
>
> >
>
> > -----------------------------------------------------------------------=
-----------------------
>
> > ----------------------------------------------
>
> > Hi,
>
> >
>
> > On 28/02/22 18:06, Adam Ford wrote:
>
> > > On Mon, Feb 28, 2022 at 10:04 AM Sean Anderson
>
> > <sean.anderson@seco.com> wrote:
>
> > >>
>
> > >>
>
> > >>
>
> > >> On 2/28/22 7:35 AM, Fillion, Claude wrote:
>
> > >>>
>
> > >>> You don't often get email from claude.fillion@mksinst.com. Learn wh=
y
>
> > >>> this is important
>
> > >>>
>
> > <https://urldefense.com/v3/__http://aka.ms/LearnAboutSenderIdentific
>
> > >>> ation__;!!KnJ4-
>
> > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-We
>
> > >>> UZR3sOMdn4NpYPGkfDG$ >
>
> > >>>
>
> > >>>
>
> > >>> Hello  Sean,
>
> > >>>
>
> > >>>
>
> > >
>
> > > + Luca Ceresoli
>
> > >
>
> > >>>
>
> > >>> I have a design that is looking to use the Renesas 5P49V6965 or 5P4=
9V690
>
> > clock chip and am looking to use the versaclock 5 driver
>
> > (https://urldefense.com/v3/__https://github.com/Xilinx/linux-
>
> > xlnx/blob/master/drivers/clk/clk-versaclock5.c__;!!KnJ4-
>
> > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
>
> > WeUZR3sOMdn4NpaBSRqIM$ ).
>
> > >>>
>
> > >>>
>
> > >>>
>
> > >>> I am new to writing drivers and have two questions I am hoping you =
can
>
> > help me with:
>
> > >>>
>
> > >>> 1) In the driver I see the following code:
>
> > >>>
>
> > >>> static const struct vc5_chip_info idt_5p49v6901_info =3D {
>
> > >>>
>
> > >>>             .model =3D IDT_VC6_5P49V6901,
>
> > >>>
>
> > >>>             .clk_fod_cnt =3D 4,
>
> > >>>
>
> > >>>             .clk_out_cnt =3D 5,
>
> > >>>
>
> > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL,
>
> > >>>
>
> > >>> };
>
> > >>>
>
> > >>>
>
> > >>>
>
> > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
>
> > >>>
>
> > >>>             .model =3D IDT_VC6_5P49V6965,
>
> > >>>
>
> > >>>             .clk_fod_cnt =3D 4,
>
> > >>>
>
> > >>>             .clk_out_cnt =3D 5,
>
> > >>>
>
> > >>>             .flags =3D  VC5_HAS_BYPASS_SYNC_BIT,
>
> > >>>
>
> > >>> };
>
> > >>>
>
> > >>>
>
> > >>>
>
> > >>> However, the 6965 part also has the same frequency doubling bit as =
the
>
> > 6901.  Would it be better to set the flags for the 6965 to something li=
ke this?
>
> > >>>
>
> > >>>
>
> > >>>
>
> > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
>
> > >>>
>
> > >>>             .model =3D IDT_VC6_5P49V6965,
>
> > >>>
>
> > >>>             .clk_fod_cnt =3D 4,
>
> > >>>
>
> > >>>             .clk_out_cnt =3D 5,
>
> > >>>
>
> > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_B=
IT,
>
> > >>>
>
> > >>> };
>
> > >>
>
> > >> I think Adam will have a better idea about this.
>
> > >>
>
> > >>> 2) I am unclear how to set the output frequencies for the device. F=
or my
>
> > application I would like to set output clock 1 to 250MHz and output clo=
ck 2 to
>
> > 46.8MHz but I am unclear how to do so.  I have looked at the documentat=
ion
>
> > at
>
> > https://urldefense.com/v3/__https://mjmwired.net/kernel/Documentation
>
> > /devicetree/bindings/clock/idt,versaclock5.yaml__;!!KnJ4-
>
> > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
>
> > WeUZR3sOMdn4NpVQVg6al$  but remain unclear how to set the output
>
> > frequencies.  Any insight you could provide would be greatly appreciate=
d.
>
> > >>
>
> > >> Use assigned-clock-frequencies as described in
>
> > >> Documentation/devicetree/bindings/clock/clock-bindings.txt
>
> > >>
>
> > >
>
> > > I agree that the clock-bindings have the instructions on how to set
>
> > > them.  If you check
>
> > > arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi, there are some
>
> > > examples of how to set the frequency.
>
> > > In my instance,  the chip wasn't enabling the output by default, so I
>
> > > needed to submit some patches upstream to make sure the device that
>
> > > was being clocked by this device had get and enable functions to make
>
> > > sure the clock chip would turn on the clock when requested.
>
> >
>
> > Indeed assigned-clocks is the way to enable a clock when the downstream
>
> > driver does not request it. Not that it is easy to find: it took me a w=
hile to find
>
> > it the first time I needed it.
>
> >
>
>
>
> Trying to follow the example beacon-renesom-som.dtsi implementation but a=
m still not getting proper output.  I should note I am running this as a pa=
tch on an older Petalinux  code base (4.14.0-xilinx-v2018.3). After replaci=
ng dev_err_probe() calls with older dev_err() calls the code compiles and s=
eems to run without issue. Is it possible other files need to be updated?
>
>
>
> Added the provider code at the beginning of dtsi as follows;
>
> #include <dt-bindings/clk/versaclock.h>
>
>
>
> /include/ "system-conf.dtsi"
>
> / {
>
>   /* Clock Provider */
>
>   x304_clk: x304-clock {
>
>     compatible =3D "fixed-clock";
>
>     #clock-cells =3D <0>;
>
>     clock-frequency =3D <25000000>;
>
>   };
>
> =E2=80=A6
>
>
>
> And added consumer code:
>
>
>
> &i2c1 {
>
>     clock-frequency =3D <100000>;
>
>
>
>     // Use patch.  Updated driver for 5p49v6965 available  at https://git=
hub.com/Xilinx/linux-xlnx/blob/master/drivers/clk/clk-versaclock5.c
>
>     // Device Tree Setup -> https://github.com/Xilinx/linux-xlnx/blob/mas=
ter/Documentation/devicetree/bindings/clock/idt%2Cversaclock5.yaml
>
>     versaclock6: clock-controller@6a {
>
>         /* Clock Consumer */
>
>         compatible =3D "idt,5p49v6965";
>
>                                 reg =3D <0x6a>;
>
>                                 #clock-cells =3D <1>;
>
>                                 clocks =3D <&x304_clk>;
>
>                                 clock-names =3D "xin";
>
>
>
>         assigned_clocks =3D <&versaclock6 1>,
>
>                           <&versaclock6 2>,
>
>                           <&versaclock6 3>,
>
>                           <&versaclock6 4>;
>
>         assigned_clock_rates =3D <46800000>, <250000000>, <1000000>, <130=
00000>;


Assigned clocks and assigned clock rates should be hyphens and not undersco=
res.

assigned-clocks =3D  <&versaclock6 1>,   <&versaclock6 2>,
<&versaclock6 3>, <&versaclock6 4>;

assigned-clock-rates =3D  <46800000>, <250000000>, <1000000>, <13000000>;

Another thing to check is to make sure the consumers of these clocks
is enabling them.  They do not necessarily get enabled by default.

adam



>
>         /* Set the SD/OE pin's settings */
>
>         OUT1 {
>
>             idt,mode =3D <VC5_LVDS>;
>
>             idt,voltage-microvolt =3D <3300000>;
>
>             idt,slew-percent =3D <100>;
>
>         };
>
>         OUT2 {
>
>             idt,mode =3D <VC5_LVDS>;
>
>             idt,voltage-microvolt =3D <3300000>;
>
>             idt,slew-percent =3D <100>;
>
>         };
>
>         OUT3 {
>
>             idt,mode =3D <VC5_LVDS>;
>
>             idt,voltage-microvolt =3D <3300000>;
>
>             idt,slew-percent =3D <100>;
>
>         };
>
>         OUT4 {
>
>             idt,mode =3D <VC5_LVDS>;
>
>             idt,voltage-microvolt =3D <3300000>;
>
>             idt,slew-percent =3D <100>;
>
>         };
>
>     };
>
> =E2=80=A6
>
>
>
> But still only seeing default clocks (100MHz on out 1, nothing on out2-4)=
.
>
>
>
> Any suggestions?
>
>
>
> > >>> I saw your name mentioned so I am emailing  you directly.  If there=
 is a
>
> > better place to ask these questions can you please direct me there?  Th=
anks
>
> > you so much.
>
> > >>
>
> > >> Adam (CC'd) wrote the original driver, so he's probably a better
>
> > >> person to start with. You should also CC the linux-clk mailing list
>
> > >> for questions about clock drivers.
>
> > >
>
> > > I've reviewed the datasheet for the 6965, and it doesn't explicitly
>
> > > show the multiplier, but the programmer's guide does appear to show
>
> > > the existence of bit that when set, it will "double the reference
>
> > > frequency for the Phase frequency detector" but on the programmer's
>
> > > guide for the 6901, the same bit reads "Enables frequency doubler whe=
n
>
> > > set to 1" so it's not clear to me that these functions are exactly th=
e
>
> > > same, but implies that it might be.  I'll need some time to test this=
,
>
> > > but if I find it works, I can push a patch to this driver.  I added
>
> > > Luca, as he is the maintainer for this driver as well.
>
> >
>
> > Thanks Adam. I'm afraid I have no detailed answer as I never tried this=
 bit,
>
> > but according to the docs indeed it looks like there is a doubler as yo=
u
>
> > noticed, that it is disabled by default. It would be nice to test it an=
d submit a
>
> > patch, thanks!
>
> >
>
> > --
>
> > Luca
>
>
>
> For what it's worth, I have played around with Renesas' Timing Commander =
 tool and they seem to use the doubler bit in the same fashion.
>
>
>
>
>
> Thanks,
>
> Claude
>
> ________________________________
> This message and any attachments are intended only for the designated rec=
ipient(s) and may contain confidential or proprietary information and be su=
bject to the attorney-client privilege or other confidentiality protections=
. If you are not a designated recipient, you may not review, use, copy or d=
istribute this message or any attachments. If you received this email in er=
ror, please notify the sender by reply e-mail and permanently delete the or=
iginal and any copies of this message and any attachments thereto. Thank yo=
u.
