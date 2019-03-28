Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F22C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:44:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D46520811
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1BQJzg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfC1Po2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:44:28 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42143 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfC1Po2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 11:44:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id p6so11795466pgh.9;
        Thu, 28 Mar 2019 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=139DqPHxDsNjcemaE3GvEKmeU43tGqNH1L4R7Ak19ts=;
        b=e1BQJzg2iAVfrohCl6zX4qY6Y6E4eEt+tVdwHCL/M2BBOw2JtDQH7FHIPliEG4czSq
         lYX362R+py6l3knA4laCYekPC1y0P6Iy4zgTp/zXzEITwp0TcLXxfxT75TYwUoq6axxD
         IlfxAGSCT20D07F3OukaJzhc7TmIJjs6W8aCr1Pa7j25hnag8S2B/AdhG+z6Lfqp5dZq
         6CBJb3/Wi+jmTKCJkBssKrWqM52X09hWAd6aIlC8RA94a3js/O6xcYBYCeEG4eFEUkCq
         1EKjd34y3uuBn37U6xNbqaJQwa3a6utlAtcC04XbNbIN41t/OiPe+XOXQRnop8o8RJxX
         SsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=139DqPHxDsNjcemaE3GvEKmeU43tGqNH1L4R7Ak19ts=;
        b=aC05Trzhpjc7s6hdDl5vD7zOK8WtjCKqLqsvRdGjJqABMDqKhDVamaXRqI0qjjsT4u
         yiLu7pjYECCETjUErq1WmfY+u/WeHig4J//lUXguymzOwrIcIBqTS36cJp9EPLFtUtsL
         vfFSCII1SGlDCe8GiviTE2WPgAwdKWn9WEBh62ekdCh678I3s3LVcUP2atwWK+rEm8O1
         oXdKeW8V4pnp2yyJEYJltyTW9VlIi1WvQ9VooM72XnOtrEvhignE8b94Mxp6E6hFGjc7
         6k8ZupkpcKnrpoetAVeE2dd5EwifgfppgQEOd8SvoriEhJeu+Gu6f/bMkIgsKwtbirDX
         MUuQ==
X-Gm-Message-State: APjAAAWhMrl4dh58YTlG17Q0ggl4EmqJTf3XzgGDkeIb002XEsXEXVr0
        e8JoqCJk7JgYKG38YoBF+e6eOUIK3EyoUD1g2cWIcSlk
X-Google-Smtp-Source: APXvYqxB2obQUUejRZr+kDWQ/rR63WSU5Z68w4+MxU5jIlB+wpUV0UsN6BdKRbS1bXMddUAMkngZg1j/uEJjE+5hL+8=
X-Received: by 2002:a62:1d90:: with SMTP id d138mr6531287pfd.232.1553787867863;
 Thu, 28 Mar 2019 08:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190328124939.23139-1-dave.mueller@gmx.ch> <ad96925b-adde-e62a-76d0-8f91865a0814@redhat.com>
 <e47cb333-61c5-ba72-edd8-021ccf961c78@gmx.ch> <65798648-9ed4-02fe-bcb1-bb7c2bf53588@redhat.com>
In-Reply-To: <65798648-9ed4-02fe-bcb1-bb7c2bf53588@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Mar 2019 17:44:15 +0200
Message-ID: <CAHp75Vf3vfADzRgKVUgToo70Ff4jKRTNpAKsHc6VxTy9sxivRA@mail.gmail.com>
Subject: Re: [PATCH] clk: x86: Add system specific quirk to mark clocks as critical
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?David_M=C3=BCller?= <dave.mueller@gmx.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 28, 2019 at 5:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 28-03-19 16:41, David M=C3=BCller wrote:
> > Hans de Goede wrote:

> >> Can you respin the patch to use the old method of looking at which
> >> clocks are enabled by the BIOS? (note you may want to wait with
> >> this till Andy and I have reached an agreement on how to solve this)
> >
> > Sure, I will wait until consensus is reached. ;-)
>
> I believe that Andy I agree now that at least your case needs the
> DMI based approach, so go ahead and respin it :)

Confirm.

--=20
With Best Regards,
Andy Shevchenko
