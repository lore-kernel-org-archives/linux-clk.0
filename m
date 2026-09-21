Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713F3AB285
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020665; cv=none; b=fVU8c/1yC2OVXo5JKTERVU2diaqQAIknYLu4a0WMxGVnyviaaO1JszBblbv27IDhkmB2Is9uM2nuNexd8yp7Gj5Y4/Fdro3c2GCEGiDZncBJjk17MsLxDymbuLtUAmoekdJB0kXJfD9upFipqs6T0ZxOSIrOzppVzgZlJLhjGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020665; c=relaxed/simple;
	bh=dNq4bkulw35Cidxo9e2r5O87nv8tva9TJtkuLwU5vsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz/xX6CiWpkBkcVBgMrMQX2Ck7QP/29GWXYsmRz1YUB9zDbQ1u3+bLV9a6u4jQLuepXQYRaRmDG1jp2kvv+sp97WsTcsyU9dw2EfQ7J+WHy3Tlgl8pWKs3wdNS+A371geYmai4uA4fdYDBo8u3+iqAhZ+DsvAeZ1I8Gha5HVU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tlr6Wi8r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EdOV/a67; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tlr6Wi8r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EdOV/a67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790020660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
	b=Tlr6Wi8rRgPqlk01junDHvva9SCSRPFZZOct30qvKtVyEnwq0DDXVGDowvECjmgGklfCnV
	r/VTUfX3fwodX/po3JNxVSZDum9SOWyaVU6o2Z7rtbJKxf13lCrwQxXF4H5/zcsXaVyrp4
	RDJs9dQDH6IAc6gPseCsZ8wPckzVtlY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-TuvFDjFZOgCFPSOOb5NnxQ-1; Mon, 21 Sep 2026 15:57:39 -0400
X-MC-Unique: TuvFDjFZOgCFPSOOb5NnxQ-1
X-Mimecast-MFC-AGG-ID: TuvFDjFZOgCFPSOOb5NnxQ_1790020659
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso444018385a.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790020659; x=1790625459; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
        b=EdOV/a67MEnCMthefwtQqV3kimuQqYjGzaORMPDlnhrPcVHY8kOxaq1duvxbYke+GH
         HcOezpho7WQIGFaxmwjJBwl2DXHVtSKjRy1jco9tOzbF9VODfXaV7TYbAEQYdzka78cs
         RgEHuxRawQEhp3aJhEGiHwnU1GTgiGVk5zXQXhcAVYcXmIj1qMuP4+gTs75KMjNcIzQ1
         zmu7zp2KslO7BQU+7jXGsHNlmx3J6TybWmgPl1+kcxiuSayzXoRFlGS6pFTNNai5flA+
         MmNEa+V6XUM6g5OpMuOcivxaHsjhDm+/XLug9NXCJuk7yqOD3fYYIcrqgFSAnv5pCB96
         tTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020659; x=1790625459;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
        b=Tpl3uatfmOh/x8PePRCeVwcWJJk9Ubq7JoVNDHdOHQblBKMFKDlU4TvQuoROxbG3mN
         USS4DyUO7hqOzRKp5fjGFNNV3pTzezC40J5pzMVhxL20AdeSGGr2+CKbZSN+prUs2Jqq
         sfie43cKvbCNtkG1c3tUrPBHqWxy8rgIdCsIKWwCms885qEFf/jB5OXumv8FN41cK90X
         5hoO2NkJXyID/wYtxNsgstsZ+iu+lXgBq2TCrccB0vANR+5DyCP5Pk/J9cf8BVVDR0HO
         RGWgv9+g+0Xdz354Akh+PnXBFKknalF30l8iYoi1SDfrN+wS9I+i3hdxE9m6+PBEqrXj
         I9KQ==
X-Forwarded-Encrypted: i=1; AKwUvBz32FVO8nQlhzFkqNiysGQAadxVl3tmsQwlmmZtdX39pgZ0OhWcuTqsO3BaETgjypsKAgL4ELjLdr4=@vger.kernel.org
X-Gm-Message-State: AFuF++nf8n2qBba7YXf+v4oqLbQYlO+DwdB/yWidNAuqI91nikVx+HxO
	4FoB4O0Hlkb+MOCiXEK2Iscc6TbCR6iu9pyt2GsrDL+OzlTiumzEtyuR4F03jU+64GwijtAh12A
	JIW6hBhne566NezOplmFO7lxByM/ZsHVtRioEY4O5UzN6Af/a7ebP0xq1cSiyJQ==
X-Gm-Gg: AYBFou1hgD7Fti3/NtKsvMAy+4QKHp6NoJ6X+ywCeAjugURJTge4wBI7yXcyjHHw6ug
	uQkhKeo0mv+jqxUe2pMBP+olFVBuA+Xv874rKDFL9xbrz7EWCXlsFZjydL4kF7hgvvlglohPG9h
	Wlhs12E7TJ2aZ6gK4Ts7SPTV1HVIK/MUf/yS17xWxaBCCKJscGbBo/Z/PPnCs97br0XmFDCI2uB
	7yy/YSXw5qqqi0c5AVGsjsgYGlHf8OijXdIJfgZvfFnIVE0KiP0gbAl9wqUQpotcI+TThvsyJEw
	yrxkrbn9VUWaH1sKXzAX+ZevULyWxsCczg6BM1z+CsIZ/CiYWBDU93ZpvoYNAkbLgtNYvgpyHA=
	=
X-Received: by 2002:a05:620a:4686:b0:937:7e90:ecc with SMTP id af79cd13be357-93c15d9a15cmr243297985a.25.1790020658505;
        Mon, 21 Sep 2026 12:57:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:937:7e90:ecc with SMTP id af79cd13be357-93c15d9a15cmr243292185a.25.1790020657833;
        Mon, 21 Sep 2026 12:57:37 -0700 (PDT)
Received: from redhat.com ([2600:382:8127:317:3053:da10:47fd:5e79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a86f62sm74973656d6.33.2026.09.21.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:57:37 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:57:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Message-ID: <arGMLthMgQvyQHuR@redhat.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
 <arFEwdu6EucK1G9x@redhat.com>
 <c89f566b-9fd7-4824-ad19-bd8b055d2736@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c89f566b-9fd7-4824-ad19-bd8b055d2736@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Dinh,

On Mon, Sep 21, 2026 at 11:59:50AM -0500, Dinh Nguyen wrote:
> On 9/21/26 09:52, Brian Masney wrote:
> > On Mon, Sep 21, 2026 at 11:17:13AM +0800, Ng, Adrian Ho Yin wrote:
> > > subsys_initcall() / subsys_platform_driver() would not fix the failure we
> > > are hitting. Both still run after time_init(), while the DW APB timer is
> > > registered via TIMER_OF_DECLARE from timer_probe().
> > > 
> > > So moving from core_initcall() to subsys_initcall() changes nothing for
> > > this consumer: the timer cannot defer, clk_get() still fails, and the timer
> > > is never brought up. That is why these patches use CLK_OF_DECLARE(): the
> > > provider must be registered from of_clk_init() so clocks exist before
> > > TIMER_OF_DECLARE runs.
> > > 
> > > On the broader point about CLK_OF_DECLARE abuse: I agree it should not be
> > > used merely to beat platform device probe. If the preferred approach is to
> > > keep the clkmgr as a platform driver (subsys_platform_driver()) and give the
> > > DW APB timer nodes a fixed clock-frequency instead of a clocks phandle, I
> > > can respin that way. Please let me know which you prefer.
> > 
> > I wanted confirmation that you wanted to use CLK_OF_DECLARE() for the
> > system timers.
> > 
> > Will you by chance be at Linux Plumbers Conference in two weeks? Bartosz
> > is leading a discussion about the future of CLK_OF_DECLARE() and
> > friends.
> > 
> > https://lpc.events/event/20/contributions/2503/
> > 
> > We want to minimize the use of CLK_OF_DECLARE(), so the preference is
> > to keep this as a platform driver if possible. If you are able to get
> > around using CLK_OF_DECLARE() by initially running the system timers
> > with a fixed frequency then I think that would be preferable.
> 
> I originally pushed back on hard-coding a fixed frequency for these timers
> because if the bootloader changed the frequency of the clocks for these
> timers, we may run in to a problem. But I don't think the bootloader had
> changed the clock frequency in a long time, so it may not really be a
> problem. But it just feels wrong to not take in a frequency from the clock
> driver.
> 
> The other option is perhaps adding the ability to defer probe these timers?

Lets see what comes out the discussion at LPC about CLK_OF_DECLARE() in
2+ weeks. I'll make sure to attend this particular discussion.

Brian

