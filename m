Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D2AC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4605921773
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="iPwtNWwm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfC1Plc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:41:32 -0400
Received: from mout.gmx.net ([212.227.15.19]:48847 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfC1Plb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 11:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1553787665;
        bh=5TwsG0UVSDWpony4Q+QFADvQwgyCPacj08MUTIaCYzs=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=iPwtNWwmBFi/Smlk6OppiCGOuTkJ7r+giLwrxhgKxkKnLNBqnSXbfZTTh/9HUh4TT
         SbAyBOmJAo0S7fCTGG2/0kOjEueNpGCW0u0ZivANQc2sA5JQ2G6Hokuq64svFWsTHF
         oSwc0FTREynb4EMxsM/CKWA3hlyIidZqWr0DRMJg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MQzIE-1hX4al0fz4-00UIOD; Thu, 28
 Mar 2019 16:41:05 +0100
Subject: Re: [PATCH] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <ad96925b-adde-e62a-76d0-8f91865a0814@redhat.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <e47cb333-61c5-ba72-edd8-021ccf961c78@gmx.ch>
Date:   Thu, 28 Mar 2019 16:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <ad96925b-adde-e62a-76d0-8f91865a0814@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QCd9bZT/AQF7q7BdPj4fdY5hcKmeWjEUtMvh7H1QIdlF6vWmq8a
 WRXjovaZ0hY8rvrsfBpc6bdHryygVRKIhGa/UBalBLGBV/eE7mQ6QS5FFr7sW94urkED8Tr
 goDYktXk1K3IPIo2r/FJnf+ZGoyTBQK+vEn7oShnBCHaB/jGrJTR5pisq/VwsLE3y/s3ijd
 JtNZ6mS5eN60asRgyhrDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J1nh78K+Y3E=:X1yJ+UTgTNUviqAFqD6Uzj
 Od0BQKnDxxzCw4v3mCSWEl6r+jIyN8CfGgbZT5WV17TK9ym1N17ty146H1luSwodKRWgR63oj
 ZfV+narKJThZbtlmNQmMdKoXTRIQybMbKkofdVPu3ojrbpjJ6Nw3clheRHl0IZ8SBje4WJ40E
 AOQIM8g3Wb9ak5wOlra5Ng9N5CnAgcGqZxu3lLHgeV90Xgqpx5VxMdXEILTfN5th6kZYtNxnn
 ++7+XmcH6VYkoVIkPVUdxCE5zrpv921+HmHrTz8yuMQUDwQnACuA832mRp53F1/lrcKwdFGfC
 Ld05RCufQ8g0S+U+Zrq9iERKkaA7da4nRuj2BgEjC+HE5N1c3ECQIeOxifn8SG6RLs5dNOGVc
 FBf/ED9+32as1piidRLLus5Jvin7xhK/oJDAo2M5W7qS14V72jc+daFS0Hybypj/e3a82qg0e
 tjW5J1R2KrPqEtLCZTAFIlcSLbR6nMg8kCLvFvQP4Xgo9+yTNoDQOTORgrJoucXdQm8X73Ea8
 lzsS0MrmSZ80OuDkIhl/UKZQ3WxIN1SCsFu/b8zyULc0EctopXPRm9IHYGVEfafC9eFYizoYZ
 rbFYo+V8CgRM0oDe3i7LVToCIt48FWCJm56JTsM4addYUN3kELOYGJG1SBUtZr96cdvUrKg+p
 LsxUu5BWHrFIPVmV6kFrakioh4dx2dng2p58WZEB3yKH2HhAdvs/xKZb0mbCrQvGTaZE7tVJK
 ruBgdegy3Tfwk1GZhUPc71d6IXbO/8zCKcEVFvLxT0NnxPYxqFhAfYtibIlM87etEzOE0nd04
 R/X8ZMHkgw+e31t87L97Z4i9Bjdfy2NJYJs0fxlkkFrEt1LvCxNj+dgRFEh2PIHtGVKZffks/
 /S9eYgEcIls0nIRzSez6ka1jqnY7JR7rxZz+3miNIkIRTMhEYI2FAl4vXdI0UwkoIGCJi/6NH
 WQ4xHc3264g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Hans de Goede wrote:
> Can you respin the patch to use the old method of looking at which
> clocks are enabled by the BIOS? (note you may want to wait with
> this till Andy and I have reached an agreement on how to solve this)

Sure, I will wait until consensus is reached. ;-)

Dave
