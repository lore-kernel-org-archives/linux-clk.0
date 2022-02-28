Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19349C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 17:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiB1RHv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 12:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235888AbiB1RHu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 12:07:50 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4161E86E29
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 09:07:11 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id h15so18537642edv.7
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pNVBJVNSIeQZrVNyJPjar/SN9V3umarDTAi3tOtz9uY=;
        b=Wgpm7l09vT8axHxDRMwLu4a8Mo1vppxksv/2wAyY6G6dx3oszOP25EHBhknV2ohTYD
         grfZDneKd7h3MpYw7pId1qE9YJ8v3uAePVEZ+du9CUTjC61iyg9JKpaT10I4gdFnTC4B
         ruqIMgDktSuMOw6oa1+1vf/e8M4s3IgqkMGElXOouGj1/9hKfd26Dk9myYlBI3BAqJnk
         s6nMU4IKFVJCNmnW5BZyk0YK28HF9sUEJPLH837wSt58XTZfXCrbDjXy4bKybQrhF2m8
         a8vkXmQc5c87mqicKAZ0hjcxvR91hz2kd61SVKV1TJmlBTDPqXEXWHU+4sxgc7aZzFBc
         BFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pNVBJVNSIeQZrVNyJPjar/SN9V3umarDTAi3tOtz9uY=;
        b=jPvF8/526VsvXLPFfPxpK6rsbgf3C6wBYITBb8JuL0LB2NTeCjTqzPncpV2KkKWSEK
         BzIbNjmnPadMDTo7axwGn9YKRP8JHp0Ftsr75VjmRx2zPoR/RHdDFMSAFaZYrnzhyo5J
         mLIVzNgMa+XQE272oJwKgUQz0ZUbkGusOtUOuTvb/4F6ED6zr7vjzyAXKdkFHh1XwBtF
         q+IzcTKWq+WB4rvm1y3+DNE3eCy9hIPbCYc36BhkQI3CmZLs9du9ys5+beojhiQzLqHZ
         I9zms9NI5GX+a6vxBR8OhjDNHKKHvnRJ5BbouKAdCw18LdolK6bUqUDY1u7dm40ATedf
         EJJw==
X-Gm-Message-State: AOAM532TBdXSdAIDreSsH4C7AKEzA9B/mD6FkTJQjtKRT9oNaGP+8U9n
        npBdPqntczh1dvcIIbrS2A48oMCOPxo7jPT4R7M=
X-Google-Smtp-Source: ABdhPJxPvMfKTHzzFNWl6tn30W1o38w4criYYo4CDusbeQw2BdKuFnm4ZuQUmY16v8j0GMyZMsGv3ix6EMu2L26LWMw=
X-Received: by 2002:a05:6402:220a:b0:413:5d5e:4470 with SMTP id
 cq10-20020a056402220a00b004135d5e4470mr19997042edb.200.1646068029422; Mon, 28
 Feb 2022 09:07:09 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
In-Reply-To: <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 28 Feb 2022 11:06:58 -0600
Message-ID: <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
Subject: Re: Questions regarding regarding idt/renesas versaclock5 driver
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     "Fillion, Claude" <Claude.Fillion@mksinst.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 28, 2022 at 10:04 AM Sean Anderson <sean.anderson@seco.com> wro=
te:
>
>
>
> On 2/28/22 7:35 AM, Fillion, Claude wrote:
> >
> > You don't often get email from claude.fillion@mksinst.com. Learn why th=
is is important <http://aka.ms/LearnAboutSenderIdentification>
> >
> >
> > Hello  Sean,
> >
> >

+ Luca Ceresoli

> >
> > I have a design that is looking to use the Renesas 5P49V6965 or 5P49V69=
0 clock chip and am looking to use the versaclock 5 driver (https://github.=
com/Xilinx/linux-xlnx/blob/master/drivers/clk/clk-versaclock5.c).
> >
> >
> >
> > I am new to writing drivers and have two questions I am hoping you can =
help me with:
> >
> > 1) In the driver I see the following code:
> >
> > static const struct vc5_chip_info idt_5p49v6901_info =3D {
> >
> >             .model =3D IDT_VC6_5P49V6901,
> >
> >             .clk_fod_cnt =3D 4,
> >
> >             .clk_out_cnt =3D 5,
> >
> >             .flags =3D VC5_HAS_PFD_FREQ_DBL,
> >
> > };
> >
> >
> >
> > static const struct vc5_chip_info idt_5p49v6965_info =3D {
> >
> >             .model =3D IDT_VC6_5P49V6965,
> >
> >             .clk_fod_cnt =3D 4,
> >
> >             .clk_out_cnt =3D 5,
> >
> >             .flags =3D  VC5_HAS_BYPASS_SYNC_BIT,
> >
> > };
> >
> >
> >
> > However, the 6965 part also has the same frequency doubling bit as the =
6901.  Would it be better to set the flags for the 6965 to something like t=
his?
> >
> >
> >
> > static const struct vc5_chip_info idt_5p49v6965_info =3D {
> >
> >             .model =3D IDT_VC6_5P49V6965,
> >
> >             .clk_fod_cnt =3D 4,
> >
> >             .clk_out_cnt =3D 5,
> >
> >             .flags =3D VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
> >
> > };
>
> I think Adam will have a better idea about this.
>
> > 2) I am unclear how to set the output frequencies for the device. For m=
y application I would like to set output clock 1 to 250MHz and output clock=
 2 to 46.8MHz but I am unclear how to do so.  I have looked at the document=
ation at https://mjmwired.net/kernel/Documentation/devicetree/bindings/cloc=
k/idt,versaclock5.yaml but remain unclear how to set the output frequencies=
.  Any insight you could provide would be greatly appreciated.
>
> Use assigned-clock-frequencies as described in
> Documentation/devicetree/bindings/clock/clock-bindings.txt
>

I agree that the clock-bindings have the instructions on how to set
them.  If you check
arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi, there are some
examples of how to set the frequency.
In my instance,  the chip wasn't enabling the output by default, so I
needed to submit some patches upstream to make sure the device that
was being clocked by this device had get and enable functions to make
sure the clock chip would turn on the clock when requested.

>
> > I saw your name mentioned so I am emailing  you directly.  If there is =
a better place to ask these questions can you please direct me there?  Than=
ks you so much.
>
> Adam (CC'd) wrote the original driver, so he's probably a
> better person to start with. You should also CC the linux-clk
> mailing list for questions about clock drivers.

I've reviewed the datasheet for the 6965, and it doesn't explicitly
show the multiplier, but the programmer's guide does appear to show
the existence of bit that when set, it will "double the reference
frequency for the Phase frequency detector" but on the programmer's
guide for the 6901, the same bit reads "Enables frequency doubler when
set to 1" so it's not clear to me that these functions are exactly the
same, but implies that it might be.  I'll need some time to test this,
but if I find it works, I can push a patch to this driver.  I added
Luca, as he is the maintainer for this driver as well.

adam
>
> --Sean
