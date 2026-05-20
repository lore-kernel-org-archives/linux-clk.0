Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291638F23D
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315058; cv=none; b=peD4zPuKNNsTChJvfGGvLdeGpFMEIs49i8K9pxQIlZe0a2xOdJUYMhmO06TZMxBp7EjTuxwL+pAG9Mv/Zrn+D/5TyddiJw98x5lMT5E4NoyoyCExBz4rUlFGyh92wu6Ffs/UhWCfP/8vXuiFQaDP5kj9J3+AT3FOicdUEXrb6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315058; c=relaxed/simple;
	bh=BH3JPXyp4zfTsYas6J33aQkbFuzLymEQ+6qzrG5KRZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mS2IuS+N4XeDHHlH1FtBN6/5ySo7rfoPrXwGCJazDjNw0Rlcj61hETPznhVha26pMoO+c9URQlrue/mE9/6KQ7hkzcTJpLqPKdWn/UgnNURai3Ru9eaxDGqdK8hfp6vtUvNUGM3ddbCxQ6NZMEaeTC9jDRvEr3TypfecutUches=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CwdgPJI5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kShmDB4Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CwdgPJI5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kShmDB4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779315055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
	b=CwdgPJI5enHFtdkCsS5ZCwZJeFbYn3T6H7GUMjBbAFcLoy8nZP6+3CvhsLhYdbqQAGJO6R
	f22Mztnmd96EzIewK0bWP5K4xNZSg83TLmFdsJOD+NyX8KP+2c5kndrxWTuiVpJ8rXBg5e
	oj3JMSLHvcJdX3QiC0jmAYb1MQhtoLk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-h5xKmKPEOQusHFm34zhqkA-1; Wed, 20 May 2026 18:10:54 -0400
X-MC-Unique: h5xKmKPEOQusHFm34zhqkA-1
X-Mimecast-MFC-AGG-ID: h5xKmKPEOQusHFm34zhqkA_1779315054
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90fbc9782c9so1327002185a.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 15:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779315054; x=1779919854; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
        b=kShmDB4ZZo1L1RbrvDdC8gT+vHfSGeoShxBffKwMAb6IwuX3aNkN6beo10IzaU5J/8
         O5ja6CjtwiMkRnGpCJzCtkHBc8YQrJwfUko9ytXsPjksPUlIhTYMo+voLA3D4mx28pCP
         TQdDMBKXK3SfaLlJZmrxdSVGX1oKr1VO+HVH74qcGcH0KAv5cJzdYixpMcXsF8BCXZWK
         EzShUaiJq+KgZBeB3xIeen67KTNbFYPSJC+2h7FuwnCZTtbO71xT2OGgjbUudSkBE/Jp
         LHBB9i/+/TCmSiPXUOXRvWZcDESMN+CVTflWpEa5RfV0Ol9Y2XMkaqiaJAcsQFZxkwCC
         D0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315054; x=1779919854;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
        b=L8ob0hIO9rS8JnKVQ1ySXmfIJTtuEg7TbSZWtIyzdVOT/QxpSU2fAGGAVfOYcLibdX
         gSHWFlYYSXYIYyF2Nut94LMm/Rf7ddakYX/csECRYvdo4oNlDDRo+4zYFhLOVbu6bu/T
         7Hk2h06OrN+hqcqV1t7elcwWp+SKku27jOEqf/jy5aBO0x0ByShfqF4apOeua3AzoYJ3
         JWK8zztY2Otk8+L5vLYLkm6kEjl8NC7L0udsN96MCpGcqcJOQMOScEko7fvDytOA/dDw
         qPTIx86NyGzffFB8Wj9ZvaueD9IggJx+aDHOEjnl3sHYA/thAR/AvfeoAVlAajjVG35o
         OOag==
X-Gm-Message-State: AOJu0Yza8uT83vp4WbeqR0VEmyyckRN3BAov/PqgZdU/i93Ev6+DnQx1
	MtUEkECZofsP+dPyERjAk+2/5gvh3gpJ2sZ8nY8wwFpZM7CnTvCsGWjvNjmoYXLqAl7kDQCq4Fw
	7MJ8RgMww98IGxVvQlf+kxXSVHSGKkD4/OTuS5uDdbhx/pwhCdflHDHBhwVoUmw==
X-Gm-Gg: Acq92OG5a0qbTfjBDpyIhohwFCT9KOY58dnazFQp/tfwvRCcvYCF/fCHkLX9+8A0rss
	b9YZtNUWwfZOhtc55IyJ7mILzOINLSU1cOalpsQGfawBEfcyK8ENGg84PsMuW8lGp5kFE2N3X/l
	XhsRDefxyfznkLdylK+rJDsZLmLx7jxxgfjTRhsNTqKqZoacZfoVrJEnOr19TZoZuPXPQF4+lHT
	8hPzeI0wPmiD04Cd7+AhRLaXoAXJWyF9vbKuXnTtoWpDKkcJrKYzFY3HsVz4CWFbhgANreUarEo
	5n0iNrVSqPt2ZFLHK7fnalS/J2sNkbonJQgngM8R2AAq+mpHBt1GvUCnx2x6s7xLstJ/IOQTqn8
	ydbJo+YIGhESjmX5U/QGLUW+uwYc=
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id af79cd13be357-914a2ce9f9amr16390285a.28.1779315053923;
        Wed, 20 May 2026 15:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id af79cd13be357-914a2ce9f9amr16384985a.28.1779315053518;
        Wed, 20 May 2026 15:10:53 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab3a207sm2240740085a.15.2026.05.20.15.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:10:52 -0700 (PDT)
Date: Wed, 20 May 2026 18:10:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: stm32: add missing bitfield.h header
Message-ID: <ag4xa-WmnGti3naD@redhat.com>
References: <20260519222639.34508-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519222639.34508-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 19, 2026 at 03:26:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

