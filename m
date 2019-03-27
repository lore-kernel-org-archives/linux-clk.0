Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE972C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 16:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5F142082F
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 16:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfC0QCh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 12:02:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54512 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfC0QCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 12:02:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id f3so560051wmj.4
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2019 09:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zPgZHRq4lKYMUGE2EKkhMjvFyzaa0xWyxEAmf1+UrcI=;
        b=HPGgkQqbeXcpcHg/sEf1951UVJoWrxRI+sAFMU8VA70VuPKn6+jGnUZ7OJAzdI0VfK
         e81P/Fec4VF8qt2VGjrNy3kTy6YEfEzWakQTIzGhmMhfwEI8Pt1l6AwUMhls3KcQOi0J
         +gj8IvHawxHOmJubpf4RJsEaYc/CcbFyeLrEoPqrxnA7noDX886+NiEGUTigkO+9z3CB
         Ohh+hs6zpr6EGxlvJE1ILBU862TP55bgidvXlfYBEyNwTdo6HaCQy6e70Y6/VBCrngEP
         H2rt7KpOpl936rGtkUMKpZcH9YgeTpiS9ir43lJ24JcxNPSEP42ivM8Ce/R9Rw22Mc0A
         88hQ==
X-Gm-Message-State: APjAAAWRs5OhI+M6yVoQMgg397RJFrI12UGWQdcenGv+5hCHcsHpNe6Y
        iQiqSp6PV0ynpj82DR9Bg7CaErgiR7Q=
X-Google-Smtp-Source: APXvYqwi7r0+4/8ZR7juMR6kPHi1K3Fl8jG0uvL2WvWmJJivKFozMNAWBwvAIqU/J+nknYTnU6br2A==
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr8720917wmg.21.1553702554117;
        Wed, 27 Mar 2019 09:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id e9sm20125329wrp.35.2019.03.27.09.02.32
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2019 09:02:33 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        Semyon Verchenko <semverchenko@factor-ts.ru>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
Date:   Wed, 27 Mar 2019 17:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 3/25/19 9:12 PM, Fujinaka, Todd wrote:
> This is going to take a bit of time to see what we need to do. The attachments were stripped but I think just figuring out what they had to change in the Realtek driver will tell us what we need to know.

I'm not sure fixing this in the ethernet driver is the best way to go,
the board in question is an embedded PC and I've also recently received
a bug report about a similar problem with the consumer not requesting
the pmc clocks causing a HSIC usb hub to not work.

I think that it might be better to restore the CLK_IS_CRITICAL workaround
for this, but then only on select boards, based on DMI matching.

I've added a bunch of relevant people / lists to the Cc.

Andy, Stephen, what is your take on this ?

I'm myself starting to believe the DMI based applying of the
CLK_IS_CRITICAL workaround is the best solution here.

Regards,

Hans


> 
> Todd Fujinaka
> Software Application Engineer
> Datacenter Engineering Group
> Intel Corporation
> todd.fujinaka@intel.com
> 
> 
> -----Original Message-----
> From: Semyon Verchenko [mailto:semverchenko@factor-ts.ru]
> Sent: Monday, March 25, 2019 6:25 AM
> To: hdegoede@redhat.com; Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; e1000-devel@lists.sf.net
> Subject: [E1000-devel] igb driver with Intel Atom Bay Trail issue
> 
> Dear Linux/igb maintainers,
> 
> We've encountered problem with igb driver (both one that is distributed with Linux kernel and one which is downloadable from intel.com). After commit 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL") on machine with Intel(R) Atom(TM) CPU E3825 with 4 ethernet cards Intel
> I211 only one of cards probed correctly, other ones fail with error -2 (error -5 with driver from intel.com). I've rebuilt kernel with commit 648e921888ad reverted and all 4 interfaces had to probe correctly.
> Problem is reproducible at least with kernel 5.0.4 and kernels 4.14.y (actually firstly I've encountered this on 4.14.105 while it worked fine with 4.14.67 so I firstly started to build intermediate versions of kernel and found that problem started to appear on 4.14.77, but since it's reproducible in mainline kernel I think I should inform mainline kernel maintainers about this). Also it is reproducible with igb
> 5.3.5.22 from intel.com. I'm attaching kernel logs (journalctl.bad is from stock kernel and journalctl.badfix is from stock kernel with commit 648e921888ad reversed), lspci -vnn output (same about file names) and /proc/cpuinfo. The system is Arch Linux with kernel replaced to stock one (it is not Arch Linux-related problem as it appeared in another system with 4.14 kernel). I think something like Hans de Goede's r8169 patches is required for igb (and maybe other Intel drivers), but I'm not so good with driver developing so it seems too hard for me.
> 
> Regards,
> Semyon Verchenko
> 
