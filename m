Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA74FC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 15:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239898AbiCBPq3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 10:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240019AbiCBPq2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 10:46:28 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608CF5BE44
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 07:45:43 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id d10so4567669eje.10
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fLyb14G3NU1sb92F4F5J/865979XQ0w3YtHTDiBkL50=;
        b=QpuJs691vGlhQ9yql1CZKprR2lReMwiYv2AKgAvwFdHEmHfSo2MNttVEt+0nsyj760
         Gp4C4uNGM4jJdPsz9AkMZ3DhpG65UPpsT+HoE2PaHxuMRkxdmIrpS3aFItCV4IPMSJ/j
         rnP5T1mOnXINA6Z+63CQqODEWPFkkVtQY6GKl7UXkRVMbLCVfe7zM7mXo+jKlRguDA51
         X5/z5yvQMwhOLmc9rRFt/IWWJMUf8gf5OK8ZZ+NxFx31LvrtcnmiehUcVfS5Ci9x4GO8
         TUplchfh2uDW2LEZ2fszSdxZ7/nNY9ZyVv5h4TzhBIIhKCB/6lvQpdvxvuwH312LWLG+
         LUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fLyb14G3NU1sb92F4F5J/865979XQ0w3YtHTDiBkL50=;
        b=B6iiw3I+k7YQCFSCY/3/ePUqOa28z4TLwU2draubQz61rEjdAzwBO9DGsQdR3e4egJ
         Ng8YkQzqy7YYaebkXFbpAeobinNpuUutOAzdBTfYXHfQ0GSnuPEHlPvjIfFpmvh50Asw
         UaYBOkbKIYXFh0WLiypSYqjM1edh7yfoVfrwpJHHkeFnuRCeJw8NORoXKaoEun9aX/T2
         abMSNoV863vDS6yRVszCLjGiB8XV2ljxrTtgnV5iFz7aizCiKUuZXzHmxZ8kvSWhpHid
         kBuZr8P2560x3f3Qpq0YZvv8fUmxyvf5BQL0xlezsypab6fq/Gj7fIP79eAq4NDUuvsh
         hFFA==
X-Gm-Message-State: AOAM531/+C9AN2zPOIgKpLKieCuS0On0uQ+rE8oUjjm+rSAQT4VYo0VH
        3N74lhbMmg/5l4adwO3rkUSALq52T2sJ51F71aY=
X-Google-Smtp-Source: ABdhPJwBoW/wUeyGHhrxXweqVOR3WaTevd2+bqUKjMHL7hppEWZmdtV+3CGINvGVfuDdJQIlZNKi55PGcRJO0QlwBAQ=
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id
 nd41-20020a17090762a900b006da79534df0mr1515315ejc.316.1646235941754; Wed, 02
 Mar 2022 07:45:41 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com> <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net> <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com>
 <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xKbE9Rv3EsvFkS4Lk8nCwy1TK-xJQLk_h70PSVdeUHJcA@mail.gmail.com> <MN2PR03MB5008536F789B93337AF0BA6793039@MN2PR03MB5008.namprd03.prod.outlook.com>
In-Reply-To: <MN2PR03MB5008536F789B93337AF0BA6793039@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 2 Mar 2022 09:45:30 -0600
Message-ID: <CAHCN7xJFxtA=9GYkQ1dVig=sSRQY3yhjS9dO2GRtqn=zdc9w7g@mail.gmail.com>
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

On Wed, Mar 2, 2022 at 8:44 AM Fillion, Claude
<Claude.Fillion@mksinst.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Adam Ford <aford173@gmail.com>
> > Sent: Tuesday, March 1, 2022 1:28 PM
> > To: Fillion, Claude <Claude.Fillion@mksinst.com>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>; Sean Anderson
> > <sean.anderson@seco.com>; linux-clk <linux-clk@vger.kernel.org>
> > Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
> > versaclock5 driver
> >
> > On Tue, Mar 1, 2022 at 12:16 PM Fillion, Claude
> > <Claude.Fillion@mksinst.com> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Adam Ford <aford173@gmail.com>
> > > > Sent: Tuesday, March 1, 2022 9:30 AM
> > > > To: Fillion, Claude <Claude.Fillion@mksinst.com>
> > > > Cc: Luca Ceresoli <luca@lucaceresoli.net>; Sean Anderson
> > > > <sean.anderson@seco.com>; linux-clk <linux-clk@vger.kernel.org>
> > > > Subject: Re: [EXTERNAL] Re: Questions regarding regarding
> > > > idt/renesas
> > > > versaclock5 driver
> > > >
> > > > On Tue, Mar 1, 2022 at 8:12 AM Fillion, Claude
> > > > <Claude.Fillion@mksinst.com>
> > > > wrote:
> > > > >
> > > > > Thanks for your replies.  A few more points/questions.
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > >
> > > > > > From: Luca Ceresoli <luca@lucaceresoli.net>
> > > > >
> > > > > > Sent: Monday, February 28, 2022 5:14 PM
> > > > >
> > > > > > To: Adam Ford <aford173@gmail.com>; Sean Anderson
> > > > >
> > > > > > <sean.anderson@seco.com>
> > > > >
> > > > > > Cc: Fillion, Claude <Claude.Fillion@mksinst.com>; linux-clk
> > > > > > <linux-
> > > > >
> > > > > > clk@vger.kernel.org>
> > > > >
> > > > > > Subject: [EXTERNAL] Re: Questions regarding regarding
> > > > > > idt/renesas
> > > > >
> > > > > > versaclock5 driver
> > > > >
> > > > > >
> > > > >
> > > > > > This email originated outside of MKS.  Use caution when sharing
> > > > > > information
> > > > >
> > > > > > or opening attachments and links.
> > > > >
> > > > > >
> > > > >
> > > > > > ---------------------------------------------------------------=
-
> > > > > > ----
> > > > > > --------------------------
> > > > >
> > > > > > ----------------------------------------------
> > > > >
> > > > > > Hi,
> > > > >
> > > > > >
> > > > >
> > > > > > On 28/02/22 18:06, Adam Ford wrote:
> > > > >
> > > > > > > On Mon, Feb 28, 2022 at 10:04 AM Sean Anderson
> > > > >
> > > > > > <sean.anderson@seco.com> wrote:
> > > > >
> > > > > > >>
> > > > >
> > > > > > >>
> > > > >
> > > > > > >>
> > > > >
> > > > > > >> On 2/28/22 7:35 AM, Fillion, Claude wrote:
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> You don't often get email from claude.fillion@mksinst.com.
> > > > > > >>> Learn why
> > > > >
> > > > > > >>> this is important
> > > > >
> > > > > > >>>
> > > > >
> > > > > >
> > > >
> > <https://urldefense.com/v3/__http://aka.ms/LearnAboutSenderIdentific
> > > > >
> > > > > > >>> ation__;!!KnJ4-
> > > > >
> > > > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-We
> > > > >
> > > > > > >>> UZR3sOMdn4NpYPGkfDG$ >
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> Hello  Sean,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >
> > > > >
> > > > > > > + Luca Ceresoli
> > > > >
> > > > > > >
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> I have a design that is looking to use the Renesas 5P49V696=
5
> > > > > > >>> or
> > > > > > >>> 5P49V690
> > > > >
> > > > > > clock chip and am looking to use the versaclock 5 driver
> > > > >
> > > > > > (https://urldefense.com/v3/__https://github.com/Xilinx/linux-
> > > > >
> > > > > > xlnx/blob/master/drivers/clk/clk-versaclock5.c__;!!KnJ4-
> > > > >
> > > > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
> > > > >
> > > > > > WeUZR3sOMdn4NpaBSRqIM$ ).
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> I am new to writing drivers and have two questions I am
> > > > > > >>> hoping you can
> > > > >
> > > > > > help me with:
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> 1) In the driver I see the following code:
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> static const struct vc5_chip_info idt_5p49v6901_info =3D {
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .model =3D IDT_VC6_5P49V6901,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_fod_cnt =3D 4,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_out_cnt =3D 5,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> };
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .model =3D IDT_VC6_5P49V6965,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_fod_cnt =3D 4,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_out_cnt =3D 5,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .flags =3D  VC5_HAS_BYPASS_SYNC_BIT,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> };
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> However, the 6965 part also has the same frequency doubling
> > > > > > >>> bit as the
> > > > >
> > > > > > 6901.  Would it be better to set the flags for the 6965 to
> > > > > > something like
> > > > this?
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .model =3D IDT_VC6_5P49V6965,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_fod_cnt =3D 4,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .clk_out_cnt =3D 5,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL |
> > > > > > >>> VC5_HAS_BYPASS_SYNC_BIT,
> > > > >
> > > > > > >>>
> > > > >
> > > > > > >>> };
> > > > >
> > > > > > >>
> > > > >
> > > > > > >> I think Adam will have a better idea about this.
> > > > >
> > > > > > >>
> > > > >
> > > > > > >>> 2) I am unclear how to set the output frequencies for the
> > > > > > >>> device. For my
> > > > >
> > > > > > application I would like to set output clock 1 to 250MHz and
> > > > > > output clock 2 to
> > > > >
> > > > > > 46.8MHz but I am unclear how to do so.  I have looked at the
> > > > > > documentation
> > > > >
> > > > > > at
> > > > >
> > > > > >
> > > >
> > https://urldefense.com/v3/__https://mjmwired.net/kernel/Documentatio
> > > > > > n
> > > > >
> > > > > > /devicetree/bindings/clock/idt,versaclock5.yaml__;!!KnJ4-
> > > > >
> > > > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
> > > > >
> > > > > > WeUZR3sOMdn4NpVQVg6al$  but remain unclear how to set the
> > output
> > > > >
> > > > > > frequencies.  Any insight you could provide would be greatly
> > appreciated.
> > > > >
> > > > > > >>
> > > > >
> > > > > > >> Use assigned-clock-frequencies as described in
> > > > >
> > > > > > >> Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > > >
> > > > > > >>
> > > > >
> > > > > > >
> > > > >
> > > > > > > I agree that the clock-bindings have the instructions on how
> > > > > > > to set
> > > > >
> > > > > > > them.  If you check
> > > > >
> > > > > > > arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi, there
> > are
> > > > > > > some
> > > > >
> > > > > > > examples of how to set the frequency.
> > > > >
> > > > > > > In my instance,  the chip wasn't enabling the output by
> > > > > > > default, so I
> > > > >
> > > > > > > needed to submit some patches upstream to make sure the devic=
e
> > > > > > > that
> > > > >
> > > > > > > was being clocked by this device had get and enable functions
> > > > > > > to make
> > > > >
> > > > > > > sure the clock chip would turn on the clock when requested.
> > > > >
> > > > > >
> > > > >
> > > > > > Indeed assigned-clocks is the way to enable a clock when the
> > > > > > downstream
> > > > >
> > > > > > driver does not request it. Not that it is easy to find: it too=
k
> > > > > > me a while to find
> > > > >
> > > > > > it the first time I needed it.
> > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > > Trying to follow the example beacon-renesom-som.dtsi
> > > > > implementation
> > > > but am still not getting proper output.  I should note I am running
> > > > this as a patch on an older Petalinux  code base
> > > > (4.14.0-xilinx-v2018.3). After replacing
> > > > dev_err_probe() calls with older dev_err() calls the code compiles
> > > > and seems to run without issue. Is it possible other files need to =
be
> > updated?
> > > > >
> > > > >
> > > > >
> > > > > Added the provider code at the beginning of dtsi as follows;
> > > > >
> > > > > #include <dt-bindings/clk/versaclock.h>
> > > > >
> > > > >
> > > > >
> > > > > /include/ "system-conf.dtsi"
> > > > >
> > > > > / {
> > > > >
> > > > >   /* Clock Provider */
> > > > >
> > > > >   x304_clk: x304-clock {
> > > > >
> > > > >     compatible =3D "fixed-clock";
> > > > >
> > > > >     #clock-cells =3D <0>;
> > > > >
> > > > >     clock-frequency =3D <25000000>;
> > > > >
> > > > >   };
> > > > >
> > > > > =E2=80=A6
> > > > >
> > > > >
> > > > >
> > > > > And added consumer code:
> > > > >
> > > > >
> > > > >
> > > > > &i2c1 {
> > > > >
> > > > >     clock-frequency =3D <100000>;
> > > > >
> > > > >
> > > > >
> > > > >     // Use patch.  Updated driver for 5p49v6965 available  at
> > > > > https://urldefense.com/v3/__https://github.com/Xilinx/linux-xlnx/=
b
> > > > > lob/
> > > > > master/drivers/clk/clk-versaclock5.c__;!!KnJ4-rp7!3K4sRtgFBeaZQ8I=
r
> > > > > EvZ8 dkvJDiPMBlDRradrS0adfnpa1dNXMNjeIwNfOyHPLkFkwVpJ$
> > > > >
> > > > >     // Device Tree Setup ->
> > > > > https://urldefense.com/v3/__https://github.com/Xilinx/linux-xlnx/=
b
> > > > > lob/
> > > > >
> > > >
> > master/Documentation/devicetree/bindings/clock/idt*2Cversaclock5.yam
> > > > l_
> > > > > _;JQ!!KnJ4-
> > > > rp7!3K4sRtgFBeaZQ8IrEvZ8dkvJDiPMBlDRradrS0adfnpa1dNXMNjeIwN
> > > > > fOyHPLhF0Uums$
> > > > >
> > > > >     versaclock6: clock-controller@6a {
> > > > >
> > > > >         /* Clock Consumer */
> > > > >
> > > > >         compatible =3D "idt,5p49v6965";
> > > > >
> > > > >                                 reg =3D <0x6a>;
> > > > >
> > > > >                                 #clock-cells =3D <1>;
> > > > >
> > > > >                                 clocks =3D <&x304_clk>;
> > > > >
> > > > >                                 clock-names =3D "xin";
> > > > >
> > > > >
> > > > >
> > > > >         assigned_clocks =3D <&versaclock6 1>,
> > > > >
> > > > >                           <&versaclock6 2>,
> > > > >
> > > > >                           <&versaclock6 3>,
> > > > >
> > > > >                           <&versaclock6 4>;
> > > > >
> > > > >         assigned_clock_rates =3D <46800000>, <250000000>, <100000=
0>,
> > > > > <13000000>;
> > > >
> > > >
> > > > Assigned clocks and assigned clock rates should be hyphens and not
> > > > underscores.
> > > >
> > > > assigned-clocks =3D  <&versaclock6 1>,   <&versaclock6 2>,
> > > > <&versaclock6 3>, <&versaclock6 4>;
> > > >
> > > > assigned-clock-rates =3D  <46800000>, <250000000>, <1000000>,
> > > > <13000000>;
> > > >
> > > > Another thing to check is to make sure the consumers of these clock=
s
> > > > is enabling them.  They do not necessarily get enabled by default.
> > > >
> > > > adam
> > >
> > > Doh - thanks.  I looked at it a million times =F0=9F=98=8A .
> > >
> > > Now getting desired out1 frequency but nothing on other outputs.  Fro=
m
> > the code it seems vc5_clk_out_prepare() is the method that enables outp=
uts
> > but this method is not being called I am not clear how to make the 'con=
sumer
> > enable them.'
> > >
> > > I have added this to my dtsi to no avail.
> > >
> > >          /* Consumer referencing 5P49V5965 pin OUT1 and OUT2 */
> > >         consumer {
> > >             clocks =3D <&versaclock6 1>, <&versaclock6 2>;
> > >             /* ... */
> > >          };
> > >
> > > Looking through device tree documentation.
> >
> > It's likely going to be in the consumer's driver.  Check the consumer d=
evice
> > tree binding to make sure you've correctly associated the clock.  If th=
e
> > binding doesnt't show a clock is required, it might not know that you u=
sing a
> > programmable clock.
> >
> > Here is a patch that I needed to apply to an Ethernet driver which wasn=
't
> > expecting a programmable clock to drive a reference clock, so the clock
> > wasn't being enabled.
> >
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel=
/g
> > it/torvalds/linux.git/commit/drivers/net/ethernet/renesas/ravb_main.c?i=
d=3D
> > 8ef7adc6beb2ef0bce83513dc9e4505e7b21e8c2__;!!KnJ4-rp7!1Qb17q-
> > TWrV62AeQtTNNVDErVbyhbXB1sukyT2ggvFPUltIBI5nIKzNnjVOcqlw8qJyy$
> >
> > Look at the use of devm_clk_get_optional and clk_prepare_enable from th=
at
> > patch.  (yes, there is a subsequent patch that fixes something I didn't=
 quite
> > do right, but the basics are here)
> >
> > The consumer drivers need to 'get' the clock so it can associate itself=
 to the
> > clock in question.  Once the relationship is established, the consumer =
needs
> > to call clk_prepare_enable() which uses the clock system to turn the cl=
ock on.
> > Without this step, it's likely the Versaclock won't generate a signal, =
because it
> > doesn't know it needs to turn it on.
> >
> > adam
>
> Not sure I fully follow.  I see that clk out1 is enabled but the other ch=
annels are not so it would seem my difficulty is with individual channels.

Do the devices that need the clock from the versaclock reference the
versaclock?  If so, to those drivers use the get and enable?  If not,
the versaclock will stay off.  In the patch example I showed, I had to
modify the Ethernet driver on a processor, because it didn't
explicitly enable the reference clock.  That Ethernet driver expected
the refclk was always present which was a false assumption.  Once I
got the consumer device (in this case, Ethernet) to request and enable
the clock, the clock subsystem enabled the corresponding output on the
versaclock.

For the Ethernet example I cited above, the corresponding device tree
looks like:

&avb {
     clocks =3D <&cpg CPG_MOD 812>, <&versaclock5 4>;
     clock-names =3D "fck", "refclk";
     status =3D "okay";
};

With this device tree reference, the 'refclk' gets associated to
versaclock ouput 4.  When the Ethernet needs the clock, it calls
clk_prepare_enable on that clock reference, and the clock system calls
on the versaclock driver to enable the output.  The reason I needed to
submit that patch was that the consumer driver (the Ethernet in this
case) wasn't calling the clk_prepare_enable, so the clock remained
off.  It's likely that whatever devices that need the clock from the
versaclock will need both a device tree reference to it as well as a
call to clk_prepare_enable.

>
> In my simple application I would like to enable outputs, on a per channel=
 basis, from the device tree.  Would it make sense  to add  an 'idt,enable'=
 property in similar fashion to the existing idt,mode, idt,voltage-microvol=
t, and idt,slew-percent properties?  Then vc5_get_output_config() could be =
modified to also call vc5_clk_out_prepare() (or clk_prepare_enable(), which=
 in turn would call vc5_clk_out_prepare()).

I can't speak for the linux clock group, but the advantage of patching
the drivers that need the clocks generated from the versaclock is the
ability to stop these clocks when the drivers are halted and/or
suspended.

adam
>
> Seems like this would work nicely for my application but not sure it woul=
d be generally useful.
>
> -Claude
>
> > >
> > > >
> > > >
> > > >
> > > > >
> > > > >         /* Set the SD/OE pin's settings */
> > > > >
> > > > >         OUT1 {
> > > > >
> > > > >             idt,mode =3D <VC5_LVDS>;
> > > > >
> > > > >             idt,voltage-microvolt =3D <3300000>;
> > > > >
> > > > >             idt,slew-percent =3D <100>;
> > > > >
> > > > >         };
> > > > >
> > > > >         OUT2 {
> > > > >
> > > > >             idt,mode =3D <VC5_LVDS>;
> > > > >
> > > > >             idt,voltage-microvolt =3D <3300000>;
> > > > >
> > > > >             idt,slew-percent =3D <100>;
> > > > >
> > > > >         };
> > > > >
> > > > >         OUT3 {
> > > > >
> > > > >             idt,mode =3D <VC5_LVDS>;
> > > > >
> > > > >             idt,voltage-microvolt =3D <3300000>;
> > > > >
> > > > >             idt,slew-percent =3D <100>;
> > > > >
> > > > >         };
> > > > >
> > > > >         OUT4 {
> > > > >
> > > > >             idt,mode =3D <VC5_LVDS>;
> > > > >
> > > > >             idt,voltage-microvolt =3D <3300000>;
> > > > >
> > > > >             idt,slew-percent =3D <100>;
> > > > >
> > > > >         };
> > > > >
> > > > >     };
> > > > >
> > > > > =E2=80=A6
> > > > >
> > > > >
> > > > >
> > > > > But still only seeing default clocks (100MHz on out 1, nothing on=
 out2-4).
> > > > >
> > > > >
> > > > >
> > > > > Any suggestions?
> > > > >
> > > > >
> > > > >
> > > > > > >>> I saw your name mentioned so I am emailing  you directly.
> > > > > > >>> If there is a
> > > > >
> > > > > > better place to ask these questions can you please direct me th=
ere?
> > > > > > Thanks
> > > > >
> > > > > > you so much.
> > > > >
> > > > > > >>
> > > > >
> > > > > > >> Adam (CC'd) wrote the original driver, so he's probably a
> > > > > > >> better
> > > > >
> > > > > > >> person to start with. You should also CC the linux-clk
> > > > > > >> mailing list
> > > > >
> > > > > > >> for questions about clock drivers.
> > > > >
> > > > > > >
> > > > >
> > > > > > > I've reviewed the datasheet for the 6965, and it doesn't
> > > > > > > explicitly
> > > > >
> > > > > > > show the multiplier, but the programmer's guide does appear t=
o
> > > > > > > show
> > > > >
> > > > > > > the existence of bit that when set, it will "double the
> > > > > > > reference
> > > > >
> > > > > > > frequency for the Phase frequency detector" but on the
> > > > > > > programmer's
> > > > >
> > > > > > > guide for the 6901, the same bit reads "Enables frequency
> > > > > > > doubler when
> > > > >
> > > > > > > set to 1" so it's not clear to me that these functions are
> > > > > > > exactly the
> > > > >
> > > > > > > same, but implies that it might be.  I'll need some time to
> > > > > > > test this,
> > > > >
> > > > > > > but if I find it works, I can push a patch to this driver.  I
> > > > > > > added
> > > > >
> > > > > > > Luca, as he is the maintainer for this driver as well.
> > > > >
> > > > > >
> > > > >
> > > > > > Thanks Adam. I'm afraid I have no detailed answer as I never
> > > > > > tried this bit,
> > > > >
> > > > > > but according to the docs indeed it looks like there is a
> > > > > > doubler as you
> > > > >
> > > > > > noticed, that it is disabled by default. It would be nice to
> > > > > > test it and submit a
> > > > >
> > > > > > patch, thanks!
> > > > >
> > > > > >
> > > > >
> > > > > > --
> > > > >
> > > > > > Luca
> > > > >
> > > > >
> > > > >
> > > > > For what it's worth, I have played around with Renesas' Timing
> > > > > Commander
> > > > tool and they seem to use the doubler bit in the same fashion.
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Claude
> > > > >
> > > > > ________________________________
> > > > > This message and any attachments are intended only for the
> > > > > designated
> > > > recipient(s) and may contain confidential or proprietary informatio=
n
> > > > and be subject to the attorney-client privilege or other
> > > > confidentiality protections. If you are not a designated recipient,
> > > > you may not review, use, copy or distribute this message or any
> > > > attachments. If you received this email in error, please notify the
> > > > sender by reply e-mail and permanently delete the original and any
> > > > copies of this message and any attachments thereto. Thank you.
> > >
> > >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > This message and any attachments are intended only for the designated
> > recipient(s) and may contain confidential or proprietary information an=
d be
> > subject to the attorney-client privilege or other confidentiality prote=
ctions.  If
> > you are not a designated recipient, you may not review, use, copy or
> > distribute this message or any attachments.  If you received this email=
 in
> > error, please notify the sender by reply e-mail and permanently delete =
the
> > original and any copies of this message and any attachments thereto.  T=
hank
> > you.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This message and any attachments are intended only for the designated rec=
ipient(s) and may contain confidential or proprietary information and be su=
bject to the attorney-client privilege or other confidentiality protections=
.  If you are not a designated recipient, you may not review, use, copy or =
distribute this message or any attachments.  If you received this email in =
error, please notify the sender by reply e-mail and permanently delete the =
original and any copies of this message and any attachments thereto.  Thank=
 you.
