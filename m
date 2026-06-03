Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8053E3C4C
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505368; cv=none; b=N0Io7d9WwZdKMasV78yQR2IJMZ945NlkIUJDhFzisHyRTpfaT7dONxJHhNxoEzQeRXMR6zk/el5dyl9U7sBFRClU+A6DRMIkmMC9d3lPToXBvghSxxWofW12/6PahjIwhPguYFz3V8o0FMdSDD/V72JtB6HOeTX0BCu0VUcDPdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505368; c=relaxed/simple;
	bh=94BXKxm9QIjyJLcl2DOZyyBik9elibbRNROTBUTTbso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED9r0V5sb0+w9LFhZGU5B0zyehsnzhW4HmVF8qWk8ZzmWTRyY/TurC1JdXVCHdxD6e8H5ilbuSZBm4BgdL7sOLMZ4UKB8VAwXkvAYQHVdDWJbMeq1/qmzs9DT4c1y6FDeM1IiFQTnyZicnxhvbZ/NKAXqr3zoEhr2owyLr3hFnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKLRKwvp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3rvlWm0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKLRKwvp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3rvlWm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780505365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=;
	b=AKLRKwvpW+x++E8+tfT1Yv7lGQCg+CgxvCEY0n1ZCEkrT9D/RGxrAo5MJ3/EcG46KbGbmq
	XC0YFVB2II7BNfdk+spFXHjH/xJ/hF5JK1rcOrXovaZqDEEDy/SEUM4mT+Hz9PZrobWFsg
	fIFdSBITitIjxYhhNPWenkeB/GvbxUE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-cJZcN8qZOt2WbMhytRywJA-1; Wed, 03 Jun 2026 12:49:24 -0400
X-MC-Unique: cJZcN8qZOt2WbMhytRywJA-1
X-Mimecast-MFC-AGG-ID: cJZcN8qZOt2WbMhytRywJA_1780505364
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91574ad6871so486008485a.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780505364; x=1781110164; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=;
        b=b3rvlWm0fU5WrWUdT/gS4+bK3TNj7rfeFbFXdL3lnzvY9TU/s+iKGJK3DokK5AijHV
         HQODvpjAFGUH6LbOGWhHNA//FF3O0WErEZb75UXKy2q7dqkcExvDYnDzoK6RJM+CJphv
         iLIfifgcWiq9Lavw/vBJ6Hvos4ctMGes/X4VVzZZ1FRAYPgnARkhJdbVOq0E3nYZDZ94
         BLgrrVjRLHtKTgQaGcy/yYYkWZhbrG8Iy2ghQBOZlixzZmMHc5BU1VuXLFjosWFX8QNc
         lUkqSZj/hbgfJ53+tKbRXCRjuoZkB360cSYf7IPtG1ayXgPgbAPxwzS0+Qk8LS/DtjxP
         pzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505364; x=1781110164;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=;
        b=UgVdGHlzue9UUiAPo1glFTjzAlzLiIh6h38jZ9e4+1tjoAFyXBNJ3urT4XqaLbUbh6
         s3KPu1MqOv20z/oEkSuqX3bbGSOc4pakZzc0kXunGD7AuApJbgmtyoBU25cl8RFOjRYt
         f/4gf3/4+C8ZXr4n0t7YPfcuwsgkkwfi21EMeWIiqNy/EVklJRTjCeMTWOI+7Ab0SUSD
         eQtDMeAki11EzaLO2kcV7BtC+0gZv3eJk2U8JOsUV+DIwwN2aLmJszVft6N0CccPYlff
         EJOzn1nOE5Z5yT3L9F5ES3jiOJR0mn9yz6LfPeoKLy1RZhQx0uYHhCQC4F3fA9wXy4JP
         fnGw==
X-Forwarded-Encrypted: i=1; AFNElJ/KfhxPO9b0UVlZigionL8yxxAKmBXUHz6eiXy7t/FKm9vdxqRxCJcGxsQiNo1ZSHOWU2ORxKX7Zhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UQAgGpR74L0917R94GMo9YX2XCRGkGU29qXwrpe5IrUrimlb
	rbAEyJDBuD0rh0FypcAe2OmLhVZTC2MxUms0uQPINCaRFlswglTGRDUH3Dz2c9SPl3hm1d38ZcQ
	GvW7+MMI9FaSJKMCY7kmfwaEZX5ghHtPVhD0QGAWhONTDV23A1OXAjDCTbXDCQg==
X-Gm-Gg: Acq92OGMnHdhAI3O1uSxV3XReKG0xbJ03iaQDW01V6aSFUlxhVBfafdPnjzYXC967jS
	h69q82q474YQPiKu9ik+WxswtwCf25TKaAF1ugv1S3R/Rm97PCRw12SC9hYbuZJ8d6yvCxL/5QI
	Zdz734w8ZZ/sM2OgBe+P2Q0hdpu7OLjD/KQxf7Yr9eZLXOEpcQDJvUSvGS/L342qlQxN4rd0Ow7
	14AYt6ZIini8u99HnaymBiQJCEyk716bRg23uEejzk1UY2JOHVkQOOWzuPeVEen0V1eaxpHvUml
	zFksRgzaBhxN491tFjus9w+DAKJQ0pTs3Js3CUNDUjevI8b9tof/ky3tEt8Ej/eEjIcB+URaHYg
	qvp6o6/DyTU4FOG6Bxy7h/FVcUA==
X-Received: by 2002:a05:620a:294b:b0:914:c8aa:34ea with SMTP id af79cd13be357-9158a83cd2emr683491085a.56.1780505363901;
        Wed, 03 Jun 2026 09:49:23 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:914:c8aa:34ea with SMTP id af79cd13be357-9158a83cd2emr683478185a.56.1780505362817;
        Wed, 03 Jun 2026 09:49:22 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c50bsm294228485a.24.2026.06.03.09.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:49:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 12:49:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>, a-christidis@ti.com,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <aiBbD2Y6s-1NKnhT@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
 <agM-VB-ToGFNphfu@redhat.com>
 <20260512171604.5ntgq65bmedb7jpc@stinger>
 <20260603160034.fbemt5n6pqyrmwke@strode>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603160034.fbemt5n6pqyrmwke@strode>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Nishanth,

On Wed, Jun 03, 2026 at 11:00:34AM -0500, Nishanth Menon wrote:
> On 12:16-20260512, Nishanth Menon wrote:
> > On 10:51-20260512, Brian Masney wrote:
> > > > Could you clarify if I need to take it via my tree to arnd or if this
> > > > patch will go via the clk tree?
> > > 
> > > Sorry, I'm not sure what Stephen prefers here. An argument could be made
> > > for either approach. I would just go with whatever you have done in the
> > > past.
> > 
> > Thanks Brian for the review.
> > 
> > This usually will go via Stephen. Will wait, just trying to make sure
> > there is no change in expectations (given this patch missed a window).
> > 
> 
> Stephen, I'd like to clarify: would you pick this patch up directly,
> or would like me to send you a PR after collecting sci_clk patches? I am
> OK with either, would prefer to not have wrong expectations.
> 
> I see two patches pending to be queued:
> * this one
> * https://lore.kernel.org/linux-arm-kernel/20260512110028.2999471-1-nm@ti.com/

Since Stephen hasn't replied yet, I would just include it in your pull
to him to make sure it gets in.

If he has an issue, then it will be straight forward to make a v2 pull
without this patch.

Brian

