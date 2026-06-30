Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162332DA757
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832264; cv=none; b=ud1qNycVvbjrvaLjCPJxrfpcjw8dAl++hFthiMk++Y7TSXcr/2R7TOw+j3Whqx6YQlbwHe0QI/OaWd+i45hrZj+SpdHEcFUbmFRe9rOVHhg1bFzpEwEY061y/Nj+owHHmKK6DTTuokVWdxc4pPl31YLeqPQkFemp7UrIwMijfWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832264; c=relaxed/simple;
	bh=EztkVPde0K4RhcRhCzcZiteVfT7iLfKSd3EI0JGqJYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbTalc1Gl++CeC3MUgmI4CzYbWlrf2ssNlKU6gYlk+qVM4YLRdZvkXOAPeeBmJVPA8t6s5mZaBHDe5OLgEzTwm4pnC1eFu5VmIIHbyIzmCqfTitmFqnKkxB73HUQrR4Tmfmnvn9iRmQPlm1/ZdrX5uEXqc3/0TuvPaErcGEaS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C/zHF2KD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRKnqZFa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C/zHF2KD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRKnqZFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782832262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
	b=C/zHF2KD/JP12MyNeCDsSIVIsgmIPvDnhqWYshyiWQ1Np2Q/6RVo0VlkYOU/kUWqyF87im
	VQYQH14ut4pu3WaDO8683Bm40CdI8WTm0+AslWSqQXXVsdjw4uPRMxGFpJcIahKEzixcm1
	Pw20yVxd6AYiYog6cInVQp04abWAnX4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-dlTxb0a5MlysDnJhWsm4QQ-1; Tue, 30 Jun 2026 11:11:00 -0400
X-MC-Unique: dlTxb0a5MlysDnJhWsm4QQ-1
X-Mimecast-MFC-AGG-ID: dlTxb0a5MlysDnJhWsm4QQ_1782832260
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso1980945e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782832260; x=1783437060; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
        b=FRKnqZFaoinN3L5tOFflQQFOVaSW8wMW5klBePfWEPxctvXQdoaOJazzYD69LzVXSv
         IM7BTg8YY3kaWnW93tieYGZZvwTag4yDhWV1o0LTzWbPIPdXEBiyEDWS+N41wNRVhMWo
         L2gTdk5/KpALg/Iy9x825JrxRwPNidyrP7mFXh8ZvLuehOa5XJo9pHZQoYudkBfPYzdv
         H4jUSqanlAiWxrl1kZGRvc6DOooYbVCGW8/J0RdYNv2W8OOOpsP8QL+Dth1F8r3fQ+IZ
         zFmrRwR+Av1D6APo3w8QDn7fGIQTjClhv9R1nkmfrZc6X9pI4PA8JYJ2HsymlQdYP+bQ
         gRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832260; x=1783437060;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
        b=DQwVLEXc05QxjE+a6uoQIkybQjLiizOVJUu7aI+iMfykFgMGq3Tg8LASbyLN1VN+mh
         6i/+m82HuWQqWZlJwipUfhZ82YmEjUiwTcPAOuauuKh4NJ1E8Z4LrgfIldfevDzO1Nzg
         hYAKjXCevbgjDOegO6vGl9j644cArMDm6a/x96Y2IBe7GhYM70D46nf74gFMSm74brV4
         1eRQ81HZYbozZbDVo7yIwGPy12IsVwHYf0UjI762tZ90jkMJSpM4hUww4dEM9TeKZaLn
         LWe3bNYzndpvEgg/q81MqYKMa1/W87pVWhjjVw7hbdkGlluJ7Lf4XJJEnkqY2HeLfQz/
         UYRg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4O4xsn4TOXW8MwSh/IWKdfZfGjEMYufCzTaeDgSooJAz7X7uanVMVo38UpSVImRtO73os9N8+RRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMtunPTlchBnAG7CvmUVYdXYYfO6JH079GouYIZzVrGsk+xKZ8
	gQ2gk+fg7h4h+F06c24bjEx7ZerlgiOmdOMlFq9p26Czh6fDBCYXI+JUHx/mo4h1gQvEC3r2aQR
	3vGD9OuS3CUQMnpFNrOWtfjQMnYeF85yhpuxXJBCRsTMhiAsqidtTZ8X9wU/x8A==
X-Gm-Gg: AfdE7ck7uoLnBR1AKobajnCE/hDrvTCH/ejdOpLIyh8c1YYQUKSdR3PMlNiBFHiVqWR
	+IglHZrN+IfUYxdSvvdwoUjV+Y/t8orK/BsT1KxTSP4aLjpwVcKuAfNefc/EjgyfY0ONd1eGu/6
	u4a6mTIrSHiutXQpsWBgwJP1vxfqRaRsNB9U0vxHEqgWgyc1/IFM+rpa+WebVRvOtIOCwTR6zRs
	L4tZhN8tFWV1P9gwWNDPaPgbZz5pV+HyZg8D0pka9xStx7A9/C5H1JdJn9qtTQYNAVZRNe1jfH8
	OFLuIj8YUpyZ0jzvI/OZTqNGIaRj0giX37gqd3wskwJixDXvvAY1CH3UdIlujcB5jrXqRn/wJX7
	rjG6a9BIG39LraNCabPCVp8A/RbSEutL6GP+ID3FjMDBXow==
X-Received: by 2002:a05:6122:17a2:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5bdbee26d80mr1876942e0c.9.1782832260038;
        Tue, 30 Jun 2026 08:11:00 -0700 (PDT)
X-Received: by 2002:a05:6122:17a2:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5bdbee26d80mr1876885e0c.9.1782832259439;
        Tue, 30 Jun 2026 08:10:59 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a26f21e4sm25766926d6.10.2026.06.30.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:10:58 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:10:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <akPcgdjlDxd-JmYb@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
 <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
 <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
 <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Konrad,

On Tue, Jun 30, 2026 at 04:37:12PM +0200, Konrad Dybcio wrote:
> On 3/23/26 5:07 PM, Brian Masney wrote:
> > On Mon, Mar 23, 2026 at 8:48 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 3/13/26 5:54 PM, Brian Masney wrote:
> >>> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> >>>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
> >>>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
> >>>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> >>>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
> >>
> >> [...]
> >>
> >>> Ignore my previous patch set. In my v6 that I just posted, I updated
> >>> clk-divider.c to support the new v2 clk negotiation logic. The
> >>> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> >>> code changes.
> >>>
> >>> Anyways, would someone from Qualcomm be willing to test this? The
> >>> procedure is fairly simple:
> >>
> >> Unfortunately, I don't think it's easy to get your hands on a 8280
> >> device with DSI.. maybe Pengyu could test that on his tablet/laptop.
> > 
> > It doesn't have to be an 8280 SoC. It could be any device that has the
> > issue where the parent rate change screws up that portion of the clock
> > tree, and crashes the device. This has been a long-standing issue in
> > the clk framework.  I know you recently posted a series for 5 other
> > SoCs with a similar change [1], so any of those other devices should
> > work as well.
> > 
> > [1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com/
> > 
> > The kunit tests in my clk scaling patch set demonstrate the issues
> > that I have worked on. For example, in my test scenario, I start with
> > a parent, and two children. The parent can do any rate. The two
> > children are simple dividers. This is the current behavior today:
> > 
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
> > 
> >         ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> > 
> >         /*
> >          * The last sibling rate change is the one that was successful, and
> >          * wins. The parent, and two children are all changed to 32 MHz.
> >          */
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
> > 
> > With my changes, the clk framework will land on 96 MHz for the parent,
> > and 24 MHz and 32 MHz for the two children.
> > 
> > Anyways, it would be great if someone from Qualcomm would be willing
> > to help me test my changes on real hardware. If it requires code
> > changes to a specific clk provider, then I'm willing to also do that
> > work if someone can test for me. Getting confirmation that this is
> > fixed on real hardware will help to land my series that will provide a
> > solution to this problem that has existing in the clk framework since
> > it was introduced over 12 years ago.
> 
> Was going through my inbox - do you still need the testing? I see that
> the last revision of the series (v6) is from march

The latest version of my clk scaling is v8 from March.
https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

It's honestly stuck in limbo right now. It fixes a real issue that you
can see from the kunit tests, and I'm happy with how simple it is now.
The series is kind of stuck though. It would be very helpful if you
could talk to some folks within QC that work on the clk drivers to see
if they would be willing to help test since it's making systems run
suboptimal. Crashes can occur on some devices when you switch between
different types of displays based on older reports.

I submitted a talk to Linux Plumbers for the Power Management / Thermal
MC to talk about this, and current state of sync_state support in clk.

Brian

