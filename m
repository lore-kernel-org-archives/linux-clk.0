Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754E61D554
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851300; cv=none; b=eqQh6u4A+5WaivKn8PXjQeK69zNkpwz7L9g8mOKnnfEQ72lvnKb1J5tbxEisNeiGhNy2sq2FYNj4x8AxNPNnZ7tUbxa1oxPu1A1AqeK2OwTNQu3TQP6vArrbgB9XzqgDldPhRgKGtwDniHiZ8Tb2N3uPEaqRoGqTPH0YB997+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851300; c=relaxed/simple;
	bh=QVrK1epjSFOqMcmLXFJpk1n4b5xh+bz113bGJLTt1Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8pOnO3hVeuWRy7cfQVMq33P4wTmseSFfiUnKGlK0RbNBABsuChxLuXm2KmGkui6xd2XJ4j49mU+6IEG45wmlwyzYT9eXq1eh+c2TLU+y3s6AMJfURngTvf1CqxbBmynzhGmSRcYF7sfR5irPysHiU5ZH3eGrAuT+nGn0BKTh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWXDqkID; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWXDqkID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
	b=LWXDqkIDs7qrGDIZ71cIQtM37axBTIWo77lMkdJCsG9CbMoN/t4bK+jVOMI+EVlYfcNROO
	ogA4soJDR0A9LCU3W+aQ7B39GzlF35Qs6HffBwbEh41paRiST7dfvt01xmXr8fzVH+2I2l
	ZKCc878+oQEkgVhFDbma737qiisrwIs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-Gv15p0jMOo6uh0jA06iJUQ-1; Sun, 14 Sep 2025 08:01:36 -0400
X-MC-Unique: Gv15p0jMOo6uh0jA06iJUQ-1
X-Mimecast-MFC-AGG-ID: Gv15p0jMOo6uh0jA06iJUQ_1757851295
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-81ea2bb8602so1041456385a.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851295; x=1758456095;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/P2pmY9erGP27JX1LIX0xO5lGm9xSowmXkGs5Snrvk=;
        b=vkuiTEG8IaHZpichatIIjSf8EppySLwhjK+KnfbWfQAmxegHmXGPDs6QcLDnGbAJlv
         stz1N4tbCh5Nu/J0NKlscqy6iQtU6Jxxodv8nBvMzKnWtk6UCplPuoddSzPoyPfG6A0b
         DBaKB3NlJsdoj/3yhjKYl3OTOTUBhuNcnmsFj0IAgz0/GxpngXkuAsTlA3q3o569NbS0
         r3pjlkbqTMMtVcmLTsNEgSVmMlRc4C0Mx42pr/kL0pjwJBHTsHirj1Ob6jH4Ih90wOV1
         ukZ91aRf405MY35KhTjV2yH6zEKPeAOS5bHuqFZA0Sw8RhSqIzWeM6SDw84U2Sx2utJs
         OXwQ==
X-Gm-Message-State: AOJu0Yw+x1FE0SBpQ33pqNfn2LMv+qbxHpvYy8/Crroy2P8H3JxOD5DQ
	FyYz/28zByxuUdmKSVRMemr6CR7Va5J2yCUplCc2BBwAsoS/HEoCenvg+sOu2iPJjhDXeIlS3Io
	mFVPXQynf+/Zdhg5WG8u8czxy9GA1/VnZ0uNLMRAQ4dYYe1a61Z4Cb1HlAjHvoA==
X-Gm-Gg: ASbGncucdJ5y5TGWe8euptuwzLM6Ek6VJXOf+hm1VuluJXnB7JBzWHhpaevrvsTo4o9
	rVh+HO7B/SJh6owuqF1ezYfhhTbotBJYpB4TrQ8D4S9bC/zzPk48XNMZU1Vr9erQOSUXvNPdIAs
	kPN21PDSeMvAHFAAcbB4erqk+v7fG1GeZiAJ3xVe2mP7YRPE5u1BirN+hicfmh4ypRrk4MpMO+T
	V4Tr/Sk2+D6SKJRn0+ZogJdJ/Moc6pgowZ7K4GwyVZoxsD+Ial4XXKUjwA7XEfn3OO94YmttCLR
	Zcqw17E2rKXu36Xzn2MiJ+aXa63obqn+baxwTu9Ec8iskHJrS0TBWcwEm1iDdL74DK5SUDCggNA
	zL38selWt5my6ox9R+TRLYD01UzzsIW4=
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027927185a.7.1757851294093;
        Sun, 14 Sep 2025 05:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIsrBfOXyBwmvGT0Kz8IZrStEjhdVLehZi62PDrHPdMWX397mJ04MxVHeqPCuDiG+BC8R/RA==
X-Received: by 2002:a05:620a:1a18:b0:7e8:3fec:5e61 with SMTP id af79cd13be357-823fb826048mr1027921885a.7.1757851293541;
        Sun, 14 Sep 2025 05:01:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b7942d706dsm16096071cf.23.2025.09.14.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:01:32 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:01:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Message-ID: <aMaum0Lv4C9B3Mzt@redhat.com>
References: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Sun, Aug 10, 2025 at 06:32:18PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

